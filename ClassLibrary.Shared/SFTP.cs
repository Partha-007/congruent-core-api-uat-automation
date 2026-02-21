using Bogus;
using Refit;
using RefitSandBox;
using RefitSandBox.Hooks;
using Renci.SshNet;
using System;
using System.Buffers;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;
using System.Threading.Tasks;

namespace ClassLibrary.Shared
{
    public class SFTP : TestBase
    {
        public static Dictionary<string, string> CUSIPTradeIdentifierDict = new Dictionary<string, string>();
        public static Dictionary<string,string> CUSIPAmountDict = new Dictionary<string, string>();
        public static Faker _faker = new Faker();
        public static Queue<CusipProcessingResult> resultsQueue = new Queue<CusipProcessingResult>();
        public async Task<List<B50MatchResult>> SFTPOperations(string searchValue)
        {
            var results = new List<B50MatchResult>();

            var connectionInfo = new PasswordConnectionInfo(
                Settings.ftp_host,
                Settings.ftp_username,
                Settings.ftp_password);

            using (var sftp = new SftpClient(connectionInfo))
            {
                sftp.Connect();
                Console.WriteLine("Connected to the SFTP server.");

                var sftpDirectory = $"/dev/{Hooks.clearingPartnerName}/outbound/";
                var files = sftp.ListDirectory(sftpDirectory)
                                .OrderByDescending(f => f.LastWriteTimeUtc)
                                .ToList();

                foreach (var file in files)
                {
                    if (file.FullName.Contains("S26599"))
                    {
                        Console.WriteLine($"Processing File: {file.FullName}");

                        using (var stream = sftp.OpenRead(file.FullName))
                        using (var reader = new StreamReader(stream))
                        {
                            var fileResults = ProcessB50File(reader, searchValue);
                            results.AddRange(fileResults);
                        }
                    }
                }
            }

            return results;
        }

        

        private static List<B50MatchResult> ProcessB50File(StreamReader reader, string searchValue)
        {
            var results = new List<B50MatchResult>();

            string line;
            string b5001Line = null;
            string b5005Line = null;
            int blockNumber = 0;

            while ((line = reader.ReadLine()) != null)
            {
                if (line.StartsWith("B5001"))
                {
                    // Check previous block before starting new one
                    if (b5001Line != null && b5005Line != null)
                    {
                        TryMatchBlock(b5001Line, b5005Line, searchValue, blockNumber, results);
                    }

                    blockNumber++;
                    b5001Line = line;
                    b5005Line = null;
                }
                else if (line.StartsWith("B5005"))
                {
                    b5005Line = line;
                }
            }

            // Check last block
            if (b5001Line != null && b5005Line != null)
            {
                TryMatchBlock(b5001Line, b5005Line, searchValue, blockNumber, results);
            }

            return results;
        }



        private static void TryMatchBlock(string b5001Line, string b5005Line, string searchValue, int blockNumber, List<B50MatchResult> results)
        {
            // Ensure B5005 long enough for 77–79 (1-based)
            if (b5005Line.Length < 79)
                return;

            // 77–79 (1-based) → index 76 length 3
            string valueAtPosition = b5005Line.Substring(75, 3).Trim();

            if (valueAtPosition == searchValue)
            {
                // Ensure B5001 long enough for extraction
                if (b5001Line.Length < 51)  // 31 + 20 = 51 minimum
                    return;

                // Updated positions per your correction
                string cusip = b5001Line.Substring(21, 9).Trim();
                string identifier = b5001Line.Substring(31, 20).Trim();

                results.Add(new B50MatchResult
                {
                    Cusip = cusip,
                    Identifier = identifier,
                    BlockNumber = blockNumber
                });
            }
        }


