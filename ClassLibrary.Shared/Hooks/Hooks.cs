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

namespace RefitSandBox.Hooks
{
    [Binding]
    public class Hooks
    {
        public Program program;
        
        public string bearer;
        public string planId;
        [BeforeScenario]
        public async Task UserLogin()
        {
            var playwright = await Playwright.CreateAsync();
            string chromePath = @"C:\Program Files\Google\Chrome\Application\chrome.exe";

            var browserType = playwright.Chromium;
            var browser = await browserType.LaunchAsync(new BrowserTypeLaunchOptions
            {
                ExecutablePath = chromePath,  // My visual studio is not identifying Chrome path so giving manually
                Headless = true  //For checking Im using Headless false
            });

            var page = await browser.NewPageAsync();


            await page.GotoAsync("https://dev.coreretirementsolutions.com/");
            var UserNameField = page.Locator("//input[@name = 'Input.Email']");
            var PasswordField = page.Locator("//input[@name = 'Input.Password']");
            var LoginButton = page.Locator("//button[text()='Log in']");
            var PlanConfig = page.Locator("//span[text()='Plan Config']");
            await UserNameField.FillAsync("mageshwaran.u@cspl.com");
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
            var bearerToken = await page.EvaluateAsync<string>("window.localStorage.getItem('COREIIuser:https://dev.coreretirementsolutions.com:COREII')");
            JObject jwt = JObject.Parse(bearerToken.ToString());
            bearer = jwt["access_token"].ToString();
            if(bearer != null)
            {
                await browser.CloseAsync();
            }
            //bearer = "eyJhbGciOiJSUzI1NiIsImtpZCI6IkMyN0E0MEI4ODkyOTU2Q0YzOTkxNkQ5MDgzRDY1NEYzRjZDNzlBNzQiLCJ4NXQiOiJ3bnBBdUlrcFZzODVrVzJRZzlaVThfYkhtblEiLCJ0eXAiOiJhdCtqd3QifQ.eyJvaV9wcnN0IjoiQ09SRUlJIiwiaXNzIjoiaHR0cHM6Ly90ZXN0LmNvcmVyZXRpcmVtZW50c29sdXRpb25zLmNvbS8iLCJvaV9hdV9pZCI6Ijk4ZDM1ZWQyLWZkZGQtNDFjNy04ZmQ4LWFlZGEyMGNhNWIzNiIsIlVzZXJJZCI6IjE1Iiwic3ViIjoiMTUiLCJlbWFpbCI6InZpZ25lc2h3YXJhbi5uQGNzcGwuY29tIiwibmFtZSI6InZpZ25lc2h3YXJhbi5uQGNzcGwuY29tIiwidXNlcm5hbWUiOiJ2aWduZXNod2FyYW4ubkBjc3BsLmNvbSIsInJvbGUiOiJTUFUiLCJjbGllbnRfaWQiOiJDT1JFSUkiLCJvaV90a25faWQiOiI3MTg4YjYyNS05YTk5LTRmOWEtODU5NC1mODI1YTVkYmRkMTYiLCJzY29wZSI6ImFwaSBvcGVuaWQgcHJvZmlsZSByb2xlcyBvZmZsaW5lX2FjY2VzcyIsImp0aSI6IjlmOTg4MTg0LTgyZDItNGMwNi1iOGVjLTVmODFkZTQ3ZGI4MyIsImV4cCI6MTc0MDk4NDc5MywiaWF0IjoxNzQwOTgxMTkzfQ.iDFesBukZlnQQ1IWE5bFcTXZNYrK3AoVT52gKO4L8E88V8yRNE5ATjtxKDG7etF2sCgDfcSZsuiQcmr0M2iE0acFkdrxXX3ZjsoEYtgCGEGBWr6pcRhyA16jfqrD3ok-sfhugtkVZzytJL-dpQTFuyTrWR4vOKofL7T6iBIHyIg0EkkxtccRlnPPZIzLbpXMY6-42MPfL6gPqrUFXDB43tkCreTHnxFaNEAHYRDryCMNnf9wKmnwpR5Y6BIiJExul4UQH_Ts0-zDQfD3AWEOBP380zVSjZKCcMkq3uWFxTc6NfPxnD-604UkPCKaDhVjkfL5HoleQpIbQVYOaRKunw";
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

        
    }
}
