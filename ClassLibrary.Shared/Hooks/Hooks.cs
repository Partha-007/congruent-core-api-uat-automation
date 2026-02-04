using Microsoft.Playwright;
using Newtonsoft.Json.Linq;
using Reqnroll;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NSwag.CodeGeneration.CSharp;
using NSwag;
using Renci.SshNet;
using Refit;
using System.Net;
using System.Security.Cryptography;
using System.Text.Json;
using System.Text.RegularExpressions;
using Bogus;
using Bogus.Extensions.UnitedStates;

namespace RefitSandBox.Hooks
{
    [Binding]
    public class Hooks : TestBase
    {
        public Program program;
        public static Bogus.Faker? faker = new Faker();

        public string? bearer;
        public static string? planId, SSN;
        [BeforeScenario]

        //private static string? _bearerToken;

        //public static string BearerToken => _bearerToken!;

        public async Task UserLogin()
        {

            bearer = await GetToken(
                baseUrl: Settings.ApplicationURL,
                clientId: "COREII",
                clientSecret: "postman-secret",
                redirectUri: $"{Settings.ApplicationURL}/authentication/login-callback",
                username: Settings.UserName!,
                password: Settings.Password!,
                enableDebug: true
            );

        }

        private static async Task<string> GetToken(
    string baseUrl,
    string clientId,
    string clientSecret,
    string redirectUri,
    string username,
    string password,
    bool enableDebug = false)
        {
            void Log(string msg)
            {
                if (!enableDebug) return;
                var log = $"[{DateTime.Now:HH:mm:ss}] {msg}";
                Console.WriteLine(log);
                File.AppendAllText("oauth_debug.log", log + Environment.NewLine);
            }

            try
            {
                using var handler = new HttpClientHandler
                {
                    CookieContainer = new CookieContainer(),
                    UseCookies = true,
                    AllowAutoRedirect = true
                };

                using var client = new HttpClient(handler);
                client.DefaultRequestHeaders.UserAgent.ParseAdd("Mozilla/5.0");

                // Generate PKCE challenge
                var codeVerifier = Convert.ToBase64String(RandomNumberGenerator.GetBytes(32))
                    .TrimEnd('=').Replace('+', '-').Replace('/', '_');

                var codeChallenge = Convert.ToBase64String(
                    SHA256.HashData(Encoding.UTF8.GetBytes(codeVerifier)))
                    .TrimEnd('=').Replace('+', '-').Replace('/', '_');

                var state = Guid.NewGuid().ToString("N");

                var authorizeUrl = $"{baseUrl}/connect/authorize?" +
                    $"client_id={clientId}&" +
                    $"redirect_uri={Uri.EscapeDataString(redirectUri)}&" +
                    $"response_type=code&" +
                    $"scope=api openid profile roles offline_access&" +
                    $"state={state}&" +
                    $"code_challenge={codeChallenge}&" +
                    $"code_challenge_method=S256&" +
                    $"response_mode=query";

                Log("Fetching authorization page...");
                var authResp = await client.GetAsync(authorizeUrl);
                var authHtml = await authResp.Content.ReadAsStringAsync();

                var tokenMatch = Regex.Match(authHtml, @"__RequestVerificationToken.*?value=""([^""]+)""");
                if (!tokenMatch.Success) throw new Exception("Verification token not found.");

                // Submit login form
                Log("Submitting login form...");
                var loginForm = new FormUrlEncodedContent(new Dictionary<string, string>
        {
            { "Input.Email", username },
            { "Input.Password", password },
            { "__RequestVerificationToken", tokenMatch.Groups[1].Value }
        });

                var loginResp = await client.PostAsync(authResp.RequestMessage?.RequestUri?.ToString()!, loginForm);

                var redirectUrl = loginResp.RequestMessage?.RequestUri?.ToString() ?? "";
                var codeMatch = Regex.Match(redirectUrl, @"code=([^&]+)");
                if (!codeMatch.Success) throw new Exception("Authorization code not found in redirect URL.");

                var authCode = codeMatch.Groups[1].Value;
                Log($"Received auth code: {authCode[..8]}...");

                // Exchange code for token
                Log("Exchanging code for token...");
                var tokenForm = new FormUrlEncodedContent(new Dictionary<string, string>
        {
            { "client_id", clientId },
            { "client_secret", clientSecret },
            { "grant_type", "authorization_code" },
            { "redirect_uri", redirectUri },
            { "code_verifier", codeVerifier },
            { "code", authCode }
        });

                var tokenResp = await client.PostAsync($"{baseUrl}/connect/token", tokenForm);
                var tokenJson = await tokenResp.Content.ReadAsStringAsync();

                if (!tokenResp.IsSuccessStatusCode)
                {
                    Log($"Token error: {tokenJson}");
                    throw new Exception($"Token request failed: {tokenResp.StatusCode}");
                }

                var doc = JsonDocument.Parse(tokenJson);
                return doc.RootElement.GetProperty("access_token").GetString()!;
            }
            catch (Exception ex)
            {
                Log($"ERROR: {ex.Message}");
                throw;
            }
        }

