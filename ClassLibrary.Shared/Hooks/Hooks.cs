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

namespace RefitSandBox.Hooks
{
    [Binding]
    public class Hooks
    {
        public Program program;
        
        public string bearer;
        [BeforeScenario]
        public async Task UserLogin()
        {
            /*var playwright = await Playwright.CreateAsync();
            string chromePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe";

            var browserType = playwright.Chromium;
            var browser = await browserType.LaunchAsync(new BrowserTypeLaunchOptions
            {
                ExecutablePath = chromePath,  // My visual studio is not identifying Chrome path so giving manually
                Headless = true  //For checking Im using Headless false
            });

            var page = await browser.NewPageAsync();


            await page.GotoAsync("https://test.coreretirementsolutions.com/");
            var UserNameField = page.Locator("//input[@name = 'Input.Email']");
            var PasswordField = page.Locator("//input[@name = 'Input.Password']");
            var LoginButton = page.Locator("//button[text()='Log in']");
            var PlanConfig = page.Locator("//span[text()='Plan Config']");
            await UserNameField.FillAsync("vigneshwaran.n@cspl.com");
            await PasswordField.FillAsync("Admin@123");
            await LoginButton.ClickAsync();
            //await PlanConfig.ClickAsync();
            await Task.Delay(3000);
            await page.WaitForLoadStateAsync();

            var isLocalStorageAvailable = await page.EvaluateAsync<bool>("typeof window.localStorage !== 'undefined'");
            Console.WriteLine("localStorage available: " + isLocalStorageAvailable);
            var localStorage = page.EvaluateAsync<string>("window.localStorage");
            var length = await page.EvaluateAsync<string>("window.localStorage.length");
            var key = await page.EvaluateAsync<string>("window.localStorage.key(0)");
            var bearerToken = await page.EvaluateAsync<string>("window.localStorage.getItem('COREIIuser:https://test.coreretirementsolutions.com:COREII')");
            JObject jwt = JObject.Parse(bearerToken.ToString());
            bearer = jwt["access_token"].ToString();*/
            bearer = "eyJhbGciOiJSUzI1NiIsImtpZCI6IkMyN0E0MEI4ODkyOTU2Q0YzOTkxNkQ5MDgzRDY1NEYzRjZDNzlBNzQiLCJ4NXQiOiJ3bnBBdUlrcFZzODVrVzJRZzlaVThfYkhtblEiLCJ0eXAiOiJhdCtqd3QifQ.eyJvaV9wcnN0IjoiQ09SRUlJIiwiaXNzIjoiaHR0cHM6Ly90ZXN0LmNvcmVyZXRpcmVtZW50c29sdXRpb25zLmNvbS8iLCJvaV9hdV9pZCI6Ijk4ZDM1ZWQyLWZkZGQtNDFjNy04ZmQ4LWFlZGEyMGNhNWIzNiIsIlVzZXJJZCI6IjE1Iiwic3ViIjoiMTUiLCJlbWFpbCI6InZpZ25lc2h3YXJhbi5uQGNzcGwuY29tIiwibmFtZSI6InZpZ25lc2h3YXJhbi5uQGNzcGwuY29tIiwidXNlcm5hbWUiOiJ2aWduZXNod2FyYW4ubkBjc3BsLmNvbSIsInJvbGUiOiJTUFUiLCJjbGllbnRfaWQiOiJDT1JFSUkiLCJvaV90a25faWQiOiJkMTdhOTdiMy03N2MzLTQxZmMtOTU4Yy0wYjgyYTI1OWQwZDgiLCJzY29wZSI6ImFwaSBvcGVuaWQgcHJvZmlsZSByb2xlcyBvZmZsaW5lX2FjY2VzcyIsImp0aSI6IjEyYWRkOTE1LTg3NTQtNDIzYS04ZDg4LTdlZDUxOGMxOTkwMyIsImV4cCI6MTc0MDQ4NDIzNiwiaWF0IjoxNzQwNDgwNjM2fQ.NhYzFP1_knrZbetiXS9qAAklI8laWDQIj_id_zMW8sp9WWsRhJmbGe7ZaTz2BeJpoeY2dA8nLkbG6g0_Dkvm9jYDqyx6k6GuJA28wlnYKuU7y7DkDPPxancfNcQvTqyoSUYbQ5yuitNQ9UgoTR4MqrPr52QzMfDelj06fFxiwmymUrbNQM_NxDCCfgm0XMVO-kh9QvVRy_kGKCJ7jd0b8uEgfKfZDfWx3P6vmsXeKipGTW61s0h_yBH-Vgs58qERWfEcP03TuwBnLpCDGHifCVQmLigVWSPGIejvRaLnqkeF3K-NlI0t_isyPlbPDHUn9rqGS9XDkIIyJCTj98nE0w";
        }

        [BeforeScenario("@SaveEmployee")]
        public async Task<string> CallSaveCompany()
        {
            string planId = "1695";
            //string companyId = await Program.SaveCompany(bearer); // Static method call
            //string planId = await Program.SavePlan(bearer, companyId);
            //await Program.SaveSponsor(bearer, planId);
            //await Program.ClearingPartnerPlanMapping(bearer, planId);
            await Program.EligibilityConfiguration(bearer, planId);
            //await Program.SaveEntryDate(bearer, planId);
            //await Program.SaveSource(bearer, planId);
            //await Program.SaveCompensation(bearer, planId);
            return planId;
        }


    }
}
