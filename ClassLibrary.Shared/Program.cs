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
using Bogus.Bson;
using FizzWare.NBuilder.Extensions;
using RefitSandBox;
using NSwag.CodeGeneration.Models;
using System.ComponentModel;
using CsvHelper;
using System.Globalization;
using Bogus.DataSets;
using ClassLibrary.Shared.TestDataGenerator;
using RefitSandBox.Hooks;
using Fluid.Values;
using System.Collections;
using NUnit.Framework.Diagnostics;
using System.Text;
using Renci.SshNet;
using System.Runtime.InteropServices.WindowsRuntime;


namespace RefitSandBox
{
    public class Program : Controller
    {
        public static string bearer;
        public static JObject response;
        public JObject request;
        public PlanDetailsViewModel planModel;
        public FakeDataHelper _fakeDataHelper;
        System.Type Model;
        public static object modelAfterConvention;
        public static Hooks.Hooks _hooks;
        
        public Program(FakeDataHelper fake, Hooks.Hooks hooks)
        {
            _fakeDataHelper = fake;
            _hooks = hooks;
        }

        public Program()
        {

        }
        public static string companyPlanCompensationId;
        public static string companyGrossCompensationId;
        public static string companyName;
        public static string planId;
        public static string planName;
        public static string rkPlanNumber;
        public static string sourceId;
        public static string uploadedFileId;
        public static string fundingBankId;
        public static string payrollFundingId;
        public static string employeeSSN;
        public static string loanDocumentId;

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
        public static List<KeyValuePair<string, System.Reflection.PropertyInfo>> jsonPropertyListTotal = new List<KeyValuePair<string, System.Reflection.PropertyInfo>>();

        public static List<KeyValuePair<string, System.Reflection.PropertyInfo>> GetJsonPropertyList(object obj)
        {
            var jsonPropertyList = new List<KeyValuePair<string, System.Reflection.PropertyInfo>>();

            // If the object is null, return an empty list
            if (obj == null)
                return jsonPropertyList;

            // Get the properties of the object
            var properties = obj.GetType().GetProperties();

            foreach (var property in properties)
            {
                // Get the JsonProperty attribute
                var jsonPropertyAttribute = property.GetCustomAttribute<JsonPropertyAttribute>();

                if (jsonPropertyAttribute != null)
                {
                    // Add the JsonPropertyName (attribute value) and the PropertyInfo to the list
                    jsonPropertyList.Add(new KeyValuePair<string, System.Reflection.PropertyInfo>(jsonPropertyAttribute.PropertyName, property));
                }

                // Handle collections (ICollection, List, etc.)
                if (typeof(System.Collections.IEnumerable).IsAssignableFrom(property.PropertyType) && property.PropertyType != typeof(string))
                {
                    // Get the value of the collection property
                    var collectionValue = property.GetValue(obj);

                    // Only recurse if the collection value is not null
                    if (collectionValue != null)
                    {
                        // Iterate through each item in the collection (assuming it's a collection of objects)
                        var collectionItemType = property.PropertyType.GetGenericArguments().FirstOrDefault();
                        if (collectionItemType != null && collectionItemType.IsClass)
                        {
                            // Handle each item in the collection and recursively find its properties
                            var collectionItems = (System.Collections.IEnumerable)collectionValue;
                            foreach (var item in collectionItems)
                            {
                                if (item != null)
                                {
                                    // Recursively call the function for the nested object inside the collection
                                    var nestedProperties = GetJsonPropertyList(item);

                                    // Add the nested properties to the list with a modified key
                                    foreach (var nestedProperty in nestedProperties)
                                    {
                                        // Prefix with collection property name to make it unique
                                        var nestedKey = $"{nestedProperty.Key}";
                                        jsonPropertyList.Add(new KeyValuePair<string, System.Reflection.PropertyInfo>(nestedKey, nestedProperty.Value));
                                    }
                                }
                            }
                        }
                    }
                }
                // Handle regular properties (non-collections)
                else if (property.PropertyType.IsClass && property.PropertyType != typeof(string))
                {
                    // Get the value of the property (this will give you the actual nested object)
                    var nestedObject = property.GetValue(obj);

                    // Only recurse if the nested object is not null
                    if (nestedObject != null)
                    {
                        // Recursively call the function for the nested object
                        var nestedProperties = GetJsonPropertyList(nestedObject);

                        foreach (var nestedProperty in nestedProperties)
                        {
                            // Prepend the parent property name to the nested property name for uniqueness
                            var nestedKey = $"{nestedProperty.Key}";

                            // Add the nested property with the unique key to the list
                            jsonPropertyList.Add(new KeyValuePair<string, System.Reflection.PropertyInfo>(nestedKey, nestedProperty.Value));
                        }
                    }
                }
            }

            jsonPropertyListTotal = jsonPropertyList;
            return jsonPropertyList;
        }





        public void ConfigureWithTestDate(string ControlName, int length, Pattern pattern)
        {
            var value = GenerateTestData.RandomString(length, pattern);

            // Find matching entries in the list
            var matchingProperties = jsonPropertyListTotal
                .Where(entry => entry.Key == ControlName)
                .ToList();

            // If we have at least one matching property, set the value
            foreach (var entry in matchingProperties)
            {
                var property = entry.Value;
                try
                {
                    property.SetValue(modelAfterConvention, value);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error setting value for property {property.Name}: {ex.Message}");
                }
            }
        }

