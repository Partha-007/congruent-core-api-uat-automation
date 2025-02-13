using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NUnit.Framework;
using NUnit.Framework.Legacy;
using Refit;
using System.Web;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.Playwright;
using MyNamespace;
using System.Security.Cryptography.X509Certificates;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Http;
using System.Net.Http;
using System;
using System.Collections.Specialized;
using System.Text.RegularExpressions;
using HtmlAgilityPack;
using Bogus;
using FizzWare.NBuilder;
using AutoFixture;
using System.Reflection;
using RefitSandBox.TestDataGenerator;
using System.Data;
using Reqnroll;
using YamlDotNet.Core.Tokens;
using Bogus.Bson;
using YamlDotNet.Serialization.Converters;
using FizzWare.NBuilder.Extensions;
using RefitSandBox;
using NSwag.CodeGeneration.Models;
using System.ComponentModel;
using CsvHelper;
using System.Globalization;
using Bogus.DataSets;
using ClassLibrary.Shared.TestDataGenerator;
using RefitSandBox.Hooks;


namespace RefitSandBox
{
    public class Program : Controller
    {
        public static string bearer;
        public JObject response;
        public JObject request;
        public PlanDetailsViewModel planModel;
        public FakeDataHelper _fakeDataHelper;
        System.Type Model;
        public static object modelAfterConvention;
        public Hooks.Hooks _hooks;
        
        public Program(FakeDataHelper fake, Hooks.Hooks hooks)
        {
            _fakeDataHelper = fake;
            _hooks = hooks;
        }

        public Program()
        {
        }

        public async Task UserLogin()
        {
            string authorizationEndpoint = "https://test.coreretirementsolutions.com/connect/authorize";
            string redirectUri = "https://test.coreretirementsolutions.com/api/swagger/oauth2-redirect.html";
            string codeChallenge;
            string codeChallengeMethod;
            (codeChallenge, codeChallengeMethod) = PKCEHelper.GeneratePKCE();
            codeChallengeMethod = "plain";
            string authRequestUrl = $"{authorizationEndpoint}?response_type=code&client_id=CoreII-Swagger&redirect_uri={Uri.EscapeDataString(redirectUri)}&code_challenge={Uri.EscapeDataString(codeChallenge)}&code_challenge_method={codeChallengeMethod}";

            Uri finalUrl;
            string[] requestid;
            using (var client = new HttpClient(new HttpClientHandler { AllowAutoRedirect = true }))
            {
                // Send a GET request to the provided URL
                HttpResponseMessage response = await client.GetAsync(authRequestUrl);

                // Check if there were any redirects
                finalUrl = response.RequestMessage.RequestUri;

                // Return the final redirected URL

                Uri uri = new Uri(finalUrl.ToString());
                string returnUrl = HttpUtility.ParseQueryString(uri.Query)["ReturnUrl"];

                // Step 2: URL decode the ReturnUrl
                string decodedReturnUrl = HttpUtility.UrlDecode(returnUrl);

                // Step 3: Parse the query string in the decoded URL
                NameValueCollection queryParams = HttpUtility.ParseQueryString(decodedReturnUrl);

                requestid = queryParams.GetValues(0);
                // Step 4: Extract the request_id
                foreach (var items in requestid)
                {
                    Console.WriteLine(items);
                }
                //string requestId = requestid["request_id"];

            }


            string codeRequestUrl = $"https://test.coreretirementsolutions.com/connect/authorize?request_id={requestid[0]}&prompt=";
            string requestUrl = $"https://test.coreretirementsolutions.com/connect/authorize?request_id={requestid[0]}";
            using (var client1 = new HttpClient(new HttpClientHandler { AllowAutoRedirect = false }))
            {

                string username = "vigneshwaran.n@cspl.com";
                string password = "Admin@123";
                HttpResponseMessage responseMessage = await client1.GetAsync(requestUrl);
                var redirectURL = responseMessage.Headers.Location.ToString();
                var redirectResponse = await client1.GetAsync(redirectURL);
                redirectResponse.EnsureSuccessStatusCode();

                var loginPageContent = await redirectResponse.Content.ReadAsStringAsync();

                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(loginPageContent);
                var tokenNode = htmlDoc.DocumentNode.SelectSingleNode("//input[@name='__RequestVerificationToken']");
                var csrfToken = tokenNode.GetAttributeValue("value", "");
                Uri code = responseMessage.RequestMessage.RequestUri;

                var loginData = new Dictionary<string, string>
                {
                    { "Input.Email", username },
                    { "Input.Password", password },
                    { "__RequestVerificationToken", csrfToken }
                };

                var content = new FormUrlEncodedContent(loginData);
                var requestLogin = $"https://test.coreretirementsolutions.com/Identity/Account/Login?ReturnUrl=%2Fconnect%2Fauthorize%3Frequest_id%3D{requestid[0]}%26prompt%3D";
                // Post the login form data
                var loginFormResponse = await client1.PostAsync(requestLogin, content);

                code.ToString();
            }

            
            using (var client2 = new HttpClient(new HttpClientHandler { AllowAutoRedirect = false, UseCookies = true }))
            {
                HttpResponseMessage responseMessagewithCode = await client2.GetAsync(codeRequestUrl);
            }

            //var response1 = prg.RedirectResponse(authRequestUrl);


            var httpClient1 = new HttpClient();

            var res = httpClient1.GetAsync(authRequestUrl);
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

            var bearerToken = await page.EvaluateAsync<string>("window.localStorage.getItem('COREIIuser:https://test.coreretirementsolutions.com:COREII')");
            JObject jwt = JObject.Parse(bearerToken.ToString());
            bearer = jwt["access_token"].ToString();
        }
        