        public void EditFixedWidthFile(string clearingPartner,string inputFilePath,List<B50MatchResult> matchResults,Dictionary<string, CusipProcessingResult> cusipProcessingResult)
        {
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.Parent.FullName;

            string directoryPath = Path.Combine(
                projectDirectory,
                "ClassLibrary.Shared",
                "Trade",
                clearingPartner,
                inputFilePath);

            if (!File.Exists(directoryPath))
                throw new FileNotFoundException("Input file not found.", directoryPath);

            if(cusipProcessingResult.Count != 0)
            {
                resultsQueue = new Queue<CusipProcessingResult>(
                cusipProcessingResult.Values);
            }
            

            var outputLines = new List<string>();
            int matchIndex = 0;

            foreach (var line in File.ReadLines(directoryPath))
            {
                string updatedLine = line;

                // F53 replacement
                if (line.StartsWith("F53") && line.Length >= 76 && matchIndex < matchResults.Count)
                {
                    updatedLine = ReplaceF53Fields(line, matchResults[matchIndex]);
                    matchIndex++;
                }

                // Trade response editing
                else if (line.StartsWith("019701") && resultsQueue.Count > 0)
                {
                    var nextResult = resultsQueue.Dequeue();
                    updatedLine = EditTradeResponseFile(line, nextResult);
                }

                outputLines.Add(updatedLine);
            }

            File.WriteAllLines(directoryPath, outputLines);
        }



        private static string ReplaceF53Fields(string line, B50MatchResult match)
        {
            char[] chars = line.ToCharArray();

            // Positions (1-based spec)
            const int cusipStart = 25;      // 26 - 1
            const int cusipLength = 9;

            const int identifierStart = 56; // 57 - 1
            const int identifierLength = 20;

            const int tradeIdentifierStart = 35;
            const int tradeIdentifierLength = 20;

            string cusip = (match.Cusip ?? "").PadRight(cusipLength).Substring(0, cusipLength);
            string identifier = (match.Identifier ?? "").PadRight(identifierLength).Substring(0, identifierLength);
            string tradeIdentifier = _faker.Random.Number(100000000,999999999).ToString().PadRight(tradeIdentifierLength).Substring(0, tradeIdentifierLength);

            // Replace CUSIP
            for (int i = 0; i < cusipLength; i++)
                chars[cusipStart + i] = cusip[i];

            // Replace Identifier
            for (int i = 0; i < identifierLength; i++)
                chars[identifierStart + i] = identifier[i];

            // Replace Trade Identifier
            for (int i = 0; i < tradeIdentifierLength; i++)
                chars[tradeIdentifierStart + i] = tradeIdentifier[i];

            CUSIPTradeIdentifierDict[match.Cusip] = tradeIdentifier.Trim();

            return new string(chars);
        }

        private static string EditTradeResponseFile(string line,CusipProcessingResult result)
        {
            char[] chars = line.ToCharArray();

            string units = CalculateUnits(result.Amount, 14);
            

            ReplaceField(chars, 32, 9, result.Cusip);
            ReplaceField(chars, 44, 16, result.TradeOrderNumber);
            ReplaceField(chars, 114, 14, units, true, '0');
            ReplaceField(chars, 128, 12, "000010000000");
            ReplaceField(chars, 140, 16, result.Amount, true, '0');

            return new string(chars);
        }



        private static void ReplaceField(char[] chars, int start, int length, string value, bool padLeft = false, char padChar = ' ')
        {
            string formatted = padLeft
                ? (value ?? "").PadLeft(length, padChar)
                : (value ?? "").PadRight(length, padChar);

            formatted = formatted.Substring(0, length);

            for (int i = 0; i < length; i++)
                chars[start + i] = formatted[i];
        }



