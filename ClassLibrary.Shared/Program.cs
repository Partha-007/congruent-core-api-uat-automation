using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using NUnit.Framework;
using NUnit.Framework.Legacy;
using Refit;
using System.Web;
using System.Data;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Microsoft.Playwright;
using MyNamespace;
using System.Security.Cryptography.X509Certificates;
//using Microsoft.AspNetCore.Mvc;
//using Microsoft.AspNetCore.Mvc.Infrastructure;
//using Microsoft.AspNetCore.Http;
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
using AutoMapper;
using ClassLibrary.Shared.Enum;
using Microsoft.Extensions.Configuration;
//using Microsoft.Extensions.Configuration.Json;
using static Org.BouncyCastle.Bcpg.Attr.ImageAttrib;
using ClassLibrary.Shared.AppSettings;
using System.Net.NetworkInformation;
using ClassLibrary.Shared;
using Bogus.Extensions.Canada;
using Bogus.Extensions.UnitedStates;
//using Io.Cucumber.Messages.Types;
//using Gherkin.CucumberMessages.Types;


namespace RefitSandBox
{
    public class Program : TestBase
    {
        public static string bearer;
        public static JObject response;
        public JObject request;
        public PlanDetailsViewModel planModel;
        public FakeDataHelper _fakeDataHelper;
        System.Type Model;
        public static object modelAfterConvention;
        public static Hooks.Hooks _hooks;
        public static string _url;
        public static ParseToObjectTestResponse? employee;
        public SFTP _sftp;
        public static List<B50MatchResult> b50Response = new List<B50MatchResult>();


        public Program(FakeDataHelper fake, Hooks.Hooks hooks, SFTP sftp)
        {
            _fakeDataHelper = fake;
            _hooks = hooks;
            _url = Settings.ApplicationURL;
            _sftp = sftp;
        }

        public Program()
        {

        }
        public static string companyPlanCompensationId;
        public static string companyGrossCompensationId;
        public static string companyName;
        public static string companyClassificationId, employeeClassificationId, payrollFrequencyId, ActiveStatusId, employeeId;
        public static string planId;
        public static string planName;
        public static string rkPlanNumber;
        public static string sourceId, pretaxRolloverSourceId;
        public static string pretaxsourceName;
        public static string matchSourceId;
        public static string matchSourceName;
        public static string rothSourceId;
        public static string MatcheditId;
        public static string rothSourceName;
        public static string uploadedFileId;
        public static string fundingBankId;
        public static string payrollFundingId;
        public static string employeeSSN;
        public static string loanDocumentId;
        public static string loanSettingsId;
        public static double totalAmount;
        public static string businessKey;
        public static string loanId;
        public static string firstRepaymentDate;
        public static string modelPortfolioId;
        public static string modelPortfolioName;
        public static string modelPortfolioInvestmentId, RegularInvestmentId, modelPortfolioInvestmentId2;
        public static AccountBalanceByPlanResponse employeeAccountBalance;
        public static int? recordKeeperId;
        public static Dictionary<string, string> InvestmentNameAndPlanMappingIdDict = new Dictionary<string, string>();
        public static SourceViewModel? sourceobjModel;
        public static PayrollEmployeeViewModel? employeeViewModel;