        public async Task LoadPlanBasicDetails()
        {
            planModel = new PlanDetailsViewModel();
            FakeDataHelper.PopulateModelWithFakeData(planModel);
            Console.WriteLine(planModel.ToString());
            
            //request = JsonConvert.SerializeObject(planModel, Formatting.Indented);
        }
        public List<string> JsonProperties = new List<string>();
        public Dictionary<string, System.Reflection.PropertyInfo> jsonPropertyDictionary = new Dictionary<string, System.Reflection.PropertyInfo>();
        public Dictionary<string, System.Reflection.PropertyInfo> GetJsonPropertyDictionary(object obj)
        {

            // Get the properties of the object
            var properties = obj.GetType().GetProperties();

            foreach (var property in properties)
            {
                // Get the JsonProperty attribute
                var jsonPropertyAttribute = property.GetCustomAttribute<JsonPropertyAttribute>();

                if (jsonPropertyAttribute != null)
                {
                    // Add the JsonPropertyName (attribute value) and the PropertyInfo to the dictionary
                    jsonPropertyDictionary[jsonPropertyAttribute.PropertyName] = property;
                }
            }

            return jsonPropertyDictionary;
        }

        public void ConfigureWithTestDate(string ControlName, int length, Pattern pattern)
        {
            var value = GenerateTestData.RandomString(length, pattern);
            if(jsonPropertyDictionary.ContainsKey(ControlName))
            {
                var property = jsonPropertyDictionary[ControlName];
                property.SetValue(modelAfterConvention, value);
            }
        }
        public async Task Configuration(string ControlName, string Value)
        {
            if (jsonPropertyDictionary.ContainsKey(ControlName))
            {
                var property = jsonPropertyDictionary[ControlName];

                // Check if the property is nullable
                if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                {
                    if (Value == null)
                    {
                        // Set the property to null if the value is null
                        property.SetValue(modelAfterConvention, null);
                    }
                    else
                    {
                        // Otherwise, convert the value to the underlying type and set it
                        var underlyingType = Nullable.GetUnderlyingType(property.PropertyType);
                        var convertedValue = Convert.ChangeType(Value, underlyingType);
                        property.SetValue(modelAfterConvention, convertedValue);
                    }
                }
                else if(String.IsNullOrEmpty(Value))
                {
                    property.SetValue(modelAfterConvention, null);
                }
                else
                {
                    // For non-nullable types, just set the value
                    property.SetValue(modelAfterConvention, Value);
                }
            }


            /*var requestModel = typeof(PlanDetailsViewModel).GetProperty(ControlName);
            
            
            if (requestModel != null)
            {
                //Handling Nullable properties
                if (Nullable.GetUnderlyingType(requestModel.PropertyType) != null)
                {
                    
                    if (string.IsNullOrEmpty(Value))
                    {
                        requestModel.SetValue(planModel, null);
                    }
                    else
                    {
                        //This is where nullable properties is handled
                        var convertedValue = Convert.ChangeType(Value, Nullable.GetUnderlyingType(requestModel.PropertyType));
                        requestModel.SetValue(planModel, convertedValue);
                    }
                }
                else
                {
                    var convertedValue = Convert.ChangeType(Value, requestModel.PropertyType);
                    requestModel.SetValue(planModel, convertedValue);
                }
            }
                
            Console.WriteLine(planModel.ToString());*/
            //response = await SendAPIRequest(bearer, planModel);
        }
        public const string BASE_URL = "https://localhost:3200";
        public string APIEndpoint = "api/v1/Payroll/PayrollAndCensusFileUploadTest";

