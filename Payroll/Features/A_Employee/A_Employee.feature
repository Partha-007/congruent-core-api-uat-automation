Feature: A_Employee
[BeforeTestRun]
[PlanActivation]

#Scenario: 20346 To verify the Marital Status Dropdown is not selected in Create Mode of Employee Information Page
#Scenario: 20252 Employee first Name field space validation 
#Scenario: 20267 Employee last Name field space validation 
Scenario: 20392 To verify the Address 1 field  value name with Null  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
 When Configuration has been made as per following
| key                  | value                |
| companyId            | <CompanyId>          |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                      |
| address1                     |                            |
| additionalCity               |                            |
| additionalCountry            |                            |
| additionalCountryId          |                            |
| additionalAddressOne         |                            |
| additionalState              |                            |
| additionalStateId            |                            |
| additionalZipcode            |                            |
| additionalAddressName        | random 51 alphabets        |
| additionalForeignState       | random 36 alphabets        |
| companyId                    |                            |
| country                      |                            |
| additionalAddressOne         | random 151 alphabets       |
| additionalAddressTwo         | random 36 alphabets        |
| additionalAddressThree       | random 36 alphabets        |
| accountHolderName            |                            |
| bankAccountName              |                            |
| bankAccountNumber            |                            |
| bankAccountType              |                            |
| birthDate                    |                            |
| employmentStatus             | Active                     |
| city                         |                            |
| state                        |                            |
| stateId                      |                            |
| primaryEmailAddress          |                        123 |
| mobilePhoneNumber            | abc                        |
| workPhoneNumber              | abc-xed-fiko               |
| employeeNumber               | random 3 specialCharacters |
| firstName                    |                            |
| uniquePersonalIdentification |                            |
| gender                       | Z                          |
| lastName                     |                            |
| maritalStatus                |                            |
| middleName                   |                        222 |
| routingNumber                |                            |
When The date property "hireDate" is configured as "days" and should add "31" days to the current date
When The date property "terminationDate" is configured as "days" and should add "31" days to the current date
When The date property "reHireDate" is configured as "days" and should add "31" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 32 following errors 
	| error_code | error_message                                                                                   |
	| EM017      | Required                                                                                        |
	| EM140      | Required                                                                                        | Scenario: To verify the Additional Address City field Mandatory validation in Create Mode of Employee Information Page
	| EM163      | Required                                                                                        | Scenario: To verify the Additional Address Country field Mandatory validation in Create Mode of Employee Information Page
	| EM155      | Required                                                                                        | Scenario: To verify the Additional Address 1 field Mandatory validation in Create Mode of Employee Information Page
	| EM163      | Required                                                                                        | Scenario: To verify the Additional State field Mandatory validation in Create Mode of Employee Information Page
	| EM150      | Required                                                                                        | Scenario: To verify the Additional Zipcode field Mandatory validation in Create Mode of Employee Information Page
	| EM154      | Address name should be less than 50 characters                                                  | Scenario: To verify the Additional Address Name field  value length validation in Create Mode of Employee Information Page
	| EM149      | State name should not exceed 35 characters.                                                     | Scenario: To verify the Additional State Name field  value length validation in Create Mode of Employee Information Page
	| EM022      | Required                                                                                        | Scenario: To verify the Company field  value length validation in Create Mode of Employee Information Page
	| EM163      | Required                                                                                        | Scenario: To verify the Country field  value length validation in Create Mode of Employee Information Page
	| EM137      | Address 1 should not exceed 150 characters.                                                     | Scenario: To verify the Additional Address 1 field  value length validation in Create Mode of Employee Information Page
	| EM138      | Address 2 should not exceed 35 characters.                                                      | Scenario: To verify the Additional Address 2 field  value length validation in Create Mode of Employee Information Page
	| EM139      | Address 3 should not exceed 35 characters.                                                      | Scenario: To verify the Additional Address 3 field value length validation in Create Mode of Employee Information Page
	| EM217      | Required.                                                                                       | Scenario: 110170 To verify the bankAccountHolderName field  value name with Null  in Create Mode of Employee Information Page
	| EM215      | Required.                                                                                       | Scenario:To verify the bankAccountName field  value name with Null  in Create Mode of Employee Information Page
	| EM189      | Required.                                                                                       | Scenario:To verify the bankAccountNumber field  value name with Null  in Create Mode of Employee Information Page
	| EM191      | Required.                                                                                       | Scenario:To verify the bankaccounttype field with savingsaccount is Null  in Create Mode of Employee Information Page
	| EM015      | Required                                                                                        | Scenario: 20620 To verify the Birth Date  value as Null Create Mode of Employee Information Page
	| EM054      | Hire Date cannot be more than 30 days in future.                                                | Scenario: 20634 To verify the HIre Date  value with valid date format of Current date + 30 date MM/DD/YYYY in Create Mode of Employee Information Page
	| EM104      | Required                                                                                        | Scenario: 20425 To verify the city field  value name with Null  in Create Mode of Employee Information Page
	| EM020      | Required                                                                                        | Scenario: 20456 To verify the validation message State Dropdown is not selected in Create Mode of Employee Information Page
	| EM040      | Email ID is invalid.                                                                            | Scenario: 20357 To verify the Email field  value with only Numerics in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number   | Scenario: 20370 To verify the  Phone Number  value with lower case in Create Mode of Employee Information Page
	| EM038      | Secondary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 150474 Verify the data type of "Secondary Phone Number" field --> "Employee Information Page" --> Existing Employee --> Employee Tab
	| EM042      | Employee ID should be alphanumeric.                                                             | Scenario: 20320 To verify the Employee ID column value with only Special Characters in Create Mode of Employee Information Page
	| EM016      | Required                                                                                        | Scenario: 20284 Employee SSN field null validation
	| EM013      | Required                                                                                        | Scenario: 20246 Employee first Name field null validation
	| EM032      | Gender is not valid                                                                             | Scenario:(Tc0113) To verify the gender column value with invalid data in Create Mode of Employee Information Page
	| EM014      | Required                                                                                        | Scenario: 20261 Employee last Name field null validation
	| EM248      | Required.                                                                                       | Scenario:(Tc0119) To verify the Marital status  with null value  in Create Mode of Employee Information Page
	| EM028      | Middle Initial should have letter only.                                                         | Scenario: 20280 Employee middle Name field validation numerics
	| EM211      | Required.                                                                                       | Scenario:To verify the routingNumber field  value name with Null  in Create Mode of Employee Information Page

