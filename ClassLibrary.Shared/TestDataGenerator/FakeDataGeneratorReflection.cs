using Bogus;
using MyNamespace;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using CsvHelper;
using System.Globalization;
using Bogus.Extensions.UnitedStates;
using YamlDotNet.Core.Tokens;

namespace RefitSandBox.TestDataGenerator
{
    public class FakeDataHelper
    {
        public static object PopulateModelWithFakeData(object obj)
        {
            var faker = new Faker();
            var properties = obj.GetType().GetProperties();

            foreach (var property in properties)
            {
                // Get the type and name of the property
                var propertyType = property.PropertyType;
                var propertyName = property.Name;

                if (propertyName.Equals("SourceCompensations", StringComparison.OrdinalIgnoreCase) || propertyName.Equals("PostSeveranceCompensationCategories", StringComparison.OrdinalIgnoreCase))
                {
                    if (propertyType.IsArray)
                    {
                        // If it's an array type, assign an empty array
                        property.SetValue(obj, Array.CreateInstance(propertyType.GetElementType(), 0));
                    }
                    else if (propertyType.IsGenericType && propertyType.GetGenericTypeDefinition() == typeof(ICollection<>))
                    {
                        // If it's a collection type (ICollection<T>), assign an empty list
                        var itemType = propertyType.GetGenericArguments()[0]; // Get the item type T
                        var listType = typeof(List<>).MakeGenericType(itemType); // Create List<T> type
                        var collectionInstance = Activator.CreateInstance(listType); // Instantiate the List<T>
                        property.SetValue(obj, collectionInstance);  // Set the empty collection
                    }
                    continue; // Skip further processing for this property
                }
                if (propertyType.IsGenericType && propertyType.GetGenericTypeDefinition() == typeof(ICollection<>) && propertyName == "PlanCompensationCategories")
                {
                    // Handle ICollection<T> types
                    var itemType = propertyType.GetGenericArguments()[0]; // Get the item type T
                    var listType = typeof(List<>).MakeGenericType(itemType); // Create List<T> type
                    var collectionInstance = Activator.CreateInstance(listType); // Instantiate the List<T>

                    // Create and add a random number of items to the collection
                    var addMethod = listType.GetMethod("Add");
                    var itemInstance = Activator.CreateInstance(itemType); // Create an instance of the item type
                    PopulateModelWithFakeData(itemInstance);  // Recursively populate nested model
                    addMethod.Invoke(collectionInstance, new[] { itemInstance }); // Add the item to the collection
                    
                    property.SetValue(obj, collectionInstance);  // Set the populated collection to the property
                }
                else
                {
                    // Handle other property types as in the original code
                    property.SetValue(obj,
                        StringComparer.OrdinalIgnoreCase.Equals(propertyName, "Id") || StringComparer.OrdinalIgnoreCase.Equals(propertyName, "PlanAmendmentId") ? null :
                        StringComparer.OrdinalIgnoreCase.Equals(propertyName, "tenantid") ? 1 :
                        propertyName.Contains("SSN", StringComparison.OrdinalIgnoreCase) ? faker.Phone.PhoneNumber("###-##-####") :
                        propertyName.Contains("FirstName", StringComparison.OrdinalIgnoreCase) || propertyName.Contains("LastName", StringComparison.OrdinalIgnoreCase) ? faker.Name.FirstName() :
                        propertyType == typeof(string) && propertyName.Contains("Name", StringComparison.OrdinalIgnoreCase) ? faker.Company.CompanyName() :
                        propertyType == typeof(string) && propertyName.Contains("Email", StringComparison.OrdinalIgnoreCase) ? faker.Person.Email :
                        propertyType == typeof(string) && propertyName.Contains("PhoneNumber", StringComparison.OrdinalIgnoreCase) ? faker.Phone.PhoneNumber("###-###-####") :
                        propertyType == typeof(string) && propertyName.Contains("Zipcode", StringComparison.OrdinalIgnoreCase) || propertyName.Contains("PostalCode", StringComparison.OrdinalIgnoreCase) ? faker.Address.ZipCode("#####") :
                        propertyName == "SicCode" ? faker.Random.Number(1000, 9999).ToString() :
                        propertyName == "BusinessCode" ? faker.Random.Number(100000, 999999).ToString() :
                        propertyName == "TaxEIN" ? faker.Phone.PhoneNumber("##-#######") :
                        propertyName == "BusinessType" ? 1 :
                        propertyName.Contains("Address", StringComparison.OrdinalIgnoreCase) ? faker.Address.StreetAddress() :
                        propertyName.Contains("State") ? GetRandomStateCode() :
                        propertyName.Contains("City", StringComparison.OrdinalIgnoreCase) ? faker.Address.City() :
                        propertyName.Contains("Country", StringComparison.OrdinalIgnoreCase) ? "USA" :
                        propertyName.Equals("Website", StringComparison.OrdinalIgnoreCase) ? faker.Internet.DomainName() :
                        propertyName.Contains("day", StringComparison.OrdinalIgnoreCase) ? faker.Random.Number(1, 28) :
                        propertyName.Equals("month", StringComparison.OrdinalIgnoreCase) ? faker.Random.Number(1, 12) :
                        propertyName == "TrsContractId" || propertyName == "RkPlanNumber" ? faker.Random.AlphaNumeric(5).ToUpper() :
                        propertyName == "IrsPlanNumber" ? faker.Random.Number(3, 3).ToString() :
                        propertyName == "LetterSerialNumber" || propertyName.Contains("CustomData", StringComparison.OrdinalIgnoreCase) || propertyName == "MepPlanId" || propertyName == "Level" || propertyName == "Prototype" || propertyName == "PlanTerminationDate" || propertyName.Contains("Enddate", StringComparison.OrdinalIgnoreCase) || propertyName == "PostSeveranceCompensationCategories" || propertyName == "EmployeeClasificationCategories" ? null :
                        propertyName == "PensionBenefitCode" || propertyName == "WelfareBenefitCode" ? faker.Random.Number(1, 2).ToString() :
                        propertyName.Contains("CompanyName", StringComparison.OrdinalIgnoreCase) ? null :
                        propertyName == "PlanStatus" ? 0 :
                        propertyName == "PlanType" || propertyName == "EligibilityRuleFor" || propertyName == "EntryDateRuleFor" || propertyName == "ContributionType" ? 1 :
                        propertyName == "Category" ? 0 :
                        propertyName == "ImmediateEligibility" ? true :
                        propertyName == "EntryDateRule" ? 6 :
                        propertyName.Contains("Minimum", StringComparison.OrdinalIgnoreCase) ? 10 :
                        propertyType == typeof(string) ? faker.Lorem.Word() :
                        propertyType == typeof(int?) ? (object)faker.Random.Int(1, 100) : // For nullable int
                        propertyType == typeof(int) ? faker.Random.Int(1, 100) : // For non-nullable int
                        propertyType == typeof(double?) ? (object)faker.Random.Double(1, 100) : // For nullable int
                        propertyType == typeof(double) ? faker.Random.Double(1, 100) : // For non-nullable int
                        propertyType == typeof(DateTime?) ? (object)faker.Date.Past().ToUniversalTime() : // For nullable DateTime
                        propertyType == typeof(DateTime) && propertyName.Contains("Date") ? faker.Date.Past().ToUniversalTime() : // For non-nullable DateTime
                        propertyType == typeof(DateTimeOffset?) ? (object)new DateTimeOffset(faker.Date.Past()) : // For nullable DateTimeOffset
                        propertyType == typeof(DateTimeOffset) ? new DateTimeOffset(faker.Date.Past()) : // For non-nullable DateTimeOffset
                        propertyType == typeof(bool?) ? false : // For nullable bool
                        propertyType == typeof(bool) ? false :
                        // For non-nullable bool
                        property.GetValue(obj) // Fallback for any unmatched type
                        );

                    if (propertyType.IsClass && propertyType != typeof(string))
                    {
                        try
                        {
                            var nestedObject = Activator.CreateInstance(propertyType);
                            PopulateModelWithFakeData(nestedObject);
                            property.SetValue(obj, nestedObject);
                        }
                        catch (Exception ex)
                        {
                            Console.WriteLine("Exception :" + ex.Message);
                        }
                    }

                    if (propertyType.IsEnum)
                    {
                        var listOfEnumValues = Enum.GetValues(propertyType);
                        var randomValueFromEnumList = listOfEnumValues.GetValue(new Random().Next(listOfEnumValues.Length));
                        property.SetValue(obj, randomValueFromEnumList);
                    }
                    else
                    {
                        Console.WriteLine($"No generator for type {propertyName}");
                    }
                }
            }
            return obj;
        }