        public static List<System.Reflection.PropertyInfo> matchingProperties = new List<System.Reflection.PropertyInfo>();
        public async Task Configuration(string ControlName, string Value)
        {
            var program = new Program();
            if(ControlName.Contains("1") || ControlName.Contains("2"))
            {
                var match = System.Text.RegularExpressions.Regex.Match(ControlName, @"^\d+");

                // If a match is found, convert the digits to skipCount, subtracting 1 for zero-based indexing
                int skipCount = match.Success && int.TryParse(match.Value, out int result) ? result - 1 : 0;
                string keyPart = ControlName.Substring(1);
                matchingProperties = jsonPropertyListTotal
                              .Where(entry => entry.Key.Contains(keyPart)) // Filter by keyPart
                              .Skip(skipCount) // Skip the appropriate number of matches
                              .Take(1) // Take the next match (either first or second)
                              .Select(entry => entry.Value)
                              .ToList(); // Get the value or null if not found
            }
            else
            {
                // Get all the matching keys from jsonPropertyDictionaryTotal
                matchingProperties = jsonPropertyListTotal
                    .Where(entry => entry.Key == ControlName)
                    .Select(entry => entry.Value)
                    .ToList();
            }


            if (matchingProperties.Any())
            {
                foreach (var property in matchingProperties)
                {
                    var ModelDeclaredType = modelAfterConvention.GetType().Name;
                    var PropertyDeclaredType = property.DeclaringType.Name;
                    var typeToSearch = System.Type.GetType($"MyNamespace.{PropertyDeclaredType}");

                    // Check if the ModelDeclaredType is different from PropertyDeclaredType
                    if (ModelDeclaredType != PropertyDeclaredType)
                    {
                        foreach (var item in modelAfterConvention.GetType().GetProperties())
                        {
                            if (item.PropertyType.IsGenericType && item.PropertyType.GetGenericTypeDefinition() == typeof(System.Collections.Generic.ICollection<>) && item.PropertyType.GetGenericArguments()[0] == typeToSearch)
                            {
                                Console.WriteLine($"Found matching property: {item.Name}");
                                var propertiesInModel = modelAfterConvention.GetType().GetProperty(item.Name);
                                var currentModel = propertiesInModel.GetValue(modelAfterConvention);
                                var collectionType = typeof(IEnumerable<>).MakeGenericType(typeToSearch);
                                try
                                {
                                    var collection = (IEnumerable)currentModel;
                                    foreach (var collectionItem in collection)
                                    {
                                        // Use reflection to get the property and set the value
                                        var propertyToUpdate = collectionItem.GetType().GetProperty(property.Name);
                                        if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                                        {
                                            if (Value == null)
                                            {
                                                // Set the property to null if the value is null
                                                property.SetValue(collectionItem, null);
                                            }
                                            else
                                            {
                                                if (property.PropertyType == typeof(DateTimeOffset?))
                                                {
                                                    var convertedValue = DateTimeOffset.Parse(Value); // Parsing the string to DateTimeOffset
                                                    property.SetValue(collectionItem, convertedValue);
                                                }
                                                else if (property.PropertyType == typeof(double?))
                                                {
                                                    var convertedValue = double.Parse(Value);
                                                    try
                                                    {
                                                        property.SetValue(collectionItem, convertedValue);
                                                    }
                                                    catch (Exception ex)
                                                    {
                                                        Console.WriteLine(ex.Message);
                                                    }
                                                }
                                                else
                                                {
                                                    // Otherwise, convert the value to the underlying type and set it
                                                    var underlyingType = Nullable.GetUnderlyingType(property.PropertyType);
                                                    var convertedValue = Convert.ChangeType(Value, underlyingType);
                                                    property.SetValue(collectionItem, convertedValue);
                                                }
                                            }
                                        }
                                        else if (property != null)
                                        {
                                            property.SetValue(collectionItem, Convert.ChangeType(Value, property.PropertyType));
                                        }
                                        else
                                        {
                                            Console.WriteLine($"Property {property.Name} not found or is read-only.");
                                        }
                                    }
                                }
                                catch (Exception ex)
                                {
                                    // Handle any exceptions that occur during collection processing
                                    Console.WriteLine($"Error processing collection: {ex.Message}");
                                }
                            }
                            else if (item.PropertyType.Name == PropertyDeclaredType)
                            {
                                var propertiesInModel = modelAfterConvention.GetType().GetProperty(item.Name);
                                var currentModel = propertiesInModel.GetValue(modelAfterConvention);
                                try
                                {
                                    if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                                    {
                                        var underlyingType = Nullable.GetUnderlyingType(property.PropertyType);
                                        var convertedValue = Convert.ChangeType(Value, underlyingType);
                                        property.SetValue(currentModel, convertedValue);
                                    }
                                    else
                                    {
                                        var propertyType = property.PropertyType;
                                        var convertedValue = Convert.ChangeType(Value, propertyType);
                                        property.SetValue(currentModel, convertedValue);
                                    }
                                }
                                catch (Exception ex)
                                {
                                    Console.WriteLine(ex.Message);
                                }
                            }
                            else
                            {
                                SetPropertyValueRecursive(modelAfterConvention,property.Name,Value);
                            }
                        }
                    }
                    // If ModelDeclaredType equals PropertyDeclaredType, handle it directly
                    else if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                    {
                        if (String.IsNullOrEmpty(Value))
                        {
                            // Set the property to null if the value is null
                            property.SetValue(modelAfterConvention, null);
                        }
                        else
                        {
                            if (property.PropertyType == typeof(DateTimeOffset?))
                            {
                                var convertedValue = DateTimeOffset.Parse(Value); // Parsing the string to DateTimeOffset
                                property.SetValue(modelAfterConvention, convertedValue);
                            }
                            else if (property.PropertyType == typeof(double?))
                            {
                                if(String.IsNullOrEmpty(Value))
                                {
                                    property.SetValue(modelAfterConvention, null);
                                }
                                else
                                {
                                    var convertedValue = double.Parse(Value);
                                    try
                                    {
                                        property.SetValue(modelAfterConvention, convertedValue);
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.WriteLine(ex.Message);
                                    }
                                }
                                    
                            }
                            else
                            {
                                // Otherwise, convert the value to the underlying type and set it
                                var underlyingType = Nullable.GetUnderlyingType(property.PropertyType);
                                var convertedValue = Convert.ChangeType(Value, underlyingType);
                                property.SetValue(modelAfterConvention, convertedValue);
                            }
                        }
                    }
                    else if (String.IsNullOrEmpty(Value))
                    {
                        property.SetValue(modelAfterConvention, null);
                    }
                    else
                    {
                        var propertyType = property.PropertyType;
                        var convertedValue = Convert.ChangeType(Value, propertyType);
                        // For non-nullable types, just set the value
                        try
                        {
                            property.SetValue(modelAfterConvention, convertedValue);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine(ex.Message);
                        }
                    }
                }
            }
            else
            {
                Console.WriteLine($"No matching property found for {ControlName}");
            }
        }

