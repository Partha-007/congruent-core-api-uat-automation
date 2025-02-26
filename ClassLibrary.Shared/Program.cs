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
using Fluid.Values;
using System.Collections;
using NUnit.Framework.Diagnostics;


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
        public static Dictionary<string, System.Reflection.PropertyInfo> jsonPropertyDictionaryTotal = new Dictionary<string, System.Reflection.PropertyInfo>();



        public static Dictionary<string, System.Reflection.PropertyInfo> GetJsonPropertyDictionary(object obj)
        {
            var jsonPropertyDictionary = new Dictionary<string, System.Reflection.PropertyInfo>();

            // If the object is null, return an empty dictionary
            if (obj == null)
                return jsonPropertyDictionary;

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
                                    var nestedProperties = GetJsonPropertyDictionary(item);

                                    // Add the nested properties to the main dictionary with a modified key
                                    foreach (var nestedProperty in nestedProperties)
                                    {
                                        // Prefix with collection property name to make it unique
                                        var nestedKey = $"{nestedProperty.Key}";
                                        jsonPropertyDictionary[nestedKey] = nestedProperty.Value;
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
                        var nestedProperties = GetJsonPropertyDictionary(nestedObject);

                        foreach (var nestedProperty in nestedProperties)
                        {
                            // Prepend the parent property name to the nested property name for uniqueness
                            var nestedKey = $"{nestedProperty.Key}";

                            // Add the nested property with the unique key to the original dictionary
                            jsonPropertyDictionary[nestedKey] = nestedProperty.Value;
                        }
                    }
                }
            }
            jsonPropertyDictionaryTotal = jsonPropertyDictionary;
            return jsonPropertyDictionary;
        }




        public void ConfigureWithTestDate(string ControlName, int length, Pattern pattern)
        {
            var value = GenerateTestData.RandomString(length, pattern);
            if(jsonPropertyDictionaryTotal.ContainsKey(ControlName))
            {
                var property = jsonPropertyDictionaryTotal[ControlName];
                property.SetValue(modelAfterConvention, value);
            }
        }
        public async Task Configuration(string ControlName, string Value)
        {
            if (jsonPropertyDictionaryTotal.ContainsKey(ControlName))
            {
                var property = jsonPropertyDictionaryTotal[ControlName];
                var ModelDeclaredType = modelAfterConvention.GetType().Name;
                var PropertyDeclaredType = property.DeclaringType.Name;
                var typeToSearch = System.Type.GetType($"MyNamespace.{PropertyDeclaredType}");
                if(ModelDeclaredType != PropertyDeclaredType)
                {
                    foreach(var item in modelAfterConvention.GetType().GetProperties())
                    {
                        if(item.PropertyType.IsGenericType && item.PropertyType.GetGenericTypeDefinition() == typeof(System.Collections.Generic.ICollection<>) && item.PropertyType.GetGenericArguments()[0] == typeToSearch)
                        {
                            Console.WriteLine($"Found matching property: {item.Name}");
                            var propertiesInModel = modelAfterConvention.GetType().GetProperty(item.Name);
                            var currentModel = propertiesInModel.GetValue(modelAfterConvention);

                            //var itemType = property.PropertyType.GetGenericArguments()[0];
                            //var collection = currentModel as ICollection<PlanCompensationCategoryViewModel>;
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
                                    else if(property != null)
                                    {
                                        property.SetValue(collectionItem, Convert.ChangeType(Value, property.PropertyType));
                                    }
                                    else
                                    {
                                        Console.WriteLine($"Property {property.Name} not found or is read-only.");
                                    }
                                }
                                //UpdateProperty(collection, property.Name, Value);
                            }
                            catch (Exception ex)
                            {

                            }
                            
                            
                        }
                        else if(item.PropertyType.Name == PropertyDeclaredType)
                        {
                            var propertiesInModel = modelAfterConvention.GetType().GetProperty(item.Name);
                            var currentModel = propertiesInModel.GetValue(modelAfterConvention);
                            try
                            {
                                if(Nullable.GetUnderlyingType(property.PropertyType) != null)
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
                                var message = ex.Message; Console.WriteLine(message);
                            }
                        }
                        
                    }
                    
                }

                /*foreach(var item in modelAfterConvention.GetType().GetProperties())
                {
                    Console.WriteLine(item.Name);
                }
                //var propertyIdentified = property.GetValue(modelAfterConvention);
                var className = property.DeclaringType.Name;
                var propertiesInModel = modelAfterConvention.GetType().GetProperty("EmployeeDeferralSource");
                var propType = propertiesInModel.PropertyType;
                var declared = propType.GetMember(property.Name);
                var currentModel = propertiesInModel.GetValue(modelAfterConvention);
                try
                {
                    var propertyType = property.PropertyType;
                    var convertedValue = Convert.ChangeType(Value,propertyType);
                    property.SetValue(currentModel, convertedValue);
                }
                catch(Exception ex)
                {
                    var message = ex.Message; Console.WriteLine(message);
                }
                
                var test = new EmployeeDeferralSourceViewModel();
                var test2 = new SourceViewModel();
                
                //propToSet.SetValue(modelAfterConvention, Value);
                var assume = modelAfterConvention.GetType().GetProperty("EmployeeDeferralSource");
                *//*if(assume.GetType().IsClass)
                {
                    try
                    {
                        var check = assume.GetType();
                        var instance = Activator.CreateInstance(assume.GetType());
                        instance.GetType().GetProperty(property.Name);
                    }
                    catch(Exception ex)
                    {
                        var message = ex.Message;
                    }
                    
                }
                try
                {
                    var propertyType = property.PropertyType;
                    var convertedValue = Convert.ChangeType(Value, propertyType);
                    property.SetValue(test, convertedValue);
                }
                catch(Exception ex)
                {
                    Console.WriteLine(ex.Message);
                }
                foreach ( var properties in propertiesInModel)
                {
                    Console.WriteLine(properties.Name);
                }*/

                // Check if the property is nullable
                else if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                {
                    if (Value == null)
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
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.{interfaceName}");
            var companyresponse = await SendAPIRequest(_hooks.bearer, modelAfterConvention, interfaceType, methodName);
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

            // Dynamically search for the method in the interface
            var methodToSearch = interfaceType.GetMethod(methodName);
            if (methodToSearch != null)
            {
                try
                {
                    object responseObject;

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
                        var requestBody = JsonConvert.SerializeObject(model);
                        Console.WriteLine(requestBody.ToString());
                        // Call method dynamically based on the passed model
                        responseObject = await (Task<object>)methodToSearch.Invoke(apiClient, new object[] { model });
                    }
                    else
                    {
                        throw new InvalidOperationException("The method signature does not match the expected parameters.");
                    }

                    Console.WriteLine("Response: " + responseObject?.ToString());
                    JObject response = JObject.Parse(responseObject?.ToString());

                    Console.Write(response.ToString());
                    return response;
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

        

        public static string companyPlanCompensationId;
        public static string companyGrossCompensationId;
        public static async Task<string> SaveCompany(string bearer)
        {
            var program = new Program();
            var companyModel = new CompanyViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(companyModel);
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.ICompanyDetails");
            var companyresponse = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "CreateNewCompanyAsync");
            var companyId = companyresponse["company"]["id"].ToString();
            companyGrossCompensationId = companyresponse["company"]["compensationCategories"][0]["id"].ToString();
            companyPlanCompensationId = companyresponse["company"]["compensationCategories"][1]["id"].ToString();

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
            var listOfProperties = GetJsonPropertyDictionary(modelAfterConvention);
            program.Configuration("exclusionType", "0"); 
            program.Configuration("isLTPTApplicable", "false");
            //program.Configuration("ltptExclusionFromRule", null);
            program.Configuration("isRevaluationRequired", "false");
            program.Configuration("isBreakInService", "false");
            program.Configuration("eligibilityType", null);
            program.Configuration("planId", "1695");
            
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var eligibilitySave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SavePlanAmendmentEligibleRule");
        }

        public static async Task SaveEntryDate(string bearer, string planId)
        {
            var program = new Program();
            var entryDateModel = new EntryDateRuleViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(entryDateModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyDictionary(modelAfterConvention);
            program.Configuration("ruleName", "Immediate");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var eligibilitySave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveEntryDate");
        }

        public static async Task SaveSource(string bearer, string planId)
        {
            var program = new Program();
            var sourceModel = new SourceViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(sourceModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var listOfProperties = GetJsonPropertyDictionary(modelAfterConvention);
            program.Configuration("sourceType", "1");
            program.Configuration("sourceCategory", "2");
            program.Configuration("sourceSubCategory", "4");
            program.Configuration("sourceSubSubCategory", "1");
            program.Configuration("effectiveStartDate", "2025-02-01T00:00:00Z");
            program.Configuration("sourceName", "Pretax");
            program.Configuration("contributionType", "1");
            //program.Configuration("limitMinimumDollar", "10");
            //program.Configuration("EmployeeDeferralSource.contributionType", "7");
            System.Type interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var sourceSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveSource");
        }

        public static async Task SaveCompensation(string bearer, string planId)
        {
            var program = new Program();
            var compensationModel = new CompensationViewModel();
            modelAfterConvention = FakeDataHelper.PopulateModelWithFakeData(compensationModel);
            modelAfterConvention = FakeDataHelper.AssignId(planId.ToString(), "PlanId", modelAfterConvention);
            var list = GetJsonPropertyDictionary(modelAfterConvention);
            program.Configuration("compensationCategoryId", "2519");
            program.Configuration("isIncluded", "true");
            program.Configuration("calculationType", "1");
            var interfaceType = System.Type.GetType($"RefitSandBox.IPlanDetailsSave");
            var compSave = await program.SendAPIRequest(bearer, modelAfterConvention, interfaceType, "SaveCompensation");
        }
    }
}