        public static string GetRandomStateCode()
        {
            string stateCode;
            List<string> listOfStateCodes = new List<string>
            {
                "AL", "AK", "AS", "AZ", "AR", "CA", "CO", "CT", "DE", "DC",
                "FM", "FL", "GA", "GU", "HI", "ID", "IL", "IN", "IA", "KS",
                "KY", "LA", "ME", "MH", "MD", "MA", "MI", "MN", "MS", "MO",
                "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "MP",
                "OH", "OK", "OR", "PW", "PA", "PR", "RI", "SC", "SD", "TN",
                "TX", "UT", "VT", "VI", "VA", "WA", "WV", "WI", "WY"
            };

            Random rand = new Random();
            int randomIndex = rand.Next(listOfStateCodes.Count);
            return listOfStateCodes[randomIndex].ToString();
        }

        public static object AssignId(string id, string propertyName, object obj)
        {
            var properties = obj.GetType().GetProperties();
            foreach (var property in properties)
            {
                if (property.Name == propertyName)
                {
                    if (Nullable.GetUnderlyingType(property.PropertyType) != null)
                    {
                        var underlyingType = Nullable.GetUnderlyingType(property.PropertyType);
                        var convertedValue = Convert.ChangeType(id, underlyingType);
                        property.SetValue(obj, convertedValue);
                    }
                    else if(property.PropertyType == typeof(ICollection<int>))
                    {
                        var convertedValue = new List<int> { Convert.ToInt32(id) };
                        property.SetValue(obj, convertedValue);
                    }
                    else
                    {
                        var propertyType = property.PropertyType;
                        var convertedValue = Convert.ChangeType(id, propertyType);
                        property.SetValue(obj, convertedValue);
                    }
                }
                else if (propertyName.Contains("."))
                {
                    var nestedProperty = propertyName.Split(".");
                    var instance = obj.GetType().GetProperty(nestedProperty[0]);

                    if (instance != null)
                    {
                        // Get the value of the property from the object, or create a new instance if null
                        var nestedObject = instance.GetValue(obj);

                        if (nestedObject == null)
                        {
                            // Create the instance if the nested object is null
                            nestedObject = Activator.CreateInstance(instance.PropertyType);
                            instance.SetValue(obj, nestedObject);
                        }

                        // Recursively call AssignId for the next level of nested property
                        AssignId(id, nestedProperty[1], nestedObject);
                    }
                    else
                    {
                        // Handle case where the property is not found
                        throw new Exception($"Property '{nestedProperty[0]}' not found.");
                    }
                }

            }
            return obj;
        }
        public static List<CombinedTemplateModel> RuleSetForCombinedTemplate()
        {
            var data = new Faker<CombinedTemplateModel>()
                .RuleFor(x => x.EmployeeId, x => x.Random.Number(10000, 99999).ToString())
                    .RuleFor(x => x.Paydate, x => x.Date.Past(1).ToString("MM/dd/yyyy"))
                    .RuleFor(x => x.SSN, x => x.Person.Ssn())
                    .RuleFor(x => x.FirstName, x => x.Person.FirstName)
                    .RuleFor(x => x.LastName, x => x.Person.LastName)
                    .RuleFor(x => x.MiddleName, x => x.Random.String2(1, "ABCDEFGHIJKLMNOPQRSTUVWXY"))
                    .RuleFor(x => x.Gender, x => x.Random.String2(1, "MF"))
                    .RuleFor(x => x.MaritalStatus, x => x.Random.String2(1, "SMD"))
                    .RuleFor(x => x.BirthDate, x => x.Date.PastDateOnly().AddYears(-40).ToString("MM/dd/yyyy"))
                    .RuleFor(x => x.Address1, x => x.Address.BuildingNumber())
                    .RuleFor(x => x.Address2, x => x.Address.SecondaryAddress())
                    .RuleFor(x => x.Address3, x => x.Address.StreetName())
                    .RuleFor(x => x.City, x => x.Address.City())
                    .RuleFor(x => x.Country, x => "USA")
                    .RuleFor(x => x.State, x => "NY")
                    .RuleFor(x => x.Zipcode, x => x.Address.ZipCode("#####"))
                    .RuleFor(x => x.PrimaryPhoneNumber, x => "")
                    .RuleFor(x => x.SecondaryPhoneNumber, x => "")
                    .RuleFor(x => x.PrimaryEmailAddress, x => "")
                    .RuleFor(x => x.HireDate, x => x.Date.Past(10).ToString("MM/dd/yyyy"))
                    .RuleFor(x => x.TermDate, x => "")
                    .RuleFor(x => x.RehireDate, x => "")
                    .RuleFor(x => x.PayrollFrequency, x => "Monthly")
                    .RuleFor(x => x.HceIndicator, x => "N")
                    .RuleFor(x => x.EmployeeStatus, x => "A")
                    .RuleFor(x => x.LeaveStartDate, x => "")
                    .RuleFor(x => x.LeaveEndDate, x => "")
                    .RuleFor(x => x.Location, x => " ")
                    .RuleFor(x => x.LocationStartDate, x => " ")
                    .RuleFor(x => x.LocationEndDate, x => " ")
                    .RuleFor(x => x.AnnualSalary, x => "500")
                    .RuleFor(x => x.Hours, x => "100")
                    .RuleFor(x => x.GrossCompensation, x => x.Random.Number(100, 999).ToString())
                    .RuleFor(x => x.PlanCompensation, x => x.Random.Number(1000, 9999).ToString())
                    .RuleFor(x => x.SourceName, x => "10");

            return data.Generate(1);
        }
        public static void GetHeaders(string filename)
        {
            DisplayNameAttribute value;
            var values = RuleSetForCombinedTemplate();

            string projectDirectory = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
            string directoryPath = Path.Combine(projectDirectory, "Templates",filename);

            using (var writer = new StreamWriter(directoryPath, false))
            {
                using (CsvWriter csv = new CsvWriter(writer, CultureInfo.CurrentCulture))
                {
                    var Test = typeof(CombinedTemplateModel);
                    var propertyInfo = Test.GetProperties();
                    foreach(var property in propertyInfo)
                    {
                        value = property.GetCustomAttributes<DisplayNameAttribute>().FirstOrDefault();
                        csv.WriteField(value.DisplayName);
                    }
                    csv.NextRecord();
                    foreach(var item in values)
                    {
                        var itemProperty = item.GetType().GetProperties();
                        foreach (var property in itemProperty)
                        {
                            var valueToWrite = property.GetValue(item);
                            csv.WriteField(valueToWrite?.ToString()); 
                        }
                        csv.NextRecord();
                    }
                    
                }
            }
        }
    }
    