        //public async Task UserLogin()
        //{
        //    var playwright = await Playwright.CreateAsync();
        //    string chromePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe";

        //    var browserType = playwright.Chromium;
        //    var browser = await browserType.LaunchAsync(new BrowserTypeLaunchOptions
        //    {
        //        ExecutablePath = chromePath,  // My visual studio is not identifying Chrome path so giving manually
        //        Headless = false  //For checking Im using Headless false
        //    });

        //    var page = await browser.NewPageAsync();


        //    await page.GotoAsync($"{Settings.ApplicationURL}/");
        //    var UserNameField = page.Locator("//input[@name = 'Input.Email']");
        //    var PasswordField = page.Locator("//input[@name = 'Input.Password']");
        //    var LoginButton = page.Locator("//button[text()='Log in']");
        //    var PlanConfig = page.Locator("//span[text()='Plan Config']");
        //    await UserNameField.FillAsync($"{Settings.UserName}");
        //    await PasswordField.FillAsync($"{Settings.Password}");
        //    await LoginButton.ClickAsync();
        //    //await PlanConfig.ClickAsync();
        //    await Task.Delay(3000);
        //    await page.WaitForLoadStateAsync();

        //    var isLocalStorageAvailable = await page.EvaluateAsync<bool>("typeof window.localStorage !== 'undefined'");
        //    Console.WriteLine("localStorage available: " + isLocalStorageAvailable);
        //    var localStorage = page.EvaluateAsync<string>("window.localStorage");
        //    var length = await page.EvaluateAsync<string>("window.localStorage.length");
        //    var key = await page.EvaluateAsync<string>("window.localStorage.key(0)");
        //    var bearerToken = await page.EvaluateAsync<string>($"window.localStorage.getItem('COREIIuser:{Settings.ApplicationURL}:COREII')");
        //    JObject jwt = JObject.Parse(bearerToken.ToString());
        //    bearer = jwt["access_token"].ToString();
        //    if (bearer != null)
        //    {
        //        await browser.CloseAsync();
        //    }
        //    //bearer = "eyJhbGciOiJSUzI1NiIsImtpZCI6IkMyN0E0MEI4ODkyOTU2Q0YzOTkxNkQ5MDgzRDY1NEYzRjZDNzlBNzQiLCJ4NXQiOiJ3bnBBdUlrcFZzODVrVzJRZzlaVThfYkhtblEiLCJ0eXAiOiJhdCtqd3QifQ.eyJvaV9wcnN0IjoiQ09SRUlJIiwiaXNzIjoiaHR0cHM6Ly90ZXN0LmNvcmVyZXRpcmVtZW50c29sdXRpb25zLmNvbS8iLCJvaV9hdV9pZCI6Ijk4ZDM1ZWQyLWZkZGQtNDFjNy04ZmQ4LWFlZGEyMGNhNWIzNiIsIlVzZXJJZCI6IjE1Iiwic3ViIjoiMTUiLCJlbWFpbCI6InZpZ25lc2h3YXJhbi5uQGNzcGwuY29tIiwibmFtZSI6InZpZ25lc2h3YXJhbi5uQGNzcGwuY29tIiwidXNlcm5hbWUiOiJ2aWduZXNod2FyYW4ubkBjc3BsLmNvbSIsInJvbGUiOiJTUFUiLCJjbGllbnRfaWQiOiJDT1JFSUkiLCJvaV90a25faWQiOiI3MTg4YjYyNS05YTk5LTRmOWEtODU5NC1mODI1YTVkYmRkMTYiLCJzY29wZSI6ImFwaSBvcGVuaWQgcHJvZmlsZSByb2xlcyBvZmZsaW5lX2FjY2VzcyIsImp0aSI6IjlmOTg4MTg0LTgyZDItNGMwNi1iOGVjLTVmODFkZTQ3ZGI4MyIsImV4cCI6MTc0MDk4NDc5MywiaWF0IjoxNzQwOTgxMTkzfQ.iDFesBukZlnQQ1IWE5bFcTXZNYrK3AoVT52gKO4L8E88V8yRNE5ATjtxKDG7etF2sCgDfcSZsuiQcmr0M2iE0acFkdrxXX3ZjsoEYtgCGEGBWr6pcRhyA16jfqrD3ok-sfhugtkVZzytJL-dpQTFuyTrWR4vOKofL7T6iBIHyIg0EkkxtccRlnPPZIzLbpXMY6-42MPfL6gPqrUFXDB43tkCreTHnxFaNEAHYRDryCMNnf9wKmnwpR5Y6BIiJExul4UQH_Ts0-zDQfD3AWEOBP380zVSjZKCcMkq3uWFxTc6NfPxnD-604UkPCKaDhVjkfL5HoleQpIbQVYOaRKunw";
        //}


