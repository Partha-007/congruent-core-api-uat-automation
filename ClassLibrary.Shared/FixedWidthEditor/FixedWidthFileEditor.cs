using Bogus;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared.FixedWidthEditor
{
    public class FixedWidthFileEditor
    {
        public int Start { get; }
        public int Length { get; }

        public FixedWidthFileEditor(int start, int length)
        {
            Start = start;
            Length = length;
        }
        public static async Task EditFixedWidthFile(
    string clearingPartner,
    string inputFilePath,
    List<B50MatchResult> matchResults,
    Dictionary<string, CusipProcessingResult> cusipProcessingResult)
        {
            if (inputFilePath == "D260102.P2361.C09" && cusipProcessingResult.Count == 0)
                throw new Exception("Trade order file does not contain order numbers belongs to the investments");

            if (inputFilePath == "D260119.P2084.C00" && matchResults.Count == 0)
                throw new Exception("B50 file does not contain the cusips belongs to the investments");

            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.Parent.FullName;

            string path = Path.Combine(
                projectDirectory,
                "ClassLibrary.Shared",
                "Trade",
                clearingPartner,
                inputFilePath);

            if (!File.Exists(path))
                throw new FileNotFoundException("Input file not found.", path);

            if (inputFilePath == "D260119.P2084.C00")
            {
                await ProcessB50File(path, matchResults);
            }
            else
            {
                await ProcessTradeSettlementFile(path, cusipProcessingResult);
            }
        }

        private static async Task ProcessB50File(string path, List<B50MatchResult> matchResults)
        {
            var lines = File.ReadAllLines(path);

            string header = lines[0];
            string f53Template = lines.First(l => l.StartsWith("F53"));

            var trailers = lines
                .Where(l => l.StartsWith("0201") || l.StartsWith("0302"))
                .ToList();

            var output = new List<string>();

            output.Add(header);

            foreach (var match in matchResults)
            {
                output.Add(ReplaceF53Fields(f53Template, match));
            }

            output.AddRange(trailers);

            File.WriteAllLines(path, output);

            await Task.Delay(2000);
        }

        private static async Task ProcessTradeSettlementFile(
    string path,
    Dictionary<string, CusipProcessingResult> results)
        {
            var lines = File.ReadAllLines(path);

            string header1 = lines[0];
            string header2 = lines[1];

            string tradeTemplate = lines.First(l => l.StartsWith("019701") && !l.Contains("9990"));
            string summaryLine = lines.First(l => l.StartsWith("019701") && l.Contains("9990"));

            decimal totalShares = 0;
            decimal totalAmount = 0;

            var output = new List<string>();

            output.Add(header1);
            output.Add(header2);

            foreach (var result in results.Values)
            {
                var tradeLine = EditTradeResponseFile(tradeTemplate, result);

                var record = new FixedWidthRecord(tradeLine);

                decimal shares = ImpliedDecimalHelper.Parse(
                    record.Get(TradeFields.Shares), 4);

                decimal amount = ImpliedDecimalHelper.Parse(
                    record.Get(TradeFields.Amount), 2);

                totalShares += shares;
                totalAmount += amount;

                output.Add(tradeLine);
            }

            summaryLine = UpdateSummaryLine(
                summaryLine,
                results.Count,
                totalShares,
                totalAmount);

            output.Add(summaryLine);

            File.WriteAllLines(path, output);

            await Task.Delay(2000);
        }


        private static string UpdateSummaryLine(
    string line,
    int tradeCount,
    decimal totalShares,
    decimal totalAmount)
        {
            var record = new FixedWidthRecord(line);

            record.Set(SummaryFields.TradeCount, tradeCount.ToString());

            long sharesForFile = ImpliedDecimalHelper.ToFile(totalShares, 4);
            long amountForFile = ImpliedDecimalHelper.ToFile(totalAmount, 2);

            record.Set(SummaryFields.Shares, sharesForFile.ToString());
            record.Set(SummaryFields.Amount, amountForFile.ToString());

            return record.ToString();
        }

        private static string ReplaceF53Fields(string line, B50MatchResult match)
        {
            var _faker = new Faker();
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
            string tradeIdentifier = _faker.Random.Number(100000000, 999999999).ToString().PadRight(tradeIdentifierLength).Substring(0, tradeIdentifierLength);

            // Replace CUSIP
            for (int i = 0; i < cusipLength; i++)
                chars[cusipStart + i] = cusip[i];

            // Replace Identifier
            for (int i = 0; i < identifierLength; i++)
                chars[identifierStart + i] = identifier[i];

            // Replace Trade Identifier
            for (int i = 0; i < tradeIdentifierLength; i++)
                chars[tradeIdentifierStart + i] = tradeIdentifier[i];

            SFTP.CUSIPTradeIdentifierDict[match.Cusip] = tradeIdentifier.Trim();

            return new string(chars);
        }

        private static string EditTradeResponseFile(string line, CusipProcessingResult result)
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

    

    public class FixedWidthRecord
    {
        private readonly StringBuilder _line;

        public FixedWidthRecord(string line)
        {
            _line = new StringBuilder(line);
        }

        public string Get(FixedWidthFileEditor field)
        {
            return _line.ToString().Substring(field.Start, field.Length);
        }

        public void Set(FixedWidthFileEditor field, string value)
        {
            value = value.PadLeft(field.Length, '0');

            _line.Remove(field.Start, field.Length);
            _line.Insert(field.Start, value);
        }

        public override string ToString()
        {
            return _line.ToString();
        }
    }

    public static class TradeFields
    {
        public static FixedWidthFileEditor Shares = new FixedWidthFileEditor(114, 14);
        public static FixedWidthFileEditor Amount = new FixedWidthFileEditor(140, 16);
    }

    public static class SummaryFields
    {
        public static FixedWidthFileEditor TradeCount = new FixedWidthFileEditor(100, 6);
        public static FixedWidthFileEditor Shares = new FixedWidthFileEditor(114, 14);
        public static FixedWidthFileEditor Amount = new FixedWidthFileEditor(140, 16);
    }

    public static class ImpliedDecimalHelper
    {
        public static decimal Parse(string value, int decimals)
        {
            if (decimal.TryParse(value.TrimStart('0'), out var result))
                return result / (decimal)Math.Pow(10, decimals);

            return 0;
        }

        public static long ToFile(decimal value, int decimals)
        {
            return (long)(value * (decimal)Math.Pow(10, decimals));
        }
    }
}