        public static void SetPropertyValueRecursive(object targetObject, string propertyName, object value)
        {
            if (targetObject == null) return;

            // Get all properties of the object
            System.Reflection.PropertyInfo[] properties = targetObject.GetType().GetProperties();

            foreach (var property in properties)
            {
                // If we find the property that matches the given name
                if (property.Name == propertyName)
                {
                    // Set the property value if it's writable
                    if (property.CanWrite)
                    {
                        if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                        {
                            if (value == null)
                            {
                                // Set the property to null if the value is null
                                property.SetValue(targetObject, null);
                            }
                            else
                            {
                                if (property.PropertyType == typeof(DateTimeOffset?))
                                {
                                    var convertedValue = DateTimeOffset.Parse(value.ToString()); // Parsing the string to DateTimeOffset
                                    property.SetValue(targetObject, convertedValue);
                                }
                                else if (property.PropertyType == typeof(double?))
                                {
                                    var convertedValue = double.Parse(value.ToString());
                                    try
                                    {
                                        property.SetValue(targetObject, convertedValue);
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.WriteLine(ex.Message);
                                    }
                                }
                                else
                                {
                                    // Otherwise, convert the value to the underlying type and set it
                                    var underlyingType = Nullable.GetUnderlyingType(property.PropertyType);
                                    var convertedValue = Convert.ChangeType(value, underlyingType);
                                    property.SetValue(targetObject, convertedValue);
                                }
                            }
                        }
                        else if (property != null)
                        {
                            property.SetValue(targetObject, Convert.ChangeType(value, property.PropertyType));
                        }
                        else
                        {
                            Console.WriteLine($"Property {property.Name} not found or is read-only.");
                        }
                    }
                    return;
                }

                // If the property is a collection, iterate through the elements
                var propertyValue = property.GetValue(targetObject);
                if (propertyValue != null && typeof(System.Collections.IEnumerable).IsAssignableFrom(property.PropertyType) && !(propertyValue is string))
                {
                    // If it's a collection, iterate through each item in the collection
                    foreach (var item in (System.Collections.IEnumerable)propertyValue)
                    {
                        SetPropertyValueRecursive(item, propertyName, value);
                    }
                }
                else if (propertyValue != null && !property.PropertyType.IsValueType && property.PropertyType != typeof(string))
                {
                    // If the property is a complex type, recurse into it
                    SetPropertyValueRecursive(propertyValue, propertyName, value);
                }
            }
        }

        public const string BASE_URL = "https://localhost:3200";
        public string APIEndpoint = "api/v1/Payroll/PayrollAndCensusFileUpload";
        public static string uploadedFileName;
        public async Task<JObject> SendAPIRequestForFileUpload(string filename)
        {
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            uploadedFileName = Path.Combine(projectDirectory, "Templates", filename);
            if(filename == "CombinedFile.csv")
            {
                using (form = new MultipartFormDataContent())
                {
                    StreamContent streamContent;
                    using (var fileStream = new FileStream(uploadedFileName, FileMode.Open))
                    {
                        streamContent = new StreamContent(fileStream);
                        form.Add(streamContent, "file", uploadedFileName);
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

                        var PayrollAPI = RestService.For<IPayrollFileUpload>(httpClient);
                        var responseAfterFileUpload = await PayrollAPI.UploadCombinedFileAsync(form);
                        Console.WriteLine("Response : " + responseAfterFileUpload.ToString());

                        JObject responseObject = JObject.Parse(responseAfterFileUpload.ToString());
                        Console.Write(responseObject.ToString());
                        await Task.Delay(5000);
                        var fileId = await GetUploadedFilesBasedOnSearchCriteria(_hooks.bearer, companyName, planName, rkPlanNumber);
                        var payrollClient = RestService.For<IPayroll>(httpClient);
                        var fileDetails = await payrollClient.GetFileInformation(fileId);
                        if (fileDetails.FileStatus == "ErrorCorrectionRequired")
                        {
                            var acceptAllWarningsClient = RestService.For<IPayroll>(httpClient);
                            var response = await acceptAllWarningsClient.AcceptAllWarningsInaFile(fileId);
                        }
                        var finalSubmit = await payrollClient.FinalSubmit(fileId, "3");
                        await SaveFundingDetailsByPlan(planId, fileId);
                        var getAwaitingFundsForFile = await payrollClient.GetAwaitingFundingDetailsByPlan(fileId, planId);
                        payrollFundingId = getAwaitingFundsForFile.PayrollFundingId.ToString();
                        await ConfirmFunds(planId, fileId, payrollFundingId);
                        await payrollClient.GenerateConsolidation();
                        return responseObject;
                    }
                }
            }
            else if(filename == "TradeOrder.csv")
            {
                using (form = new MultipartFormDataContent())
                {
                    // Add the file content to the form
                    var fileStream = new FileStream(uploadedFileName, FileMode.Open);
                    var fileContent = new StreamContent(fileStream);
                    fileContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/csv");
                    form.Add(fileContent, "File", uploadedFileName);
                    form.Add(new StringContent("1"), "FileType");
                    string BaseURL = "https://test.coreretirementsolutions.com";
                    var httpClient = new HttpClient()
                    {
                        BaseAddress = new Uri(BaseURL)
                    };

                    httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
                    var tradeOrderClient = RestService.For<ITradeOrderFileUpload>(httpClient);
                    await tradeOrderClient.UploadFile(form);
                    Console.WriteLine("Trade order file uploaded");
                    var employeeId = await GetEmployeeId();
                    var currentDate = DateTime.Today.ToString("yyyy-MM-dd");
                    await Task.Delay(5000);
                    var employeeAccountBalance = await tradeOrderClient.GetParticipantAccountBalanceByPlan(planId, employeeId, currentDate);
                    var responseObject = JObject.Parse(employeeAccountBalance.ToString());
                    try
                    {
                        var amountUpdated = responseObject["sources"][0]["vestedBalance"].ToString();
                        Console.WriteLine($"Amount updated as : {amountUpdated}");
                        if (amountUpdated != "100")
                        {
                            throw new Exception();
                        }
                    }
                    catch(Exception ex)
                    {

                    }
                    
                    return null;
                }
            }
            else
            {
                return null;
            }
            
            //var formData = HandlingFileUpload(filename);
            
        }