        public Dictionary<string, CusipProcessingResult> ProcessTradeOrderFile(Dictionary<string, string> cusipTradeIdentifierDict,List<B50MatchResult> b50MatchResults)
        {
            var result = new Dictionary<string, CusipProcessingResult>();

            var connectionInfo = new PasswordConnectionInfo(
                Settings.ftp_host,
                Settings.ftp_username,
                Settings.ftp_password);

            using (var sftp = new SftpClient(connectionInfo))
            {
                sftp.Connect();

                var sftpDirectory = $"/dev/{Hooks.clearingPartnerName}/outbound/";
                var files = sftp.ListDirectory(sftpDirectory)
                                .OrderByDescending(f => f.LastWriteTimeUtc)
                                .ToList();

                foreach (var file in files)
                {
                    if (!file.FullName.Contains("S01125"))
                        continue;

                    var b50Lookup = b50MatchResults
                        .ToLookup(x => (x.Cusip, x.Identifier));

                    using var stream = sftp.OpenRead(file.FullName);
                    using var fileReader = new StreamReader(stream);

                    string? line;

                    while ((line = fileReader.ReadLine()) != null)
                    {
                        if (!line.StartsWith("0101B") || line.Length < 56)
                            continue;

                        string cusip = line.Substring(28, 9).Trim();

                        if (!cusipTradeIdentifierDict.ContainsKey(cusip))
                            continue;

                        string? line0202 = fileReader.ReadLine();

                        if (line0202 == null || !line0202.StartsWith("0202") || line0202.Length < 62)
                            continue;

                        string b50Identifier = line0202.Substring(21, 20).Trim();
                        string tradeIdentifier = line0202.Substring(42, 20).Trim();

                        bool validB50 = b50Lookup.Contains((cusip, b50Identifier));

                        if (!validB50)
                            continue;

                        if (tradeIdentifier != cusipTradeIdentifierDict[cusip])
                            continue;

                        // ✅ Extract TradeOrderNumber
                        string tradeOrderNumber = line.Substring(40, 16).Trim();

                        // Read 0303 for Amount
                        string? line0303 = fileReader.ReadLine();

                        if (line0303 == null || !line0303.StartsWith("0303") || line0303.Length < 23)
                            continue;

                        string amount = line0303.Substring(7, 16).Trim();

                        result[cusip] = new CusipProcessingResult
                        {
                            Cusip = cusip,
                            TradeIdentifier = tradeIdentifier,
                            TradeOrderNumber = tradeOrderNumber,
                            Amount = amount
                        };
                    }
                }
            }

            return result;
        }





        public void UploadFile(string clearingPartner, string localFileName)
        {
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.Parent.FullName;

            string directoryPath = Path.Combine(
                projectDirectory,
                "ClassLibrary.Shared",
                "Trade",
                clearingPartner,
                localFileName);

            if (!File.Exists(directoryPath))
                throw new FileNotFoundException("Input file not found.", directoryPath);
            var sftpDirectory = $"/dev/{Hooks.clearingPartnerName}/inbound/";
            string remoteFilePath = sftpDirectory + localFileName;
            

            var connectionInfo = new PasswordConnectionInfo(
                Settings.ftp_host,
                Settings.ftp_username,
                Settings.ftp_password);

            using (var sftp = new SftpClient(connectionInfo))
            {
                sftp.Connect();

                if (!sftp.IsConnected)
                    throw new Exception("SFTP connection failed.");

                using (var fileStream = new FileStream(directoryPath, FileMode.Open))
                {
                    sftp.UploadFile(fileStream, remoteFilePath, true);
                }

                sftp.Disconnect();
            }
        }

        public async Task PollingIdentifier(HttpClient httpClient, string ClearingPartner, string planId, string Operation)
        {
            switch(ClearingPartner)
            {
                case "DTCC":
                    Poller(httpClient, 130, planId, Operation).Wait();
                    break;

                default:
                    throw new Exception($"Invalid Clearing partner {ClearingPartner}");
            }
                
        }

       