    public class CombinedTemplateModel
    {
        [DisplayName("EMPLOYEE ID")]
        public string EmployeeId { get; set; }

        [DisplayName("PAY DATE")]
        public string Paydate { get; set; }

        [DisplayName("SSN")]
        public string SSN { get; set; }

        [DisplayName("FIRST NAME")]
        public string FirstName { get; set; }

        [DisplayName("LAST NAME")]
        public string LastName { get; set; }

        [DisplayName("MIDDLE NAME")]
        public string MiddleName { get; set; }

        [DisplayName("GENDER")]
        public string Gender { get; set; }

        [DisplayName("MARITAL STATUS")]
        public string MaritalStatus { get; set; }

        [DisplayName("BIRTH DATE")]
        public string BirthDate { get; set; }

        [DisplayName("FOREIGN ADDRESS INDICATOR")]
        public string ForeignAddress { get; set; }

        [DisplayName("ADDRESS 1")]
        public string Address1 { get; set; }

        [DisplayName("ADDRESS 2")]
        public string Address2 { get; set; }

        [DisplayName("ADDRESS 3")]
        public string Address3 { get; set; }

        [DisplayName("CITY")]
        public string City { get; set; }

        [DisplayName("COUNTRY")]
        public string Country { get; set; }

        [DisplayName("STATE")]
        public string State { get; set; }