        public async Task TradeOrderFileUpload(string filename)
        {
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            uploadedFileName = Path.Combine(projectDirectory, "Templates", filename);
            using (form = new MultipartFormDataContent())
            {
                // Add the file content to the form
                var fileStream = new FileStream(uploadedFileName, FileMode.Open);
                var fileContent = new StreamContent(fileStream);
                fileContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/csv");
                form.Add(fileContent, "File", uploadedFileName);
                form.Add(new StringContent("1"), "FileType");
                string BaseURL = "https://test.coreretirementsolutions.com";
                var httpClient = new HttpClient()
                {
                    BaseAddress = new Uri(BaseURL)
                };

                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
                var tradeOrderClient = RestService.For<ITradeOrderFileUpload>(httpClient);
                var tradeOrderFileUploadResult = await tradeOrderClient.UploadFile(form);
            }
        }

        public async Task<Dictionary<string, string>> SFTPConnect()
        {
            string hostName = "10.4.1.5";
            string userName = "ftp_qa";
            string password = "jack@123";
            var FileContent = new List<string>();
            var connectionInfo = new PasswordConnectionInfo(hostName, userName, password);
            using (var sftp = new SftpClient(connectionInfo))
            {
                try
                {
                    // Connect to the SFTP server
                    sftp.Connect();
                    Console.WriteLine("Connected to the SFTP server.");

                    // List files in the root directory of the SFTP server
                    var files = sftp.ListDirectory("/qa/outbound/").OrderByDescending(_ => _.LastWriteTimeUtc).ToList();
                    Console.WriteLine("Files in root directory:");
                    var fileToRead = files[1];
                    //var checkFileName = "/qa/outbound/TRADE.20250311.C0602959";
                    using (var fileStream = sftp.OpenRead(fileToRead.FullName))
                    {
                        // Read the file content (example: print to console)
                        using (var reader = new StreamReader(fileStream))
                        {
                            string line;
                            while ((line = reader.ReadLine()) != null)
                            {
                                FileContent.Add(line);
                            }

                            //Console.WriteLine("File content:\n" + content);
                        }
                    }
                    var tradeInstructionRows = FileContent.Where(_ => _.StartsWith("001")).ToList();
                    var cusipWithOrderNumber = await CusipTradeOrderNumberDictionary(tradeInstructionRows);
                    return cusipWithOrderNumber;
                }
                catch (Exception ex)
                {
                    return null;
                }
            }
        }

