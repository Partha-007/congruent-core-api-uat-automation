using Bogus;
using ClassLibrary.Shared.AppSettings;
using FizzWare.NBuilder;
using Generator.sourceGenerator;
using Microsoft.ApplicationInsights;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Playwright;
using Microsoft.VisualStudio.TestPlatform.TestHost;
using MyNamespace;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using NSwag;
using NSwag.CodeGeneration.CSharp;
using Refit;
using Renci.SshNet;
using Reqnroll;
using Reqnroll.Assist;
using SharedStepDefinitions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http.Headers;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using static Org.BouncyCastle.Math.EC.ECCurve;

namespace RefitSandBox.Hooks
{
    [Binding]
    public partial class Hooks : TestBase
    {


        public Program? program;
        public SampleStepDefinitions _sampledefinition;
        public static int i = 0, j = 0,AccountId;
        public static HttpClient? httpClient;
        public static Faker? faker = new Faker();

        public static string? bearer;
        //public string planId;
        public static string? companyId, planId, RollOverSource;
        public static AppSettings? _appSettings;
        public static string? url, name, password, clearingPartnerName, iD;

        //DataTable configTable = new DataTable();
        //public List<Dictionary<string, Dictionary<string, string>>> ClearingPartners { get; set; }

        public class CPInfo
        {
            public int Id { get; set; }
            public string? Name { get; set; }
            //public string Logo { get; set; }
            //public int NoOfPlan { get; set; }
            //public DateTime CreatedDate { get; set; }
        }

        public static string GetAppsettingsPath()
        {
            var currentDir = AppDomain.CurrentDomain.BaseDirectory;

            while (!string.IsNullOrEmpty(currentDir))
            {
                var potentialPath = Path.Combine(currentDir, "ClassLibrary.Shared", "AppSettings");

                if (Directory.Exists(potentialPath))
                    return potentialPath;

                currentDir = Directory.GetParent(currentDir)?.FullName;
            }

            throw new DirectoryNotFoundException($"Helpers folder not found starting from {AppDomain.CurrentDomain.BaseDirectory}");
        }

        public static IConfiguration BuildConfig(string sharedConfigPath)
        {
            var builder = new ConfigurationBuilder()
                .SetBasePath(sharedConfigPath)
                .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true);

            return builder.Build();
        }

        public static async Task getAppSettings()
        {
            string sharedConfigPath = GetAppsettingsPath();
            var config = BuildConfig(sharedConfigPath);
            _appSettings = config.GetSection(AppSettings.Name).Get<AppSettings>();

            url = _appSettings?.ApplicationURL;
            name = _appSettings?.UserName; password = _appSettings?.Password;
        }