        public async Task<bool> WaitForFileToBePickedAsync(string fileName)
        {
            const int pollIntervalSeconds = 10;
            const int totalTimeoutSeconds = 130;

            int elapsedSeconds = 0;
            var sftpDirectory = $"/dev/{Hooks.clearingPartnerName}/inbound/";
            string remoteFilePath = sftpDirectory + fileName;
            var connectionInfo = new PasswordConnectionInfo(
                Settings.ftp_host,
                Settings.ftp_username,
                Settings.ftp_password);

            using (var sftp = new SftpClient(connectionInfo))
            {
                sftp.Connect();

                if (!sftp.IsConnected)
                    throw new Exception("Could not connect to SFTP server.");

                while (elapsedSeconds < totalTimeoutSeconds)
                {
                    Console.WriteLine($"Checking file at {elapsedSeconds}s...");

                    bool fileExists = sftp.Exists(remoteFilePath);

                    if (!fileExists)
                    {
                        Console.WriteLine("File has been picked up (no longer exists).");
                        return true;
                    }

                    await Task.Delay(TimeSpan.FromSeconds(pollIntervalSeconds));
                    elapsedSeconds += pollIntervalSeconds;
                }

                Console.WriteLine("Timeout reached. File was not picked up.");
                return false;
            }
        }


        public async Task Poller(HttpClient httpClient, int timeoutSeconds, string planId, string Operation)
        {
            int waited = 0;
            int interval = 10;

            if(Operation == "ClearingPartnerMapping")
            {
                while (waited < timeoutSeconds)
                {
                    var planInterface = RestService.For<IPlanDetailsSave>(httpClient);
                    var responseObject = await planInterface.GetInvestmentListByPlanId(planId);

                    var jsonElement = (JsonElement)responseObject;

                    var result = jsonElement.Deserialize<InvestmentResponse>(
                        new JsonSerializerOptions { PropertyNameCaseInsensitive = true });

                    if (result?.InvestmentPlanDetails != null &&
                        result.InvestmentPlanDetails.Count >= 2 &&
                        result.InvestmentPlanDetails.All(x =>
                            !string.IsNullOrWhiteSpace(x.TradeIdentifier)))
                    {
                        Console.WriteLine("Investments processed successfully.");
                        return;
                    }


                    await Task.Delay(interval * 1000);
                    waited += interval;
                }

                throw new Exception("Trade identifiers were not populated within expected time.");
            }
            else if(Operation == "AccountBalanceVerification")
            {
                while(waited < timeoutSeconds)
                {
                    var flag = await Program.VerifyAccountBalanceReflection(httpClient, planId);
                    if (flag)
                        return;

                    await Task.Delay(interval * 1000);
                    waited += interval;
                }
            }
            
        }

        private static string CalculateUnits(string amountString, int totalWidth = 14)
        {
            if (string.IsNullOrWhiteSpace(amountString))
                return new string('0', totalWidth);

            // Step 1: Convert implied 2-decimal amount to decimal
            decimal amount = decimal.Parse(amountString) / 100m;

            // Step 2: Divide by 10.00
            decimal units = amount / 10.00m;

            // Step 3: Convert to implied 4 decimals (multiply by 10,000)
            decimal unitsImplied = units * 10000m;

            // Step 4: Convert to integer (no decimal point)
            long finalValue = (long)unitsImplied;

            // Step 5: Pad with leading zeroes
            return finalValue.ToString().PadLeft(totalWidth, '0');
        }

    }



    public class B50MatchResult
    {
        public string Cusip { get; set; }
        public string Identifier { get; set; }
        public int BlockNumber { get; set; }
    }

    public class InvestmentResponse
    {
        public List<InvestmentPlanDetail> InvestmentPlanDetails { get; set; }
        public bool IsSuccessful { get; set; }
        public List<string> ErrorMessages { get; set; }
    }

    public class InvestmentPlanDetail
    {
        public int Id { get; set; }
        public int InvestmentId { get; set; }
        public string Ticker { get; set; }
        public int Type { get; set; }
        public int Status { get; set; }
        public string Name { get; set; }
        public string Cusip { get; set; }
        public string AdvisorRepresentativeName { get; set; }
        public string TradeIdentifier { get; set; }
    }

    public class CusipProcessingResult
    {
        public string Cusip { get; set; }
        public string TradeIdentifier { get; set; }
        public string TradeOrderNumber { get; set; }
        public string Amount { get; set; }
    }



}