        public async Task<Dictionary<string, string>> CusipTradeOrderNumberDictionary(List<string> tradeInstructionRows)
        {
            var CusipTradeOrderNumber = new Dictionary<string, string>();
            foreach (var row in tradeInstructionRows)
            {
                string cusip = row.Substring(3, 9);
                string tradeOrderNumber = row.Substring(71, 15);
                CusipTradeOrderNumber.Add(cusip, tradeOrderNumber);
            }
            return CusipTradeOrderNumber;
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

        public void VerifyResponse()
        {
            var responseBody = JsonConvert.DeserializeObject<ResponseBody>(response.ToString());
            if(responseBody.ErrorMessages.Count == 0 && responseBody.isSuccessful)
            {
                Assert.Pass();
            }
            else
            {
                Assert.Fail();
                throw new ArgumentException("API failed");
            }
        }
        public async Task APIRequestForRefit(string interfaceName, string methodName)
        {
            if(interfaceName == "IPlanDetailsSave" && methodName != "CreateNewPlanAsync")
            {
                if(methodName == "SaveLoan")
                {
                    await Configuration("sourceId", sourceId);
                }
                FakeDataHelper.AssignId(planId, "PlanId", modelAfterConvention);
            }
            if(methodName == "SaveInprogressLoanRequest")
            {
                var employeeId = await GetEmployeeId();
                await Configuration("employeeId", employeeId);
                await Configuration("planId", planId);
                await Configuration("loanDocumentTypeId", loanDocumentId);
            }
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.{interfaceName}");
            var response = await SendAPIRequest(_hooks.bearer, modelAfterConvention, interfaceType, methodName);
        }

        /*public async Task<JObject> SendAPIRequest(string bearer, object model, System.Type interfaceType, string methodName)
        {
            string BaseURL = "https://test.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };
            
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
            //var AdvisorAPI = RestService.For<IAdvisorDetails>(httpClient);
            var apiClient = RestService.For(interfaceType, httpClient);
            //For the sake of verifying payload, serializing here
            var jsonData = JsonConvert.SerializeObject(model);
            Console.WriteLine("Sending request body: " + jsonData);

            var methodToSearch = interfaceType.GetMethod(methodName);
            if (methodToSearch != null)
            {
                try
                {
                    var responseObject = await (Task<object>)methodToSearch.Invoke(apiClient, new object[] { model });
                    Console.WriteLine("Response: " + responseObject.ToString());
                    response = JObject.Parse(responseObject.ToString());

                    if(response["isSuccessful"].ToString() != "True")
                    {
                        throw new Exception($"Response indicates IsSuccessful false for the method {methodName}");
                    }

                    Console.Write(response.ToString());
                    return response;
                }
                // Call the method dynamically using reflection
                catch(Exception ex)
                {
                    throw new Exception($"API Request failed at {methodName} " +ex.Message);
                }
            }
            else
            {
                throw new InvalidOperationException("The given method was not found on the interface.");
            }
            //var createAdvisor = await AdvisorAPI.CreateAdvisorDetailsAsync(model);
            *//*Console.WriteLine("Response : " + createAdvisor.ToString());
            
            JObject responseObject = JObject.Parse(createAdvisor.ToString());
            Console.Write(responseObject.ToString());
            return responseObject;*//*
        }*/

        public async Task<JObject> SendAPIRequest(string bearer, object model, System.Type interfaceType, string methodName)
        {
            string BaseURL = "https://test.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);


            var apiClient = RestService.For(interfaceType, httpClient);
            //JObject response = null;
            // Dynamically search for the method in the interface
            var methodToSearch = interfaceType.GetMethod(methodName);
            if (methodToSearch != null)
            {
                
                try
                {
                    object responseObject = null;
                    // Ensure that the model type matches the parameter type expected by the method
                    if (methodToSearch.GetParameters().Length == 1)
                    {
                        // If model is of type int (or another primitive), ensure it's passed correctly
                        var parameterType = methodToSearch.GetParameters()[0].ParameterType;

                        // Check if the model is already of the correct type (int, string, etc.)
                        if (model != null && model.GetType() != parameterType)
                        {
                            model = Convert.ChangeType(model, parameterType); // Convert the model to the expected type
                        }
                        
                        Console.WriteLine(JsonConvert.SerializeObject(model));
                        if(methodName == "SavePlanAmendmentEligibleRule")
                        {
                            var requestBody = JsonConvert.SerializeObject(model);
                            var requestPayload = JObject.Parse(requestBody);
                            string Action = "api/v1/EligibleRule/SavePlanAmendmentEligibleRule";
                            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
                            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
                            var task = await httpClient.PostAsync($"{BaseURL}{Action}/", data);
                            var contentTask = await task.Content.ReadAsStringAsync();
                            response = JObject.Parse(contentTask);
                            Console.Write(response.ToString());
                            return response;
                        }
                        else if(methodName == "SaveEnrollmentSettings")
                        {
                            var requestBody = JsonConvert.SerializeObject(model);
                            var requestPayload = JObject.Parse(requestBody);
                            string Action = "api/Enrollment/SaveEnrollmentSetting";
                            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
                            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
                            var task = await httpClient.PostAsync($"{BaseURL}{Action}/", data);
                            var contentTask = await task.Content.ReadAsStringAsync();
                            response = JObject.Parse(contentTask);
                            Console.Write(response.ToString());
                            return response;
                        }
                        else if(methodName == "SaveFunding")
                        {
                            var requestBody = JsonConvert.SerializeObject(model);
                            var requestPayload = JObject.Parse(requestBody);
                            string Action = "api/Funding/SaveFunding";
                            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
                            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
                            var task = await httpClient.PostAsync($"{BaseURL}{Action}/", data);
                            var contentTask = await task.Content.ReadAsStringAsync();
                            response = JObject.Parse(contentTask);
                            Console.Write(response.ToString());
                            return response;
                        }
                        else if(methodName == "SaveInprogressLoanRequest")
                        {
                            var requestBody = JsonConvert.SerializeObject(model);
                            var requestPayload = JObject.Parse(requestBody);
                            string Action = "api/v1/Loan/SaveInprogressLoanRequest";
                            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
                            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
                            var task = await httpClient.PostAsync($"{BaseURL}{Action}/", data);
                            var contentTask = await task.Content.ReadAsStringAsync();
                            response = JObject.Parse(contentTask);
                            Console.Write(response.ToString());
                            return response;
                        }
                        else
                        {
                            try
                            {
                                responseObject = await (Task<object>)methodToSearch.Invoke(apiClient, new object[] { model });
                            }
                            catch (Exception ex)
                            {
                                Console.WriteLine(ex.Message);
                            }
                            Console.WriteLine("Response: " + responseObject?.ToString());
                        }
                        // Call method dynamically based on the passed model
                        
                    }
                    else
                    {
                        throw new InvalidOperationException("The method signature does not match the expected parameters.");
                    }

                    Console.WriteLine("Response: " + responseObject?.ToString());
                    if(responseObject is bool)
                    {
                        Console.WriteLine("API Returned true");
                        return response;
                    }
                    else 
                    {
                        response = JObject.Parse(responseObject?.ToString());

                        Console.Write(responseObject.ToString());
                        return response;
                    }
                    
                   
                }
                catch (Exception ex)
                {
                    throw new Exception($"API Request failed at {methodName}: {ex.Message}");
                }
            }
            else
            {
                throw new InvalidOperationException("The given method was not found on the interface.");
            }
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
                { "/api/v1/Company", () => new CompanyViewModel() },
                { "/api/v1/Payroll/SaveEmployee",() => new PayrollEmployeeViewModel() },
                { "/api/Loan/SaveLoan", () => new LoanSettingViewModel() },
                { "/api/v1/Loan/SaveInprogressLoanRequest", () => new EmployeeLoanViewModel()}
            };

            if (endpointToViewModel.TryGetValue(endpoint, out Func<object> viewModelType))
            {
               var Model = viewModelType();
               modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(Model);
               var listOfProperties = GetJsonPropertyList(Model);
               return viewModelType;    
            }
            
            return null;

        }

        public static async Task FileConfiguration(string filename, Reqnroll.DataTable dataTable)
        {
            switch(filename)
            {
                case "CombinedFile.csv":
                    var sourceNames = await GetSourceNameHeader(_hooks.planId);
                    FakeDataHelper.WriteHeadersWithConventionalData(filename, sourceNames);
                    await EditFile(filename, dataTable);
                    break;

                case "TradeOrder.csv":
                    await EditFile(filename, dataTable);
                    break;

                default:
                    break;

            }
        }

