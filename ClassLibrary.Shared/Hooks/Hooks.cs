using Microsoft.Playwright;
using Newtonsoft.Json.Linq;
using Reqnroll;
using Microsoft.Playwright;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            var playwright = await Playwright.CreateAsync();
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
            bearer = jwt["access_token"].ToString();
        }

        [BeforeScenario("@SaveEmployee")]
        public async Task<string> CallSaveCompany()
        {
            string companyId = await Program.SaveCompany(bearer); // Static method call
            string planId = await Program.SavePlan(bearer, companyId);
            return planId;
        }


    }
}