        public async Task<JObject> SendAPIRequestForFileUpload(string filename)
        {
            
            
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            string directoryPath = Path.Combine(projectDirectory, "Templates", filename);
            using (form = new MultipartFormDataContent())
            {
                StreamContent streamContent;
                using (var fileStream = new FileStream(directoryPath, FileMode.Open))
                {
                    streamContent = new StreamContent(fileStream);
                    form.Add(streamContent, "file", directoryPath);
                    form.Add(new StringContent("1"), "fileType");
                    form.Add(new StringContent("testing stuff"), "description");
                    form.Add(new StringContent("false"), "isSFTP");
                    form.Add(new StringContent("1"), "inputType");
                    form.Add(new StringContent("1"), "format");
                    form.Add(new StringContent("true"), "isMultiplePlanOrPaydate");
                    //form.Add(new StringContent(directoryPath), "fileName");
                    form.Add(new StringContent("null"), "planId");
                    form.Add(new StringContent("null"), "payDate");
                    form.Add(new StringContent("false"), "isYearEndProcessing");
                    form.Add(new StringContent("0"), "payrollFrequencyId");

                    string BaseURL = "https://test.coreretirementsolutions.com";
                    var httpClient = new HttpClient()
                    {
                        BaseAddress = new Uri(BaseURL)
                    };

                    httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
                    //var responseObject = httpClient.PostAsync($"{BaseURL}/{APIEndpoint}", form);

                    /*var task = Task.Run(() => httpClient.PostAsync($"{BaseURL}/{APIEndpoint}", form));
                    task.Wait();
                    var contentTask = Task.Run(() => task.Result.Content.ReadAsStringAsync());
                    contentTask.Wait();
                    //var responseObj = JObject.Parse(contentTask.Result);
                    response = (JObject)JsonConvert.DeserializeObject(contentTask.Result);

                    Console.WriteLine(response.ToString());
                    return response;*/
                    var PayrollAPI = RestService.For<IPayrollFileUpload>(httpClient);
                    var responseAfterFileUpload = await PayrollAPI.UploadCombinedFileAsync(form);
                    Console.WriteLine("Response : " + responseAfterFileUpload.ToString());

                    JObject responseObject = JObject.Parse(responseAfterFileUpload.ToString());
                    Console.Write(responseObject.ToString());
                    return responseObject;
                }
            }
            //var formData = HandlingFileUpload(filename);
            
        }
        public async Task LoadDefaultAdvisorDetails()
        {
            //Autofixture flow
            var fixture = new Fixture();
            fixture.Customize<string>(c => c.FromFactory(() => Guid.NewGuid().ToString("N")));
            var advisorReq = fixture.Create<AdvisorRepresentativeViewModel>();

            //Nbuilder flow
            var obj = Builder<AdvisorRepresentativeViewModel>.CreateListOfSize(1).All().With(_ => _.Contact = Builder<Contact>.CreateNew().Build()).Build();
            foreach(var item in obj)
            {
                Console.WriteLine("Nbuilder returns : "+item);
            }

            //Bogus with Reflection
            var advisorReflection = new AdvisorRepresentativeViewModel();

            FakeDataHelper.PopulateModelWithFakeData(advisorReflection);

            response = await SendAPIRequest(bearer, advisorReflection, typeof(IAdvisorDetails), "CreateAdvisorDetailsAsync");
            Console.WriteLine("Response inside : " + response);
        }
        string errorMessage;
        string errorCode;
        public void AssertResponse(string expectedValue)
        {
            
            var responseBody = JsonConvert.DeserializeObject<ResponseBody>(response.ToString());
            if(responseBody.ErrorMessages.Count > 1)
            {
                Console.WriteLine("More than one error is returned");
                Assert.Fail();
            }
            else
            {
                errorMessage = responseBody.ErrorMessages.First().Message;
                errorCode = responseBody.ErrorMessages.First().ErrorCode;
            }
            /*var errorObject= JsonConvert.DeserializeObject<dynamic>(response.ToString());
            var errorMessage = new ErrorMessages()
            {
                MessageCode = errorObject["errorMessages"][0]["errorCode"],
                MessageDescCode = errorObject["errorMessages"][0]["message"],
            };
            Console.WriteLine("Error message : " +errorMessage.MessageCode);*/
            ClassicAssert.AreEqual(expectedValue, $"{errorCode} : {errorMessage}");
        }
        public async Task APIRequestForRefit(string interfaceName, string methodName)
        {
            
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.{interfaceName}");
            var companyresponse = await SendAPIRequest(_hooks.bearer, modelAfterConvention, interfaceType, methodName);
        }