#Scenario: 20444 To verify the Foreign Country field  value name with Null when Country as Other in Create Mode of Employee Information Page
Scenario: To verify the Additional ZipCode field  value length validation in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                                      |
| additionalZipcode            | random 37 numerics                         |
| country                      | Others                                     |
| countryId                    |                                          2 |
| foreignCountry               |                                            |
| additionalCity               | random 36 alphabets                        |
| accountHolderName            | random 10 numerics                         |
| bankAccountName              | random 51 alphabets                        |
| bankAccountNumber            | random 10 alphabets                        |
| city                         | random 10 numerics                         |
| foreignState                 |                                            |
| primaryEmailAddress          | !@#                                        |
| mobilePhoneNumber            | ABC                                        |
| workPhoneNumber              |                                         90 |
| employeeNumber               | random 7 alphaNumericWithSpecialCharacters |
| firstName                    | random 10 numerics                         |
| lastName                     | random 10 numerics                         |
| uniquePersonalIdentification | random 5 numerics                          |
| maritalStatus                | Y                                          |
| middleName                   | random 1 specialCharacters                 |
| routingNumber                | random 9 alphabets                         |
| zipCode                      |                                            |
| employmentStatus             | Active                                     |
When The date property "birthDate" is configured as "days" and should add "0" days to the current date
When The date property "hireDate" is configured as "null" and should add "0" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 21 following errors 
	| error_code | error_message                                                                                   |
	| EM152      | ZIP Code should not exceed 36 characters.                                                       |
	| EM021      | Required                                                                                        | Scenario: To verify the Foreign Country field value length validation in Create Mode of Employee Information Page
	| EM142      | City name should not exceed 35 characters.                                                      | Scenario: To verify the Additional City field  value length validation in Create Mode of Employee Information Page
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only.                                   | Scenario: 110172 To verify the bankAccountHolderName field with numerics of below 10  in Create Mode of Employee Information Page
	| EM188      | Bank Name should not exceed 50 characters.                                                      | Scenario:To verify the bankAccountName field with alphabets of above 50  in Create Mode of Employee Information Page
	| EM258      | Bank account number must contain only numeric digits (0–9)                                      | Scenario:To verify Bank account number field in data type acceptance of only alphabets - Create mode
	| EM053      | Date of Birth must be prior to the current date.                                                | Scenario: 20622 To verify the Birth Date  value with valid date format of Current date MM/DD/YYYY in Create Mode of Employee Information Page
	| EM035      | City name should have spaces, dot, hyphen, (‘) and letters only.                                | Scenario: 20429 To verify the city field  value with only Numerics in Create Mode of Employee Information Page
	| EM020      | Required                                                                                        | Scenario: To verify the Foreign State field  value name with Null when Country as Other in Create Mode of Employee Information Page
	| EM040      | Email ID is invalid.                                                                            | Scenario: 20358 To verify the Email field  value with only Special Characters in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number   | Scenario: 20371 To verify the  Phone Number  value with Upper case in Create Mode of Employee Information Page
	| EM038      | Secondary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 150470 Verify whether validation is triggered if "Secondary Phone Number" field is not in the proper format --> "Employee Information Page"--> New Employee --> Employee Tab
	| EM042      | Employee ID should be alphanumeric.                                                             | Scenario: 20322 To verify the Employee ID column value with Alphanumerics & Special characters in Create Mode of Employee Information Page
	| EM103      | SSN is invalid. Accepted format is xxxxxxxxx or xxx-xx-xxxx, x being a number.                  | Scenario: 20287 Employee SSN field less than 9 numerics validation
	| EM026      | First Name should have spaces, hyphen, (') and letters only.                                    | Scenario: 20250 Employee first Name field  validation numerics
	| EM030      | Last Name should have spaces, dot, hyphen, (‘), (,) and letters only.                           | Scenario: 20265 Employee last Name field  validation numerics
	| EM033      | Invalid Marital Status.                                                                         | Scenario:(Tc0128) To verify the Marital status value with invalid data in Create Mode of Employee Information Page
	| EM028      | Middle Initial should have letter only.                                                         | Scenario: 20281 Employee middle Name field validation special charecters
	| EM259      | Routing number must contain only numeric digits (0–9).                                          | Scenario:To verify Routing number field in data type acceptance of only alphabets - Create mode
	| EM019      | Required                                                                                        | Scenario: 20489 To verify the Foreign Zipcode  value name with Null when Country as Other in Create Mode of Employee Information Page
	| EM023      | Required                                                                                        |Scenario:(Tc395)To verify the Hire Date  value as Null Create Mode of Employee Information Page



Scenario: To verify the Additional ZipCode field  value format validation in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                       |
| additionalZipcode            |                         123 |
| additionalCity               | random 10 specialCharacters |
| additionalForeignCountry     | random 31 alphabets         |
| address1                     | random 151 alphabets        |
| address2                     | random 36 alphabets         |
| address3                     | random 40 alphabets         |
| accountHolderName            | random 10 SpecialCharacters |
| bankAccountName              | random 10 numerics          |
| bankAccountNumber            | random 10 SpecialCharacters |
| city                         | random 10 SpecialCharacters |
| country                      | Others                      |
| countryId                    |                           2 |
| foreignCountry               | random 100 alphabets        |
| foreignState                 | random 40 alphabets         |
| primaryEmailAddress          | 123!@#                      |
| mobilePhoneNumber            | ABc                         |
| firstName                    | random 10 alphabets         |
| uniquePersonalIdentification | random 9 alphabets          |
| middleName                   | a1                          |
| routingNumber                | random 9 SpecialCharacters  |
| zipCode                      | random 100 numerics         |
| employmentStatus             | Active                      |
When The date property "hireDate" is configured as "days" and should add "31" days to the current date
When The date property "birthDate" is configured as "days" and should add "1" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 20 following errors 
	| error_code | error_message                                                                                 |
	| EM153      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number            |
	| EM143      | City name should have spaces, dot, hyphen, (‘) and letters only.                              | Scenario: To verify the Additional City field  value Character acceptance in Create Mode of Employee Information Page
	| EM146      | Country name should not exceed 30 characters.                                                 | Scenario: To verify the Additional Country field  value Character acceptance in Create Mode of Employee Information Page
	| EM048      | Address 1 should not exceed 150 characters.                                                   | Scenario: 20402 To verify the Address 1 field  value with above 150 characters in Create Mode of Employee Information Page
	| EM049      | Address 2 should not exceed 35 characters.                                                    | Scenario: 20413 To verify the Address 2 field  value with above 35 characters in Create Mode of Employee Information Page
	| EM050      | Address 3 should not exceed 35 characters.                                                    | Scenario: 20424 To verify the Address 3 field  value with above 35 characters in Create Mode of Employee Information Page
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only                                  | Scenario: 110173 To verify the bankAccountHolderName field with special characrets of below 10  in Create Mode of Employee Information Page
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                                           | Scenario:To verify the bankAccountName field with numerics of  10  in Create Mode of Employee Information Page
	| EM258      | Bank account number must contain only numeric digits (0–9)                                    | Scenario:To verify Bank account number field in data type acceptance of only special characters - Create mode
	| EM053      | Date of Birth must be prior to the current date.                                              | Scenario: 20623 To verify the Birth Date  value with valid date format of Future date MM/DD/YYYY in Create Mode of Employee Information Page
	| EM035      | City name should have spaces, dot, hyphen, (‘) and letters only.                              | Scenario: 20430 To verify the city field  value with only Special Characters in Create Mode of Employee Information Page
	| EM045      | Country name should not exceed 30 characters.                                                 | Scenario: 20453 To verify the Foreign Country field  value with above 30 characters when Country as Other in Create Mode of Employee Information Page
	| EM046      | State name should not exceed 35 characters.                                                   | Scenario: 20473 To verify the Foreign State field  value with above 50 characters  when Country as Other in Create Mode of Employee Information Page
	| EM040      | Email ID is invalid.                                                                          | Scenario: 20359 To verify the Email field  value with Alphanumerics in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 20372 To verify the  Phone Number  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
	| EM103      | SSN is invalid. Accepted format is xxxxxxxxx or xxx-xx-xxxx, x being a number.                | Scenario: To verify the SSN  value with alphabets in Create Mode of Employee Information Page
	| EM028      | Middle Initial should have letter only.                                                       | Scenario: 20282 Employee middle Name field validation alphanumerics
	| EM259      | Routing number must contain only numeric digits (0–9).                                        | Scenario:To verify Routing number field in data type acceptance of only special characters - Create mode
	| EM047      | ZIP Code should not exceed 36 characters.                                                     | Scenario: 20499 To verify the Foreign Zipcode  value with above 36 characters  when Country as Other in Create Mode of Employee Information Page
	| EM054      | Hire Date cannot be more than 30 days in future.                                              | Scenario:(Tc401)To verify the HIre Date  value with valid date format of Current date + 30 date MM/DD/YYYY in Create Mode of Employee Information Page



#Scenario: 20377 To verify the  Phone Number  value with below 10 characters in Create Mode of Employee Information Page
Scenario: 110174 To verify the bankAccountHolderName field with alphaNumerics of below 10  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key                  | value                |
| companyId            | <CompanyId>          |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                       |
| accountHolderName            | random 10 alphanumerics     |
| bankAccountName              | random 10 specialCharacters |
| bankAccountNumber            | random 19 numerics          |
| acceptWarning                | false                       |
| city                         | random 10 alphanumerics     |
| primaryEmailAddress          | ABC123!@#                   |
| mobilePhoneNumber            |                         123 |
| firstName                    | random 10 alphabets         |
| uniquePersonalIdentification | random 9 SpecialCharacters  |
| middleName                   | a1#                         |
| routingNumber                | random 9 alphaNumerics      |
| zipCode                |                            |
When The date property "birthDate" is configured as "days" and should add "-1" days to the current date
When The date property "hireDate" is configured as "days" and should add "1" days to the current date
When The date property "terminationDate" is configured as "days" and should add "10" days to the current date
When The date property "reHireDate" is configured as "days" and should add "20" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 11 following errors 
	| error_code | error_message                                                                                 |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only                                  |
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                                           | Scenario:To verify the bankAccountName field with specialCharacters of  10  in Create Mode of Employee Information Page
	| EM190      | Bank account Number should not exceed 18 characters.                                          | Scenario:To verify the bankAccountNumber field with Numerics of above 18 in Create Mode of Employee Information Page
	| EM056      | Age of the employee cannot be less than 16 years. Please review and update Date of Birth.     | Scenario: 20624 To verify the Birth Date  value with valid date format of Current date -1 date MM/DD/YYYY in Create Mode of Employee Information Page
	| EM035      | City name should have spaces, dot, hyphen, (‘) and letters only.                              | Scenario: 20431 To verify the city field  value with Alphanumerics in Create Mode of Employee Information Page
	| EM040      | Email ID is invalid.                                                                          | Scenario: 20360 To verify the Email field  value with Alphanumerics & Special characters in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 20373 To verify the  Phone Number  value with only Numerics in Create Mode of Employee Information Page
	| EM103      | SSN is invalid. Accepted format is xxxxxxxxx or xxx-xx-xxxx, x being a number.                | Scenario: To verify the SSN  value with special characters in Create Mode of Employee Information Page
	| EM028      | Middle Initial should have letter only.                                                       | Scenario: 20283 Employee middle Name field validation alphanumerics and special charecters
	| EM259      | Routing number must contain only numeric digits (0–9).                                        | Scenario:To verify Routing number field in data type acceptance of only alphanuerics - Create mode
	| EM019      | Required                                                                                      | Scenario: 20474 To verify the ZipCode field  value name with Null  in Create Mode of Employee Information Page





Scenario:To verify the bankAccountHolderName field with alphaNumericWithSpecialCharacters of below 10  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                                       |
| accountHolderName            | random 10 alphaNumericWithSpecialCharacters |
| bankAccountName              | random 10 alphaNumericWithSpecialCharacters |
| bankAccountNumber            | random 10 alphaNumericWithSpecialCharacters |
| acceptWarning                | false                                       |
| employmentStatus             |                                             |
| employmentStatusId           |                                             |
| city                         | random 10 alphaNumericWithSpecialCharacters |
| mobilePhoneNumber            | !@#                                         |
| firstName                    | random 10 specialCharacters                 |
| lastName                     | random 10 specialCharacters                 |
| uniquePersonalIdentification | 444-44-4444                                 |
| routingNumber                | random 9 alphaNumericWithSpecialCharacters  |
| zipCode                      | abc                                        |

When The date property "birthDate" is configured as "years" and should add "-15" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 12 following errors 
	| error_code | error_message                                                                                 |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only                                  |
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                                           | Scenario:To verify the bankAccountName field with alphaNumericWithSpecialCharacters of  10  in Create Mode of Employee Information Page
	| EM258      | Bank account number must contain only numeric digits (0–9)                                    | Scenario:To verify Bank account number field in data type acceptance of only alphanumerics with special characters - Create mode
	| EM056      | Age of the employee cannot be less than 16 years. Please review and update Date of Birth.     | Scenario: 20625 To verify the Birth Date  value with valid date format of Current date -15 year date MM/DD/YYYY in Create Mode of Employee Information Page
	| EM083      | Required.                                                                                     | Scenario: 20639 To verify the validation message Employment status Dropdown is not selected in Create Mode of Employee Information Page
	| EM035      | City name should have spaces, dot, hyphen, (‘) and letters only.                              | Scenario: 20431 To verify the city field  value with Alphanumerics in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 20374 To verify the  Phone Number  value with only Special Characters in Create Mode of Employee Information Page
	| EM061      | Social Security Number digits all should not be same                                          | Scenario: 20290 Employee SSN field all same validation
	| EM026      | First Name should have spaces, hyphen, (') and letters only.                                  | Scenario: 20255 Employee first Name field  validation special charecters
	| EM030      | Last Name should have spaces, dot, hyphen, (‘), (,) and letters only.                         | Scenario: 20270 Employee last Name field  validation special charecters
	| EM259      | Routing number must contain only numeric digits (0–9).                                        | Scenario:To verify Routing number field in data type acceptance of only alphanuerics with special characters - Create mode
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number            | Scenario: 20475 To verify the ZipCode field  value with lower case in Create Mode of Employee Information Page


Scenario:To verify the bankAccountHolderName field with alphabets of above 150 characters  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                       |
| accountHolderName            | random 151 alphabets        |
| bankAccountName              | random 10 alphaNumerics     |
| bankAccountNumber            | random 10 alphaNumerics     |
| employmentStatus             | active                      |
| hireDate                     |                             |
| mobilePhoneNumber            | !@#123                      |
| employeeNumber               | random 22 alphabets         |
| firstName                    | random 160 alphabets        |
| lastName                     | random 160 alphabets        |
| uniquePersonalIdentification | 444-00-4444                 |
| routingNumber                | random 10 numerics          |
| zipCode                     | ABC                         |

When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 11 following errors 
	| error_code | error_message                                                                                 |
	| EM218      | Account Holder Name should not exceed 150 characters.                                         |
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                                           | Scenario:To verify the bankAccountName field with alphaNumerics of  10  in Create Mode of Employee Information Page
	| EM258      | Bank account number must contain only numeric digits (0–9)                                    | Scenario:To verify Bank account number field in data type acceptance of only alphanumerics - Create mode
	| EM023      | Required                                                                                      | Scenario: 20432 To verify the city field  value with Alphanumerics & Special characters in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 20375 To verify the  Phone Number  value with Alphanumerics in Create Mode of Employee Information Page
	| EM043      | Employee ID should not exceed 20 characters.                                                  | Scenario: 20325 To verify the Employee ID column value with above 20 characters in Create Mode of Employee Information Page
	| EM062      | Social Security Number fourth and fifth digits should not be zero.                            | Scenario: 20291 Employee SSN field  4th and 5th digit zero validation
	| EM027      | First Name should not exceed 150 characters.                                                  | Scenario: 20260 Employee first Name field greater than 150 charecters validation
	| EM031      | Last Name should not exceed 150 characters.                                                   | Scenario: 20275 Employee last Name field greater than 150 charecters validation
	| EM212      | Routing number should be 9 characters.                                                        | Scenario:To verify the routingNumber field with numerics of above 9  in Create Mode of Employee Information Page
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number            |Scenario: 20476 To verify the ZipCode field  value with Upper case in Create Mode of Employee Information Page





Scenario: 20393 To verify the Address 1 field  value with lower case in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                 |
| address1                     | <Address1>            |
| address2                     | <Address2>            |
| address3                     | <Address3>            |
| accountHolderName            | <AccountHolderName>   |
| bankAccountNumber            | <BankAccountNumber>   |
| bankAccountType              | <BankAccountType>     |
| city                         | <City>                |
| country                      | Other                 |
| countryId                    |                     2 |
| foreignCountry               | <ForeignCountry>      |
| foreignState                 | <ForeignState>        |
| primaryEmailAddress          | <PrimaryEmailAddress> |
| employeeNumber               | <EmployeeNumber>      |
| firstName                    | <FirstName>           |
| uniquePersonalIdentification | <SSN>                 |
| gender                       | <Gender>              |
| lastName                     | <LastName>            |
| maritalStatus                | <MaritalStatus>       |
| middleName                   | <MiddleName>          |
| routingNumber                | <RoutingNumber>       |
| zipCode                      | <ZipCode>             |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message
Examples: 
| Address1                                    | Address2                                    | Address3                                    | AccountHolderName    | bankAccountName     | BankAccountNumber  | BankAccountType | City                | ForeignCountry                              | ForeignState                                | PrimaryEmailAddress                                                              | EmployeeNumber         | SSN         | FirstName            | Gender | LastName             | MaritalStatus | MiddleName | RoutingNumber     | ZipCode                                     |
| abc                                         |                                             |                                             | random 10 alphabets  | random 10 alphabets | random 10 numerics |               1 | abc                 | abc                                         | abc                                         |                                                                                  | aca                    | 123-12-3452 | random 10 alphabets  | m      | random 10 alphabets  | m             |            | random 9 numerics | abc                                         |
| abc                                         | abc                                         | abc                                         | random 100 alphabets | random 50 alphabets | random 10 numerics |               2 | ABC                 | ABC                                         | ABC                                         | te7st@test.com                                                                    |                        | 444-05-4444 | abcdefg              | M      | abcdefg              | M             | a          | random 9 numerics | ABC                                         |
| ABC                                         | ABC                                         | ABC                                         | random 150 alphabets | random 10 alphabets | random 18 numerics |               1 | ABc                 | ABc                                         | ABc                                         | TES1T@TEST.COM                                                                    | ACA                    | 444-50-4444 | ABCDEFG              |        | ABCDEFG              | s             | A          | random 9 numerics | ABc                                         |
| ABc                                         | ABc                                         | ABc                                         | random 10 alphabets  | random 10 alphabets | random 10 numerics |               2 | random 25 alphabets | random 10 Numerics                          | random 10 numerics                          | TE6ST@test.COM                                                                   | Aca                    | 000-50-4444 | ABCDEFaa             | f      | ABCDEFaa             | S             | aA         | random 9 numerics | random 10 numerics                          |
| random 10 numerics                          | random 10 numerics                          | random 10 numerics                          | random 10 alphabets  | random 10 alphabets | random 10 numerics |               1 | random 30 alphabets | random 10 SpecialCharacters                 | random 10 specialCharacters                 | abcdeabcdeabcdeabcdeabcdeabcdeabckeabcdeabcdeabcde@test.com                      | random 3 numerics      | 666-66-1234 | -'                   | F      | -'                   | d             |            | random 9 numerics | random 10 specialCharacters                 |
| random 10 SpecialCharacters                 | random 10 specialCharacters                 | random 10 specialCharacters                 | random 10 Alphabets  | random 10 alphabets | random 10 numerics |               2 | abc                 | random 10 alphaNumerics                     | random 10 alphaNumerics                     | abdceabdceabdceabdceabdceabdcelbdceabdceabdceabdceabdceabdceabdceabdcea@test.com | random 5 alphaNumerics | 999-92-6666 | aaaaa                | u      | aaaaa                | D             |            | random 9 numerics | random 10 alphaNumerics                     |
| random 10 alphaNumerics                     | random 10 alphaNumerics                     | random 10 alphaNumerics                     | random 10 alphabets  | random 10 alphabets | random 10 numerics |               1 | abc                 | random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | 193@test.com                                                                     | random 15 alphabets    | 999-96-9999 | random 150 alphabets | U      | random 150 alphabets | w             |            | random 9 numerics | random 10 alphaNumericWithSpecialCharacters |
| random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | random 10 alphabets  | random 10 alphabets | random 10 numerics |               2 | abc                 | random 30 alphabets                         | random 35 alphabets                         |                                                                                  | random 20 alphabets    | 999-96-9999 | random 100 alphabets | M      | random 100 alphabets | W             |            | random 9 numerics | random 35 numerics                          |
| random 30 alphabets                         | random 30 alphabets                         | random 30 alphabets                         | random 10 alphabets  | random 10 alphabets | random 10 numerics |               1 | abd                 | abc                                         | abc                                         |                                                                                  | random 10 alphabets    | 999-96-9999 | random 10 alphabets  | M      | random 10 alphabets  | S             |            | random 9 numerics | random 36 numerics                          |
| random 150 alphabets                        | random 35 alphabets                         | random 35 alphabets                         | random 10 alphabets  | random 10 alphabets | random 10 numerics |               2 | abc                 | abc                                         | abc                                         |                                                                                  | ACA001                 | 999-96-9999 | random 10 alphabets  | M      | random 10 alphabets  | S             |            | random 9 numerics | abc                                         |
#Scenario: 20394 To verify the Address 1 field  value with Upper case in Create Mode of Employee Information Page
#Scenario: 20395 To verify the Address 1 field  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
#Scenario: 20396 To verify the Address 1 field  value with only Numerics in Create Mode of Employee Information Page
#Scenario: 20397 To verify the Address 1 field  value with only Special Characters in Create Mode of Employee Information Page
#Scenario: 20398 To verify the Address 1 field  value with Alphanumerics in Create Mode of Employee Information Page
#Scenario: 20399 To verify the Address 1 field  value with Alphanumerics & Special characters in Create Mode of Employee Information Page
#Scenario: 20400 To verify the Address 1 field  value with below 150 characters in Create Mode of Employee Information Page
#Scenario: 20401 To verify the Address 1 field  value with equal 150 characters in Create Mode of Employee Information Page
#Scenario: 20403 To verify the Address 2 field  value name with Null  in Create Mode of Employee Information Page
#Scenario: 20404 To verify the Address 2 field  value with lower case in Create Mode of Employee Information Page
#Scenario: 20405 To verify the Address 2 field  value with Upper case in Create Mode of Employee Information Page
#Scenario: 20406 To verify the Address 2 field  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
#Scenario: 20407 To verify the Address 2 field  value with only Numerics in Create Mode of Employee Information Page
#Scenario: 20408 To verify the Address 2 field  value with only Special Characters in Create Mode of Employee Information Page
#Scenario: 20409 To verify the Address 2 field  value with Alphanumerics in Create Mode of Employee Information Page
#Scenario: 20410 To verify the Address 2 field  value with Alphanumerics & Special characters in Create Mode of Employee Information Page
#Scenario: 20411 To verify the Address 2 field  value with below 35 characters in Create Mode of Employee Information Page
#Scenario: 20412 To verify the Address 2 field  value with equal 35 characters in Create Mode of Employee Information Page
#Scenario: 20414 To verify the Address 3 field  value name with Null  in Create Mode of Employee Information Page
#Scenario: 20415 To verify the Address 3 field  value with lower case in Create Mode of Employee Information Page
#Scenario: 20416 To verify the Address 3 field  value with Upper case in Create Mode of Employee Information Page
#Scenario: 20417 To verify the Address 3 field  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
#Scenario: 20418 To verify the Address 3 field  value with only Numerics in Create Mode of Employee Information Page
#Scenario: 20419 To verify the Address 3 field  value with only Special Characters in Create Mode of Employee Information Page
#Scenario: 20420 To verify the Address 3 field  value with Alphanumerics in Create Mode of Employee Information Page
#Scenario: 20421 To verify the Address 3 field  value with Alphanumerics & Special characters in Create Mode of Employee Information Page
#Scenario: 20422 To verify the Address 3 field  value with below 35 characters in Create Mode of Employee Information Page
#Scenario: 20423 To verify the Address 3 field  value with equal 35 characters in Create Mode of Employee Information Page

#  + Address field (11 cases which is restricted in UI)

#Scenario: 110171 To verify the bankAccountHolderName field with alphabets of below 10  in Create Mode of Employee Information Page
#Scenario:To verify the bankAccountHolderName field with numerics of below 150 in Create Mode of Employee Information Page
#Scenario:To verify the bankAccountHolderName field with alphabets of equal 150 characters  in Create Mode of Employee Information Page

#Scenario:To verify the bankAccountName field with alphabets of below 50  in Create Mode of Employee Information Page
#Scenario:To verify the bankAccountName field with alphabets of equal 50  in Create Mode of Employee Information Page
#Scenario:To verify the bankAccountName field with alphabets of  10  in Create Mode of Employee Information Page

#Scenario:To verify Bank account number field in data type acceptance of only numerics - Create mode
#Scenario:To verify the bankAccountNumber field with Numerics of below 18  in Create Mode of Employee Information Page
#Scenario:To verify the bankAccountNumber field with Numerics of equal 18 in Create Mode of Employee Information Page

#Scenario:To verify the bankaccounttype field with savingsaccount is Null  in Create Mode of Employee Information Page
#Scenario:To verify the bankaccounttype field with savingsaccount  in Create Mode of Employee Information Page

#Scenario: 20426 To verify the city field  value with lower case in Create Mode of Employee Information Page
#Scenario: 20427 To verify the city field  value with Upper case in Create Mode of Employee Information Page
#Scenario: 20428 To verify the city field  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
#Scenario: 20433 To verify the City field  value with below 30 characters in Create Mode of Employee Information Page
#Scenario: 20434 To verify the City field  value with equal 30 characters in Create Mode of Employee Information Page

#Scenario: 20445 To verify the Foreign Country field  value with lower case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20446 To verify the Foreign Country field  value with Upper case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20447 To verify the Foreign Country field  value with Combination of Upper case and lower case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20448 To verify the Foreign Country field  value with only Numerics when Country as Other in Create Mode of Employee Information Page
#Scenario: 20449 To verify the Foreign Country field  value with only Special Characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20450 To verify the Foreign Country field  value with Alphanumerics when Country as Other in Create Mode of Employee Information Page
#Scenario: 20451 To verify the Foreign Country field  value with Alphanumerics & Special characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20452 To verify the Foreign Country field  value with equal 30 characters when Country as Other in Create Mode of Employee Information Page

#Scenario: 20465 To verify the Foreign State field  value with lower case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20466 To verify the Foreign State field  value with Upper case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20467 To verify the Foreign State field  value with Combination of Upper case and lower case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20468 To verify the Foreign State field  value with only Numerics when Country as Other in Create Mode of Employee Information Page
#Scenario: 20469 To verify the Foreign State field  value with only Special Characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20470 To verify the Foreign State field  value with Alphanumerics when Country as Other in Create Mode of Employee Information Page
#Scenario: 20471 To verify the Foreign State field  value with Alphanumerics & Special characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20472 To verify the Foreign State field  value with equal 50 characters when Country as Other in Create Mode of Employee Information Page

#Scenario: 20353 To verify the Email field  value with Null  in Create Mode of Employee Information Page
#Scenario: 20354 To verify the Email field  value with lower case in Create Mode of Employee Information Page
#Scenario: 20355 To verify the Email field  value with Upper case in Create Mode of Employee Information Page
#Scenario: 20356 To verify the Email field  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
#Scenario: 20360 To verify the Email field  value with below 80 characters in Create Mode of Employee Information Page
#Scenario: 20362 To verify the Email field  value with equal 80 characters in Create Mode of Employee Information Page
#Scenario: 20365 To verify the Email field  value added Numerics in Create Mode of Employee Information Page

#Scenario: 20316 To verify the Employee ID column value with lower case in Create Mode of Employee Information Page
#Scenario: To verify the Employee ID column value with Null  in Create Mode of Employee Information Page
#Scenario: 20317 To verify the Employee ID column value with Upper case in Create Mode of Employee Information Page
#Scenario: 20318 To verify the Employee ID column value with Combination of Upper case and lower case in Create Mode of Employee Information Page
#Scenario: 20319 To verify the Employee ID column value with only Numerics in Create Mode of Employee Information Page
#Scenario: 20321 To verify the Employee ID column value with Alphanumerics in Create Mode of Employee Information Page
#Scenario: 20323 To verify the Employee ID column value with below 20 characters in Create Mode of Employee Information Page
#Scenario: 20324 To verify the Employee ID column value with equal 20 characters in Create Mode of Employee Information Page
#Scenario: 20326 To verify the Employee Id saves into the system by Create Mode of Employee Information Page
#Scenario:(Tc95a)To verify the Employee have same employee id of another employee of another company 
#Scenario:(Tc95b)To verify the Employee have same employee id of another employee of another company  

#Scenario: 20288 Employee SSN field equal to 9 numerics acceptance
#Scenario: 20292 Employee SSN field  4th digit zero acceptance
#Scenario: 20293 Employee SSN field  5th digit zero acceptance
#Scenario: 20294 Employee SSN field first three digit zero validation
#Scenario: 20296 Employee SSN field with first 3 digits as 666  validation
#Scenario: 20298 Employee SSN field with first three digits are between "900 - 999" validation
#Scenario: 20299 Employee SSN field with all three digits as 9 validation                         

#Scenario: Employee first Name field acceptance alphabets
#Scenario: 20247 Employee first Name field  acceptance lower case alphabets
#Scenario: 20248 Employee first Name field  acceptance higher case alphabets
#Scenario: 20249 Employee first Name field  acceptance lower and higher case alphabets
#Scenario: 20251 Employee first Name field  acceptance "-" and "'" 
#Scenario: 20253 Employee first Name field  acceptance space and alphabets 
#Scenario: 20259 Employee first Name equal to 150 charecters acceptance
#Scenario: 20258 Employee first Name  lesser than 150 charecters acceptance

#Scenario:(Tc0111) To verify the gender value with lower case of Male in Create Mode of Employee Information Page
#Scenario:(Tc0112) To verify the gender column value with upper case of Male in Create Mode of Employee Information Page
#Scenario:(Tc0114) To verify the gender column value with null data in Create Mode of Employee Information Page
#Scenario:(Tc0115) To verify the gender value with lower case of Female in Create Mode of Employee Information Page
#Scenario:(Tc0116) To verify the gender value with upper case of Male in Create Mode of Employee Information Page
#Scenario:(Tc0117) To verify the gender value with lower case of Unknown in Create Mode of Employee Information Page
#Scenario:(Tc0118) To verify the gender value with upper case of Unknown in Create Mode of Employee Information Page

#Scenario: Employee last Name field acceptance alphabets
#Scenario: 20262 Employee last Name field  acceptance lower case alphabets
#Scenario: 20263 Employee last Name field  acceptance higher case alphabets
#Scenario: 20264 Employee last Name field  acceptance lower and higher case alphabets
#Scenario: 20266 Employee last Name field  acceptance "-" and "'" 
#Scenario: 20268 Employee last Name field  acceptance space and alphabets 
#Scenario: 20274 Employee last Name equal to 150 charecters acceptance
#Scenario: 20273 Employee last Name  lesser than 150 charecters acceptance

#Scenario:(Tc0120) To verify the Marital status value with lower case of Married in Create Mode of Employee Information Page
#Scenario:(Tc0121) To verify the Marital status value with upper case of Married in Create Mode of Employee Information Page
#Scenario:(Tc0122) To verify the Marital status value with lower case of Single in Create Mode of Employee Information Page
#Scenario:(Tc0123) To verify the Marital status value with upper case of Single in Create Mode of Employee Information Page
#Scenario:(Tc0124) To verify the Marital status value with lower case of divorced in Create Mode of Employee Information Page
#Scenario:(Tc0125) To verify the Marital status value with upper case of divorced in Create Mode of Employee Information Page
#Scenario:(Tc0126) To verify the Marital status value with lower case of Widow in Create Mode of Employee Information Page
#Scenario:(Tc0127) To verify the Marital status value with upper case of widow in Create Mode of Employee Information Page

#Scenario: 20276 Employee middle Name field acceptance null
#Scenario: 20277 Employee middle Name field acceptance lower case
#Scenario: 20278 Employee middle Name field acceptance higher case
#Scenario: 20279 Employee middle Name field acceptance higher case and lower case

#Scenario: 20339 To verify the Gender Dropdown is not selected in Create Mode of Employee Information Page
#Scenario: 20340 To verify the Gender Dropdown values "Male" selected in Create Mode of Employee Information Page
#Scenario: 20341 To verify the Gender Dropdown values "Female" selected in Create Mode of Employee Information Page
#Scenario: 20342 To verify the Gender Dropdown values "Unknown" selected in Create Mode of Employee Information Page
#Scenario: 20347 To verify the Marital Status Dropdown values "Single" selected in Create Mode of Employee Information Page
#Scenario: 20348 To verify the Marital Status Dropdown values "Married" selected in Create Mode of Employee Information Page
#Scenario: 20349 To verify the Marital Status Dropdown values "Divorced" selected in Create Mode of Employee Information Page
#Scenario: 20350 To verify the Marital Status Dropdown values "Widower" selected in Create Mode of Employee Information Page

#Scenario:To verify Routing number field in data type acceptance of only numerics - Create mode
#Scenario:To verify the routingNumber field with numerics of equal 9  in Create Mode of Employee Information Page

#Scenario: 20490 To verify the Foreign Zipcode  value with lower case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20491 To verify the Foreign Zipcode  value with Upper case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20492 To verify the Foreign Zipcode  value with Combination of Upper case and lower case when Country as Other in Create Mode of Employee Information Page
#Scenario: 20493 To verify the Foreign Zipcode  value with only Numerics when Country as Other in Create Mode of Employee Information Page
#Scenario: 20494 To verify the Foreign Zipcode  value with only Special Characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20495 To verify the Foreign Zipcode  value with Alphanumerics when Country as Other in Create Mode of Employee Information Page
#Scenario: 20496 To verify the Foreign Zipcode  value with Alphanumerics & Special characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20497 To verify the Foreign Zipcode  value with below 36 characters when Country as Other in Create Mode of Employee Information Page
#Scenario: 20498 To verify the Foreign Zipcode  value with equal 36 characters when Country as Other in Create Mode of Employee Information Page



#Scenario: Employee Hire Date
#Scenario: 20369 To verify the  Phone Number  value name with Null  in Create Mode of Employee Information Page
Scenario: 20621 To verify the Birth Date  value with valid date format of  MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value       |
| birthDate                    | 01-04-1988  |
| mobilePhoneNumber            |             |
| hireDate                     | 1/1/2019    |
| uniquePersonalIdentification | 444-44-4445 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message

Scenario: 20629 To verify the Hire Date  value with valid date format of Current date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value              |
| employmentStatus | Terminated         |
| zipCode          | random 5 Numerics |
When The date property "hireDate" is configured as "<type>" and should add "<hireDate>" days to the current date
When The date property "terminationDate" is configured as "days" and should add "<terminationDate>" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
When The date property "reHireDate" is configured as "days" and should add "<reHireDate>" days to the current date
When Configuration has been made as per following
| key                | value             |
| employmentStatus   | Active            |
| zipCode            | random 9 numerics |
When The date property "leaveStartDate" is configured as "days" and should add "<leaveStartDate>" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message
Examples: 
| hireDate | terminationDate | reHireDate | type  | leaveStartDate |
|        0 |               1 |         10 | days  |              0 |
|        1 |               2 |         10 | days  |              1 |
|       -1 |               1 |         10 | days  |             29 |
|       -1 |               1 |         10 | years |              0 |
|       29 |              30 |         30 | days  |              0 |

#Scenario: 20630 To verify the Hire Date  value with valid date format of Future date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20631 To verify the Hire Date  value with valid date format of Past date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20632 To verify the HIre Date  value with valid date format of past year date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20633 To verify the HIre Date  value with valid date format of Current date + 29 date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20487 To verify the Zipcode  value with equal 9 characters in Create Mode of Employee Information Page

#Scenario: 20647 To verify the Leave Start date value with valid date format of Current date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20648 To verify the Leave Start Date a value with valid date format of Future date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20649 To verify the Leave Start Date value with valid date format of Current date + 29 date MM/DD/YYYY in Create Mode of Employee Information Page


Scenario: 20636 To verify the Hire Date value before of Birth date format MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                                                                                                                                |
| employmentStatus             | Active                                                                                                                               |
| hireDate                     | 01/01/1988                                                                                                                           |
| birthDate                    | 01/01/1991                                                                                                                           |
| city                         | random 50 alphabets                                                                                                                  |
| primaryEmailAddress          | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdedeabcdedeabcdeabcdeabcdeababcdeabcdeababcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcde@test.com |
| mobilePhoneNumber            | !@#123ABC                                                                                                                            |
| firstName                    | random 10 alphaNumerics                                                                                                              |
| lastName                     | 123abc                                                                                                                               |
| uniquePersonalIdentification | 000-00-0000                                                                                                                          |
| zipCode                      | ABc                                                                                                                                  |
| routingNumber                | random 8 numerics                                                                                                                    |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 9 following errors 
	| error_code | error_message                                                                                 |
	| EM055      | Hire Date cannot be prior or equal to the Date of Birth.                                      |
	| EM034      | City name should not exceed 35 characters.                                                    | Scenario: 20435 To verify the City field  value with above 30 characters in Create Mode of Employee Information Page
	| EM041      | Email Address should not exceed 80 characters.                                                | Scenario: 20363 To verify the Email field  value with above 80 characters in Create Mode of Employee Information Page
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 20376 To verify the  Phone Number  value with Alphanumerics & Special characters in Create Mode of Employee Information Page
	| EM061      | Social Security Number digits all should not be same                                          |
	| EM062      | Social Security Number fourth and fifth digits should not be zero.                            | Scenario: 20295 Employee SSN field with all digits zero validation
	| EM026      | First Name should have spaces, hyphen, (') and letters only.                                  | Scenario: 20256 Employee first Name field  validation alphaNumerics
	| EM030      | Last Name should have spaces, dot, hyphen, (‘), (,) and letters only.                         | Scenario: 20271 Employee last Name field  validation alphaNumerics
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number            | Scenario: 20477 To verify the ZipCode field  value with Combination of Upper case and lower case in Create Mode of Employee Information Page
	| EM212      | ABA routing number should be 9 digits.                                                        | #Scenario:To verify the routingNumber field with numerics of below 9  in Create Mode of Employee Information Page
	
Scenario: 20646 To verify the Leave start Date  value as Null Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value               |
| employmentStatus             | Military Leave      |
| leaveStartDate               |                     |
| primaryEmailAddress          | testtest@.com       |
| mobilePhoneNumber            |         12312312301 |
| firstName                    | random 10 alphaNumericWithSpecialCharacters |
| lastName                    | random 10 alphaNumericWithSpecialCharacters |
| uniquePersonalIdentification | 666-66-6666         | 
| zipCode                      | random 10 numerics                          |


When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 7 following errors 
	| error_code | error_message                                                                                 |
	| EM079      | Leave Start Date is required.                                                                 |
	| EM040      | Email ID is invalid                                                                           | Scenario: 20364 To verify the Email field  value in Create Mode of Employee Information Page other than format (abc@test.com)
	| EM036      | Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number | Scenario: 20379 To verify the  Phone Number  value with above 10 characters in Create Mode of Employee Information Page
	| EM061      | Social Security Number digits all should not be same                                          | Scenario: 20297 Employee SSN field with all digits as 6  validation
	| EM026      | First Name should have spaces, hyphen, (') and letters only.                                  | Scenario: 20257 Employee first Name field  validation alphaNumerics with special charecters
	| EM030      | Last Name should have spaces, dot, hyphen, (‘), (,) and letters only.                         | Scenario: 20272 Employee last Name field  validation alphaNumerics with special charecters
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number            |Scenario: 20478 To verify the ZipCode field  value with only Numerics in Create Mode of Employee Information Page



Scenario: 20650 To verify the Leave Start Date  value with valid date format of Current date + 30 date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                       |
| employmentStatus             | Military Leave              |
| employmentStatusId           |                       38419 |
| primaryEmailAddress          | "!@#@test.com               |
| mobilePhoneNumber            |                  0231231233 |
| workPhoneNumber              |                  0678437328 |
| firstName                    | random 10 alphabets         |
| uniquePersonalIdentification | 000-00-9999                 |
| zipCode                      | random 10 specialCharacters |
When The date property "leaveStartDate" is configured as "day" and should add "31" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 6 following errors 
	| error_code | error_message                                                                      |
	| EM127      | Leave Start Date cannot be more than 30 days in future.                            |
	| EM040      | Email ID is invalid.                                                               | Scenario: 20366 To verify the Email field  value added Special Characters in Create Mode of Employee Information Page
	| EM037      | Primary Phone number should not start with zero.                                   | Scenario: 20380 To verify the  Phone Number  value in Create Mode of Employee Information Page starts with Zero
	| EM039      | Secondary Phone number should not start with zero.                                 | Scenario: 150471 Verify whether validation is triggered if "Secondary Phone Number" field is started with "zero(0)" --> "Employee Information Page"--> New Employee --> Employee Tab
	| EM062      | Social Security Number fourth and fifth digits should not be zero.                 | Scenario: 20300 Employee SSN field with  Combination of first three digits are 000  with Fourt and Fifth digits are Zero validation
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number | Scenario: 20479 To verify the ZipCode field  value with only Special Characters in Create Mode of Employee Information Page

Scenario: 20483 To verify the zipCode field  value with equal 5 characters in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key               | value             |
| employmentStatus  | Military Leave    |
| mobilePhoneNumber |        1231231230 |
| zipCode           | random 5 numerics |

When The date property "leaveStartDate" is configured as "days" and should add "<leaveStartDate>" days to the current date
When The date property "leaveEndDate" is configured as "<type>" and should add "<leaveEndDate>" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message
Examples: 
| leaveStartDate | leaveEndDate | type |
|              1 |            2 | days |
|              1 |            2 | days |
|              1 |           29 | days |

#Scenario: 20653 To verify the Leave End date value with valid date format of Current date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20654 To verify the Leave End Date  value with valid date format of Future date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20655 To verify the Leave End Date  value with valid date format of Current date + 29 date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario: 20378 To verify the  Phone Number  value with equal 10 characters in Create Mode of Employee Information Page


Scenario:(Tc419)To verify the validation message forLeave End Date  value as Null when changing employment status change to other from Leave inCreate Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key               | value               |
| employmentStatus  | Military Leave      |
| leaveEndDate      |                     |
| accountHolderName | random 10 alphabets |
When The date property "leaveStartDate" is configured as "days" and should add "1" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message



Scenario: 20482 To verify the ZipCode field  value with below 5 characters in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key               | value          |
| zipCode           | random 3 numerics |

When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                                       |
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number |


Scenario: 20657 To verify the validation message for Leave End Date  value as before Leave start date in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value               |
| employmentStatus             | Military Leave      |
| primaryEmailAddress          | ABC123!@#@test.com  |
| firstName                    | random 10 alphabets |
| uniquePersonalIdentification | 666-00-1234         |
| zipCode                      | random 6 numerics   |

When The date property "leaveStartDate" is configured as "days" and should add "30" days to the current date
When The date property "leaveEndDate" is configured as "days" and should add "29" days to the current date
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                                                      |
	| EM080      | Leave End Date cannot be prior to the Leave Start Date.                            |
	| EM040      | Email ID is invalid.                                                               | Scenario: 20368 To verify the Email field  value added Alphanumerics & Special characters in Create Mode of Employee Information Page
	| EM062      | Social Security Number fourth and fifth digits should not be zero.                 | Scenario: 20301 Employee SSN field with  Combination of first three digits are 666  with Fourt and Fifth digits are zero validation
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number |Scenario: 20484 To verify the zipCode field  value with above 5 characters in Create Mode of Employee Information Page

Scenario: 150479 Verify whether validation is triggered if "Secondary Phone Number" field is started with "zero(0)" --> "Employee Information Page"--> Existing Employee --> Employee Tab
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value               |
| workPhoneNumber              | 978-456-7352         |
| firstName                    | random 10 alphabets |
| uniquePersonalIdentification | 123-45-6789         |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"

 When Configuration has been made as per following
| key       | value       |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value               |
| workPhoneNumber              |          0678437328 |
| firstName                    | random 10 alphabets |
| uniquePersonalIdentification | 123-45-6789         |
| primaryEmailAddress          | random 20 Email     |

When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message                                                                                                                                                    |
	| EM039      | Secondary Phone number should not start with zero.                                                                                                               |
	| EM110      | This employee Social Security Number already exists in the company.Please review Existing Employees Social Security Number and correct or delete this new entry. | Scenario: To verify the Employee have same SSN of another employee with in the System in Create Mode of Employee Information Page


#Scenario: 20486 To verify the Zipcode  value with below 9 characters in Create Mode of Employee Information Page
Scenario: 20302 Employee SSN field with  Combination of first three digits are 999  with Fourt and Fifth digits are zero validation
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value               |
| firstName                    | random 10 alphabets |
| uniquePersonalIdentification | 999-00-1234         |
| zipCode                      | random 7 numerics   |
| employmentStatus             | Active              |
| hireDate                     | 01/01/1988          |
| birthDate                    | 01/01/1991          |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                                                                         |
	| EM062      | Social Security Number fourth and fifth digits should not be zero.                                    |
	| EM181      | The middle two digits of the Social Security Number should be \\"70-88\\", \\"90-92\\" or \\"94-99\\" |
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number                    | Scenario: 20485 To verify the Zipcode  value with above 5 and below 9 characters in Create Mode of Employee Information Page
	| EM055      | Hire Date cannot be prior or equal to the Date of Birth.                                              | Scenario:(Tc403)To verify the Hire Date value before of Birth date format MM/DD/YYYY in Create Mode of Employee Information Page

Scenario: To verify the SSN  value with above 9 characters in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value               |
| firstName                    | random 10 alphabets |
| uniquePersonalIdentification | 999-00-12345        |
| zipCode                      | random 11 numerics  |
| employmentStatus             | Terminated          |
| terminationDate              |                     |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                                                      |
	| EM103      | SSN is invalid. Accepted format is xxxxxxxxx or xxx-xx-xxxx, x being a number.     |
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number | Scenario: 20488 To verify the Zipcode  value with above 9 characters in Create Mode of Employee Information Page
	| EM240      | Invalid Employment Status for the Dates Received. Please Review.                   |
	| M090       | Required                                                                           |Scenario: To verify the Most recent Term Date  value as Null Create Mode of Employee Information Page





Scenario: 20627 To verify the Same Fistname, Lastname, Birth date of another employee with in the System in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key                          | value                    |
| firstName                    | John                     |
| lastName                     | Muller                   |
| uniquePersonalIdentification | 123-45-6789              |
| primaryEmailAddress          | LaCurtis.Johns@yahoo.com |

When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
When Configuration has been made as per following
| key                          | value       |
| firstName                    | John        |
| lastName                     | Muller      |
| uniquePersonalIdentification | 123-45-6789 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                                                                                                                    |
	| EM110      | This employee Social Security Number already exists in the company.Please review Existing Employees Social Security Number and correct or delete this new entry. |


Scenario:(Tc396)To verify the Hire Date  value with valid date format of Current date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value |
| employmentStatus | Active |
When The date property "hireDate" is configured as "<type>" and should add "<hireDate>" days to the current date
When The date property "reHireDate" is configured as "days" and should add "<reHireDate>" days to the current date
When The date property "terminationDate" is configured as "days" and should add "<terminationDate>" days to the current date
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key        | Value  |
|           1 | RehireDate | day_10 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message
Examples: 
| type  | hireDate | reHireDate | terminationDate |
| days  |        0 |         10 |               2 |
| days  |        1 |         10 |               2 |
| days  |       -1 |         10 |               2 |
| years |       -1 |         10 |               2 |

#Scenario:(Tc397)To verify the Hire Date  value with valid date format of Future date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario:(Tc398)To verify the Hire Date  value with valid date format of Past date MM/DD/YYYY in Create Mode of Employee Information Page
#Scenario:(Tc399)To verify the HIre Date  value with valid date format of past year date MM/DD/YYYY in Create Mode of Employee Information Page
 Scenario:(Tc400)To verify the HIre Date  value with valid date format of Current date + 29 date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value |
| employmentStatus | Active |
When The date property "hireDate" is configured as "<hi>" and should add "<di>" days to the current date
When The date property "reHireDate" is configured as "days" and should add "<ri>" days to the current date
When The date property "terminationDate" is configured as "days" and should add "<ti>" days to the current date
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value  |
|           1 | RehireDate | day_10 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                                      |
	| EM239      | Most recent term should not be prior to Hire date                                  |
Examples: 
| hi    | di | ri | ti |
| days  | 29 | 30 | 30 |

#notification
Scenario: To verify the Most recent Term date value with valid date format of Current date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value      |
| employmentStatus | Terminated |
When The date property "terminationDate" is configured as "day" and should add "0" days to the current date
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value  |
|           1 | TerminationDate | day_0 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                |
	| EM069      | New employee added with Date of Termination. Please confirm. |
         

#notification
Scenario: To verify the Most recent Term date value with valid date format of Past date below 90 days MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value                    |
| employmentStatus | Terminated               |
| terminationDate  | 2023-12-12T06:56:11.258Z |
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value                    |
|           1 | TerminationDate | 2023-12-12T06:56:11.258Z |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message                                                                    |
	| EM069      | New employee added with Date of Termination. Please confirm.                     |
	| EM068      | The Employee's Most Recent Term Date is more than 90 days prior to current date. |

#notification
Scenario: To verify the Most recent Term date value with valid date format of Past date above 90 days MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value                    |
| employmentStatus | Terminated               |
| terminationDate  | 2023-01-12T06:56:11.258Z |
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value                    |
|           1 | TerminationDate | 2023-01-12T06:56:11.258Z |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message                                                                    |
	| EM069      | New employee added with Date of Termination. Please confirm.                     |
	| EM068      | The Employee's Most Recent Term Date is more than 90 days prior to current date. |


#notification	
Scenario: To verify the Most recent Term Date  value with valid date format of Future date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value      |
| employmentStatus | Terminated |
When The date property "terminationDate" is configured as "day" and should add "1" days to the current date
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value  |
|           1 | TerminationDate | day_1 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                |
	| EM069      | New employee added with Date of Termination. Please confirm. |
      
#notification
Scenario: To verify the Most recent Term Date  value with valid date format of Current date + 29 date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value      |
| employmentStatus | Terminated |
When The date property "terminationDate" is configured as "day" and should add "29" days to the current date
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value  |
|           1 | TerminationDate | day_29 |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                |
	| EM069      | New employee added with Date of Termination. Please confirm. |

#notification
Scenario: To verify the validation message for Most Recent term Date  value as before HIre start date in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value                    |
| employmentStatus | Terminated               |
| terminationDate  | 2022-04-04T06:56:11.258Z |
| zipCode          | random 10 alphaNumericWithSpecialCharacters  |

 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value                    |
|           1 | TerminationDate | 2022-04-04T06:56:11.258Z |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 3 following errors 
	| error_code | error_message                                                                      |
	| EM088      | Most recent term should not be prior to Hire date                                  |
	| EM068      | The Employee's Most Recent Term Date is more than 90 days prior to current date.   |
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number | Scenario: 20481 To verify the ZipCode field  value with Alphanumerics & Special characters in Create Mode of Employee Information Page


#notification
Scenario: To verify the validation message for Most Recent term Date is admitted for New hire employee in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
| classificationId     | <CompEmpClassId>     |
| classificationTypeId | <CompEmpClassTypeId> |
| payrollFrequencyId   | <DailyFreqId>        |
| employmentStatusId   | <ActiveStatusId>     |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
| BlockNumber | Key                  | Value                |
|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
|           1 | ClassificationId     | <CompEmpClassId>     |
When Configuration has been made as per following
| key              | value                    |
| employmentStatus | Terminated               |
| acceptWarning    | false                    |
| hireDate         | 2022-12-27T06:56:11.258Z |
| terminationDate  | 2023-12-26T06:56:11.258Z |
| zipCode          | random 10 alphaNumerics  |
 When Collection in a model is configured with 1 blocks for the property "RehireDetails" with values to save model portfolio as given below
| BlockNumber | Key             | Value                    |
|           1 | TerminationDate | 2023-12-26T06:56:11.258Z |
|           1 | RehireDate      |                          |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 3 following errors 
	| error_code | error_message                                                                      |
	| EM069      | New employee added with Date of Termination. Please confirm.                       |
	| EM068      | The Employee's Most Recent Term Date is more than 90 days prior to current date.   |
	| EM044      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number | Scenario: 20480 To verify the ZipCode field  value with Alphanumerics in Create Mode of Employee Information Page


#**********************
#@PlanActivation
#Scenario: positive case
#  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
#  When Configuration has been made as per following
#| key       | value       |
#| companyId | <CompanyId> |
#| classificationId     | <CompEmpClassId>     |
#| classificationTypeId | <CompEmpClassTypeId> |
#| payrollFrequencyId   | <DailyFreqId>        |
#| employmentStatusId   | <ActiveStatusId>     |
#When Collection in a model is configured with 1 blocks for the property "EmployeeClassifications" with values as given below
#| BlockNumber | Key                  | Value                |
#|           1 | ClassificationTypeId | <CompEmpClassTypeId> |
#|           1 | ClassificationId     | <CompEmpClassId>     |
#When Configuration has been made as per following
#| key       | value |
#| firstName | Rock  |
#When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
#Then API should respond with successful message