        public async Task UserLogin()
        {
            string authorizationEndpoint = $"{Settings.ApplicationURL}/connect/authorize";
            string redirectUri = $"{Settings.ApplicationURL}/api/swagger/oauth2-redirect.html";
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
                var requestLogin = $"{Settings.ApplicationURL}/Identity/Account/Login?ReturnUrl=%2Fconnect%2Fauthorize%3Frequest_id%3D{requestid[0]}%26prompt%3D";
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


            await page.GotoAsync($"{Settings.ApplicationURL}/");
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

            var bearerToken = await page.EvaluateAsync<string>($"window.localStorage.getItem('COREIIuser:{Settings.ApplicationURL}:COREII')");
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
                    Configuration(ControlName, value);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Error setting value for property {property.Name}: {ex.Message}");
                }
            }
        }

        public async Task AssignValueToDateProperty(string ControlName, string pattern, string incrementValue)
        {
            int increment = int.Parse(incrementValue);
            var Value = await GetDate(increment, pattern);
            if (ControlName == "firstRepaymentDate")
            {
                firstRepaymentDate = Value;
            }
            Configuration(ControlName, Value);
        }

        public static List<System.Reflection.PropertyInfo> matchingProperties = new List<System.Reflection.PropertyInfo>();
        public void Configuration(string ControlName, string Value)
        {
            var program = new Program();
            if (ControlName.Contains("1") || ControlName.Contains("2"))
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

            if (ControlName.Contains(","))
            {
                var parts = Value.Split(',', StringSplitOptions.RemoveEmptyEntries);
                var newArray = new JArray();

                foreach (var part in parts)
                {
                    var trimmed = part.Trim();

                    // Try to parse into number (int/float), fallback to string
                    if (int.TryParse(trimmed, out int intVal))
                    {
                        newArray.Add(intVal);
                    }
                    else if (double.TryParse(trimmed, out double doubleVal))
                    {
                        newArray.Add(doubleVal);
                    }
                    else
                    {
                        newArray.Add(trimmed);
                    }
                }
            }

            //for (int i = 0; i < Value.Length; i++)
            //{
            //    char PropertyName = Value[i];
            //    var convertedValue = Value.ToString();
            //    string formattedValue = convertedValue.ToString("i");
            //    property.SetValue(targetObject, convertedValue);
            //}





            if (ControlName == "employeeClassificationId")
            {
                Value = companyClassificationId;
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
                                                    if (ControlName == "firstRepaymentDate")
                                                    {
                                                        string formattedValue = convertedValue.ToString("M/d/yyyy, hh:mm:ss tt");
                                                        property.SetValue(collectionItem, convertedValue);
                                                    }
                                                    else
                                                    {
                                                        property.SetValue(collectionItem, convertedValue);
                                                    }
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
                                SetPropertyValueRecursive(modelAfterConvention, property.Name, Value);
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
                                if (ControlName == "firstRepaymentDate")
                                {
                                    var formattedValue = convertedValue.ToUniversalTime().AddDays(1);
                                    try
                                    {
                                        property.SetValue(modelAfterConvention, formattedValue);
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.WriteLine(ex.Message);
                                    }
                                }
                                else
                                {
                                    property.SetValue(modelAfterConvention, convertedValue);
                                }

                            }
                            else if (property.PropertyType == typeof(double?))
                            {
                                if (String.IsNullOrEmpty(Value))
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
                    else if (property.PropertyType.IsGenericType && property.PropertyType.GetGenericTypeDefinition() == typeof(System.Collections.Generic.ICollection<>))
                    {
                        Console.WriteLine($"Found matching property: {property.Name}");
                        var propertiesInModel = modelAfterConvention.GetType().GetProperty(property.Name);
                        var currentModel = propertiesInModel.GetValue(modelAfterConvention);
                        var typeOfCollection = System.Type.GetType($"MyNamespace.{PropertyDeclaredType}");
                        if (String.IsNullOrEmpty(Value))
                        {
                            try
                            {
                                var itemType = property.PropertyType.GetGenericArguments()[0]; // Get the item type T
                                var listType = typeof(List<>).MakeGenericType(itemType); // Create List<T> type
                                var collectionInstance = Activator.CreateInstance(listType); // Instantiate the List<T>
                                property.SetValue(modelAfterConvention, collectionInstance);
                            }
                            catch (Exception ex)
                            {

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
                        object convertedValue;

                        if (propertyType.IsEnum)
                            convertedValue = Enum.Parse(propertyType, Value.ToString(), true);
                        
                        else
                            convertedValue = Convert.ChangeType(Value, propertyType);
                        
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

        public static async Task SetPropertyValueRecursive(object targetObject, string propertyName, object value)
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
                                    if (propertyName == "firstRepaymentDate")
                                    {
                                        string formattedValue = convertedValue.ToString("M/d/yyyy, hh:mm:ss tt");
                                        property.SetValue(targetObject, convertedValue);
                                    }
                                    else
                                    {
                                        property.SetValue(targetObject, convertedValue);
                                    }
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
                        await SetPropertyValueRecursive(item, propertyName, value);
                    }
                }
                else if (propertyValue != null && !property.PropertyType.IsValueType && property.PropertyType != typeof(string))
                {
                    // If the property is a complex type, recurse into it
                    await SetPropertyValueRecursive(propertyValue, propertyName, value);
                }
            }
        }



        public const string BASE_URL = "https://localhost:3200";
        public string APIEndpoint = "api/v1/Payroll/PayrollAndCensusFileUpload";
        public static string uploadedFileName;
        public async Task<JObject> SendAPIRequestForFileUpload(string filename, string fundingType)
        {
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            uploadedFileName = Path.Combine(projectDirectory, "Templates", filename);
            if (filename == "CombinedFile.csv" || filename == "LoanRepayment.csv")
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
                        form.Add(new StringContent("savePayroll.csv"), "fileName");
                        form.Add(new StringContent("null"), "planId");
                        form.Add(new StringContent("null"), "payDate");
                        form.Add(new StringContent("false"), "isYearEndProcessing");
                        form.Add(new StringContent("0"), "payrollFrequencyId");

                        var httpClient = new HttpClient()
                        {
                            BaseAddress = new Uri(_url)
                        };

                        httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer);

                        var PayrollAPI = RestService.For<IPayrollFileUpload>(httpClient);
                        var responseAfterFileUpload = await PayrollAPI.UploadCombinedFileAsync(form);
                        Console.WriteLine("Response : " + responseAfterFileUpload.ToString());

                        JObject responseObject = JObject.Parse(responseAfterFileUpload.ToString());
                        Console.Write(responseObject.ToString());
                        await Task.Delay(10000);
                        var fileId = await GetUploadedFilesBasedOnSearchCriteria(Hooks.Hooks.bearer!, companyName, planName, rkPlanNumber);
                        var payrollClient = RestService.For<IPayroll>(httpClient);
                        var fileDetails = await payrollClient.GetFileInformation(fileId);
                        if (fileDetails.FileStatus == "ErrorCorrectionRequired")
                        {
                            var acceptAllWarningsClient = RestService.For<IPayroll>(httpClient);
                            var response = await acceptAllWarningsClient.AcceptAllWarningsInaFile(fileId);
                            if (!response)
                            {
                                throw new Exception("Error in accepting warnings");
                            }
                        }
                        await Task.Delay(5000);
                        var finalSubmit = await payrollClient.FinalSubmit(fileId, "3");
                        await Task.Delay(5000);
                        if (fundingType == "File")
                        {
                            var fundByFile = await payrollClient.FinalSubmit(fileId, fundingType);
                            var responseAfterFileSubmission = fundByFile.IsSuccessfull;
                            if (!responseAfterFileSubmission)
                            {
                                throw new Exception("Error in submitting the file");
                            }
                        }
                        else
                        {
                            var fundByFile = await payrollClient.FinalSubmit(fileId, fundingType);
                            await SaveFundingDetailsByPlan(httpClient, planId, fileId);
                            await Task.Delay(5000);
                            
                            var responseAfterFileSubmission = fundByFile.IsSuccessfull;
                            if (!responseAfterFileSubmission)
                            {
                                throw new Exception("Error in submitting the file");
                            }
                            var getAwaitingFundsForFile = await payrollClient.GetAwaitingFundingDetailsByPlan(fileId, planId);
                            payrollFundingId = getAwaitingFundsForFile.PayrollFundingId.ToString();
                            await ConfirmFunds(httpClient, planId, fileId, payrollFundingId);
                            if (filename == "CombinedFile.csv")
                            {
                                await Task.Delay(3000);
                            }
                            else
                            {
                                await Task.Delay(10000);
                            }
                            await GenerateOutboundFile(httpClient,"Saturna","DTCC",1);
                            await Task.Delay(2000);
                            var tradeOrderNumbers = _sftp.ProcessTradeOrderFile(SFTP.CUSIPTradeIdentifierDict,b50Response);
                            _sftp.EditFixedWidthFile(Hooks.Hooks.clearingPartnerName, "D260102.P2361.C09", new List<B50MatchResult>(), tradeOrderNumbers);
                            _sftp.UploadFile(Hooks.Hooks.clearingPartnerName, "D260102.P2361.C09");
                            await _sftp.PollingIdentifier(httpClient, Hooks.Hooks.clearingPartnerName, planId, "AccountBalanceVerification");
                            /*var generateConsolidationResponse = await payrollClient.GenerateConsolidation();
                            var parsedResponse = JObject.Parse(generateConsolidationResponse.ToString());
                            if (!(parsedResponse["isSuccessful"].ToString() == "True"))
                                throw new Exception("Error in generating consolidation");*/

                            //await Task.Delay(10000);
                        }
                        return responseObject;

                    }
                }
            }
            else if (filename == "TradeOrder.csv")
            {
                using (form = new MultipartFormDataContent())
                {
                    // Add the file content to the form
                    var fileStream = new FileStream(uploadedFileName, FileMode.Open);
                    var fileContent = new StreamContent(fileStream);
                    fileContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("text/csv");
                    form.Add(fileContent, "File", uploadedFileName);
                    form.Add(new StringContent("1"), "FileType");
                    //string BaseURL = "https://dev.coreretirementsolutions.com";
                    var httpClient = new HttpClient()
                    {
                        BaseAddress = new Uri(_url)
                    };

                    httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
                    var tradeOrderClient = RestService.For<ITradeOrderFileUpload>(httpClient);
                    var tradeOrderFileResponse = await tradeOrderClient.UploadFile(form);
                    Console.WriteLine("Trade order file uploaded");
                    var employeeId = await GetEmployeeId();
                    await Task.Delay(5000);
                    var currentDate = DateTime.Today.ToString("yyyy-MM-dd");
                    await Task.Delay(15000);
                    employeeAccountBalance = await tradeOrderClient.GetParticipantAccountBalanceByPlan(planId, employeeId, currentDate);
                    var investedAmount = employeeAccountBalance.InvestedAmount;
                    //var responseObject = JObject.Parse(employeeAccountBalance.ToString());
                    //Console.WriteLine("Employee account balance : " + employeeAccountBalance.ToString());
                    /*if (!(responseObject["sources"][0]["vestedBalance"].Count() > 1))
                    {
                        throw new Exception("Error in getting the account balance");
                    }*/
                    var amountUpdated = investedAmount;
                    Console.WriteLine($"Amount updated as : {amountUpdated}");
                    if (String.IsNullOrEmpty(fundingType))
                    {
                        return null;
                    }
                    if (investedAmount != totalAmount)
                    {
                        throw new Exception($"Amount updated as {amountUpdated} but total amount given in file is {totalAmount}");
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



        public async Task<PayrollAndCensusFileUploadTestResult> SendAPIRequestForFileUploadTest(string filename)
        {
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            uploadedFileName = Path.Combine(projectDirectory, "Templates", filename);
            using (form = new MultipartFormDataContent())
            {
                StreamContent streamContent;
                using (var fileStream = new FileStream(uploadedFileName, FileMode.Open))
                {
                    streamContent = new StreamContent(fileStream);
                    form.Add(streamContent, "file", uploadedFileName);
                    form.Add(new StringContent("1"), "fileType");
                    form.Add(new StringContent("testing stuff"), "description");
                    form.Add(new StringContent("true"), "isSFTP");
                    form.Add(new StringContent("1"), "inputType");
                    form.Add(new StringContent("1"), "format");
                    form.Add(new StringContent("true"), "isMultiplePlanOrPaydate");
                    //form.Add(new StringContent(directoryPath), "fileName");
                    form.Add(new StringContent("null"), "planId");
                    form.Add(new StringContent("null"), "payDate");
                    form.Add(new StringContent("false"), "isYearEndProcessing");
                    form.Add(new StringContent("0"), "payrollFrequencyId");

                    //string BaseURL = "https://dev.coreretirementsolutions.com";
                    var httpClient = new HttpClient()
                    {
                        BaseAddress = new Uri(_url)
                    };

                    httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);

                    var PayrollAPI = RestService.For<IPayrollFileUpload>(httpClient);
                    var responseAfterFileUpload = await PayrollAPI.UploadCombinedFileTestAsync(form);
                    employee = responseAfterFileUpload.ParseToObjectTestReponse;
                    Console.WriteLine("EMPLOYEE: ", employee);
                    return responseAfterFileUpload;

                }
            }




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
                //string BaseURL = "https://dev.coreretirementsolutions.com";
                var httpClient = new HttpClient()
                {
                    BaseAddress = new Uri(_url)
                };

                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
                var tradeOrderClient = RestService.For<ITradeOrderFileUpload>(httpClient);
                var tradeOrderFileUploadResult = await tradeOrderClient.UploadFile(form);
            }
        }

        public async Task SendAPIRequestForFileUploadToTestEndpoint(string filename)
        {
            MultipartFormDataContent form;
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            uploadedFileName = Path.Combine(projectDirectory, "Templates", filename);
            if (filename == "CombinedFile.csv")
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
                        form.Add(new StringContent("savePayroll.csv"), "fileName");
                        form.Add(new StringContent("null"), "planId");
                        form.Add(new StringContent("null"), "payDate");
                        form.Add(new StringContent("false"), "isYearEndProcessing");
                        form.Add(new StringContent("0"), "payrollFrequencyId");

                        var httpClient = new HttpClient()
                        {
                            BaseAddress = new Uri(_url)
                        };

                        httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);

                        var PayrollAPI = RestService.For<IPayrollFileUpload>(httpClient);
                        var responseAfterFileUpload = await PayrollAPI.UploadCombinedFileTestAsync(form);

                        if (responseAfterFileUpload.IsSuccessfull)
                            ResponseFromTestEndpoint = responseAfterFileUpload;
                        else
                            throw new Exception("Error in uploading file to test endpoint");
                    }
                }
            }

        }

        public async Task ProcessLoanDisbursement()
        {
            var ProcessLoanDisbursementViewModel = new ProcessLoanDisbursementViewModel()
            {
                IsDisbursed = false,
                LoanId = int.Parse(loanId!),
                PaymentMethod = 1,
                Reason = null,
                ReferenceNumber = null,
                IsReInitiate = false,

            };
            var ProcessLoanDisbursementViewModel2 = new ProcessLoanDisbursementViewModel()
            {
                IsDisbursed = true,
                LoanId = int.Parse(loanId!),
                PaymentMethod = 1,
                Reason = null,
                ReferenceNumber = null,
                IsReInitiate = false,

            };
            try
            {
                await DisbursementProcessing(ProcessLoanDisbursementViewModel);
                await DisbursementProcessing(ProcessLoanDisbursementViewModel2);
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }

        public async Task AddInvestmentToPlan(string InvestmentName)
        {
            var investmentSearchModel = new MasterInvestmentSearchModel();
            investmentSearchModel.Search = InvestmentName;
            investmentSearchModel.To = 20;

            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);

            var settings = new RefitSettings
            {
                ContentSerializer = new NewtonsoftJsonContentSerializer()
            };
            var apiClient = RestService.For<IInvestment>(httpClient, settings);
            var investmentResponse = await apiClient.GetMasterInvestmentBySearchCriteria(investmentSearchModel);
            if (investmentResponse.Count > 0)
            {
                var investmentId = investmentResponse[0]["id"].ToString();
                var investmentPlanMapping = new AddInvestmentsInput
                {
                    AddInvestmentInputs = new List<AddInvestmentInput>()
                };

                var newInvestment = new AddInvestmentInput
                {
                    Id = 0,
                    InvestmentId = Convert.ToInt32(investmentId),
                    PlanId = Convert.ToInt32(Hooks.Hooks.planId),
                    Status = 1,
                    InvestmentType = 2,
                    SuspendedFromDate = null,
                    SuspendedToDate = null
                };

                investmentPlanMapping.AddInvestmentInputs.Add(newInvestment);

                var planApiClient = RestService.For<IPlanDetailsSave>(httpClient);
                var responseAfterAddingInvestment = await planApiClient.AddInvestmentsToPlan(investmentPlanMapping);
                if (!(responseAfterAddingInvestment is bool value && value))
                    throw new Exception($"Investment {InvestmentName} not mapped to Plan");

                var listInvestmentsOfPlan = await planApiClient.GetInvestmentListByPlanId(Hooks.Hooks.planId);
                var parsedList = JObject.Parse(listInvestmentsOfPlan.ToString());

                var investmentPlanDetails = parsedList["investmentPlanDetails"] as JArray;
                foreach (var investment in investmentPlanDetails)
                {
                    if (investment["name"].ToString() == InvestmentName)
                    {
                        InvestmentNameAndPlanMappingIdDict.Add(investment["name"].ToString(), investment["id"].ToString());
                    }
                }
            }
            else
            {
                await CreateInvestment(InvestmentName);
                await AddInvestmentToPlan(InvestmentName);
            }



        }

        public async Task CreateInvestment(string investmentName)
        {

        }

        public async Task DisbursementProcessing(ProcessLoanDisbursementViewModel _ProcessLoanDisbursementViewModel)
        {
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var loanClient = RestService.For<ILoan>(httpClient);
            var loanDisbursementResult = await loanClient.ProcessLoanDisbursement(_ProcessLoanDisbursementViewModel);
            if (!loanDisbursementResult)
                throw new Exception("Process Loan Disbursement API returned false");
        }

        public async Task EnrollmentSetup()
        {
            try
            {
                await EnrollmentConfiguration(planId, sourceId, rothSourceId, "<SEAS001>", "<SEAS002>");
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Dictionary<string, string>> SFTPConnect()
        {

            /*var configuration = new ConfigurationBuilder()
            .SetBasePath("D:\\NewBackEndAutomation\\Congruent.Core.API.TestAutomation\\ClassLibrary.Shared\\AppSettings")
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .Build();*/

            //string url = configuration["AppSettings:ApplicationURL"];
            /*string ftp_user = configuration["AppSettings:ftp_user"];
            string userName = configuration["AppSettings:ftp_userName"];
            string password = configuration["AppSettings:ftp_password"];
            string hostName = configuration["AppSettings:ftp_host"];*/

            //string hostName = "10.4.1.5";
            //string userName = "ftp_dev";
            //string password = "jack@123";
            var FileContent = new List<string>();
            var connectionInfo = new PasswordConnectionInfo(Settings.ftp_host, Settings.ftp_username, Settings.ftp_password);
            using (var sftp = new SftpClient(connectionInfo))
            {
                try
                {
                    // Connect to the SFTP server
                    sftp.Connect();
                    Console.WriteLine("Connected to the SFTP server.");

                    // List files in the root directory of the SFTP server
                    var sftpDirectory = $"/{Settings.ftp_user}/outbound/";
                    var files = sftp.ListDirectory(sftpDirectory).OrderByDescending(_ => _.LastWriteTimeUtc).ToList();

                    var fileToRead = files[1];
                    //var checkFileName = "/qa/outbound/TRADE.20250311.C0602959";
                    using (var fileStream = sftp.OpenRead(fileToRead.FullName))
                    {
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
                string tradeOrderNumber = row.Substring(71, 16);
                CusipTradeOrderNumber.Add(cusip, tradeOrderNumber);
            }
            return CusipTradeOrderNumber;
        }
        string errorMessage;
        string errorCode;
        public void AssertResponse(string expectedValue)
        {

            var responseBody = JsonConvert.DeserializeObject<ResponseBody>(response.ToString());
            if (responseBody!.ErrorMessages != null)
            {
                if (responseBody.ErrorMessages.Count > 1)
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
        }


        public void VerifyResponseObject(Table table)
        {

            foreach (var row in table.Rows)
            {
                string SourceName = row[0];
                string Calculatedvalue = row[1];





            }

            var responseBody = JsonConvert.DeserializeObject<ResponseBody>(response.ToString());
            if (responseBody!.ErrorMessages == null && responseBody.isSuccessful)
            {
                Assert.Pass();
            }
            else
            {
                Assert.Fail();
                throw new ArgumentException("API failed");
            }
        }


        public void VerifyMatchvalue(Table table)
        {
            foreach (var row in table.Rows)
            {
                var sourcename = row[0];
                var CalculatedAmount = row[1];
                var PPAmount = row[2];
                var YTDAmount = row[3];

                var contributions = Program.employee!.Employees.SelectMany(e => e.Contributions).Where(_ => _.SourceName == sourcename).ToList();
                var CalcAmount = ((double)contributions.Sum(_ => _.CalculatedContributionAmount)).ToString("0.00");
                var PPValue = ((double)contributions.Sum(_ => _.ContributionAmount)).ToString("0.00");
                var YTDValue = ((double)contributions.Sum(_ => _.YtdContributionAmount)).ToString("0.00");

                ClassicAssert.AreEqual(CalculatedAmount, CalcAmount);
                ClassicAssert.AreEqual(PPAmount, PPValue);
                ClassicAssert.AreEqual(YTDAmount, YTDValue);



            }

        }


        public void VerifyResponse()
        {
            if (response.ContainsKey("isSuccessfull"))
            {
                response["isSuccessful"] = response["isSuccessfull"];  
                response.Remove("isSuccessfull");                      
            }

            var responseBody = JsonConvert.DeserializeObject<ResponseBody>(response.ToString());
            if (responseBody!.ErrorMessages == null && responseBody.isSuccessful)
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
            if (interfaceName == "IPlanDetailsSave" && methodName != "CreateNewPlanAsync")
            {
                if (methodName == "SaveLoan")
                {
                    Configuration("sourceId", sourceId);
                }
                if (methodName == "SaveVesting")
                {
                    Configuration("sourceId", matchSourceId);
                }
                FakeDataHelper.AssignId(planId, "PlanId", modelAfterConvention);
            }
            if (methodName == "SaveInprogressLoanRequest")
            {
                var employeeId = await GetEmployeeId();
                Configuration("employeeId", employeeId);
                Configuration("planId", planId);
                Configuration("loanDocumentTypeId", loanDocumentId);
                Configuration("loanSettingId", loanSettingsId);
            }
            if (methodName == "SaveLoanRefinance")
            {
                Configuration("loanId", loanId);
            }
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.{interfaceName}");
            Console.WriteLine($"Data001: {JsonConvert.SerializeObject(sourceobjModel, Formatting.Indented)}");
            var response = await SendAPIRequest(Hooks.Hooks.bearer!, modelAfterConvention, interfaceType, methodName);
            if(response != null)
            {
                if (response.ContainsKey("source"))
                {
                    MatcheditId = response["source"]?["sourceName"]?.ToString() == "ERMatch" ? response["source"]?["id"]?.ToString() : null;
                    var sourceName = response["source"]?["sourceName"]?.ToString();
                    sourceobjModel = (sourceName == "ERMatch" || sourceName == "ERNonMatch") && response["source"] is JObject matchSource ? MapJObjectToModel<SourceViewModel>(matchSource) : null;
                    Console.WriteLine($"Data: {JsonConvert.SerializeObject(sourceobjModel, Formatting.Indented)}");
                }
                Console.WriteLine("Response : " + response.ToString());
            }
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


        public static T MapJObjectToModel<T>(JObject source) where T : new()
        {
            var target = new T();
            var targetType = typeof(T);

            foreach (var prop in targetType.GetProperties(BindingFlags.Public | BindingFlags.Instance))
            {
                if (!prop.CanWrite) continue;

                var jsonName = prop.GetCustomAttribute<JsonPropertyAttribute>()?.PropertyName ?? prop.Name;
                var token = source[jsonName];

                if (token == null || token.Type == JTokenType.Null) continue;

                try
                {
                    object? value;

                    if (prop.PropertyType != typeof(string) &&
                        typeof(IEnumerable).IsAssignableFrom(prop.PropertyType))
                    {
                        var elementType = prop.PropertyType.IsGenericType
                            ? prop.PropertyType.GetGenericArguments()[0]
                            : prop.PropertyType.GetElementType();

                        var listType = typeof(List<>).MakeGenericType(elementType!);
                        value = token.ToObject(listType);
                    }
                    else
                    {
                        value = token.ToObject(prop.PropertyType);
                    }

                    prop.SetValue(target, value);
                }
                catch (Exception ex)
                {
                    Console.WriteLine($"Mapping failed for '{prop.Name}': {ex.Message}");
                }
            }

            return target;
        }


        public async Task<JObject> SendAPIRequest(string bearer, object model, System.Type interfaceType, string methodName)
        {

            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
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

                        if (MethodNamesNotHandledByRefit.ContainsKey(methodName))
                        {
                            response = await PostCall(httpClient, model, MethodNamesNotHandledByRefit[methodName]);
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

                    // Handle response based on type
                    if (responseObject is bool boolResult)
                    {
                        Console.WriteLine("API Returned: " + boolResult);

                        var responseJObject = new JObject
                        {
                            ["IsSuccessful"] = boolResult,
                            ["errorMessages"] = new JArray()  // Empty array when successful
                        };

                        response = responseJObject;
                        return response;
                    }
                    else if (responseObject != null)
                    {
                        Console.WriteLine("Response: " + responseObject.ToString());
                        response = JObject.Parse(responseObject.ToString());
                        return response;
                    }
                    else
                    {
                        var responseObjectForFail = new JObject
                        {
                            ["IsSuccessful"] = false,
                            ["errorMessages"] = new JArray
                            {
                                new JObject { ["message"] = "No response received" }
                            }
                        };

                        response = responseObjectForFail;
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

        public static async Task<JObject> PostCall(HttpClient httpClient, object model, string endpoint)
        {
            var requestBody = JsonConvert.SerializeObject(model);
            var requestPayload = JObject.Parse(requestBody);

            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
            
            var task = await httpClient.PostAsync($"{_url}/{endpoint}/", data);
            var contentTask = await task.Content.ReadAsStringAsync();
            response = JObject.Parse(contentTask);
            Console.Write(response.ToString());
            return response;
        }

        public static Dictionary<string,string> MethodNamesNotHandledByRefit = new Dictionary<string, string>
        {
             { "SavePlanAmendmentEligibleRule", "api/v1/EligibleRule/SavePlanAmendmentEligibleRule" },
             { "SaveEnrollmentSettings", "api/Enrollment/SaveEnrollmentSetting" },
             { "SaveFunding", "api/Funding/SaveFunding" },
             {"SaveInprogressLoanRequest","api/v1/Loan/SaveInprogressLoanRequest" },
             {"SubmitLoanRequest","api/v1/Loan/SubmitLoanRequest" },
             {"SaveEmployeeAsync","api/v1/Payroll/SaveEmployee" },
            {"SaveTransferDetailsForAdminAsync","api/v1/Transfer/SaveTransferDetailsForAdmin" }
        };

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


            string codeRequestUrl = $"https://test.coreretirementsolutions.com/connect/authorize?request_id={requestid[0]}";

            using (var client1 = new HttpClient(new HttpClientHandler { AllowAutoRedirect = false }))
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
                var csrfToken = tokenNode.GetAttributeValue("value", "");
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

        /*public ActionResult RedirectResponse(string authURL)
        {

             return Redirect(authURL);
        }*/

        public async Task<Func<object>> EndpointToViewModel(string endpoint)
        {
            var endpointToViewModel = new Dictionary<string, Func<object>>
            {
                { "/api/BasicPlanDetails/SaveBasicPlanDetails", () => new PlanDetailsViewModel() },
                { "/api/v1/Company", () => new CompanyViewModel() },
                { "/api/v1/Payroll/SaveEmployee",() => new PayrollEmployeeViewModel() },
                { "/api/v1/Payroll/AddBeneficary",() => new BeneficiaryInformation() },
                { "/api/Loan/SaveLoan", () => new LoanSettingViewModel() },
                { "/api/v1/Loan/SaveInprogressLoanRequest", () => new EmployeeLoanViewModel()},
                {"/api/Vesting/SaveVesting", () => new VestingViewModel() },
                {"/api/v1/Loan/SaveLoanRefinance", () => new LoanRefinanceViewModel() },
                {"/api/v1/Investment/AddMasterInvestment", () => new InvestmentViewModel() },
                { "/api/Enrollment/SaveEnrollmentSetting",() => new EnrollmentViewModel()},
                { "/api/Source/SaveSource",() => sourceobjModel==null?new SourceViewModel():sourceobjModel},
                {"/api/Transfer/SaveTransfer",() => new TransferViewModel() },
                {"/api/v1/Transfer/SaveTransferDetailsForAdmin", () => new TransferDetailsForAdminViewModel() },
                {"/api/Rollover/SaveRollover", () => new RolloverViewModel() },
                { "/api/RolloverIn/SaveRolloverInRequest", () => new RollOverInRequestDetails()},
                { "/api/v1/Adjustment/SaveBasicAdjustmentDetails", () => new BasicDetails() }
                //{"/api/v1/TradeOutboundFileGeneration/GenerateFile",()=>new OutboundFileGeneration() }
                { "/api/Transfer/SaveTransfer",() => new TransferViewModel()},
               // { "/api/Enrollment/SaveEnrollmentSetting",() => new EnrollmentViewModel()},
                {"/api/Source/SaveSource",() => new SourceViewModel() },
                {"api/v1/Company/SaveRecordKeepers",() => new SaveRecordKeeperViewModel() },
                {"/api/Sponsor/SaveSponsor",() => new SponsorViewModel() },
                {"/api/v1/EligibleRule/SavePlanAmendmentEligibleRule",() => new EligibilityRuleViewModel() },
                {"/api/EntryDate/SaveEntryDate",() => new EntryDateRuleViewModel() },
                {"/api/PlanYOS/SavePlanYOS",() => new YearsOfServiceViewModel() },
                {"/api/Withdrawal/SaveWithdrawal",() => new WithdrawalViewModel() },
                {"/api/Rollover/SaveRollover",() => new RolloverViewModel() },
               // {"/api/Transfer/SaveTransfer",() => new TransferViewModel() },
                {"/api/v1/Loan/SubmitLoanRequest", () => new SubmitLoanRequestViewModel() },
                {"/api/v1/Plan/SaveSourceLimits",() => new SourceLimitsViewModel() }

            };

            if (endpointToViewModel.TryGetValue(endpoint, out Func<object> viewModelType))
            {
                var Model = viewModelType();
                if (recordKeeperId != null)
                {
                    Configuration("recordKeeperId", recordKeeperId.ToString());
                }

                if (endpoint == "/api/v1/Payroll/SaveEmployee")
                {
                    employeeViewModel = EmployeeConfiguration();
                    Model = employeeViewModel;
                    modelAfterConvention = employeeViewModel;
                }
                else if(endpoint == "/api/v1/Payroll/AddBeneficary")
                {
                    var benModel = BeneficiaryConfiguration();
                    Model = benModel;
                    modelAfterConvention = benModel;
                }
                else
                    modelAfterConvention = sourceobjModel != null ? sourceobjModel : FakeDataHelper.PopulateModelWithFakeData(Model);

                var listOfProperties = GetJsonPropertyList(Model);
                if (endpoint == "/api/Enrollment/SaveEnrollmentSetting")
                {
                    var program = new Program();
                    var planDetailsClient = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
                    var listOfPlanInvestments = await program.SendAPIRequest(Hooks.Hooks.bearer!, planId, planDetailsClient, "GetInvestmentListByPlanId");
                    if (listOfPlanInvestments == null)
                        throw new Exception("Investments not mapped to this plan");
                    
                    var InvestmentPlanMappingIds = await GetInvestmentIdsByNames(listOfPlanInvestments, modelPortfolioNames);

                    modelPortfolioInvestmentId = InvestmentPlanMappingIds[modelPortfolioNames.First()].ToString();
                    modelPortfolioInvestmentId2 = InvestmentPlanMappingIds[modelPortfolioNames.Last()].ToString();
                    RegularInvestmentId = InvestmentPlanMappingIds["SEAS003"].ToString();
                }
                return viewModelType;
            }



            return null;

        }

        public static async Task FileConfiguration(string filename, Reqnroll.DataTable dataTable)
        {
            switch (filename)
            {
                case "CombinedFile.csv":
                    var sourceNames = await GetSourceNameHeader(Hooks.Hooks.planId!);
                    FakeDataHelper.WriteHeadersWithConventionalData(filename, sourceNames);
                    await EditFile(filename, dataTable);
                    break;

                case "TradeOrder.csv":
                    await EditFile(filename, dataTable);
                    break;

                case "LoanRepayment.csv":
                    var sourceNames1 = await GetSourceNameHeader(Hooks.Hooks.planId!);
                    FakeDataHelper.WriteHeadersWithConventionalData(filename, sourceNames1);
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
            if (employeeSSN == null)
            {
                employeeSSN = FileToEdit.GetValueOrDefault("SSN");
            }

            if (filename == "TradeOrder.csv")
            {
                var CusipWithTradeOrderNumber = await program.SFTPConnect();
                //var value = CusipWithTradeOrderNumber.GetValueOrDefault("SEAS00001");
                var matchingCusips = CusipWithTradeOrderNumber.Where(_ => _.Key.Contains("SEAS")).ToList();
                var tradeOrderNumberList = matchingCusips.Select(_ => _.Value).ToList();
                if (!matchingCusips.Any())
                {
                    throw new Exception("Trade order number is not present in Trade response file");
                }
                foreach (var value in matchingCusips)
                {
                    var tradeOrderNumber = value.Value;
                    if (tradeOrderNumber != null)
                    {
                        foreach (var row in dataTable.Rows)
                        {
                            var Columnname = row[0];
                            if (matchingCusips.Count == 1)
                            {
                                UpdateFile(FileToEdit, Columnname, tradeOrderNumber, directoryPath);
                            }
                            else if (matchingCusips.Count > 1)
                            {
                                UpdateFileWithMultipleLines(FileToEdit, matchingCusips.Count, tradeOrderNumberList, directoryPath);
                            }

                        }
                    }
                }

            }
            else
            {
                foreach (var row in dataTable.Rows)
                {
                    var Columnname = row[0];
                    var Value = row[1];
                    Value = Value.Contains("_") ? await GetDate(Convert.ToInt32(Value.Split('_')[0]), Value.Split('_')[1]) : Value;
                    Value = Columnname == "SSN" ? employeeSSN : Value;
                    UpdateFile(FileToEdit, Columnname, Value!, directoryPath);
                }
            }


        }
        public static int count = 0;
        public static async void UpdateFile(Dictionary<string, string> fileToEdit, string ColumnHeader, string Value, string FilePath)
        {

            if (fileToEdit.Count != 0)
            {
                if (ColumnHeader == "PAY DATE" && firstRepaymentDate != null && Value != "Currentdate")
                {
                    Value = firstRepaymentDate;
                }
                if (Value.Contains("Currentdate", StringComparison.OrdinalIgnoreCase))
                {
                    var currentDate = await GetDate(0, "day");
                    Value = currentDate;
                }
                if (Value.Contains("days", StringComparison.OrdinalIgnoreCase))
                {
                    var date = Value.Split(" ");
                    int numberOfDays = Convert.ToInt32(date[0]);
                    var obtainedDate = await GetDate(numberOfDays, date[1]);
                    Value = obtainedDate;
                }
                if (fileToEdit.ContainsKey(ColumnHeader))
                {
                    fileToEdit[ColumnHeader] = Value;
                }
                else if (fileToEdit.Keys.Any(_ => _.Contains(ColumnHeader, StringComparison.OrdinalIgnoreCase)))
                {
                    var pretaxHeader = fileToEdit.Keys.First(_ => _.Contains(ColumnHeader, StringComparison.OrdinalIgnoreCase));
                    fileToEdit[pretaxHeader] = Value;
                    if (Value is string && Value.Any())
                    {
                        totalAmount = totalAmount + Convert.ToDouble(Value);
                    }
                }
                else if (ColumnHeader.Contains("Repayment", StringComparison.OrdinalIgnoreCase))
                {
                    var repaymentHeader = fileToEdit.Keys.First(_ => _.Contains("Repayment", StringComparison.OrdinalIgnoreCase));
                    fileToEdit[repaymentHeader] = Value;
                }
                else if (ColumnHeader.Contains("LoanId", StringComparison.OrdinalIgnoreCase))
                {
                    var loanIdHeader = fileToEdit.Keys.First(_ => _.Contains("first loan id", StringComparison.OrdinalIgnoreCase));
                    fileToEdit[loanIdHeader] = Value;
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

        public static async void UpdateFileWithMultipleLines(Dictionary<string, string> fileToEdit, int noOfLines, List<string> Value, string FilePath)
        {
            using (var writerEdit = new StreamWriter(FilePath, false))
            {
                using (var csvWriter = new CsvWriter(writerEdit, CultureInfo.CurrentCulture))
                {
                    foreach (var header in fileToEdit.Keys)
                    {
                        csvWriter.WriteField(header);
                    }
                    csvWriter.NextRecord();

                    for (int i = 0; i < noOfLines; i++)
                    {
                        fileToEdit["Order Number"] = Value[i];
                        foreach (var value in fileToEdit.Values)
                        {
                            csvWriter.WriteField(value);
                        }
                        csvWriter.NextRecord();

                    }
                }

            }
        }

        public async Task WriteMultipleLinesForLoanRepayment(string filename, Reqnroll.DataTable dataTable)
        {
            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            string directoryPath = Path.Combine(projectDirectory, "Templates", filename);
            var FileToEdit = new Dictionary<string, string>();
            FileToEdit = await ReadCsvToDictionary(directoryPath);
            using (var writerEdit = new StreamWriter(directoryPath, false))
            {
                using (var csvWriter = new CsvWriter(writerEdit, CultureInfo.CurrentCulture))
                {
                    foreach (var header in FileToEdit.Keys)
                    {
                        csvWriter.WriteField(header);
                    }
                    csvWriter.NextRecord();
                    foreach (var value in FileToEdit.Values)
                    {
                        csvWriter.WriteField(value);
                    }
                    if (dataTable != null)
                    {
                        int count = 1;
                        foreach (var row in dataTable.Rows)
                        {
                            var paydate = row[0];
                            var repaymentAmount = row[1];
                            if (paydate == "Monthly")
                            {
                                paydate = DateTime.Parse(firstRepaymentDate).AddMonths(count).ToString("MM/dd/yyyy");
                            }
                            FileToEdit["PAY DATE"] = paydate;
                            count++;
                            var repaymentHeader = FileToEdit.Keys.First(_ => _.Contains("Repayment", StringComparison.OrdinalIgnoreCase));
                            FileToEdit[repaymentHeader] = repaymentAmount;
                            csvWriter.NextRecord();
                            foreach (var value in FileToEdit.Values)
                            {
                                csvWriter.WriteField(value);
                            }
                        }
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
            //string BaseURL = "https://dev.coreretirementsolutions.com/";
            string Action = "api/Source/ListSource";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
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
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var searchBody = new SearchCriterias()
            {
                SearchBySSNEmpIdName = employeeSSN.Replace("-", ""),
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


        public async Task GenerateOBFile()
        {
            
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var planClient = RestService.For<IPayroll>(httpClient);
            await planClient.GenerateOutboundFile();
        }

        public async Task SaveLoan()
        {
            Configuration("planId", planId);
            Configuration("sourceId", sourceId);
            
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var planClient = RestService.For<IPlanDetailsSave>(httpClient);
            var loanSettings = new LoanSettingViewModel();
            loanSettings = (LoanSettingViewModel)modelAfterConvention;
            var response = await planClient.SaveLoan(loanSettings);
            var responseAfterParsing = JObject.Parse(response.ToString());
            Console.WriteLine("Loan response : " + responseAfterParsing.ToString());
            loanDocumentId = responseAfterParsing["loan"]["loanDocumentType"][0]["id"].ToString();
            loanSettingsId = responseAfterParsing["loan"]["id"].ToString();
        }

        public async Task LoanApprove(string loanType)
        {
            try
            {
                //string BaseURL = "https://dev.coreretirementsolutions.com/";
                var httpClient = new HttpClient()
                {
                    BaseAddress = new Uri(_url)
                };
                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
                if (loanType == "Loan Refinancing")
                {
                    var loanClient = RestService.For<ILoan>(httpClient);
                    var loanApproved = await loanClient.ApproveLoan(loanId);
                    if (!loanApproved)
                    {
                        throw new Exception();
                    }
                }
                else
                {
                    Console.WriteLine($"Loan approve started on {DateTime.Now}");
                    /*var check = JsonConvert.DeserializeObject<SaveLoanResult>(response.ToString(), new JsonSerializerSettings
                    {
                        NullValueHandling = NullValueHandling.Ignore
                    });*/
                    loanId = response["loan"]["id"].ToString();
                    businessKey = response["loan"]["businessKey"].ToString();

                    var loanClient = RestService.For<ILoan>(httpClient);
                    var loanApproved = await loanClient.ApproveLoan(loanId);
                    if (!loanApproved)
                    {
                        throw new Exception();
                    }
                    else
                    {
                        Console.WriteLine($"Loan has been approved on {DateTime.Now}");
                        await Task.Delay(5000);
                        var loanActiveResult = await loanClient.GenerateLoan();
                        var loanResponse = loanActiveResult.IsSuccessful;
                        if (!loanResponse)
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

            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
        }



        public async Task<GetEmployeeEligiblePlanLoansResult> GetEmployeePlanLoans()
        {
            try
            {
                var employeeId = await GetEmployeeId();
                var httpClient = new HttpClient()
                {
                    BaseAddress = new Uri(Settings.ApplicationURL)
                };

                httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
                var loanClient = RestService.For<ILoan>(httpClient);
                await Task.Delay(5000);
                var employeeLoansResponse = await loanClient.GetEmployeePlanLoans(employeeId);
                return employeeLoansResponse;
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                return null;
            }
        }

        public async Task VerifyMasterLoanTypesForEmployee(int expectedLoanCount, int expectedLoanType, string expectedLoanName)
        {
            await Task.Delay(2000);
            var employeeLoansResponse = await GetEmployeePlanLoans();
            if (employeeLoansResponse != null)
            {
                if (employeeLoansResponse.EmployeePlans.Count != 0)
                {
                    var masterLoanTypes = employeeLoansResponse.EmployeePlans.SelectMany(_ => _.LoanSettings).Select(_ => _.MasterLoanType).Distinct().ToList();
                    ClassicAssert.AreEqual(expectedLoanCount, masterLoanTypes.Count);
                    var masterLoanType = employeeLoansResponse.EmployeePlans.SelectMany(_ => _.LoanSettings).Select(_ => _.MasterLoanType).FirstOrDefault()?.LoanType;
                    ClassicAssert.AreEqual(expectedLoanType, masterLoanType);
                    var masterLoanName = employeeLoansResponse.EmployeePlans.SelectMany(_ => _.LoanSettings).Select(_ => _.MasterLoanType).FirstOrDefault()?.Description;
                    ClassicAssert.AreEqual(expectedLoanName, masterLoanName);
                }
                else
                {
                    var masterLoanTypes = employeeLoansResponse.EmployeePlans.SelectMany(_ => _.LoanSettings).Select(_ => _.MasterLoanType).Distinct().ToList();
                    ClassicAssert.AreEqual(expectedLoanCount, masterLoanTypes.Count);
                }

            }
            else
            {
                throw new Exception();
            }
        }


        public async Task VerifyErrorMessage(string expectedErrorMessage)
        {
            try
            {
                var loanResponse = JObject.Parse(response.ToString());
                Console.WriteLine("Loan response :" + loanResponse.ToString());
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
                    catch (Exception ex)
                    {
                        throw new Exception(ex.Message);
                    }

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Deserializing the response failed : " + ex.Message);
                throw new Exception();
            }
        }

        public double sourceBalance;
        public async Task VerifyAvailableBalanceForNewLoan(double expectedAmount)
        {
            var employeeLoanDetails = await GetEmployeePlanLoans();
            var availableSources = employeeLoanDetails.EmployeePlans.SelectMany(_ => _.SourceBalances).ToList();
            foreach (var source in availableSources)
            {
                sourceBalance += source.VestedBalance;
            }
            var actualAmount = sourceBalance * 0.5;
            ClassicAssert.AreEqual(expectedAmount, actualAmount);
        }

        public async Task VerifyAvailableBalance(double expectedAmount)
        {
            var employeeLoanDetails = await GetEmployeePlanLoans();
            var highestOutstandingLoanBalance = employeeLoanDetails.EmployeePlans.FirstOrDefault()?.HighestOutstandingLoanBalance;
            var outstandingLoanBalance = employeeLoanDetails.EmployeePlans.FirstOrDefault()?.OutstandingLoanBalance;
            var availableSources = employeeLoanDetails.EmployeePlans.SelectMany(_ => _.SourceBalances).ToList();
            foreach (var source in availableSources)
            {
                sourceBalance += source.VestedBalance;
            }
            var calculatedAmount = await CalculateAvailableBalance(highestOutstandingLoanBalance, outstandingLoanBalance, sourceBalance);
            ClassicAssert.AreEqual(expectedAmount, calculatedAmount);
        }

        public async Task<double> CalculateAvailableBalance(double? highestOutstanding, double? outstandingLoanBalance, double? vestedBalance)
        {
            double limit = 50000;
            var firstAmount = vestedBalance.HasValue ? vestedBalance.Value * 0.5 : 0;
            var secondAmount = highestOutstanding.HasValue ? limit - highestOutstanding.Value : limit;
            var minimumAmount = Math.Min(firstAmount, secondAmount);
            var availableBalance = minimumAmount - (outstandingLoanBalance ?? 0);
            return availableBalance;
        }

        public async Task VerifyAmortizationScheduleForLoan(int NoOfInstallments, Reqnroll.DataTable dataTable)
        {
            await Task.Delay(5000);
            //string BaseURL = "https://dev.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var loanClient = RestService.For<ILoan>(httpClient);
            var updatedLoanId = int.Parse(loanId);
            updatedLoanId = updatedLoanId + 1;
            var loanAmortization = await loanClient.GetAmortizationSchedule(updatedLoanId.ToString());
            var filteredLoanAmortization = loanAmortization
                .Where(_ => _.ReAmortizationRequestDetails == null)
                .ToList();

            ClassicAssert.AreEqual(NoOfInstallments, filteredLoanAmortization.Count);
            var OutstandingPrincipalList = new List<double>();
            var InterestList = new List<double>();
            var PrincipalList = new List<double>();
            foreach (var item in filteredLoanAmortization)
            {
                InterestList.Add(item.Interest);
                PrincipalList.Add(item.Principal);
                OutstandingPrincipalList.Add(item.TotalOutstandingPrincipal);
            }

            foreach (var amount in OutstandingPrincipalList)
            {
                Console.WriteLine("Outstanding amount : " + amount);
            }


        }


        public async Task SubmitLoanRequest(List<string> sourceNames)
        {
            var applicableSources = new List<ApplicableSourcesViewModel>();
            var program = new Program();
            foreach (var source in sourceNames)
            {
                applicableSources.Add(new ApplicableSourcesViewModel
                {
                    Id = 0,
                    SourceId = program.IdentifyValue(source).Result != null ? int.Parse(program.IdentifyValue(source).Result) : throw new Exception($"Given source name is not valid {source}"),
                    IsDeleted = false
                });
            }

            var submitLoanRequestModel = new SubmitLoanRequestViewModel
            {
                LoanId = int.Parse(loanId),
                ApplicableSources = applicableSources
            };

            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var loanClient = RestService.For<ILoan>(httpClient);
            var submitLoanRequestResponse = await loanClient.SubmitLoanRequest(submitLoanRequestModel);
            if (!submitLoanRequestResponse.IsSuccessfull)
                throw new Exception("Submit loan request returns false");
        }


        PayrollAndCensusFileUploadTestResult ResponseFromTestEndpoint;
        public async Task ValidateResponseFromTestEndpoint(string controlName, string errorReportMessage, string ecrMessage)
        {
            bool errorTriggered = false;
            if (ResponseFromTestEndpoint == null)
                throw new Exception("No response from test endpoint to validate");

            var errorMessages = ResponseFromTestEndpoint.ParseToObjectTestReponse.Employees.SelectMany(_ => _.ErrorMessages);

            foreach (var error in errorMessages)
            {
                if (controlName == error.ControlName)
                {
                    errorTriggered = true;
                    var actualErrorReportMessage = error.MessageCode;
                    var actualECRReportMessage = error.MessageDescCode;
                    ClassicAssert.AreEqual(errorReportMessage, actualErrorReportMessage);
                    ClassicAssert.AreEqual(ecrMessage, actualECRReportMessage);
                }
            }

            if (!errorTriggered)
                throw new Exception($"Error not triggered for the given control name {controlName}");
        }


        public async Task VerifyMultipleErrors(int NoOfErrors, Reqnroll.DataTable dataTable)
        {
            var responseBody = JsonConvert.DeserializeObject<ResponseBody>(response.ToString());
            if (responseBody.ErrorMessages.Count != NoOfErrors)
                throw new Exception($"Error count mismatch, Expected error count : {NoOfErrors}, Actual error count : {responseBody.ErrorMessages.Count}");

            foreach (var row in dataTable.Rows)
            {
                string errorCode = row["error_code"].Trim();
                string errorMessage = row["error_message"].Trim();

                string expectedError = $"{errorCode} : {errorMessage}";

                for (int i = 0; i < responseBody.ErrorMessages.Count; i++)
                {
                    var actualErrorCode = responseBody.ErrorMessages[i].ErrorCode;
                    var actualErrorMessage = responseBody.ErrorMessages[i].Message;

                    var actualError = $"{actualErrorCode} : {actualErrorMessage}";

                    if (expectedError == actualError)
                        Assert.Pass();
                }

            }
        }

        public async Task VerifyLoanStatus(string expectedStatus)
        {
            //string BaseURL = "https://dev.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var loanClient = RestService.For<ILoan>(httpClient);
            var checkAndUpdateLoanStatus = await loanClient.CheckAndUpdateLoanStatus(loanId);
            if (!checkAndUpdateLoanStatus)
            {
                throw new Exception("Check and update loan status API returns false");
            }
            await Task.Delay(3000);
            var getLoanResponse = await loanClient.GetLoan(loanId);
            var loanStatus = getLoanResponse.LoanRequest.LoanStatus;
            Console.WriteLine("Loan status :" + loanStatus);
            if (expectedStatus.Contains("DefaultDeemedDistribution", StringComparison.OrdinalIgnoreCase) || expectedStatus.Contains("DefaultBenefitOffset", StringComparison.OrdinalIgnoreCase))
            {
                checkAndUpdateLoanStatus = await loanClient.CheckAndUpdateLoanStatus(loanId);
                if (!checkAndUpdateLoanStatus)
                {
                    throw new Exception("Check and update loan status API returns false");
                }
                await Task.Delay(3000);
                getLoanResponse = await loanClient.GetLoan(loanId);
                loanStatus = getLoanResponse.LoanRequest.LoanStatus;
            }
            if (Enum.TryParse(expectedStatus, true, out LoanStatus.LoanStatusesTest statusEnum))
            {
                // Assert that the API response matches the enum value.
                ClassicAssert.AreEqual((int)statusEnum, loanStatus);
            }
            else
            {
                throw new Exception($"{expectedStatus} is not a valid status, check spelling");
            }
        }

        public async Task AddValuesToCollection(int noOfItems, int value1, int value2, string propertyName)
        {
            var property = modelAfterConvention.GetType().GetProperty(propertyName);
            var collection = property.GetValue(modelAfterConvention) as IList;

            if (collection != null)
            {
                collection.Clear();
                for (int i = 0; i < noOfItems; i++)
                {
                    collection.Add(i % 2 == 0 ? value1 : value2);
                }
            }
            else
            {
                throw new Exception("The property is not a collection type.");
            }
            property.SetValue(modelAfterConvention, collection);
        }
        /*public async Task<System.Reflection.PropertyInfo> FindProperty(object targetObject, System.Reflection.PropertyInfo propertyInfo, string propertyName)
        {
            foreach(var item in targetObject.GetType().GetProperties())
            {
                if (item.PropertyType.Name == propertyName)
                {
                    return propertyInfo;
                }
                else
                {
                    return null;
                }
            }
            return null;
        }
        object instance;
        public async Task EditCollection(int noOfBlocks,string propertyName, Reqnroll.DataTable dataTable)
        {
            var property = modelAfterConvention.GetType().GetProperty(propertyName);
            
            if (property == null)
            {
                foreach (var item in modelAfterConvention.GetType().GetProperties())
                {
                    if(item.PropertyType.IsGenericType && item.PropertyType.GetGenericTypeDefinition() == typeof(System.Collections.Generic.ICollection<>))
                    {
                        instance = item.GetValue(modelAfterConvention);
                    }
                    var result = await FindProperty(instance,item, propertyName);
                    if(result != null)
                    {
                        property = result;
                        return;
                    }
                }
            }

            var collection = property.GetValue(modelAfterConvention) as IList;
            if (collection == null)
            {
                throw new Exception("The property is not a collection type.");
            }

            collection.Clear();
            var elementType = property.PropertyType.GetGenericArguments().FirstOrDefault();
            if (elementType == null)
            {
                throw new Exception("Could not determine collection element type.");
            }
            for (int i = 0; i < noOfBlocks; i++)
            {
                var newElement = Activator.CreateInstance(elementType);
                foreach (var row in dataTable.Rows)
                {
                    var propertyName1 = row[1];
                    var value = row[2];
                    var blockNumber = row[0];
                    if(i == (Convert.ToInt32(blockNumber)-1))
                    {
                        var elementProperty = elementType.GetProperty(propertyName1);
                        if (elementProperty != null)
                        {
                            var propertyType = elementProperty.PropertyType;
                            if (propertyType == typeof(int))
                            {
                                var convertedValue = Convert.ToInt32(value);
                                elementProperty.SetValue(newElement, convertedValue);
                            }
                            else if (propertyType == typeof(double))
                            {
                                var convertedValue = Convert.ToDouble(value);
                                elementProperty.SetValue(newElement, convertedValue);
                            }
                            
                            else if (propertyType == typeof(bool))
                            {
                                var convertedValue = Convert.ToBoolean(value);
                                elementProperty.SetValue(newElement, convertedValue);
                            }
                            else if (propertyType == typeof(DateTime))
                            {
                                var convertedValue = DateTime.Parse(value);
                                elementProperty.SetValue(newElement, convertedValue);
                            }
                            else if (propertyType == typeof(string))
                            {
                                var convertedValue = value.ToString();
                                elementProperty.SetValue(newElement, convertedValue);
                            }
                            if (Nullable.GetUnderlyingType(propertyType) != null)
                            {
                                if (value == null)
                                {
                                    // Set the property to null if the value is null
                                    elementProperty.SetValue(newElement, null);
                                }
                                else
                                {
                                    if (propertyType == typeof(DateTimeOffset?))
                                    {
                                        var convertedValue = DateTimeOffset.Parse(value); // Parsing the string to DateTimeOffset
                                        elementProperty.SetValue(newElement, convertedValue);
                                    }
                                    else if (propertyType == typeof(double?))
                                    {
                                        var convertedValue = double.Parse(value);
                                        try
                                        {
                                            elementProperty.SetValue(newElement, convertedValue);
                                        }
                                        catch (Exception ex)
                                        {
                                            Console.WriteLine(ex.Message);
                                        }
                                    }
                                    else
                                    {
                                        // Otherwise, convert the value to the underlying type and set it
                                        var underlyingType = Nullable.GetUnderlyingType(propertyType);
                                        var convertedValue = Convert.ChangeType(value, underlyingType);
                                        elementProperty.SetValue(newElement, convertedValue);
                                    }
                                }
                            }
                            else
                            {
                                
                            }
                        }
                    }
                    
                }
                collection.Add(newElement);
            }
            property.SetValue(modelAfterConvention, collection);
        }*/

        public async Task AddValuesToCollection1(int noOfItems, int value1, int value2, int value3, string propertyName)
        {
            var property = modelAfterConvention.GetType().GetProperty(propertyName);
            var collection = property.GetValue(modelAfterConvention) as IList;

            if (collection != null)
            {
                collection.Clear();

                collection.Add(value1);
                collection.Add(value2);
                collection.Add(value3);
            }
            else
            {
                throw new Exception("The property is not a collection type.");
            }
            property.SetValue(modelAfterConvention, collection);
        }

        public async Task AddValuesToCollectionFromTable(string propertyName, Reqnroll.DataTable dataTable)
        {
            var property = modelAfterConvention.GetType().GetProperty(propertyName);
            var collection = property.GetValue(modelAfterConvention) as IList;

            if (collection == null)
                throw new Exception("The property is not a collection type.");

            collection.Clear();

            var elementType = property.PropertyType.GetGenericArguments().FirstOrDefault();
            if (elementType == null)
                throw new Exception("Could not determine collection element type.");


            var propName = dataTable.Header.ElementAt(0);
            var elementProperty = elementType.GetProperty(propName);
            if (elementProperty == null)
                throw new Exception($"Property '{propName}' not found on element type.");

            foreach (var row in dataTable.Rows)
            {
                var newElement = Activator.CreateInstance(elementType);
                var value = row[0];
                var convertedValue = Convert.ChangeType(value, elementProperty.PropertyType);
                elementProperty.SetValue(newElement, convertedValue);
                collection.Add(newElement);
            }

            property.SetValue(modelAfterConvention, collection);
        }

        public class PropertySearchResult
        {
            public System.Reflection.PropertyInfo Property { get; set; }
            public object Owner { get; set; }
        }

        public async Task<PropertySearchResult> FindProperty(object targetObject, string propertyName)
        {
            if (targetObject == null)
                return null;

            var type = targetObject.GetType();

            // 1. Direct match
            foreach (var prop in type.GetProperties(BindingFlags.Public | BindingFlags.Instance))
            {
                if (prop.Name == propertyName)
                {
                    return new PropertySearchResult
                    {
                        Property = prop,
                        Owner = targetObject
                    };
                }
            }

            // 2. Recurse into properties that are complex objects
            foreach (var prop in type.GetProperties(BindingFlags.Public | BindingFlags.Instance))
            {
                var value = prop.GetValue(targetObject);

                if (value == null) continue;

                var propType = prop.PropertyType;

                // Avoid primitive types and strings
                if (propType == typeof(string) || propType.IsPrimitive)
                    continue;

                // Recurse into collections
                if (typeof(IEnumerable).IsAssignableFrom(propType) && propType != typeof(string))
                {
                    foreach (var item in (IEnumerable)value)
                    {
                        var result = await FindProperty(item, propertyName);
                        if (result != null)
                            return result;
                    }
                }
                else if (propType.IsClass) // Recurse into complex types
                {
                    var result = await FindProperty(value, propertyName);
                    if (result != null)
                        return result;
                }
            }

            return null;
        }

        public async Task<string> IdentifyValue(string value)
        {
            if (value == "<MPInvestmentId>") return modelPortfolioInvestmentId;
            else if (value == "<MPInvestmentName>") return modelPortfolioNames.First();
            else if (value == "<MPInvestmentId2>") return modelPortfolioInvestmentId2;
            else if (value == "<MPInvestmentName2>") return modelPortfolioNames.Last();
            else if (value == "<RInvestmentId>") return RegularInvestmentId;
            else if (value == "<RInvestmentName>") return "SEAS003";
            else if (value == "<PretaxSourceID>") return sourceId;
            else if (value == "<PretaxRolloverSourceId>") return pretaxRolloverSourceId;
            else if (value == "<RothSourceID>") return rothSourceId;
            else if (value == "<MatchSourceID>") return matchSourceId;
            else if (value == "<CompanyId>") return Hooks.Hooks.companyId!;
            else if (value == "<PretaxSourceName>") return pretaxsourceName;
            else if (value == "<Auto Transfer1>") return InvestmentNameAndPlanMappingIdDict["Auto Transfer1"];
            else if (value == "<Auto Transfer2>") return InvestmentNameAndPlanMappingIdDict["Auto Transfer2"];
            else if (value == "<SEAS001>") return InvestmentNameAndPlanMappingIdDict["SEAS001"];
            else if (value == "<SEAS002>") return InvestmentNameAndPlanMappingIdDict["SEAS002"];
            else if (value == "<RothSourceName>") return rothSourceName;
            else if (value == "<RecordKeeperId>") return recordKeeperId.ToString();
            else if (value == "<MatchSourceName>") return matchSourceName;
            else if (value == "<LoanId>") return loanId;
            else if (value == "<CompEmpClassTypeId>") return companyClassificationId;
            else if (value == "<CompEmpClassId>") return employeeClassificationId;
            else if (value == "<DailyFreqId>") return payrollFrequencyId;
            else if (value == "<ActiveStatusId>") return ActiveStatusId;
            else if (value == "<EmployeeId>") return await GetEmployeeId();
            else if (value == "<PlanId>") return planId;
            else if (value == "<SSN>") return employeeSSN.Replace("-", "");
            else if (value == "<PayrollTransactionId>") return await GetPayrollTransactionId();
            else if (value == "<HooksEmpId>") return employeeId;

            else return null;
        }

        public async Task EditCollection(int noOfBlocks, string propertyName, Reqnroll.DataTable dataTable)
        {
            var modelType = modelAfterConvention.GetType();
            var property = modelType.GetProperty(propertyName);
            object targetObject = modelAfterConvention;

            // Search recursively if property not found at top level
            if (property == null)
            {
                var searchResult = await FindProperty(modelAfterConvention, propertyName);
                if (searchResult == null)
                    throw new Exception($"Property '{propertyName}' not found in the object graph.");

                property = searchResult.Property;
                targetObject = searchResult.Owner;
            }

            // Get the collection instance
            var collection = property.GetValue(targetObject) as IList;
            if (collection == null)
                throw new Exception($"The property is not a collection type : '{propertyName}'");

            collection.Clear();

            var elementType = property.PropertyType.GetGenericArguments().FirstOrDefault();
            if (elementType == null)
                throw new Exception("Could not determine collection element type.");

            for (int i = 0; i < noOfBlocks; i++)
            {
                var newElement = Activator.CreateInstance(elementType);

                // Initialize collection properties to avoid null reference issues during property search
                foreach (var prop in elementType.GetProperties())
                {
                    if (prop.PropertyType.IsGenericType && prop.PropertyType.GetGenericTypeDefinition() == typeof(ICollection<>))
                    {
                        var itemType = prop.PropertyType.GetGenericArguments()[0];
                        var listType = typeof(List<>).MakeGenericType(itemType);
                        var collectionInstance = Activator.CreateInstance(listType);
                        prop.SetValue(newElement, collectionInstance);
                    }
                }

                foreach (var row in dataTable.Rows)
                {
                    var blockNumber = Convert.ToInt32(row[0]);
                    if (i != (blockNumber - 1)) continue;

                    var elementPropName = row[1].ToString();
                    var value = row[2];
                    //value = value.Contains("_") ? await Program.GetDate(Convert.ToInt32(value.Split('_')[0]), (value.Split('_')[1])) : value;
                    if (value.Contains("<"))
                    {
                        value = await IdentifyValue(value);
                    }
                    if (value.Contains("random"))
                    {
                        var splitted = value.Split(" ");

                        Pattern patternValue = (Pattern)Enum.Parse(typeof(Pattern), splitted[2], ignoreCase: true);
                        value = GenerateTestData.RandomString(Convert.ToInt32(splitted[1]), patternValue);
                    }
                    if (value.Contains(","))
                    {
                        var parts = value.Split(',', StringSplitOptions.RemoveEmptyEntries);
                        var newArray = new JArray();

                        foreach (var part in parts)
                        {
                            var trimmed = part.Trim();

                            // Try to parse into number (int/float), fallback to string
                            if (int.TryParse(trimmed, out int intVal))
                            {
                                newArray.Add(intVal);
                            }
                            else if (double.TryParse(trimmed, out double doubleVal))
                            {
                                newArray.Add(doubleVal);
                            }
                            else
                            {
                                newArray.Add(trimmed);
                            }
                        }
                    }
                    //****
                    if (value.Contains("_"))
                    {
                        value = await GetDate(Convert.ToInt32(value.Split("_")[1]), value.Split("_")[0]);
                        //var splitted = value.Split("_");

                        //Pattern patternValue = (Pattern)Enum.Parse(typeof(Pattern), splitted[0], ignoreCase: true);
                        //value = GenerateTestData.RandomString(Convert.ToInt32(splitted[1]), patternValue);
                    }
                    // Date and time *****
                    if (property.PropertyType == typeof(DateTimeOffset?))
                    {
                        var convertedValue = DateTimeOffset.Parse(value.ToString()); // Parsing the string to DateTimeOffset
                        if (propertyName == "scheduleBeginDate" || propertyName == "scheduleEndDate")
                        {
                            string formattedValue = convertedValue.ToString("M/d/yyyy, hh:mm:ss tt");
                            property.SetValue(targetObject, convertedValue);
                        }
                        else
                        {
                            property.SetValue(targetObject, convertedValue);
                        }
                    }
                    if (value.Contains("12:00:00 AM"))
                    {
                        value = await IdentifyValue(value);


                        DateTime start = new DateTime(2023, 1, 2);
                        DateTime end = new DateTime(2023, 12, 31);
                        DateTime startweekly = new DateTime(2023, 1, 8);
                        DateTime startbiweekly = new DateTime(2023, 1, 15);
                        DateTime startsemimonthly = new DateTime(2023, 1, 14);
                    }
                    var elementProperty = elementType.GetProperty(elementPropName);

                    //if (elementProperty == null) continue;

                    var propType = elementProperty.PropertyType;
                    var underlyingType = Nullable.GetUnderlyingType(propType) ?? propType;

                    try
                    {
                        object convertedValue = null;

                        if (value == null || string.IsNullOrWhiteSpace(value.ToString()))
                        {
                            convertedValue = null;
                        }
                        else if (underlyingType == typeof(int))
                        {
                            convertedValue = Convert.ToInt32(value);
                        }
                        else if (underlyingType == typeof(double))
                        {
                            convertedValue = Convert.ToDouble(value);
                        }
                        else if (underlyingType == typeof(bool))
                        {
                            convertedValue = Convert.ToBoolean(value);
                        }
                        else if (underlyingType == typeof(DateTime))
                        {
                            convertedValue = DateTime.Parse(value.ToString());
                        }
                        else if (underlyingType == typeof(DateTimeOffset))
                        {
                            convertedValue = DateTimeOffset.Parse(value.ToString());
                        }
                        else if (underlyingType == typeof(string))
                        {
                            convertedValue = value.ToString();
                        }
                        else if(propType.IsEnum)
                        {
                            convertedValue = Enum.Parse(propType, value.ToString(), true);
                        }
                        else
                        {
                            convertedValue = Convert.ChangeType(value, underlyingType);
                        }

                        elementProperty.SetValue(newElement, convertedValue);
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine($"Error setting property '{elementPropName}': {ex.Message}");
                    }
                }

                collection.Add(newElement);
            }

            //var additionalMatchTier = new AdditionalMatchTierBasedContributionTypeViewModel()
            //{
            //    new AdditionalMatchTierBasedContributionTypeViewModel
            //    {
            //        Id = null,
            //        AdditionalMatchSourceId = null,

            //    }
            //};

            // Re-set the collection on the correct object
            property.SetValue(targetObject, collection);
        }




        public static List<string> modelPortfolioNames = new List<string>();

        public async Task ModelPortInvestmentAddAndEnrollment(int noOfBlocks, string PropertyName, Reqnroll.DataTable dataTable)
        {
            modelPortfolioId = response["investment"]["id"].ToString();
            //public static List<string> modelPortfolioNames = new List<string>();

            var investments = response["investments"] as JArray;
            if (investments != null)
            {
                foreach (var inv in investments)
                {
                    var name = inv["name"]?.ToString();
                    if (!string.IsNullOrEmpty(name))
                        modelPortfolioNames.Add(name);
                }
            }
            else
            {
                var name = response["investment"]?["name"]?.ToString();
                if (!string.IsNullOrEmpty(name))
                    modelPortfolioNames.Add(name);
                foreach (var modelPortFolioName in modelPortfolioNames)
                {
                    Console.WriteLine(modelPortFolioName);
                }
            }

            if (modelPortfolioId == "0") throw new Exception("Model portfolio investment not saved");
            await AddInvestmentsToPlan(planId, modelPortfolioId, "993", noOfBlocks, PropertyName, dataTable);
        }


        public static async Task<Dictionary<string, int>> GetInvestmentIdsByNames(JObject jsonObject, List<string> targetNames)
        {
            var result = new Dictionary<string, int>();

            // Ensure the operation was successful
            if (!(bool)jsonObject["isSuccessful"]) return result;

            JArray investmentPlans = (JArray)jsonObject["investmentPlanDetails"];

            foreach (var plan in investmentPlans)
            {
                string name = plan["name"]?.ToString();

                if ((name == "SEAS003" || (targetNames != null && targetNames.Contains(name))) && int.TryParse(plan["id"]?.ToString(), out int id))
                {
                    result[name] = id;
                }
            }

            return result;
        }

        /*public static async Task VerifyAccountBalanceForAnEmployeeSourceWise(string sourceName, Reqnroll.DataTable dataTable)
        {
            var program = new Program();
            if (employeeAccountBalance == null) throw new Exception("Employee account balance is empty");
            var modelPortfolioName = await program.IdentifyValue("<MPInvestmentName>");

            //source wise investment account balances
            var sourceBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).Select(_ => _.VestedBalance);
            var modelPortfolioInvestmentBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.ModelPortfolioName == modelPortfolioName).Sum(_ => _.RegularAccountBalance);
            var MPInv1AccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS001").Select(_ => _.RegularAccountBalance);
            var MPInv2AccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS002").Select(_ => _.RegularAccountBalance);
            var RegularInvestmentAccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Select(_ => _.RegularAccountBalance);

            //investment wise account balances
            foreach(var row in dataTable.Rows)
            {
                var sourceBalanceExpected = row[0];
            }
        }*/

        public async Task VerifyAccountBalanceForAnEmployeeSourceWise(string sourceName, Reqnroll.DataTable dataTable)
        {
            var program = new Program();
            if (employeeAccountBalance == null)
                throw new Exception("Employee account balance is empty");

            var modelPortfolioName = await program.IdentifyValue("<MPInvestmentName>");

            // Source-wise balances
            var sourceBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).Sum(_ => _.VestedBalance);
            var modelPortfolioInvestmentBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.ModelPortfolioName == modelPortfolioName).Sum(_ => _.RegularAccountBalance);

            var modelPortfolioInvestmentBalance1 = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).Where(_ => _.Name == modelPortfolioNames.First()).Sum(_ => _.RegularAccountBalance);
            var modelPortfolioInvestmentBalance2 = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).Where(_ => _.Name == modelPortfolioNames.Last()).Sum(_ => _.RegularAccountBalance);


            var MPInv1AccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS001").Sum(_ => _.RegularAccountBalance);
            var MPInv2AccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS002").Sum(_ => _.RegularAccountBalance);
            var MPInv3AccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularAccountBalance);

            var MPInv4AccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS004").Sum(_ => _.RegularAccountBalance);
            var MPInv5AccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS005").Sum(_ => _.RegularAccountBalance);
            var MPInv6AccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS006").Sum(_ => _.RegularAccountBalance);

            var MPInv1UnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS001").Sum(_ => _.RegularBalanceUnits);
            var MPInv2UnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS002").Sum(_ => _.RegularBalanceUnits);
            var MPInv3UnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularBalanceUnits);

            var MPInv4UnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS004").Sum(_ => _.RegularBalanceUnits);
            var MPInv5UnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS005").Sum(_ => _.RegularBalanceUnits);
            var MPInv6UnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.ModelPortfolioInvestmentBalances).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS006").Sum(_ => _.RegularBalanceUnits);

            var RegularInvestmentAccountBalanceActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.RegularInvestmentBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularAccountBalance);
            var RegularInvestmentUnitsActual = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.RegularInvestmentBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularBalanceUnits);

            //var MPInv1AccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS001").Sum(_ => _.RegularAccountBalance);
            //var MPInv2AccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS002").Sum(_ => _.RegularAccountBalance);
            //var MPInv3AccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularAccountBalance);

            //var RegularInvestmentAccountBalance = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularAccountBalance);
            //var MPInv1Units = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS001").Sum(_ => _.RegularBalanceUnits);
            //var MPInv2Units = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS002").Sum(_ => _.RegularBalanceUnits);
            //var MPInv3Units = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularBalanceUnits);
            //var RegularInvestmentUnits = employeeAccountBalance.Sources.Where(_ => _.SourceName == sourceName).SelectMany(_ => _.InvestmentwiseBalances).Where(_ => _.Name == "SEAS003").Sum(_ => _.RegularBalanceUnits);
            // Assertions based on table
            foreach (var row in dataTable.Rows)
            {
                var key = row["Key"]?.ToString();
                var expectedValueStr = row["Value"]?.ToString();

                if (!double.TryParse(expectedValueStr, out var expectedValue))
                    throw new Exception($"Invalid decimal value for key {key}: {expectedValueStr}");

                switch (key)
                {
                    case "SourceBalance":
                        ClassicAssert.AreEqual(expectedValue, sourceBalance, $"Mismatch in {key}");
                        break;

                    case "ModelPortfolioBalance":
                        ClassicAssert.AreEqual(expectedValue, modelPortfolioInvestmentBalance, $"Mismatch in {key}");
                        break;

                    case "ModelPortfolioBalance1":
                        ClassicAssert.AreEqual(expectedValue, modelPortfolioInvestmentBalance1, $"Mismatch in {key}");
                        break;

                    case "ModelPortfolioBalance2":
                        ClassicAssert.AreEqual(expectedValue, modelPortfolioInvestmentBalance2, $"Mismatch in {key}");
                        break;

                    case "MPInv1Balance":
                        ClassicAssert.AreEqual(expectedValue, MPInv1AccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "MPInv2Balance":
                        ClassicAssert.AreEqual(expectedValue, MPInv2AccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "MPInv3Balance":
                        ClassicAssert.AreEqual(expectedValue, MPInv3AccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "MPInv4Balance":
                        ClassicAssert.AreEqual(expectedValue, MPInv4AccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "MPInv5Balance":
                        ClassicAssert.AreEqual(expectedValue, MPInv5AccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "MPInv6Balance":
                        ClassicAssert.AreEqual(expectedValue, MPInv6AccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "RInvBalance":
                        ClassicAssert.AreEqual(expectedValue, RegularInvestmentAccountBalanceActual, $"Mismatch in {key}");
                        break;

                    case "MPInv1Units":
                        ClassicAssert.AreEqual(expectedValue, MPInv1UnitsActual, $"Mismatch in {key}");
                        break;

                    case "MPInv2Units":
                        ClassicAssert.AreEqual(expectedValue, MPInv2UnitsActual, $"Mismatch in {key}");
                        break;

                    case "MPInv3Units":
                        ClassicAssert.AreEqual(expectedValue, MPInv3UnitsActual, $"Mismatch in {key}");
                        break;

                    case "MPInv4Units":
                        ClassicAssert.AreEqual(expectedValue, MPInv4UnitsActual, $"Mismatch in {key}");
                        break;

                    case "MPInv5Units":
                        ClassicAssert.AreEqual(expectedValue, MPInv5UnitsActual, $"Mismatch in {key}");
                        break;

                    case "MPInv6Units":
                        ClassicAssert.AreEqual(expectedValue, MPInv6UnitsActual, $"Mismatch in {key}");
                        break;

                    case "RInvUnits":
                        ClassicAssert.AreEqual(expectedValue, RegularInvestmentUnitsActual, $"Mismatch in {key}");
                        break;

                    default:
                        throw new Exception($"Unknown key in balance table: {key}");
                }
            }
        }


        public async Task UpdateEmployeeInformation(Reqnroll.DataTable dataTable)
        {
            //Will do research later blud!
            /*var employeeId = await GetEmployeeId();
            string BaseURL = "https://test.coreretirementsolutions.com/";
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(BaseURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var employeeClient = RestService.For<IEmployee>(httpClient);
            var employeeResponse = await employeeClient.GetEmployee(employeeId);

            *//*var config = new MapperConfiguration(cfg =>
            {
                cfg.CreateMap<Employee,PayrollEmployeeViewModel>()
                .ForMember(dest => dest.EmployeeId, opt => opt.MapFrom(src => src.Id))
                    .ForMember(dest => dest.SSN, opt => opt.MapFrom(src => src.SSN))
                    .ForMember(dest => dest.FirstName, opt => opt.MapFrom(src => src.FirstName))
                    .ForMember(dest => dest.LastName, opt => opt.MapFrom(src => src.LastName))
                    .ForMember(dest => dest.Email, opt => opt.MapFrom(src => src.Email))
                    .ForMember(dest => dest.PhoneNumber, opt => opt.MapFrom(src => src.PhoneNumber))
                    .ForMember(dest => dest.Address, opt => opt.MapFrom(src => src.Address));
            })*//*
            var employeeModel = new Employee();
            var payrollEmployeeViewModel = new PayrollEmployeeViewModel();
            var mapper = new Mapper();
            payrollEmployeeViewModel = mapper.Map<PayrollEmployeeViewModel>(employeeModel);
            modelAfterConvention = employeeResponse;
            
            var listOfProperties = GetJsonPropertyList(payrollEmployeeViewModel);
            foreach(var row in dataTable.Rows)
            {
                string controlName = row[0];
                string Value = row[1];
                Configuration(controlName, Value);
            }
            var employee = (PayrollEmployeeViewModel)employeeResponse;
            var updateEmployee = employeeClient.UpdateExistingEmployee(employee);*/
        }
        public static async Task<string> GetDate(int n, string pattern)
        {
            DateTime currentDate = DateTime.Now;
            DateTime adjustedDate = currentDate;

            if (pattern.Contains("day", StringComparison.OrdinalIgnoreCase))
            {
                adjustedDate = currentDate.AddDays(n);
            }
            else if (pattern.Contains("month", StringComparison.OrdinalIgnoreCase))
            {
                adjustedDate = currentDate.AddMonths(n);
            }
            else if (pattern.Contains("year", StringComparison.OrdinalIgnoreCase))
            {
                adjustedDate = currentDate.AddYears(n);
            }
            string finalDate = adjustedDate.ToString("MM/dd/yyyy");
            return finalDate;
        }

       

        public static async Task<string> SaveCompany(string bearer)
        {
            var program = new Program();
            var companyModel = new CompanyViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(companyModel);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId(null, "CompanyId", modelAfterConvention);
            Reqnroll.DataTable frequency = new Reqnroll.DataTable("Block", "FrequencyType", "FrequencyName");
            frequency.AddRow("1", "FrequencyName", "Daily"); frequency.AddRow("2", "FrequencyName", "Monthly");
            frequency.AddRow("1", "FrequencyType", "1"); frequency.AddRow("2", "FrequencyType", "4"); frequency.AddRow("2", "StartDate", "1");
            Reqnroll.DataTable calendar = new Reqnroll.DataTable("Block", "FrequencyType", "FrequencyName");
            calendar.AddRow("1", "FrequencyType", "1"); frequency.AddRow("1", "FrequencyName", "Daily");
            Program _program = new Program();
            await _program.EditCollection(2, "PayrollFrequencies", frequency);
            await _program.EditCollection(1, "PayrollCalendars", calendar);
            //program.Configuration("frequencyType", "1");
            program.Configuration("modeOfHours", "1");
            program.Configuration("modeOfCompensation", "1");
            program.Configuration("modeOfContribution", "1");
            program.Configuration("employeeClassificationType", "1");
            program.Configuration("code", "L1");
            program.Configuration("classificationName", "Location");
            program.Configuration("value", "Location");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.ICompanyDetails");
            var companyresponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewCompanyAsync");
            var companyId = companyresponse["company"]["id"].ToString();
            companyGrossCompensationId = companyresponse["company"]["compensationCategories"][1]["id"].ToString();
            companyPlanCompensationId = companyresponse["company"]["compensationCategories"][0]["id"].ToString();
            companyName = companyresponse["company"]["name"].ToString();
            companyClassificationId = companyresponse["company"]["classifications"][0]["employeeClassificationCodes"][0]["id"].ToString();
            employeeClassificationId = companyresponse["company"]["classifications"][0]["id"].ToString();
            payrollFrequencyId = companyresponse["company"]["payrollFrequencies"][0]["id"].ToString();
            ActiveStatusId = companyresponse["company"]["employmentStatus"][0]["id"].ToString();
            return companyId;
        }

        public static async Task<string> SavePlan(string bearer, string companyId)
        {
            var program = new Program();
            var planModel = new PlanDetailsViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(planModel);
            modelAfterConvention = FakeDataHelper.AssignId(companyId.ToString(), "CompanyId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            program.Configuration("effectiveDate", "2015-01-01");
            program.Configuration("name", "ABC123");
            program.Configuration("1month", "1");
            program.Configuration("1day", "1");
            program.Configuration("2month", "12");
            program.Configuration("2day", "31");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planResponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewPlanAsync");
            planId = planResponse["plan"]["id"].ToString();
            rkPlanNumber = planResponse["plan"]["rkPlanNumber"].ToString();
            planName = planResponse["plan"]["planName"].ToString();
            return planId;
        }

        public static async Task SaveSponsor(HttpClient httpClient, string bearer, string planId)
        {
            var faker = new Faker();
            var program = new Program();
            var sponsorModel = new SponsorViewModel
            {
                Id = 0,
                Ssn = faker.Random.Replace("6##-##-####"),
                Name = new MyNamespace.Name
                {
                    FirstName = faker.Person.FirstName,
                    LastName = faker.Person.LastName,
                    MiddleName = faker.Name.Suffix()
                },
                ContactDetails = new MyNamespace.Contact
                {
                    MobilePhoneNumber = faker.Random.Replace("###-###-####"),
                    WorkPhoneNumber = null,
                    Email = faker.Person.Email,
                    Website = null,
                },
                PlanId = int.Parse(planId),
                ExistingEmployeeId = null,
                IsDeleted = false,
                IsSponsor = true,
                Validate = null,
                Address = new MyNamespace.Address
                {
                    Address1 = faker.Address.StreetAddress(),
                    Address2 = faker.Address.StreetName(),
                    Address3 = null,
                    City = faker.Address.City(),
                    State = null,
                    ZipCode = faker.Random.Replace("#####-####"),
                    PostalCode = null,
                    Country = null
                },
                StateId = 1,
                CountryId = 1,
                ForeignCountry = null,
                ForeignState = null,
                ForeignZipCode = null,
            };

            var planInterface = RestService.For<IPlanDetailsSave>(httpClient);
            var sponsorSaveResponse = await planInterface.SavePlanSponsor(sponsorModel);

            /*modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sponsorModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId("1", "CountryId", modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId("1", "StateId", modelAfterConvention);
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sponsorSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType!, "SavePlanSponsor");*/
        }

        public static async Task ClearingPartnerPlanMapping(string bearer, string planId,string? ACName=null)
        {
            
            

            var program = new Program();
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            
            var clearingPartnerIds = await program.SendAPIRequest(bearer,1, interfaceType, "GetClearingPartnersId");
            var clearingPartnerId = clearingPartnerIds["clearingPartnerListResponses"][0]["id"].ToString();
            var CPAddToPlan = new PlanWithClearingPartnerViewModel();
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", CPAddToPlan);
            modelAfterConvention = FakeDataHelper.AssignId(clearingPartnerId.ToString(), "ClearingPartnerAccountIds", modelAfterConvention);
            modelAfterConvention = FakeDataHelper.AssignId(clearingPartnerId.ToString(), "DefaultClearingPartnerAccountId", modelAfterConvention);
            var clearingPartnerAddToPlanResponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "AddClearingPartnerToPlan");
        }

        public static async Task UpsertPlanWithClearingPartnerAccount(HttpClient httpClient, string planId, int accountId )
        {
            var clearingPartnerPlanMapping = new PlanWithClearingPartnerViewModel
            {
                PlanId = Convert.ToInt32(planId),
                ClearingPartnerAccountIds = new List<int> { accountId },
                DefaultClearingPartnerAccountId = accountId
            };

            var PlanInterface = RestService.For<IPlanDetailsSave>(httpClient);
            var clearingPartnerPlanMappingResponse = await PlanInterface.AddClearingPartnerToPlan(clearingPartnerPlanMapping);
            var parsedResponse = JObject.Parse(clearingPartnerPlanMappingResponse.ToString());
            var errorMessage = parsedResponse["errorMessage"]?.ToString();
            if(!(errorMessage == null))
                throw new Exception($"Error in upserting clearing partner account to plan: {errorMessage}");
        }

        public static async Task EligibilityConfiguration(string URL, HttpClient httpClient, string bearer, string planId)
        {
            var model = new EligibilityRuleViewModel
            {
                Id = 0,
                PlanId = Convert.ToInt32(planId),
                //PlanAmendmentId = 0,

                Name = "Immediate",
                Description = "Immediate eligibility",
                ImmediateEligibility = true,
                EligibilityRuleFor = 1,

                IsLTPTApplicable = false,
                IsBreakInService = false,
                IsRevaluationRequired = false,
                RehiredOneYearLookBack = null,

                EligibilityCalculationPeriod = null,
                AdditionalEligibilityRules = new List<AdditionalEligibilityRuleViewModel>(),

                ExclusionFromRule = new ExclusionFromRuleViewModel
                {
                    ExclusionType = 0
                },

                LtptExclusionFromRule = new ExclusionFromRuleViewModel
                {
                    ExclusionType = 0
                },

                LtptVestingComputationPeriod = new VestingComputationPeriod(),

                LtptServiceCreditPeriod = new ServiceCreditPeriod(),

                PlanAmendments = new PlanAmendmentViewModel
                {
                    Id = 0,
                    EffectiveStartDate = DateTimeOffset.Parse("2015-01-01T00:00:00Z"),
                    DirectAmendment = false,
                    Description = "Initial Rule",
                    PlanId = Convert.ToInt32(planId)
                },

                IsDeleted = false
            };

            var requestBody = JsonConvert.SerializeObject(model);
            var requestPayload = JObject.Parse(requestBody);
            string Action = "api/v1/EligibleRule/SavePlanAmendmentEligibleRule";
            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", bearer);
            var task = await httpClient.PostAsync($"{URL}/{Action}/", data);
            var contentTask = await task.Content.ReadAsStringAsync();
            response = JObject.Parse(contentTask);
            Console.Write(response.ToString());
        }

        public static async Task SaveEntryDate(HttpClient httpClient, string bearer, string planId)
        {
            var entryDate = new EntryDateRuleViewModel
            {
                Id = 0,
                PlanId = Convert.ToInt32(planId),
                EntryDateRuleType = null,
                EntryDateRuleFor = 1,
                RuleName = "Immediate",
                EntryDateRule = 6,
                EntryDateRehireOption = 0,
                IsSwitchToPlanYearHaveDifferentEntryDates = false,
                EntryDateSources = null,
                OtherEntryDates = null,
                PlanYearOtherEntryDates = null,
                AdditionalEntryDateRules = null
            };

            var planDetailsSaveInterface = RestService.For<IPlanDetailsSave>(httpClient);
            var entryDateSaveResponse = await planDetailsSaveInterface.SaveEntryDate(entryDate);
        }

        public static async Task SavePretaxSource(string bearer, string planId)
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            var currentDate = DateTime.UtcNow;
            program.Configuration("sourceType", "1");
            program.Configuration("sourceCategory", "2");
            program.Configuration("sourceSubCategory", "4");
            program.Configuration("sourceSubSubCategory", "1");
            program.Configuration("effectiveStartDate", "2020-01-01");
            program.Configuration("sourceName", "EEPreTax");
            program.Configuration("contributionType", "1");
            program.Configuration("limitMinimumDollar", "10");
            program.Configuration("limitMinimumPercentage", "10");
            program.Configuration("limitMaximumPercentage", "70");
            program.Configuration("limitMaximumDollar", "70");
            program.Configuration("sourceCode", "A");
            program.Configuration("employerDiscretionarySource", null);
            program.Configuration("employerMatchSource", null);
            program.Configuration("employerOtherSource", null);
            program.Configuration("employerSourceExcludedEmployeeClassifications", null);
            program.Configuration("employerSourceExcludedEmploymentStatuses", null);
            program.Configuration("employerSourceExclusion", null);

            //program.Configuration("EmployeeDeferralSource.contributionType", "7");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
            sourceId = sourceSave["source"]["id"].ToString();
            pretaxsourceName = sourceSave["source"]["sourceName"].ToString();
        }

        public static async Task SaveMatchSource(string bearer, string planId, string sourceName = "null")
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            var currentDate = DateTime.UtcNow;
            program.Configuration("sourceType", "2");
            program.Configuration("sourceCategory", "6");
            program.Configuration("effectiveStartDate", "2015-01-01");
            program.Configuration("sourceName", "Match");
            program.Configuration("responsibleMode", "1");
            program.Configuration("sourceCode", "D");
            program.Configuration("contributionType", "1");
            program.Configuration("limitMinimumDollar", "10");
            program.Configuration("limitMinimumPercentage", "10");
            program.Configuration("limitMaximumPercentage", "70");
            program.Configuration("limitMaximumDollar", "70");
            //program.Configuration("EmployeeDeferralSource.contributionType", "7");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
            matchSourceId = sourceSave["source"]["id"].ToString();
        }

        public static async Task SaveRothSource(string bearer, string planId)
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            var currentDate = DateTime.UtcNow;
            program.Configuration("sourceType", "1");
            program.Configuration("sourceCategory", "2");
            program.Configuration("sourceSubCategory", "5");
            program.Configuration("sourceSubSubCategory", "1");
            program.Configuration("effectiveStartDate", "2020-01-01");
            program.Configuration("sourceName", "EERoth");
            program.Configuration("contributionType", "1");
            program.Configuration("limitMinimumDollar", "10");
            program.Configuration("limitMinimumPercentage", "10");
            program.Configuration("limitMaximumPercentage", "70");
            program.Configuration("limitMaximumDollar", "70");
            program.Configuration("sourceCode", "Q");
            program.Configuration("sourceId", "");
            program.Configuration("employerDiscretionarySource", null);
            program.Configuration("employerMatchSource", null);
            program.Configuration("employerOtherSource", null);
            program.Configuration("employerSourceExcludedEmployeeClassifications", null);
            program.Configuration("employerSourceExcludedEmploymentStatuses", null);
            program.Configuration("employerSourceExclusion", null);
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
            rothSourceId = sourceSave["source"]["id"].ToString();
            rothSourceName = sourceSave["source"]["sourceName"].ToString();
        }

        public static async Task SavePretaxRolloverSource(string bearer, string planId)
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            var currentDate = DateTime.UtcNow;
            await program.Configuration("sourceType", "1");
            await program.Configuration("sourceCategory", "4");
            await program.Configuration("sourceSubCategory", "7");
            await program.Configuration("sourceSubSubCategory", "");
            await program.Configuration("effectiveStartDate", "2020-01-01");
            await program.Configuration("sourceName", "Pretax Rollover");
            await program.Configuration("contributionType", "1");
            await program.Configuration("limitMinimumDollar", "10");
            await program.Configuration("limitMinimumPercentage", "10");
            await program.Configuration("limitMaximumPercentage", "70");
            await program.Configuration("limitMaximumDollar", "70");
            await program.Configuration("sourceCode", "R");
            await program.Configuration("employerDiscretionarySource", null);
            await program.Configuration("employerMatchSource", null);
            await program.Configuration("employerOtherSource", null);
            await program.Configuration("employerSourceExcludedEmployeeClassifications", null);
            await program.Configuration("employerSourceExcludedEmploymentStatuses", null);
            await program.Configuration("employerSourceExclusion", null);

            //program.Configuration("EmployeeDeferralSource.contributionType", "7");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
            sourceId = sourceSave["source"]["id"].ToString();
            pretaxsourceName = sourceSave["source"]["sourceName"].ToString();
        }
        public static async Task SaveCompensation(string bearer, string planId)
        {
            var program = new Program();
            var compensationModel = new CompensationViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(compensationModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var list = GetJsonPropertyList(modelAfterConvention);
            program.Configuration("compensationCategoryId", companyPlanCompensationId);
            program.Configuration("isIncluded", "true");
            program.Configuration("calculationType", "1");
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var compSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveCompensation");
        }

        public static async Task UpdatePlanStatus(string bearer, string planId, string statusCode)
        {
            var program = new Program();
            var updatePlanStatusModel = new UpdatePlanStatusViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(updatePlanStatusModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var list = GetJsonPropertyList(modelAfterConvention);
            program.Configuration("planStatus", statusCode);
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
            program.Configuration("investmentId", "2");
            program.Configuration("status", "1");
            program.Configuration("investmentType", "2");
            program.Configuration("planId", planId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planStatus = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "AddInvestmentsToPlan");
            program.Configuration("investmentId", "3");
            program.Configuration("status", "1");
            program.Configuration("investmentType", "2");
            program.Configuration("planId", planId);
            var interfaceType1 = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var addedToPlan = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "AddInvestmentsToPlan");
        }

        public static async Task AddInvestmentsToPlan(string planId, string modelPortfolioId, string investmentId2, int noOfBlocks, string propertyName, Reqnroll.DataTable dataTable)
        {
            var program = new Program();
            var investmentPlanMapping = new AddInvestmentsInput();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(investmentPlanMapping);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var list = GetJsonPropertyList(modelAfterConvention);
            program.Configuration("investmentId", modelPortfolioId);
            program.Configuration("status", "1");
            program.Configuration("investmentType", "1");
            program.Configuration("planId", planId);
            await program.EditCollection(noOfBlocks, propertyName, dataTable);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var planStatus = await program.SendAPIRequest(Hooks.Hooks.bearer!, modelAfterConvention, interfaceType, "AddInvestmentsToPlan");
            program.Configuration("investmentId", investmentId2);
            program.Configuration("status", "1");
            program.Configuration("investmentType", "2");
            program.Configuration("planId", planId);
            var addedToPlan = await program.SendAPIRequest(Hooks.Hooks.bearer!, modelAfterConvention, interfaceType, "AddInvestmentsToPlan");
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
            program.Configuration("planId", planId);
            program.Configuration("sameInvestmentElectionToAllParticipants", "true");
            program.Configuration("sourceName", "Pretax");
            program.Configuration("contributionRate", "12");
            program.Configuration("autoDeferralIncreaseProgram", "true");
            program.Configuration("increaseAllowanceDays", "30");
            program.Configuration("periodOfIncrease", "1");
            program.Configuration("applyADITo", "0");
            program.Configuration("adiApplicableTo", "2");
            program.Configuration("subjecttoAutoEnrollment", "True");
            program.Configuration("numberOfDaysWindowIsOpenNumber", "1");
            program.Configuration("numberOfDaysWindowIsOpen", "3");
            program.Configuration("numberOfDaysWindowIsOpenForOptoutNumber", "1");
            program.Configuration("numberOfDaysWindowIsOpenForOptout", "1");
            program.Configuration("exclusionType", "0");
            program.Configuration("usePlanDefaultDeferralElection", "true");
            program.Configuration("usePlanDefaultInvestmentElection", "true");
            program.Configuration("sendEnrollmentInvite", "1");
            program.Configuration("deferralContributionRateUponRehire", "2");
            program.Configuration("contributionType", "1");
            program.Configuration("sourceId", sourceId);
            program.Configuration("autoDeferralIncreasePercentage", "15");
            program.Configuration("maximumADIPercentage", "18");
            program.Configuration("investmentId", investmentPlanMappingId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var enrollmentSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveEnrollmentSettings");
        }

        public async Task SaveEnrollmentForModelPortfolio()
        {
            var program = new Program();
            var planDetailsClient = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var listOfPlanInvestments = await program.SendAPIRequest(Hooks.Hooks.bearer!, planId, planDetailsClient, "GetInvestmentListByPlanId");
            var InvestmentPlanMappingIds = await GetInvestmentIdsByNames(listOfPlanInvestments, modelPortfolioNames);
            modelPortfolioInvestmentId = InvestmentPlanMappingIds[modelPortfolioNames.First()].ToString();
            modelPortfolioInvestmentId2 = InvestmentPlanMappingIds[modelPortfolioNames.Last()].ToString();
            RegularInvestmentId = InvestmentPlanMappingIds["SEAS003"].ToString();
            program.Configuration("planId", planId);
            program.Configuration("sameInvestmentElectionToAllParticipants", "true");
            program.Configuration("sourceName", "Pretax");
            program.Configuration("contributionRate", "12");
            program.Configuration("autoDeferralIncreaseProgram", "true");
            program.Configuration("increaseAllowanceDays", "30");
            program.Configuration("periodOfIncrease", "1");
            program.Configuration("applyADITo", "0");
            program.Configuration("adiApplicableTo", "2");
            program.Configuration("subjecttoAutoEnrollment", "True");
            program.Configuration("numberOfDaysWindowIsOpenNumber", "1");
            program.Configuration("numberOfDaysWindowIsOpen", "3");
            program.Configuration("numberOfDaysWindowIsOpenForOptoutNumber", "1");
            program.Configuration("numberOfDaysWindowIsOpenForOptout", "1");
            program.Configuration("exclusionType", "0");
            program.Configuration("usePlanDefaultDeferralElection", "true");
            program.Configuration("usePlanDefaultInvestmentElection", "true");
            program.Configuration("sendEnrollmentInvite", "1");
            program.Configuration("deferralContributionRateUponRehire", "2");
            program.Configuration("contributionType", "1");
            program.Configuration("sourceId", sourceId);
            program.Configuration("autoDeferralIncreasePercentage", "15");
            program.Configuration("maximumADIPercentage", "18");
            /*program.Configuration("1investmentId", RegularInvestmentId);
            program.Configuration("2investmentId", modelPortfolioInvestmentId);
            program.Configuration("1investmentName", "SEAS003");
            program.Configuration("21investmentName", modelPortfolioName);*/
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var enrollmentSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveEnrollmentSettings");
        }

        /*public static async Task<string> SavePretaxRollOverSource(string bearer, string planId)
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyList(modelAfterConvention);
            var currentDate = DateTime.UtcNow;
            await program.Configuration("sourceType", "1");
            await program.Configuration("sourceCategory", "4");
            await program.Configuration("sourceSubCategory", "7");
            await program.Configuration("sourceSubSubCategory", "");
            await program.Configuration("effectiveStartDate", "2020-01-01");
            await program.Configuration("sourceName", "Pretax Rollover");
            //await program.Configuration("isNewContributionAllowed", "false");
            //await program.Configuration("limitMinimumDollar", "10");
            //await program.Configuration("limitMinimumPercentage", "10");
            //await program.Configuration("limitMaximumPercentage", "70");
            //await program.Configuration("limitMaximumDollar", "70");
            await program.Configuration("sourceCode", "R");
            //program.Configuration("EmployeeDeferralSource.contributionType", "7");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
            pretaxRolloverSourceId = sourceSave["source"]["id"].ToString();
            return pretaxRolloverSourceId;
        }

        //public static async Task<string> SaveRollOverSource(string? bearer,string planId)
        //{
        //    var program = new Program();
        //    var RolloOver = new RolloverViewModel();
        //    modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(RolloOver);
        //    modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "planId", modelAfterConvention);
        //    var listOfProperties = GetJsonPropertyList(modelAfterConvention);
        //    await program.Configuration("planId", planId);
        //    await program.Configuration("sourceName", "PretaxRollover");
        //    await program.Configuration("sourceType","1");
        //    await program.Configuration("sourceCategory", "4");
        //    await program.Configuration("sourceSubCategory", "7");
        //    await program.Configuration("sourceSubSubCategory", null);
        //    await program.Configuration("sourceCode", "8");
        //    await program.Configuration("effectiveStartDate", "2025-04-01T00:00:00Z");
        //    await program.Configuration("effectiveEndDate", null);
        //    await program.Configuration("isSourceOfferdInthisPlan", "True");
        //    await program.Configuration("recordKeepingNumber", null);
        //    await program.Configuration("isNewContributionAllowed", "false");
        //    await program.Configuration("isDisplayToParticipantWebsite", "false");
        //    await program.Configuration("isEligibilityRulesUniqueThisSource", "false");
        //    await program.Configuration("employerSourceExclusion", "");
        //    await program.Configuration("employeeDeferralSource", null);
        //    await program.Configuration("employerDiscretionarySource", null);
        //    await program.Configuration("employerMatchSource", null);
        //    await program.Configuration("employerOtherSource", null);
        //    await program.Configuration("contributionType", "1");
        //    await program.Configuration("employerSourceExcludedEmployeeClassifications", "");
        //    await program.Configuration("employerSourceExcludedEmploymentStatuses", "");
        //    await program.Configuration("isValid", null);
        //    await program.Configuration("validate", null);
        //    System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
        //    var planResponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveRollOverAsync");
        //    string RollOverSource = planResponse["plan"]["id"].ToString();
        //    rkPlanNumber = planResponse["plan"]["rkPlanNumber"].ToString();
        //    planName = planResponse["plan"]["planName"].ToString();
        //    return RollOverSource;
        //}
        public async Task SaveEnrollmentForModelPortfolioWithDiffernentInvestionElectionToAllSources()
        {
            var program = new Program();
            var planDetailsClient = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var listOfPlanInvestments = await program.SendAPIRequest(Hooks.Hooks.bearer!, planId, planDetailsClient, "GetInvestmentListByPlanId");
            var InvestmentPlanMappingIds = await GetInvestmentIdsByNames(listOfPlanInvestments, modelPortfolioNames);
            modelPortfolioInvestmentId = InvestmentPlanMappingIds[modelPortfolioNames.First()].ToString();
            modelPortfolioInvestmentId2 = InvestmentPlanMappingIds[modelPortfolioNames.Last()].ToString();
            RegularInvestmentId = InvestmentPlanMappingIds["SEAS003"].ToString();
            program.Configuration("planId", planId);
            program.Configuration("sameInvestmentElectionToAllParticipants", "true");
            program.Configuration("sourceName", "Pretax");
            program.Configuration("contributionRate", "12");
            program.Configuration("autoDeferralIncreaseProgram", "true");
            program.Configuration("increaseAllowanceDays", "30");
            program.Configuration("periodOfIncrease", "1");
            program.Configuration("applyADITo", "0");
            program.Configuration("adiApplicableTo", "2");
            program.Configuration("subjecttoAutoEnrollment", "True");
            program.Configuration("numberOfDaysWindowIsOpenNumber", "1");
            program.Configuration("numberOfDaysWindowIsOpen", "3");
            program.Configuration("numberOfDaysWindowIsOpenForOptoutNumber", "1");
            program.Configuration("numberOfDaysWindowIsOpenForOptout", "1");
            program.Configuration("exclusionType", "0");
            program.Configuration("usePlanDefaultDeferralElection", "true");
            program.Configuration("usePlanDefaultInvestmentElection", "false");
            program.Configuration("sameInvestmentElectionToAllSources", "false");
            program.Configuration("sendEnrollmentInvite", "1");
            program.Configuration("deferralContributionRateUponRehire", "2");
            program.Configuration("contributionType", "1");
            //program.Configuration("sourceId", sourceId);
            program.Configuration("autoDeferralIncreasePercentage", "15");
            program.Configuration("maximumADIPercentage", "18");
            /*program.Configuration("1investmentId", RegularInvestmentId);
            program.Configuration("2investmentId", modelPortfolioInvestmentId);
            program.Configuration("1investmentName", "SEAS003");
            program.Configuration("21investmentName", modelPortfolioName);
        var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var enrollmentSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveEnrollmentSettings");
        }*/
        public static async Task SaveFunding(string bearer, string planId)
        {
            var program = new Program();
            var listOfFundingClient = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var listOfFunding = await program.SendAPIRequest(bearer, planId, listOfFundingClient, "ListFunding");
            var fundingId = listOfFunding["funding"]["id"].ToString();
            var funding = new FundingViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(funding);
            var list = GetJsonPropertyList(modelAfterConvention);
            program.Configuration("planId", planId);
            program.Configuration("planCashAccountEnabled", "true");
            program.Configuration("achPullEnabled", "true");
            program.Configuration("bankAccountNumber", "647823647236");
            program.Configuration("abaRoutingNumber", "527183462");
            program.Configuration("bankAccountName", "HSBC Bank");
            program.Configuration("bankAccountType", "2");
            program.Configuration("bankAccountStatus", "1");
            program.Configuration("defaultBankAccountIndicator", "true");
            program.Configuration("classificationIds", null);
            program.Configuration("fundingId", fundingId);
            program.Configuration("1id", fundingId);
            program.Configuration("sponsorFeePaymentMethod", "1");
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
            program.Configuration("companyName", companyName);
            program.Configuration("planName", planName);
            program.Configuration("rkPlanNumber", rkPlanNumber);
            program.Configuration("uploadedOn", null);
            program.Configuration("fileStatus", null);
            program.Configuration("fileType", null);
            program.Configuration("fileName", null);
            //string BaseURL = "https://dev.coreretirementsolutions.com/";
            payrollSearch = (UploadedFileInformationDetails)modelAfterConvention;
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);

            var apiClient = RestService.For<IPayroll>(httpClient);
            var response = await apiClient.GetUploadedFilesBasedOnSearchCriteria(payrollSearch);
            var responseArray = JArray.Parse(response.ToString());
            uploadedFileId = responseArray[0]["id"].ToString();
            return uploadedFileId;
            var interfaceType = System.Type.GetType($"RefitSandBox.IPayroll");
            var payrollFileList = await program.SendAPIRequest(bearer, payrollSearch, interfaceType, "GetUploadedFilesBasedOnSearchCriteria");
        }

        public static async Task SaveFundingDetailsByPlan(HttpClient httpClient, string planId, string fileId)
        {
            var PlanFunding = new FundingByPlanViewModel
            {
                PlanId = Convert.ToInt32(planId),
                FileId = Convert.ToInt32(fileId),
                TotalFundingAmount = totalAmount,
                TotalEmployerContribution = 0,
                BankFundings = null,
                ForfeitureFundings = null,
                AchDebitFundings = new List<ACHDebitFundingViewModel>
                {
                    new ACHDebitFundingViewModel
                    {
                        BankName = "HSBC Bank",
                        BankId = Convert.ToInt32(fundingBankId),
                        PlanAccountId = 0,
                        Amount = totalAmount,
                    }
                },
                AchPushFundings = null,
                WireFundings = null,
                CheckFundings = null,
                IsPayDateWise = false,
                PayDate = null
            };

            var PayrollInterface = RestService.For<IPayroll>(httpClient);
            var saveFundingByPlanResponse = await PayrollInterface.SaveFundingDetailsByPlan(PlanFunding);
        }


        public static async Task ConfirmFunds(HttpClient httpClient, string planId, string fileId, string payrollFundingId)
        {
            var ConfirmFunds = new ConfirmFundsViewModel
            {
                FileId = Convert.ToInt32(fileId),
                PayrollFundingId = Convert.ToInt32(payrollFundingId),
                FundingType = "Plan",
                IsForfeiture = false,
                IsACHDebit = true,
                IsACHPushFunding = false,
                IsCheckFunding = false,
                IsWireFunding = false,
                PlanId = Convert.ToInt32(planId),
                Amount = totalAmount,
                NodConfirmationNumber = "",
                PayDate = null,
                IsPayDateWise = false
            };

            var PayrollInterface = RestService.For<IPayroll>(httpClient);
            var ResponseAfterConfirmFunds = await PayrollInterface.ConfirmFunds(ConfirmFunds);
            /*var program = new Program();
            var confirmFunds = new ConfirmFundsViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(confirmFunds);
            var list = GetJsonPropertyList(modelAfterConvention);
            program.Configuration("fileId", fileId);
            program.Configuration("fundingType", "Plan");
            program.Configuration("isACHDebit", "true");
            program.Configuration("planId", planId);
            program.Configuration("amount", totalAmount.ToString());
            program.Configuration("payrollFundingId", payrollFundingId);
            var interfaceType = System.Type.GetType($"RefitSandBox.IPayroll");
            var confirmFundsResponse = await program.SendAPIRequest(Hooks.Hooks.bearer!, modelAfterConvention, interfaceType, "ConfirmFunds");*/
        }
        public async Task TransferTransaction()
        {
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            await GenerateOutboundFile(httpClient, "Saturna", "DTCC", 1);
            await Task.Delay(2000);
            var tradeOrderNumbers = _sftp.ProcessTradeOrderFile(SFTP.CUSIPTradeIdentifierDict, b50Response);
            _sftp.EditFixedWidthFile(Hooks.Hooks.clearingPartnerName, "D260102.P2361.C09", new List<B50MatchResult>(), tradeOrderNumbers);
            _sftp.UploadFile(Hooks.Hooks.clearingPartnerName, "D260102.P2361.C09");
            var filePicked = await _sftp.WaitForFileToBePickedAsync("D260102.P2361.C09");
            if (!filePicked)
                throw new TimeoutException("File not picked up within 2 minutes");
        }
        public async Task TradeOutboundFileGeneration(string ClearingPartner, int AccountId)
        {
            var program = new Program();
            var sftp = new SFTP();
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            switch (ClearingPartner)
            {
                case "DTCC":
                    await program.GenerateOutboundFile(httpClient, "Saturna", "DTCC", 5);
                    await program.VerifyClearingPartnerMappingId(httpClient, planId);
                    await Task.Delay(2500);
                    await program.GenerateOutboundFile(httpClient, "Saturna", "DTCC", 7);
                    b50Response = await sftp.SFTPOperations(AccountId.ToString());
                    if (b50Response.Count == 0)
                        throw new Exception("B50 File does not contain investments");
                    sftp.EditFixedWidthFile(Hooks.Hooks.clearingPartnerName, "D260119.P2084.C00", b50Response, new Dictionary<string, CusipProcessingResult>());
                    sftp.UploadFile(Hooks.Hooks.clearingPartnerName, "D260119.P2084.C00");
                    await sftp.PollingIdentifier(httpClient, Hooks.Hooks.clearingPartnerName, planId, "ClearingPartnerMapping");
                    break;

                default:
                    throw new Exception($"Invalid Clearing partner {ClearingPartner}");
            }
        }

        public async Task GenerateOutboundFile(HttpClient httpClient, string tenantIdentifier, string custodianIdentifier, int tradeFileType)
        {
            var generateOutboundFileModel = new OutboundFileGeneration
            {
                TenantIdentifier = tenantIdentifier,
                TransmissionType = TransmissionType2._2,
                TransmissionMode = TransmissionMode._1,
                TradeFileType = (TradeFileType)tradeFileType,
                CustodianIndentifier = custodianIdentifier,
            };

            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Include
            };

            var json = JsonConvert.SerializeObject(generateOutboundFileModel, settings);
            var requestPayload = JObject.Parse(json);
            Console.WriteLine("Trade order request :" + requestPayload.ToString());
            string Action = "api/v1/TradeOutboundFileGeneration/GenerateFile";
            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
            
            var task = await httpClient.PostAsync($"{Settings.ApplicationURL}/{Action}/", data);
            var contentTask = await task.Content.ReadAsStringAsync();
            if (!(contentTask == "Outbound File generation initiated successfully"))
                throw new Exception($"Error in running {Action} endpoint");
            
        }

        public async Task VerifyClearingPartnerMappingId(HttpClient httpClient, string planId)
        {
            var PlanInterface = RestService.For<IPlanDetailsSave>(httpClient);
            var clearingPartnerPlanMappingResponse = await PlanInterface.GetPlanAssociatedClearingPartnerAccounts(Convert.ToInt32(planId));

            var parsedResponse = JObject.Parse(clearingPartnerPlanMappingResponse.ToString())["planAssociatedClearingPartnerAccounts"] as JArray;
            var clearingPartnerMappingId = parsedResponse[0]["clearingPartnerId"].ToString();
            if(clearingPartnerMappingId == null)
                throw new Exception("Clearing Partner Mapping Id is null");
        }

        public static async Task<bool> VerifyAccountBalanceReflection(HttpClient httpClient, string planId)
        {
            var employeeId = await GetEmployeeId();
            await Task.Delay(3000);
            var currentDate = DateTime.Today.ToString("yyyy-MM-dd");
            var tradeOrderClient = RestService.For<ITradeOrderFileUpload>(httpClient);
            employeeAccountBalance = await tradeOrderClient.GetParticipantAccountBalanceByPlan(planId, employeeId, currentDate);
            var accountBalance = employeeAccountBalance.RegularAccountBalance;
            if (accountBalance == 0)
                return false;
            else
                return true;
        }
    
        public async Task EnrollmentConfiguration(string planId, string pretaxSourceId, string rothSourceId, string investment1Name, string investment2Name)
        {
            var program = new Program();
            var investment1PlanMappingId = await program.IdentifyValue(investment1Name);
            var investment2PlanMappingId = await program.IdentifyValue(investment2Name);

            var enrollmentModel = new EnrollmentViewModel
            {
                Id = 0,
                PlanId = int.Parse(planId),
                DefaultElectionSetting = new DefaultElectionSettingViewModel
                {
                    EnrollmentId = 0,
                    Id = 0,
                    AutoUpdateInvestmentElection = null,
                    SameInvestmentElectionToAllParticipants = true,
                    InvestmentElectionBasedOn = null,
                    DeferralSourceContribution = new List<DeferralSourceContributionViewModel>
                    {
                        new DeferralSourceContributionViewModel
                        {
                            DefaultElectionSettingsId = 0,
                            Id = 0,
                            SourceId = int.Parse(pretaxSourceId),
                            SourceName = "EEPretax",
                            SourceType = 0,
                            SourceCategory = 0,
                            SourceSubCategory = 0,
                            ContributionType = 1,
                            ContributionRate = 30.0, // double
                            MinimumRate = null,
                            MaximumRate = null,
                            PercentageMinimumRate = null,
                            PercentageMaximumRate = null,
                            IsDeleted = false,
                            ContributionFieldType = 1,
                            HceContributionFieldType = null,
                            HceRate = null
                        },
                        new DeferralSourceContributionViewModel
                        {
                            DefaultElectionSettingsId = 0,
                            Id = 0,
                            SourceId = int.Parse(rothSourceId),
                            SourceName = "Roth",
                            SourceType = 0,
                            SourceCategory = 0,
                            SourceSubCategory = 0,
                            ContributionType = 1,
                            ContributionRate = 30.0,
                            MinimumRate = null,
                            MaximumRate = null,
                            PercentageMinimumRate = null,
                            PercentageMaximumRate = null,
                            IsDeleted = false,
                            ContributionFieldType = 1,
                            HceContributionFieldType = null,
                            HceRate = null
                        }
                    },
                    DefaultElectionBasedOnList = new List<DefaultElectionBasedOnViewModel>(),
                    PlanInvestment = new List<PlanInvestmentViewModel>
                    {
                        new PlanInvestmentViewModel
                        {
                            DefaultElectionSettingsId = 0,
                            InvestmentElectionBasedOnId = null,
                            Id = 0,
                            InvestmentId = int.Parse(investment1PlanMappingId),
                            InvestmentName = "SEAS001",
                            InvestmentPercentage = 70.0, // double
                            IsDeleted = false
                        },
                        new PlanInvestmentViewModel
                        {
                            DefaultElectionSettingsId = 0,
                            InvestmentElectionBasedOnId = null,
                            Id = 0,
                            InvestmentId = int.Parse(investment2PlanMappingId),
                            InvestmentName = "SEAS002",
                            InvestmentPercentage = 30.0,
                            IsDeleted = false
                        }
                    },
                    AdditionalDefaultElectionSetting = new List<AdditionalDefaultElectionSettingViewModel>()
                },
                AutoDeferralncreaseApplicable = new ADIApplicableConfigurationViewModel2
                {
                    EnrollmentId = 0,
                    Id = 0,
                    AutoDeferralIncreaseProgram = false,
                    AdiApplicableTo = null,
                    AutoDeferralIncrease = null,
                    PeriodOfIncrease = null,
                    ApplyADITo = null,
                    IncreaseAllowanceDays = null,
                    ExcludeHCE = null,
                    SeparateAdiRatesForHce = null,
                    AdiLiveDate = null,
                    IsSetAutoIncreaseLimitAcrossAllDeferrals = null,
                    AutoIncreaseAcrossAllDeferralsStopsAt = null,
                    AdiContributionType = null,
                    Adi = new List<ADIViewModel2>(),
                    AdditionalADIRules = new List<AdditionalADIRuleViewModel>()
                },
                AutoEnrollment = new AutoEnrollmentDataViewModel2
                {
                    EnrollmentId = 0,
                    Id = 0,
                    PlanId = int.Parse(planId),
                    SubjecttoAutoEnrollment = true,
                    MinimumWithdrawallimit = null,
                    IsAutoReEnroll = false,
                    FrequencyOptoutIndicator = null,
                    IsWindowPeriod = null,
                    NumberOfDaysWindowIsOpenNumber = 10,
                    NumberOfDaysWindowIsOpen = 1,
                    NumberOfDaysWindowIsOpenForOptoutNumber = 10,
                    NumberOfDaysWindowIsOpenForOptout = 1,
                    NumberOfDaysWindowIsOpenReEnrollmentNumber = null,
                    NumberOfDaysWindowIsOpenReEnrollment = null,
                    ExclusionType = 0,
                    UsePlanDefaultDeferralElection = true,
                    UsePlanDefaultInvestmentElection = true,
                    InvestmentBasedOn = null,
                    SameInvestmentBasedOn = null,
                    SameInvestmentElectionToAllSources = null,
                    SameInvestmentElectionToAllParticipants = true,
                    EffectiveDate = DateTimeOffset.Now.AddDays(1), // DateTimeOffset
                    LiveDate = null,
                    InvestmentElectionBasedOnList = new List<InvestmentElectionBasedOnViewModel2>
                    {
                        new InvestmentElectionBasedOnViewModel2()
                        {
                            Id = 0,
                            AgeFrom = null,
                            AgeTo = null,
                            AutoEnrollmentId = 0,
                            From = null,
                            InvestmentBasedOn = null,
                            To = null,
                            IsDefaultCategory = null,
                            IsDeleted = false,
                            InvestmentElectionValuesList = new List<InvestmentElectionValuesViewModel2>
                            {
                                new InvestmentElectionValuesViewModel2
                                {
                                    InvestmentElectionBasedOnId = 0,
                                    Id = 0,
                                    InvestmentId = int.Parse(investment1PlanMappingId),
                                    InvestmentName = "SEAS001",
                                    InvestmentPercentage = 70.0,
                                    IsDeleted = false
                                },
                                new InvestmentElectionValuesViewModel2
                                {
                                    InvestmentElectionBasedOnId = 0,
                                    Id = 0,
                                    InvestmentId = int.Parse(investment2PlanMappingId),
                                    InvestmentName = "SEAS002",
                                    InvestmentPercentage = 30.0,
                                    IsDeleted = false
                                }
                            },
                        }
                    },
                    ExcludedEmployeeClassifications = new List<ExcludedEmployeeClassficationViewModel2>(),
                    ExcludedEmploymentStatuses = new List<ExcludedEmployeeStatusViewModel2>(),
                    DateOfHire = null,
                    HiredOnOrAfterDateEnrollment = null,
                    HiredOnOrBeforeDateEnrollment = null,
                    HiredBetweenFrom = null,
                    HiredBetweenTo = null,
                    AutoEnrollmentDeferralSources = new List<AutoEnrollmentDeferralSourcesViewModel2>
                    {
                        new AutoEnrollmentDeferralSourcesViewModel2
                        {
                            AutoEnrollmentId = 0,
                            Id = 0,
                            SourceId = int.Parse(pretaxSourceId),
                            DeferralSourceName = "EEPretax",
                            DeferralSourcePercentage = 30.0,
                            ExcludeFromEnrollment = false,
                            LimitMinimum = 10.0,
                            LimitMaximum = 70.0,
                            IsDeleted = false
                        },
                        new AutoEnrollmentDeferralSourcesViewModel2
                        {
                            AutoEnrollmentId = 0,
                            Id = 0,
                            SourceId = int.Parse(rothSourceId),
                            DeferralSourceName = "Roth",
                            DeferralSourcePercentage = 30.0,
                            ExcludeFromEnrollment = false,
                            LimitMinimum = 10.0,
                            LimitMaximum = 70.0,
                            IsDeleted = false
                        }
                    },
                    AdditionalAutoEnrollment = new List<AdditionalAutoEnrollmentDataViewModel2>()
                },
                OtherInformation = new OtherInformationViewModel
                {
                    EnrollmentId = 0,
                    Id = 0,
                    AllowReallocation = false,
                    ReallocationPeriod = null,
                    NumberOfReallocationsAllowed = null,
                    SendEnrollmentInvite = 1,
                    NumberOfDaysBeforeEntryDate = null,
                    NumberOfDaysBeforeForecastDate = null,
                    DeferralContributionRateUponRehire = 2,
                    SendNoticeBeforeEachPlanYear = false,
                    NumberOfDaysBeforePlanYearStart = null,
                    IsRecurringCommunication = false,
                    Frequency = null,
                    NumberOfOccurrences = null
                }
            };




            var settings = new JsonSerializerSettings
            {
                NullValueHandling = NullValueHandling.Include
            };

            var json = JsonConvert.SerializeObject(enrollmentModel, settings);
            var requestPayload = JObject.Parse(json);
            Console.WriteLine("Enrollment request :" + requestPayload.ToString());
            string Action = "api/Enrollment/SaveEnrollmentSetting";
            var data = new StringContent(requestPayload.ToString(), Encoding.UTF8, "application/json");
            string token = _hooks != null || !string.IsNullOrEmpty(Hooks.Hooks.bearer!) ? Hooks.Hooks.bearer! : bearer;
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", token);
            var task = await httpClient.PostAsync($"{Settings.ApplicationURL}/{Action}/", data);
            var contentTask = await task.Content.ReadAsStringAsync();
            response = JObject.Parse(contentTask);
            Console.Write(response.ToString());
        }

        public async Task<string> GetPayrollTransactionId()
        {
            var getTransactionModel = new GetEmployeeTransactionViewModel
            {
                PlanId = int.Parse(planId),
                EmployeeId = Convert.ToInt32(await GetEmployeeId()),
                TransactionType = new List<int> { 5 },
                FromDate = DateTimeOffset.Now.AddYears(-10),
                ToDate = DateTimeOffset.Now,
                PageNumber = 1,
                RecordsPerPage = 20
            };

            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);

            var tradeInterface = RestService.For<ITradeOrderFileUpload>(httpClient);
            var transactionResponse = await tradeInterface.GetEmployeeTransactionViewAsync(getTransactionModel);

            var payrollTransactionId = transactionResponse.TransactionDetails.Select(_ => _.TransactionKey).First().ToString();

            if(payrollTransactionId == null)
            {
                throw new Exception("Payroll Transaction Id is null"); 
                return null;
            }
                
            else
                return payrollTransactionId;
        }

        public static async Task SaveEmployee(HttpClient httpClient, string companyId)
        {
            var program = new Program();
            var employeeModel = program.EmployeeConfiguration();
            employeeModel.CompanyId = int.Parse(companyId);

            var employeeInterface = RestService.For<IEmployee>(httpClient);
            var saveEmployeeResponse = await employeeInterface.SaveEmployeeAsync(employeeModel);

            var parsedResponse = JObject.Parse(saveEmployeeResponse.ToString());
            employeeId = parsedResponse["employee"]["id"].ToString();
            Console.WriteLine("Employee created with id: " + employeeId);
        }

        public PayrollEmployeeViewModel EmployeeConfiguration()
        {
            var faker = new Faker();
            employeeViewModel = new PayrollEmployeeViewModel
            {
                Id = 0,
                CompanyId = 0,
                ModeOfHours = 1,
                FirstName = faker.Name.FirstName(),
                LastName = faker.Name.LastName(),
                MiddleName = "A",
                EmployeeNumber = null,
                UniquePersonalIdentification = faker.Person.Ssn(),
                VestingPercentage = 0,
                Gender = faker.PickRandom(new[] { "M", "F" }),
                MaritalStatus = faker.PickRandom(new[] { "S", "M", "D", "W" }),
                FamilyStatus = "",
                PermanentId = 0,
                BirthDate = faker.Date.Past(30, DateTime.Today.AddYears(-18)).ToUniversalTime(),
                Address = faker.Address.StreetAddress(),
                Address1 = faker.Address.SecondaryAddress(),
                Address2 = null,
                Address3 = null,
                Country = "USA",
                CountryId = 1,
                State = "AL",
                StateId = 1,
                City = faker.Address.City(),
                ZipCode = faker.Random.Replace("#####-####"),
                MobilePhoneNumber = faker.Random.Replace("9##-###-####"),
                WorkPhoneNumber = null,
                Fax = null,
                PrimaryEmailAddress = faker.Internet.Email(),
                AlternativeEmailAddress = null,
                ForeignState = null,
                ForeignCountry = null,
                HireDate = faker.Date.Past(10).ToUniversalTime(),
                ReHireDate = null,
                TerminationDate = null,
                LeaveStartDate = null,
                LeaveEndDate = null,
                PayPeriodHours = null,
                YtdHours = null,
                TempAmt = null,
                FileUploadId = null,
                UploadedThrough = null,
                PayDate = null,
                EmploymentStatusId = null,
                EmploymentStatus = "Active",
                EmploymentSchedule = null,
                PayrollFrequency = "Daily",
                PayrollFrequencyId = null,
                ConfirmationNumber = null,
                EntryMode = null,
                AnnualSalary = null,
                RkPlanNumber = null,
                ImageURL = null,
                HceIndicator = null,
                IsSponsor = false,
                HceIndicatorReason = null,
                PendingQDROIndicator = false,
                OfficerIndicator = false,
                FamilyMemberOfOwnerIndicator = false,
                RelationUniquePersonalIdentification = null,
                OwnerShip = null,
                Relationship = null,
                SsnOfOwner = null,
                InsiderOrRestrictedEmployeeIndicator = false,
                KeyEmployeeIndicator = false,
                ReturnMailIndicator = false,
                TotalContributionAmount = null,
                UnionEmployeeIndicator = false,
                LeasedOrContractedEmployeeIndicator = false,
                PartTimeEmployeeIndicator = false,
                NonResidentAlienIndicator = false,
                TotalLoanRePayAmount = null,
                ErrorMessages = null,
                HoursDetails = null,
                EmployeeClassifications = new List<PayrollEmployeeClassificationViewModel>
                {
                    new PayrollEmployeeClassificationViewModel
                    {
                       Id = 0,
                       ClassificationTypeName = "Location",
                       Code = "L1",
                       ClassificationTypeId = 0,
                       ClassificationId = 0,
                       EffectiveStartDate = DateTimeOffset.Now,
                       EffectiveEndDate = null,
                       ClassificationName = "Location",
                       IsMandatory = false,
                       DisplayOrder = 0,
                       IsCodeExist = false,
                       IsEndDateCalculated = false,
                       PmtTypeWiseClassificationHistoryId = 0,
                       EmployeeClassificationHistory = null,
                       PayDate = null
                    }
                },
                PayrollLoans = new List<PayrollLoanViewModel>(),
                Contributions = new List<ContributionViewModel>(),
                CompensationCategories = new List<EmployeeCompensationCategoryViewModel>(),
                Compensations = new List<PayrollCompensationViewModel>(),
                EmployeePlanLevelCompensationCategories = new List<PlanCompensationViewModel>(),
                RehireDetails = new List<RehireDetailViewModel>()
                {
                    new RehireDetailViewModel
                    {
                        Id = 0,
                        EmployeeRehireId = 0,
                        RehireDate = null,
                        RehireInd = false,
                        TerminationDate = null
                    }
                },
                EmployeeYOSs = new List<EmployeeYOSTestViewModel>(),
                DeletedContributionIds = new List<int>(),
                DeletedLoanIds = new List<int>(),
                AcceptedErrorIds = new List<int>(),
                AdditionalAddress = null,
                AcceptWarning = false,
                BankAccountNumber = faker.Finance.Account(12),
                BankAccountName = faker.Person.FirstName,
                RoutingNumber = faker.Finance.RoutingNumber(),
                BankAccountType = 1,
                AccountHolderName = faker.Name.FullName()
            };

            return employeeViewModel;
        }

        public BeneficiaryInformation BeneficiaryConfiguration()
        {
            var faker = new Faker();
            var beneficiaryInformation = new BeneficiaryInformation
            {
                Id = 0,
                BeneficiaryName = faker.Name.FullName(),
                BeneficiaryType = 1,
                RelationShipType = 1,
                TrustName = null,
                EstateName = null,
                EntityName = null,
                StateAgency = null,
                TrusteeName = null,
                ExecutorName = null,
                RepresentativeName = null,
                Ein = faker.Random.Replace("##-#######"),
                Tin = faker.Random.Replace("##-#######"),
                PhoneNumber = faker.Phone.PhoneNumber("9##-###-####"),
                EmailId = faker.Internet.Email(),
                DateOfBirth = faker.Date.Past(30, DateTime.Today.AddYears(-18)).ToUniversalTime(),
                Address1 = faker.Address.StreetAddress(),
                Address2 = faker.Address.SecondaryAddress(),
                Address3 = null,
                City = faker.Address.City(),
                CountryId = 1,
                StateId = 1,
                ZipCode = faker.Random.Replace("#####-####"),
                ForeignCountry = null,
                ForeignState = null,
                BankAccountNumber = faker.Finance.Account(12),
                BankAccountName = faker.Person.FirstName,
                RoutingNumber = faker.Finance.RoutingNumber(),
                BankAccountType = 1,
                AccountHolderName = faker.Person.FullName,
                EmployeeId = int.Parse(employeeId),
                UniquePersonalIdentification = faker.Person.Ssn()
            };

            return beneficiaryInformation;
        }

        public async Task AdjustmentConfigurations(string AdjustType, string IncidentCode)
        {
            //Handle Adjustment type and Incident code based on test case, for now going with default values

            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };

            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.Hooks.bearer!);
            var transactionConfiguration = new TransactionsConfigurations(this);
            var employeeId = await GetEmployeeId();
            var payrollTransactionId = await GetPayrollTransactionId();
            var adjustmentId = await transactionConfiguration.AdjustmentConfiguration(httpClient, Convert.ToInt32(planId), Convert.ToInt32(employeeId), planName, payrollTransactionId);
        }
    }
}