        public async Task<JObject> SendAPIRequest(string bearer, object model, System.Type interfaceType, string methodName)
        {
            string BaseURL = "https://test.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };
            
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
            //var AdvisorAPI = RestService.For<IAdvisorDetails>(httpClient);
            var apiClient = RestService.For(interfaceType, httpClient);
            var jsonData = JsonConvert.SerializeObject(model);
            Console.WriteLine("Sending request body: " + jsonData);

            var methodToSearch = interfaceType.GetMethod(methodName);
            if (methodToSearch != null)
            {
                // Call the method dynamically using reflection
                var responseObject = await (Task<object>)methodToSearch.Invoke(apiClient, new object[] { model });
                
                Console.WriteLine("Response: " + responseObject.ToString());

                response = JObject.Parse(responseObject.ToString());
                Console.Write(response.ToString());
                return response;
            }
            else
            {
                throw new InvalidOperationException("The given method was not found on the interface.");
            }
            //var createAdvisor = await AdvisorAPI.CreateAdvisorDetailsAsync(model);
            /*Console.WriteLine("Response : " + createAdvisor.ToString());
            
            JObject responseObject = JObject.Parse(createAdvisor.ToString());
            Console.Write(responseObject.ToString());
            return responseObject;*/
        }

        public static MultipartFormDataContent HandlingFileUpload(string filename)
        {
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            string directoryPath = Path.Combine(projectDirectory, "Templates", filename);
            using (form = new MultipartFormDataContent())
            {
                StreamContent streamContent;
                using (var fileStream = new FileStream(directoryPath, FileMode.Open))
                {
                    streamContent = new StreamContent(fileStream);
                    form.Add(streamContent, "file", directoryPath);
                    form.Add(new StringContent("1"), "fileType");
                    form.Add(new StringContent("testing stuff"), "description");
                    form.Add(new StringContent("true"), "isSFTP");
                    form.Add(new StringContent("1"), "inputType");
                    form.Add(new StringContent("1"), "format");
                    form.Add(new StringContent("false"), "isMultiplePlanOrPaydate");
                    form.Add(new StringContent(directoryPath), "fileName");
                    form.Add(new StringContent("null"), "planId");
                    form.Add(new StringContent("null"), "payDate");
                    return form;
                }
            }
        }
        