        private static async Task<string> GetToken(string baseUrl, string clientId, string clientSecret, string redirectUri, string username, string password, bool enableDebug = false)
        {
            void Log(string msg)
            {
                if (!enableDebug) return;
                Console.WriteLine($"[{DateTime.Now:HH:mm:ss}] {msg}");
            }

            try
            {
                using var handler = new HttpClientHandler
                {
                    CookieContainer = new CookieContainer(),
                    UseCookies = true,
                    AllowAutoRedirect = true,
                    AutomaticDecompression = System.Net.DecompressionMethods.GZip | System.Net.DecompressionMethods.Deflate
                };

                using var client = new HttpClient(handler)
                {
                    Timeout = TimeSpan.FromSeconds(30)
                };
                client.DefaultRequestHeaders.UserAgent.ParseAdd("Mozilla/5.0");
                client.DefaultRequestHeaders.AcceptEncoding.ParseAdd("gzip, deflate");

                // PKCE: generate verifier and challenge (without Span)
                byte[] randomBytes = new byte[32];
                using (var rng = RandomNumberGenerator.Create())
                {
                    rng.GetBytes(randomBytes);
                }

                string codeVerifier = Convert.ToBase64String(randomBytes)
                    .TrimEnd('=').Replace('+', '-').Replace('/', '_');

                byte[] codeVerifierBytes = Encoding.UTF8.GetBytes(codeVerifier);
                byte[] hashBytes = SHA256.HashData(codeVerifierBytes);

                string codeChallenge = Convert.ToBase64String(hashBytes)
                    .TrimEnd('=').Replace('+', '-').Replace('/', '_');

                string state = Guid.NewGuid().ToString("N");

                // Use StringBuilder for URL construction
                var authorizeUrlBuilder = new StringBuilder(baseUrl.Length + 256)
                    .Append(baseUrl)
                    .Append("/connect/authorize?client_id=")
                    .Append(clientId)
                    .Append("&redirect_uri=")
                    .Append(Uri.EscapeDataString(redirectUri))
                    .Append("&response_type=code&scope=api%20openid%20profile%20roles%20offline_access&state=")
                    .Append(state)
                    .Append("&code_challenge=")
                    .Append(codeChallenge)
                    .Append("&code_challenge_method=S256&response_mode=query");

                string authorizeUrl = authorizeUrlBuilder.ToString();

                Log("Fetching authorization page...");

                var authResp = await client.GetAsync(authorizeUrl);
                string authHtml = await authResp.Content.ReadAsStringAsync();

                // Use compiled regex for better performance
                var tokenMatch = Regex.Match(authHtml, @"__RequestVerificationToken.*?value=""([^""]+)""", RegexOptions.Compiled);
                if (!tokenMatch.Success)
                    throw new Exception("Verification token not found in login page.");

                string verificationToken = tokenMatch.Groups[1].Value;

                // Reuse dictionary for form data
                var loginFormData = new Dictionary<string, string>(3)
        {
            { "Input.Email", username },
            { "Input.Password", password },
            { "__RequestVerificationToken", verificationToken }
        };

                using var loginForm = new FormUrlEncodedContent(loginFormData);

                Log("Submitting login form...");
                var loginResp = await client.PostAsync(authResp.RequestMessage!.RequestUri!.ToString(), loginForm);

                string redirectedUrl = loginResp.RequestMessage?.RequestUri?.ToString() ?? "";

                var codeMatch = Regex.Match(redirectedUrl, @"code=([^&]+)", RegexOptions.Compiled);
                if (!codeMatch.Success)
                    throw new Exception("Authorization code not found in redirect URL.");

                string authCode = codeMatch.Groups[1].Value;
                Log($"Received auth code: {authCode[..Math.Min(8, authCode.Length)]}...");

                // Reuse dictionary for token exchange
                var tokenFormData = new Dictionary<string, string>(6)
        {
            { "client_id", clientId },
            { "client_secret", clientSecret },
            { "grant_type", "authorization_code" },
            { "redirect_uri", redirectUri },
            { "code_verifier", codeVerifier },
            { "code", authCode }
        };

                using var tokenForm = new FormUrlEncodedContent(tokenFormData);

                Log("Exchanging code for token...");
                var tokenResp = await client.PostAsync($"{baseUrl}/connect/token", tokenForm);
                string tokenJson = await tokenResp.Content.ReadAsStringAsync();

                if (!tokenResp.IsSuccessStatusCode)
                {
                    Log($"Token error: {tokenResp.StatusCode}");
                    throw new Exception($"Token request failed: {tokenResp.StatusCode}");
                }

                // Use JsonDocument for faster parsing
                using var doc = JsonDocument.Parse(tokenJson);
                return doc.RootElement.GetProperty("access_token").GetString()!;
            }
            catch (Exception ex)
            {
                Log($"ERROR: {ex.Message}");
                throw;
            }
        }


        [GeneratedRegex(@"__RequestVerificationToken.*?value=""([^""]+)""", RegexOptions.Compiled)]
        private static partial Regex VerificationTokenRegex();

