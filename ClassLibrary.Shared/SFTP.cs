using RefitSandBox.Hooks;
using Renci.SshNet;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared
{
    public class SFTP : TestBase
    {
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


        private static List<B50MatchResult> ProcessFile(StreamReader reader,string searchValue)
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



        private static void TryMatchBlock(string b5001Line,string b5005Line,string searchValue,int blockNumber,List<B50MatchResult> results)
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




    }

    public class B50MatchResult
    {
        public string Cusip { get; set; }
        public string Identifier { get; set; }
        public int BlockNumber { get; set; }
    }


}