        public async Task Main(string[] args)
        {
            string authorizationEndpoint = "https://test.coreretirementsolutions.com/connect/authorize";
            string redirectUri = "https://test.coreretirementsolutions.com/api/swagger/oauth2-redirect.html";
            string codeChallenge;  
            string codeChallengeMethod;
            (codeChallenge, codeChallengeMethod) = PKCEHelper.GeneratePKCE();
            codeChallengeMethod = "plain";
            string authRequestUrl = $"{authorizationEndpoint}?response_type=code&client_id=CoreII-Swagger&redirect_uri={Uri.EscapeDataString(redirectUri)}&code_challenge={Uri.EscapeDataString(codeChallenge)}&code_challenge_method={codeChallengeMethod}";
            
            //Program prg = new Program();
            Uri finalUrl;
            string[] requestid;
            using (var client = new HttpClient(new HttpClientHandler { AllowAutoRedirect = true } ))
            {
                // Send a GET request to the provided URL
                HttpResponseMessage response = await client.GetAsync(authRequestUrl);

                // Check if there were any redirects
                finalUrl = response.RequestMessage.RequestUri;

                // Return the final redirected URL
                
                Uri uri = new Uri(finalUrl.ToString());
                string returnUrl = HttpUtility.ParseQueryString(uri.Query)["ReturnUrl"];

                // Step 2: URL decode the ReturnUrl
                string decodedReturnUrl = HttpUtility.UrlDecode(returnUrl);

                // Step 3: Parse the query string in the decoded URL
                NameValueCollection queryParams = HttpUtility.ParseQueryString(decodedReturnUrl);

                requestid = queryParams.GetValues(0);
                // Step 4: Extract the request_id
                foreach(var items in requestid)
                {
                    Console.WriteLine(items);
                }
                //string requestId = requestid["request_id"];

            }


            string codeRequestUrl = $"https://test.coreretirementsolutions.com/connect/authorize?request_id={requestid[0]}";

            using (var client1 = new HttpClient(new HttpClientHandler { AllowAutoRedirect = false}))
            {
               
                string username = "vigneshwaran.n@cspl.com";
                string password = "Admin@123";
                HttpResponseMessage responseMessage = await client1.GetAsync(codeRequestUrl);
                var redirectURL = responseMessage.Headers.Location.ToString();
                var redirectResponse = await client1.GetAsync(redirectURL);
                redirectResponse.EnsureSuccessStatusCode();
                
                var loginPageContent = await redirectResponse.Content.ReadAsStringAsync();

                var htmlDoc = new HtmlDocument();
                htmlDoc.LoadHtml(loginPageContent);
                var tokenNode = htmlDoc.DocumentNode.SelectSingleNode("//input[@name='__RequestVerificationToken']");
                var csrfToken = tokenNode.GetAttributeValue("value","");
                Uri code = responseMessage.RequestMessage.RequestUri;
                
                var loginData = new Dictionary<string, string>
                {
                    { "Input.Email", username },
                    { "Input.Password", password },
                    { "__RequestVerificationToken", csrfToken }
                };

                var content = new FormUrlEncodedContent(loginData);
                var requestLogin = $"https://test.coreretirementsolutions.com/Identity/Account/Login?ReturnUrl/connect/authorize?request_id={requestid[0]}&prompt";
                // Post the login form data
                var loginFormResponse = await client1.PostAsync(requestLogin, content);

                code.ToString();
            }

            using (var client2 = new HttpClient(new HttpClientHandler { AllowAutoRedirect = false }))
            {
                HttpResponseMessage responseMessagewithCode = await client2.GetAsync(codeRequestUrl);
            }
               
            //var response1 = prg.RedirectResponse(authRequestUrl);
            
            
            var httpClient1 = new HttpClient();
            
            var res = httpClient1.GetAsync(authRequestUrl);
        }