        [DisplayName("ZIPCODE")]
        public string Zipcode { get; set; }

        [DisplayName("PRIMARY PHONE NUMBER")]
        public string PrimaryPhoneNumber { get; set; }

        [DisplayName("SECONDARY PHONE NUMBER")]
        public string SecondaryPhoneNumber { get; set; }

        [DisplayName("PRIMARY EMAIL ADDRESS")]
        public string PrimaryEmailAddress { get; set; }

        [DisplayName("HIRE DATE")]
        public string HireDate { get; set; }

        [DisplayName("MOST RECENT TERM DATE")]
        public string TermDate { get; set; }

        [DisplayName("MOST RECENT REHIRE DATE")]
        public string RehireDate { get; set; }

        [DisplayName("PAYROLL FREQUENCY")]
        public string PayrollFrequency { get; set; }

        [DisplayName("HCE INDICATOR")]
        public string HceIndicator { get; set; }

        [DisplayName("EMPLOYMENT STATUS CODE")]
        public string EmployeeStatus { get; set; }

        [DisplayName("LEAVE START DATE")]
        public string LeaveStartDate { get; set; }

        [DisplayName("LEAVE END DATE")]
        public string LeaveEndDate { get; set; }

        [DisplayName("LOCATION")]
        public string Location { get; set; }

        [DisplayName("LOCATION EFFECTIVE START DATE")]
        public string LocationStartDate { get; set; }

        [DisplayName("LOCATION EFFECTIVE END DATE")]
        public string LocationEndDate { get; set; }

        [DisplayName("ANNUAL SALARY")]
        public string AnnualSalary { get; set; }

        [DisplayName("HOURS")]
        public string Hours { get; set; }

        [DisplayName("GROSS COMPENSATION")]
        public string GrossCompensation { get; set; }

        [DisplayName("PLAN COMPENSATION")]
        public string PlanCompensation { get; set; }

        [DisplayName("PP123_PRETAX")]
        public string SourceName { get; set; }
        //public List<Contributions> contributions { get; set; }
    }

    public class Contributions
    {
        public string Name { get; set; }
    }
    

    

}
