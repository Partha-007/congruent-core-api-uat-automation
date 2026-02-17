using Bogus;
using Refit;
using RefitSandBox;
using RefitSandBox.Hooks;
using Renci.SshNet;
using System;
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
        public static Faker _faker = new Faker();
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
                            var fileResults = ProcessFile(reader, searchValue);
                            results.AddRange(fileResults);
                        }
                    }
                }
            }

            return results;
        }


        private static List<B50MatchResult> ProcessFile(StreamReader reader, string searchValue)
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
            string valueAtPosition = b5005Line.Substring(76, 3).Trim();

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


        public void EditF53Lines(string clearingPartner, string inputFilePath, List<B50MatchResult> matchResults)
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

            var outputLines = new List<string>();
            int matchIndex = 0;

            foreach (var line in File.ReadLines(directoryPath))
            {
                string updatedLine = line;

                if (line.StartsWith("F53") && line.Length >= 76 && matchIndex < matchResults.Count)
                {
                    updatedLine = ReplaceF53Fields(line, matchResults[matchIndex]);
                    matchIndex++;
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

            const int tradeIdentifierStart = 36;
            const int tradeIdentifierLength = 20;

            string cusip = (match.Cusip ?? "").PadRight(cusipLength).Substring(0, cusipLength);
            string identifier = (match.Identifier ?? "").PadRight(identifierLength).Substring(0, identifierLength);
            string tradeIdentifier = _faker.Random.Number(10,20).ToString().PadRight(tradeIdentifierLength).Substring(0, tradeIdentifierLength);

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

        public async Task PollingIdentifier(HttpClient httpClient, string ClearingPartner, string planId)
        {
            switch(ClearingPartner)
            {
                case "DTCC":
                    Poller(httpClient, 120, planId).Wait();
                    break;

                default:
                    throw new Exception($"Invalid Clearing partner {ClearingPartner}");
            }
                
        }

        public async Task Poller(HttpClient httpClient, int timeoutSeconds, string planId)
        {
            int waited = 0;
            int interval = 10;

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


}