        public async Task<string> ExchangeAuthorizationCodeForToken(string authorizationCode, string codeVerifier)
        {
            var tokenEndpoint = "https://test.coreretirementsolutions.com/connect/token";
            var client = new HttpClient();

            var requestBody = new Dictionary<string, string>
                {
                    { "grant_type", "authorization_code" },
                    { "code", authorizationCode },
                    { "redirect_uri", "https://your-app.com/callback" },
                    { "code_verifier", codeVerifier }  // Send the original code verifier here
                };

            var requestContent = new FormUrlEncodedContent(requestBody);

            var response = await client.PostAsync(tokenEndpoint, requestContent);
            var responseContent = await response.Content.ReadAsStringAsync();

            return responseContent;  // Should contain the access token if successful
        }

        public ActionResult RedirectResponse(string authURL)
        {

             return Redirect(authURL);
        }
        
        public Func<object> EndpointToViewModel(string endpoint)
        {
            var endpointToViewModel = new Dictionary<string, Func<object>>
            {
                { "/api/BasicPlanDetails/SaveBasicPlanDetails", () => new PlanDetailsViewModel() },
                { "/api/v1/Company", () => new CompanyViewModel() }
            };

            if (endpointToViewModel.TryGetValue(endpoint, out Func<object> viewModelType))
            {
                var Model = viewModelType();
                modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(Model);
                var listOfProperties = GetJsonPropertyDictionary(Model);
                return viewModelType;
            }
            
            return null;

        }

        public static void FileConfiguration(string filename, Reqnroll.DataTable dataTable)
        {
            switch(filename)
            {
                case "CombinedFile.csv":
                    FakeDataHelper.GetHeaders(filename);
                    EditFile(filename, dataTable);
                    break;

                default:
                    break;

            }
        }

        public static void EditFile(string filename, Reqnroll.DataTable dataTable)
        {
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            string directoryPath = Path.Combine(projectDirectory, "Templates", filename);

            var EditedFile = ReadCsvToDictionary(directoryPath);

            foreach(var row in dataTable.Rows)
            {
                var Columnname = row[0];
                var Value = row[1];
                UpdateFile(EditedFile, Columnname, Value, directoryPath);
            }
        }

        public static void UpdateFile(Dictionary<string, string> fileToEdit, string ColumnHeader, string Value, string FilePath)
        {
            if (fileToEdit.Count != 0)
            {
                if (fileToEdit.ContainsKey(ColumnHeader))
                {
                    fileToEdit[ColumnHeader] = Value;
                }
                else
                {
                    Console.WriteLine("Given column header is not found");
                }
            }
            else
            {
                Console.WriteLine("File cannot be edited");
            }

            using (var writerEdit = new StreamWriter(FilePath, false))
            {
                using (var csvWriter = new CsvWriter(writerEdit, CultureInfo.CurrentCulture))
                {
                    foreach (var header in fileToEdit.Keys)
                    {
                        csvWriter.WriteField(header);
                    }
                    csvWriter.NextRecord();
                    foreach (var value in fileToEdit.Values)
                    {
                        csvWriter.WriteField(value);
                    }
                }

            }
        }
        public static Dictionary<string, string> ReadCsvToDictionary(string filePath)
        {
            var dictionary = new Dictionary<string, string>();
            
            using (var reader = new StreamReader(filePath))
            using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
            {
                // Read the CSV file
                var records = csv.GetRecords<dynamic>().ToList();  

                if (records.Any())
                {
                    var firstRecord = records.First();

                    foreach (var header in firstRecord)
                    {
                        dictionary.Add(header.Key, header.Value.ToString());
                    }
                }
            }

            return dictionary;
        }
        
        public static async Task<string> SaveCompany(string bearer)
        {
            var program = new Program();
            var companyModel = new CompanyViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(companyModel);
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.ICompanyDetails");
            var companyresponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewCompanyAsync");
            var companyId = companyresponse["company"]["id"].ToString();
            return companyId;
        }

        public static async Task<string> SavePlan(string bearer, string companyId)
        {
            var program = new Program();
            var planModel = new PlanDetailsViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(planModel);
            modelAfterConvention = FakeDataHelper.AssignId(companyId.ToString(), "CompanyId", modelAfterConvention);
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planResponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewPlanAsync");
            var planId = planResponse["plan"]["id"].ToString();
            return planId;
        }
    }
}