        [BeforeFeature("@MatchPlanActivation")]
        public static async Task<string> MatchPlanActivation()
        {
            var hook = new Hooks();
            await hook.UserLogin();
            string companyId = await Program.SaveCompany(hook.bearer); // Static method call
            planId = await Program.SavePlan(hook.bearer, companyId);
            await Program.SaveSponsor(hook.bearer, planId);
            await Program.ClearingPartnerPlanMapping(hook.bearer, planId);
            await Program.EligibilityConfiguration(hook.bearer, planId);
            await Program.SaveEntryDate(hook.bearer, planId);
            await Program.SavePretaxSource(hook.bearer, planId);
            await Program.SaveRothSource(hook.bearer, planId);
            await Program.SaveCompensation(hook.bearer, planId);
            await Program.UpdatePlanStatus(hook.bearer, planId, "2");
            await Program.UpdatePlanStatus(hook.bearer, planId, "3");
            await Program.AddInvestmentsToPlan(hook.bearer, planId);
            await Program.SaveEnrollmentSettings(hook.bearer, planId);
            await Program.SaveFunding(hook.bearer, planId);





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

            //await Program.GetUploadedFilesBasedOnSearchCriteria(bearer, companyName, planName, rkPlanNumber);
            return planId;



        }

        [BeforeScenario("@SSNGenerate")]
        public static string SSNGenerate()
        {
            SSN = faker!.Person.Ssn();
            return SSN;
        }


        [BeforeScenario("@PlanActivation")]
        public async Task<string> PlanActivation()
        {
            string companyId = await Program.SaveCompany(bearer); // Static method call
            planId = await Program.SavePlan(bearer, companyId);
            await Program.SaveSponsor(bearer, planId);
            await Program.ClearingPartnerPlanMapping(bearer, planId);
            await Program.EligibilityConfiguration(bearer, planId);
            await Program.SaveEntryDate(bearer, planId);
            await Program.SavePretaxSource(bearer, planId);
            await Program.SaveMatchSource(bearer, planId);
            await Program.SaveCompensation(bearer, planId);
            await Program.UpdatePlanStatus(bearer, planId, "2");
            await Program.UpdatePlanStatus(bearer, planId, "3");
            await Program.AddInvestmentsToPlan(bearer, planId);
            await Program.SaveEnrollmentSettings(bearer, planId);
            await Program.SaveFunding(bearer, planId);
            //await Program.GetUploadedFilesBasedOnSearchCriteria(bearer, companyName, planName, rkPlanNumber);
            return planId;
        }

        [BeforeScenario("@PlanActivationWithoutInvestmentAndEnrollment")]
        public async Task PlanActivationWithoutInvestment()
        {
            string companyId = await Program.SaveCompany(bearer); // Static method call
            planId = await Program.SavePlan(bearer, companyId);

            await Program.SaveSponsor(bearer, planId);
            await Program.ClearingPartnerPlanMapping(bearer, planId);
            await Program.EligibilityConfiguration(bearer, planId);
            await Program.SaveEntryDate(bearer, planId);
            await Program.SavePretaxSource(bearer, planId);
            await Program.SaveMatchSource(bearer, planId);
            await Program.SaveRothSource(bearer, planId);
            await Program.SaveCompensation(bearer, planId);
            await Program.UpdatePlanStatus(bearer, planId, "2");
            await Program.UpdatePlanStatus(bearer, planId, "3");
            await Program.SaveFunding(bearer, planId);
        }

        [BeforeTestRun]
        public static async Task CompanyCreation()
        {
            await UserLogin();
            var program = new Program();
            companyId = await Program.SaveCompany(bearer); // Static method call
            planId = await Program.SavePlan(bearer, companyId);
            await Program.SaveSponsor(bearer, planId);
            await Program.ClearingPartnerPlanMapping(bearer, planId);
            await Program.EligibilityConfiguration(bearer, planId);
            await Program.SaveEntryDate(bearer, planId);
            await Program.SavePretaxSource(bearer, planId);
            //await Program.SavePretaxRollOverSource(bearer, planId);
            //await Program.SaveMatchSource(bearer, planId);
            await Program.SaveRothSource(bearer, planId);
            await Program.SaveCompensation(bearer, planId);
            await program.AddInvestmentToPlan("SEAS001");
            await program.AddInvestmentToPlan("SEAS002");
            await Program.EnrollmentSetup();
            await Program.UpdatePlanStatus(bearer, planId, "2");
            await Program.UpdatePlanStatus(bearer, planId, "3");
            await Program.SaveFunding(bearer, planId);
            //RollOverSource = await Program.SavePretaxRollOverSource(bearer, planId);
        }

    }
}
