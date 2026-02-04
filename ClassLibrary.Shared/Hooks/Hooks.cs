using ClassLibrary.Shared.AppSettings;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Configuration;
using Microsoft.Playwright;
using Microsoft.Playwright;
using Newtonsoft.Json.Linq;
using NSwag;
using NSwag.CodeGeneration.CSharp;
using Refit;
using Renci.SshNet;
using Reqnroll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Text.Json;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace RefitSandBox.Hooks
{
    [Binding]
    public class Hooks : TestBase
    {
        public Program program;
        
        
        public static string? bearer;
        //public string planId;
        public static string? companyId, planId, RollOverSource;
        private static AppSettings? _appSettings;
        public static string? url, name, password;

        public static string GetAppsettingsPath()
        {
            var currentDir = AppDomain.CurrentDomain.BaseDirectory;

            while (!string.IsNullOrEmpty(currentDir))
            {
                var potentialPath = Path.Combine(currentDir, "ClassLibrary.Shared","AppSettings");

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
                string log = $"[{DateTime.Now:HH:mm:ss}] {msg}";
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

                // PKCE: generate verifier and challenge
                string codeVerifier = Convert.ToBase64String(RandomNumberGenerator.GetBytes(32))
                    .TrimEnd('=').Replace('+', '-').Replace('/', '_');
                string codeChallenge = Convert.ToBase64String(
                    SHA256.HashData(Encoding.UTF8.GetBytes(codeVerifier)))
                    .TrimEnd('=').Replace('+', '-').Replace('/', '_');

                string state = Guid.NewGuid().ToString("N");
                string authorizeUrl = $"{baseUrl}/connect/authorize" +
                    $"?client_id={clientId}" +
                    $"&redirect_uri={Uri.EscapeDataString(redirectUri)}" +
                    $"&response_type=code" +
                    $"&scope=api openid profile roles offline_access" +
                    $"&state={state}" +
                    $"&code_challenge={codeChallenge}" +
                    $"&code_challenge_method=S256" +
                    $"&response_mode=query";

                Log("Fetching authorization page...");
                var authResp = await client.GetAsync(authorizeUrl);
                var authHtml = await authResp.Content.ReadAsStringAsync();

                var tokenMatch = Regex.Match(authHtml, @"__RequestVerificationToken.*?value=""([^""]+)""");
                if (!tokenMatch.Success) throw new Exception("Verification token not found in login page.");

                string verificationToken = tokenMatch.Groups[1].Value;

                // Submit login form
                var loginForm = new FormUrlEncodedContent(new Dictionary<string, string>
                {
                    { "Input.Email", username },
                    { "Input.Password", password },
                    { "__RequestVerificationToken", verificationToken }
                });

                Log("Submitting login form...");
                var loginResp = await client.PostAsync(authResp.RequestMessage.RequestUri.ToString(), loginForm);

                string redirectedUrl = loginResp.RequestMessage.RequestUri?.ToString() ?? "";
                var codeMatch = Regex.Match(redirectedUrl, @"code=([^&]+)");
                if (!codeMatch.Success) throw new Exception("Authorization code not found in redirect URL.");

                string authCode = codeMatch.Groups[1].Value;
                Log($"Received auth code: {authCode.Substring(0, 8)}...");

                // Exchange code for token
                var tokenForm = new FormUrlEncodedContent(new Dictionary<string, string>
                {
                    { "client_id", clientId },
                    { "client_secret", clientSecret },
                    { "grant_type", "authorization_code" },
                    { "redirect_uri", redirectUri },
                    { "code_verifier", codeVerifier },
                    { "code", authCode }
                });

                Log("Exchanging code for token...");
                var tokenResp = await client.PostAsync($"{baseUrl}/connect/token", tokenForm);
                string tokenJson = await tokenResp.Content.ReadAsStringAsync();

                if (!tokenResp.IsSuccessStatusCode)
                {
                    Log($"Token error response: {tokenJson}");
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

        [BeforeScenario("@PlanActivation")]
        public async Task<string> PlanActivation()
        {
            string companyId = await Program.SaveCompany(Hooks.bearer); // Static method call
            planId = await Program.SavePlan(bearer, companyId);
            await Program.SaveSponsor(bearer!, planId);
            await Program.ClearingPartnerPlanMapping(bearer, planId);
            await Program.EligibilityConfiguration(bearer, planId);
            await Program.SaveEntryDate(bearer, planId);
            await Program.SavePretaxSource(bearer, planId);
            //await Program.SavePretaxRollOverSource(bearer, planId);
            //await Program.SaveMatchSource(bearer, planId);
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
            //await Program.SavePretaxRollOverSource(bearer, planId);
            //await Program.SaveMatchSource(bearer, planId);
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