        [GeneratedRegex(@"code=([^&]+)", RegexOptions.Compiled)]
        private static partial Regex AuthCodeRegex();
        public static async Task UserLogin()
        {
            string sharedConfigPath = GetAppsettingsPath();
            var config = BuildConfig(sharedConfigPath);
            _appSettings = config.GetSection(AppSettings.Name).Get<AppSettings>();

            url = _appSettings?.ApplicationURL;
            name = _appSettings?.UserName; password = _appSettings?.Password;

            bearer = await GetToken(
              url!,
              "COREII",
              "postman-secret",
              $"{url!}/authentication/login-callback",
              name!,
              password!,
              enableDebug: true
          );
        }


        [BeforeFeature("@MatchPlanActivation")]
        public static async Task<string> MatchPlanActivation()
        {
            httpClient = new HttpClient
            {
                BaseAddress = new Uri(_appSettings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer!);
            var hook = new Hooks();
            await UserLogin();
            string companyId = await Program.SaveCompany(bearer!); // Static method call
            planId = await Program.SavePlan(bearer!, companyId);
            await Program.SaveSponsor(httpClient, bearer!, planId);
            await Program.ClearingPartnerPlanMapping(bearer!, planId);
            await Program.EligibilityConfiguration(_appSettings.ApplicationURL, httpClient, bearer!, planId);
            await Program.SaveEntryDate(httpClient, bearer!, planId);
            await Program.SavePretaxSource(bearer!, planId);
            await Program.SaveRothSource(bearer!, planId);
            await Program.SaveCompensation(bearer!, planId);
            await Program.UpdatePlanStatus(bearer!, planId, "2");
            await Program.UpdatePlanStatus(bearer!, planId, "3");
            await Program.AddInvestmentsToPlan(bearer!, planId);
            await Program.SaveEnrollmentSettings(bearer!, planId);
            await Program.SaveFunding(bearer!, planId);





            // Load the OpenAPI document (adjust the file path as needed)
            var document = await OpenApiDocument.FromFileAsync("D:\\01MODULES\\Congruent.Core.API.TestAutomation\\SourceGenerator\\json1.json");

            // Create settings for the CSharpClientGenerator
            var settings = new CSharpClientGeneratorSettings
            {
                ClassName = "MyApiClient",
                //Namespace = "MyNamespace"       
            };


            var generator = new CSharpClientGenerator(document, settings);

            // Generate the client code as a string
            var code = generator.GenerateFile();

            // Optionally, save the generated code to a .cs file
            File.WriteAllText("GeneratedApiClient.cs", code);

            //await Program.GetUploadedFilesBasedOnSearchCriteria(bearer!, companyName, planName, rkPlanNumber);
            return planId;



        }

        [BeforeScenario("@PlanActivation")]
        public async Task<string> PlanActivation()
        {
            httpClient = new HttpClient
            {
                BaseAddress = new Uri(_appSettings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer!);
            string companyId = await Program.SaveCompany(Hooks.bearer); // Static method call
            planId = await Program.SavePlan(bearer!, companyId);
            await Program.SaveSponsor(httpClient, bearer!, planId);
            await Program.ClearingPartnerPlanMapping(bearer!, planId);
            await Program.EligibilityConfiguration(_appSettings.ApplicationURL, httpClient, bearer!, planId);
            await Program.SaveEntryDate(httpClient, bearer!, planId);
            await Program.SavePretaxSource(bearer!, planId);
            //await Program.SavePretaxRollOverSource(bearer!, planId);
            //await Program.SaveMatchSource(bearer!, planId);
            await Program.SaveCompensation(bearer!, planId);
            await Program.UpdatePlanStatus(bearer!, planId, "2");
            await Program.UpdatePlanStatus(bearer!, planId, "3");
            await Program.AddInvestmentsToPlan(bearer!, planId);
            await Program.SaveEnrollmentSettings(bearer!, planId);
            await Program.SaveFunding(bearer!, planId);
            //await Program.GetUploadedFilesBasedOnSearchCriteria(bearer!, companyName, planName, rkPlanNumber);
            return planId;
        }

        [BeforeScenario("@PlanActivationWithoutInvestmentAndEnrollment")]
        public async Task PlanActivationWithoutInvestment()
        {
            httpClient = new HttpClient
            {
                BaseAddress = new Uri(_appSettings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer!);
            string companyId = await Program.SaveCompany(bearer); // Static method call
            planId = await Program.SavePlan(bearer!, companyId);

            await Program.SaveSponsor(httpClient, bearer!, planId);
            await Program.ClearingPartnerPlanMapping(bearer!, planId);
            await Program.EligibilityConfiguration(_appSettings.ApplicationURL, httpClient, bearer!, planId);
            await Program.SaveEntryDate(httpClient, bearer!, planId);
            await Program.SavePretaxSource(bearer!, planId);
            //await Program.SavePretaxRollOverSource(bearer!, planId);
            //await Program.SaveMatchSource(bearer!, planId);
            await Program.SaveRothSource(bearer!, planId);
            await Program.SaveCompensation(bearer!, planId);
            await Program.UpdatePlanStatus(bearer!, planId, "2");
            await Program.UpdatePlanStatus(bearer!, planId, "3");
            await Program.SaveFunding(bearer!, planId);
        }

        [BeforeScenario("@CompanyAndPlanBasicDetails")]
        public async Task CompanyAndPlanBasicDetails()
        {
            httpClient = new HttpClient
            {
                BaseAddress = new Uri(_appSettings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer!);
            string companyId = await Program.SaveCompany(bearer); // Static method call
            planId = await Program.SavePlan(bearer!, companyId);
        }

        public static async Task<DataTable> ChangeTable(DataTable table, string[] rowData)
        {
            foreach (var item in rowData)
            {
                var keyValue = item.Split(':');

                if (keyValue.Length == 2)
                {
                    string key = keyValue[0], value = keyValue[1];


                    var existingRow = table.Rows.FirstOrDefault(row => row["Key"].ToString() == key);

                    if (existingRow != null)
                        existingRow["Value"] = value;

                }
            }

            return table;
        }

        

        public static async Task<int> CreateCPAccount(string name, int id)
        {
            var cpModel = new ClearingPartnerViewModel
            {
                Id = 0,
                ClearingPartnerId = id,
                Description = $"Account for {name}",
                AccountName = name,
                AccountAggregationLevel = AccountAggregationLevel._0,
                BankAccountType = BankAccountType._1,
                BankName = faker!.Finance.AccountName(),
                AbaRoutingNumber = faker!.Finance.RoutingNumber(),
                AccountNumber = faker!.Finance.Account(9)
            };

            var refitSettings = new RefitSettings
            {
                ContentSerializer = new NewtonsoftJsonContentSerializer(new JsonSerializerSettings())
            };

            var clearingPartnerInterface = RestService.For<IClearingPartner>(httpClient, refitSettings);

            int accId = 0;
            try
            {
                await clearingPartnerInterface.AddClearingPartnerAccount(cpModel);

                var responseObject = await clearingPartnerInterface.GetMasterClearingPartnerAccounts(id);

                var clearingPartnerListArray = JObject.Parse(responseObject.ToString())["clearingPartnerListResponses"] as JArray;

                accId = clearingPartnerListArray?
                    .Where(x => x["accountName"] != null && x["accountName"]!.ToString().Equals(name, StringComparison.OrdinalIgnoreCase))
                    .Select(x => Convert.ToInt32(x["id"]))
                    .FirstOrDefault() ?? 0;
            }
            catch (Refit.ValidationApiException ex)
            {
                var problemDetails = ex.Content != null ? ex.Content.Errors : null;
                throw;
            }

            return accId;
        }

        public static async Task<Dictionary<string, string>> GetClearingPartner(HttpClient httpClient)
        {
            // Prepare list of partners with fake names
            var listOfClearingPartners = _appSettings.ClearingPartners
                .Where(p => !string.IsNullOrEmpty(p.Name))
                .ToDictionary(p => p.Name, p => faker!.Name.FirstName());


            var clearingPartnerInterface = RestService.For<IClearingPartner>(httpClient);
            var masterClearingPartnersResponse = await clearingPartnerInterface.GetMasterClearingPartnersId();

            var apiPartnersDictionary = JArray.Parse(masterClearingPartnersResponse.ToString())
                .ToDictionary(
                    p => p["name"]!.ToString(),
                    p => p["id"]!.ToString()
                );

            // Run CreateCPAccount in parallel for faster execution
            var tasks = listOfClearingPartners.Select(async configuredPartner =>
            {
                if (apiPartnersDictionary.TryGetValue(configuredPartner.Key, out var partnerIdStr) &&
                    int.TryParse(partnerIdStr, out int partnerId))
                {
                    AccountId = await CreateCPAccount(configuredPartner.Value, partnerId);
                }
                else
                {
                    Console.WriteLine($"Clearing Partner: {configuredPartner.Key} Not found in API response");
                }
            });

            await Task.WhenAll(tasks);

            return apiPartnersDictionary;
        }



        [BeforeTestRun]
        public static async Task CompanyCreation()
        {
            //var prm = new Programs();
            //await prm.GenerateApiClientAsync();

            

            await UserLogin();


            // Initialize HttpClient
            httpClient = new HttpClient
            {
                BaseAddress = new Uri(_appSettings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization =
                new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer!);

            var listOfClearingPartners = await GetClearingPartner(httpClient);




            j = _appSettings!.ClearingPartners.Count();

            var ListofClearingPartners = new Dictionary<string, string>();

            foreach (var partner in _appSettings.ClearingPartners)
            {

                // ListofClearingPartners[partner] = $"{partner}001";
            }


            //  var partnersList = JsonConvert.DeserializeObject<List<CPInfo>>(response.ToString());






            var program = new Program();
            companyId = await Program.SaveCompany(bearer!); // Static method call
            for (i = 1; i < j; i++)
            {
                planId = await Program.SavePlan(bearer!, companyId);
                await Program.SaveSponsor(httpClient, bearer!, planId);
                //await Program.ClearingPartnerPlanMapping(bearer!, planId);
                await Program.UpsertPlanWithClearingPartnerAccount(httpClient, planId, AccountId);
                await Program.EligibilityConfiguration(_appSettings.ApplicationURL, httpClient, bearer!, planId);
                await Program.SaveEntryDate(httpClient, bearer!, planId);
                await Program.SavePretaxSource(bearer!, planId);
                //await Program.SavePretaxRollOverSource(bearer!, planId);
                //await Program.SaveMatchSource(bearer!, planId);
                await Program.SaveRothSource(bearer!, planId);
                await Program.SaveCompensation(bearer!, planId);
            }


            await program.AddInvestmentToPlan("SEAS001");
            await program.AddInvestmentToPlan("SEAS002");
            await program.EnrollmentSetup();
            await Program.SaveFunding(bearer!, planId);
            clearingPartnerName = _appSettings.ClearingPartners.Select(_ => _.Name).FirstOrDefault() ?? "DefaultPartner";
            await program.TradeOutboundFileGeneration(clearingPartnerName, AccountId);
            await Program.UpdatePlanStatus(bearer!, planId, "2");
            await Program.UpdatePlanStatus(bearer!, planId, "3");
            await Program.SaveEmployee(httpClient, companyId);
            //RollOverSource = await Program.SavePretaxRollOverSource(bearer!, planId);
            await Program.SavePretaxRolloverSource(bearer!, planId);
        }

    }
}