        public static async Task EditFile(string filename, Reqnroll.DataTable dataTable)
        {
            var program = new Program();
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            string directoryPath = Path.Combine(projectDirectory, "Templates", filename);
            var FileToEdit = new Dictionary<string, string>();
            FileToEdit = await ReadCsvToDictionary(directoryPath);
            if(employeeSSN == null)
            {
                employeeSSN = FileToEdit.GetValueOrDefault("SSN");
            }
            
            if (filename == "TradeOrder.csv")
            {
                var CusipWithTradeOrderNumber = await program.SFTPConnect();
                var value = CusipWithTradeOrderNumber.GetValueOrDefault("SEAS00001");
                if(value != null)
                {
                    foreach (var row in dataTable.Rows)
                    {
                        var Columnname = row[0];
                        UpdateFile(FileToEdit, Columnname, value, directoryPath);
                    }
                }
                else
                {
                    Console.WriteLine("Trade order number is not present in Trade response file");
                    throw new Exception();
                }
            }
            else
            {
                foreach (var row in dataTable.Rows)
                {
                    var Columnname = row[0];
                    var Value = row[1];
                    UpdateFile(FileToEdit, Columnname, Value, directoryPath);
                }
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
                else if(fileToEdit.Keys.Any(_ => _.Contains("Pretax",StringComparison.OrdinalIgnoreCase)))
                {
                    var pretaxHeader = fileToEdit.Keys.First(_ => _.Contains("Pretax", StringComparison.OrdinalIgnoreCase));
                    fileToEdit[pretaxHeader] = Value;
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
        public static async Task<Dictionary<string, string>> ReadCsvToDictionary(string filePath)
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


        public static async Task<List<string>> GetSourceNameHeader(string planId)
        {
            var sourceNames = new List<string>();
            var program = new Program();
            string BaseURL = "https://test.coreretirementsolutions.com/";
            string Action = "api/Source/ListSource";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
            /*var task = await httpClient.GetAsync($"{BaseURL}{Action}/{planId}");
            var contentTask = await task.Content.ReadAsStringAsync();
            var response = JObject.Parse(contentTask);*/
            var apiClient = RestService.For<IPlanDetailsSave>(httpClient);
            var response = await apiClient.ListSource(Convert.ToInt32(planId));
            var result = JObject.Parse(response.ToString());
            foreach (var item in result["employerSourcesList"])
            {
                sourceNames.Add(item["sourceName"].ToString());
                Console.WriteLine(item["sourceName"]);
            }
            return sourceNames;
        }

        public static async Task<string> GetEmployeeId()
        {
            string BaseURL = "https://test.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
            var searchBody = new SearchCriterias()
            {
                SearchBySSNEmpIdName = employeeSSN.Replace("-",""),
                From = 0,
                Offset = 20
            };
            await Task.Delay(3000);
            //searchBody.SearchBySSNEmpIdName = "691209015";
            var payrollClient = RestService.For<IPayroll>(httpClient);
            var getEmployee = await payrollClient.GetEmployeesBySearchCriteria(searchBody);
            var employeeId = getEmployee.SearchEmployeeResults.Select(_ => _.Id).FirstOrDefault().ToString();
            return employeeId;
        }
        
        public async Task SaveLoan()
        {
            await Configuration("planId", planId);
            string BaseURL = "https://test.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
            var planClient = RestService.For<IPlanDetailsSave>(httpClient);
            var loanSettings = new LoanSettingViewModel();
            loanSettings = (LoanSettingViewModel)modelAfterConvention;
            var response = await planClient.SaveLoan(loanSettings);
            var responseAfterParsing = JObject.Parse(response.ToString());
            loanDocumentId = responseAfterParsing["loan"]["loanDocumentType"][0]["id"].ToString();
        }

        public async Task LoanApprove()
        {
            try
            {
                Console.WriteLine($"Loan approve started on {DateTime.Now}");
                /*var check = JsonConvert.DeserializeObject<SaveLoanResult>(response.ToString(), new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Ignore
                });*/
                var loanId = response["loan"]["id"].ToString();
                string BaseURL = "https://test.coreretirementsolutions.com/";
                var httpClient = new HttpClient()
                {
                    BaseAddress = new Uri(BaseURL)
                };
                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
                var loanClient = RestService.For<ILoan>(httpClient);
                var loanApproved = await loanClient.ApproveLoan(loanId);
                if(!loanApproved)
                {
                    throw new Exception();
                }
                else
                {
                    Console.WriteLine($"Loan has been approved on {DateTime.Now}");
                    await Task.Delay(3000);
                    var loanActiveResult = await loanClient.GenerateLoan();
                    var loanResponse = loanActiveResult.IsSuccessful;
                    if(!loanResponse)
                    {
                        throw new Exception();
                    }
                    else
                    {
                        Console.WriteLine($"Generate Loan API returns success on {DateTime.Now}");
                    }
                    await Task.Delay(3000);
                    /*var payrollClient = RestService.For<IPayroll>(httpClient);
                    var consolidationResult = await payrollClient.GenerateConsolidation();*/
                }
            }
            catch(Exception ex)
            {

            }
        }

        public async Task VerifyErrorMessage(string expectedErrorMessage)
        {
            try
            {
                var loanResponse = JObject.Parse(response.ToString());
                Console.WriteLine("Loan response :" +loanResponse.ToString());
                var loanRequestResult = JsonConvert.DeserializeObject<SaveLoanResult>(response.ToString(), new JsonSerializerSettings
                {
                    NullValueHandling = NullValueHandling.Include
                });
                if (loanRequestResult != null)
                {
                    try
                    {
                        var errorMessage = loanRequestResult.ErrorMessages.Single();
                        var errorCode = errorMessage.ErrorCode.ToString();
                        var message = errorMessage.Message.ToString();
                        ClassicAssert.AreEqual(expectedErrorMessage, $"{errorCode} : {message}");
                    }
                    catch(Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }
                    
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine("Deserializing the response failed : " +ex.Message);
                throw new Exception();
            }
        }
        public static async Task<string> SaveCompany(string bearer)
        {
            var program = new Program();
            var companyModel = new CompanyViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(companyModel);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId(null, "CompanyId", modelAfterConvention);
            await program.Configuration("frequencyName", "Daily");
            await program.Configuration("frequencyType", "1");
            await program.Configuration("modeOfHours", "1");
            await program.Configuration("modeOfCompensation", "1");
            await program.Configuration("modeOfContribution", "1");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.ICompanyDetails");
            var companyresponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewCompanyAsync");
            var companyId = companyresponse["company"]["id"].ToString();
            companyGrossCompensationId = companyresponse["company"]["compensationCategories"][0]["id"].ToString();
            companyPlanCompensationId = companyresponse["company"]["compensationCategories"][1]["id"].ToString();
            companyName = companyresponse["company"]["name"].ToString();
            return companyId;
        }

        public static async Task<string> SavePlan(string bearer, string companyId)
        {
            var program = new Program();
            var planModel = new PlanDetailsViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(planModel);
            modelAfterConvention = FakeDataHelper.AssignId(companyId.ToString(), "CompanyId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("effectiveDate", "2021-01-01");
            await program.Configuration("name", "ABC123");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planResponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewPlanAsync");
            planId = planResponse["plan"]["id"].ToString();
            rkPlanNumber = planResponse["plan"]["rkPlanNumber"].ToString();
            planName = planResponse["plan"]["planName"].ToString();
            return planId;
        }

        public static async Task SaveSponsor(string bearer, string planId)
        {
            var program = new Program();
            var sponsorModel = new SponsorViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sponsorModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sponsorSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SavePlanSponsor");
        }

        public static async Task ClearingPartnerPlanMapping(string bearer, string planId)
        {
            var program = new Program();
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var clearingPartnerIds = await program.SendAPIRequest(bearer,1,interfaceType, "GetClearingPartnersId");
            var clearingPartnerId = clearingPartnerIds["clearingPartnerListResponses"][0]["id"].ToString();
            var CPAddToPlan = new PlanWithClearingPartnerViewModel();
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", CPAddToPlan);
            modelAfterConvention = FakeDataHelper.AssignId(clearingPartnerId.ToString(), "ClearingPartnerAccountIds", modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId(clearingPartnerId.ToString(), "DefaultClearingPartnerAccountId", modelAfterConvention);
            var clearingPartnerAddToPlanResponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "AddClearingPartnerToPlan");
        }

        public static async Task EligibilityConfiguration(string bearer, string planId)
        {
            var program = new Program();
            var eligibility = new EligibilityRuleViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(eligibility);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanAmendments.PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("exclusionType", "0"); 
            await program.Configuration("isLTPTApplicable", "false");
            await program.Configuration("ltptHours", "500");
            await program.Configuration("isRevaluationRequired", "false");
            await program.Configuration("isBreakInService", "false");
            await program.Configuration("eligibilityType", null);
            await program.Configuration("planId", planId.ToString());
            await program.Configuration("age", "20");
            await program.Configuration("ltptAgeInYears", "20");
            
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var eligibilitySave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SavePlanAmendmentEligibleRule");
        }

        public static async Task SaveEntryDate(string bearer, string planId)
        {
            var program = new Program();
            var entryDateModel = new EntryDateRuleViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(entryDateModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("ruleName", "Immediate");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var eligibilitySave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveEntryDate");
        }

        public static async Task SaveSource(string bearer, string planId)
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            var currentDate = DateTime.UtcNow;
            await program.Configuration("sourceType", "1");
            await program.Configuration("sourceCategory", "2");
            await program.Configuration("sourceSubCategory", "4");
            await program.Configuration("sourceSubSubCategory", "1");
            await program.Configuration("effectiveStartDate", "2022-01-01");
            await program.Configuration("sourceName", "Pretax");
            await program.Configuration("contributionType", "1");
            await program.Configuration("limitMinimumDollar", "10");
            await program.Configuration("limitMinimumPercentage", "10");
            await program.Configuration("limitMaximumPercentage", "70");
            await program.Configuration("limitMaximumDollar", "70");
            await program.Configuration("sourceCode", "A");
            //program.Configuration("EmployeeDeferralSource.contributionType", "7");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
            sourceId = sourceSave["source"]["id"].ToString();
        }

        public static async Task SaveCompensation(string bearer, string planId)
        {
            var program = new Program();
            var compensationModel = new CompensationViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(compensationModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("compensationCategoryId", companyPlanCompensationId);
            await program.Configuration("isIncluded", "true");
            await program.Configuration("calculationType", "1");
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var compSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveCompensation");
        }

        public static async Task UpdatePlanStatus(string bearer, string planId, string statusCode)
        {
            var program = new Program();
            var updatePlanStatusModel = new UpdatePlanStatusViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(updatePlanStatusModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(),"PlanId",modelAfterConvention);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("planStatus", statusCode);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planStatus = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "UpdatePlanStatus");
        }

        public static async Task AddInvestmentsToPlan(string bearer, string planId)
        {
            var program = new Program();
            var investmentPlanMapping = new AddInvestmentsInput();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(investmentPlanMapping);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("investmentId", "281");
            await program.Configuration("status", "1");
            await program.Configuration("investmentType", "2");
            await program.Configuration("planId", planId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planStatus = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "AddInvestmentsToPlan");
            await program.Configuration("investmentId", "282");
            await program.Configuration("status", "1");
            await program.Configuration("investmentType", "2");
            await program.Configuration("planId", planId);
            var interfaceType1 = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var addedToPlan = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "AddInvestmentsToPlan");
        }

        public static async Task SaveEnrollmentSettings(string bearer, string planId)
        {
            var program = new Program();
            var planDetailsClient = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var listOfPlanInvestments = await program.SendAPIRequest(bearer, planId, planDetailsClient, "GetInvestmentListByPlanId");
            var investmentPlanMappingId = listOfPlanInvestments["investmentPlanDetails"][0]["id"].ToString();
            var enrollmentSettings = new EnrollmentViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(enrollmentSettings);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("planId", planId);
            await program.Configuration("sameInvestmentElectionToAllParticipants", "true");
            await program.Configuration("sourceName", "Pretax");
            await program.Configuration("contributionRate", "12");
            await program.Configuration("autoDeferralIncreaseProgram", "true");
            await program.Configuration("increaseAllowanceDays", "30");
            await program.Configuration("periodOfIncrease", "1");
            await program.Configuration("applyADITo", "0");
            await program.Configuration("adiApplicableTo", "2");
            await program.Configuration("subjecttoAutoEnrollment", "True");
            await program.Configuration("numberOfDaysWindowIsOpenNumber", "1");
            await program.Configuration("numberOfDaysWindowIsOpen", "3");
            await program.Configuration("numberOfDaysWindowIsOpenForOptoutNumber", "1");
            await program.Configuration("numberOfDaysWindowIsOpenForOptout", "1");
            await program.Configuration("exclusionType", "0");
            await program.Configuration("usePlanDefaultDeferralElection", "true");
            await program.Configuration("usePlanDefaultInvestmentElection", "true");
            await program.Configuration("sendEnrollmentInvite", "1");
            await program.Configuration("deferralContributionRateUponRehire", "2");
            await program.Configuration("contributionType", "1");
            await program.Configuration("sourceId", sourceId);
            await program.Configuration("autoDeferralIncreasePercentage", "15");
            await program.Configuration("maximumADIPercentage", "18");
            await program.Configuration("investmentId", investmentPlanMappingId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var enrollmentSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveEnrollmentSettings");
        }

        public static async Task SaveFunding(string bearer, string planId)
        {
            var program = new Program();
            var listOfFundingClient = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var listOfFunding = await program.SendAPIRequest(bearer, planId, listOfFundingClient, "ListFunding");
            var fundingId = listOfFunding["funding"]["id"].ToString();
            var funding = new FundingViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(funding);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("planId", planId);
            await program.Configuration("planCashAccountEnabled", "true");
            await program.Configuration("achPullEnabled", "true");
            await program.Configuration("bankAccountNumber", "647823647236");
            await program.Configuration("abaRoutingNumber", "527183462");
            await program.Configuration("bankAccountName", "HSBC Bank");
            await program.Configuration("bankAccountType", "2");
            await program.Configuration("bankAccountStatus", "1");
            await program.Configuration("defaultBankAccountIndicator", "true");
            await program.Configuration("classificationIds", null);
            await program.Configuration("fundingId", fundingId);
            await program.Configuration("1id", fundingId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var fundingSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveFunding");
            fundingBankId = fundingSave["funding"]["sponsorFundingAccounts"][0]["id"].ToString();
        }


        public static async Task<string> GetUploadedFilesBasedOnSearchCriteria(string bearer, string companyName, string planName, string rkPlanNumber)
        {
            var program = new Program();
            var payrollSearch = new UploadedFileInformationDetails();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(payrollSearch);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("companyName",companyName);
            await program.Configuration("planName", planName);
            await program.Configuration("rkPlanNumber", rkPlanNumber);
            await program.Configuration("uploadedOn", null);
            await program.Configuration("fileStatus", null);
            await program.Configuration("fileType", null);
            await program.Configuration("fileName", null);
            string BaseURL = "https://test.coreretirementsolutions.com/";
            payrollSearch = (UploadedFileInformationDetails)modelAfterConvention;
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", _hooks.bearer);
            
            var apiClient = RestService.For<IPayroll>(httpClient);
            var response = await apiClient.GetUploadedFilesBasedOnSearchCriteria(payrollSearch);
            var responseArray = JArray.Parse(response.ToString());
            uploadedFileId = responseArray[0]["id"].ToString();
            return uploadedFileId;
            /*var interfaceType = System.Type.GetType($"RefitSandBox.IPayroll");
            var payrollFileList = await program.SendAPIRequest(bearer, payrollSearch, interfaceType, "GetUploadedFilesBasedOnSearchCriteria");*/
        }

        public static async Task SaveFundingDetailsByPlan(string planId, string fileId)
        {
            var program = new Program();
            var fundingByPlan = new FundingByPlanViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(fundingByPlan);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("planId", planId);
            await program.Configuration("fileId", fileId);
            await program.Configuration("bankId", fundingBankId);
            await program.Configuration("amount", "100");
            await program.Configuration("totalFundingAmount", "100");
            await program.Configuration("forfeitureFundings", null);
            await program.Configuration("achPullFundings", null);
            await program.Configuration("wireFundings", null);
            await program.Configuration("checkFundings", null);
            await program.Configuration("achPushFundings", null);
            await program.Configuration("totalEmployerContribution", "0");
            await program.Configuration("bankFundings", null);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPayroll");
            var fundByPlan = await program.SendAPIRequest(_hooks.bearer, modelAfterConvention, interfaceType, "SaveFundingDetailsByPlan");
        }

        
        public static async Task ConfirmFunds(string planId, string fileId, string payrollFundingId)
        {
            var program = new Program();
            var confirmFunds = new ConfirmFundsViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(confirmFunds);
            var list = GetJsonPropertyList(modelAfterConvention);
            await program.Configuration("fileId", fileId);
            await program.Configuration("fundingType", "Plan");
            await program.Configuration("isACHDebit", "true");
            await program.Configuration("planId", planId);
            await program.Configuration("amount", "100");
            await program.Configuration("payrollFundingId", payrollFundingId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPayroll");
            var confirmFundsResponse = await program.SendAPIRequest(_hooks.bearer, modelAfterConvention, interfaceType, "ConfirmFunds");
        }
    }
}
