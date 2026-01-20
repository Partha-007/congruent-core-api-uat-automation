Feature: A_Employee
[BeforeTestRun]

Scenario: 20392 To verify the Address 1 field  value name with Null  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                    | value                |
| address1               |                      |
| additionalCity         |                      |
| additionalCountry      |                      |
| additionalCountryId    |                      |
| additionalAddressOne   |                      |
| additionalState        |                      |
| additionalStateId      |                      |
| additionalZipcode      |                      |
| additionalAddressName  | random 51 alphabets  |
| additionalForeignState | random 36 alphabets  |
| companyId              |                      |
| country                |                      |
| additionalAddressOne   | random 151 alphabets |
| additionalAddressTwo   | random 36 alphabets  |
| additionalAddressThree | random 36 alphabets  |
| accountHolderName      |                      |
| bankAccountName        |                      |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 13 following errors 
	| error_code | error_message                                  |
	| EM017      | Required                                       |
	| EM140      | Required                                       | Scenario: To verify the Additional Address City field Mandatory validation in Create Mode of Employee Information Page
	| EM163      | Required                                       | Scenario: To verify the Additional Address Country field Mandatory validation in Create Mode of Employee Information Page
	| EM155      | Required                                       | Scenario: To verify the Additional Address 1 field Mandatory validation in Create Mode of Employee Information Page
	| EM163      | Required                                       | Scenario: To verify the Additional State field Mandatory validation in Create Mode of Employee Information Page
	| EM150      | Required                                       | Scenario: To verify the Additional Zipcode field Mandatory validation in Create Mode of Employee Information Page
	| EM154      | Address name should be less than 50 characters | Scenario: To verify the Additional Address Name field  value length validation in Create Mode of Employee Information Page
	| EM149      | State name should not exceed 35 characters.    | Scenario: To verify the Additional State Name field  value length validation in Create Mode of Employee Information Page
	| EM022      | Required                                       | Scenario: To verify the Company field  value length validation in Create Mode of Employee Information Page
	| EM163      | Required                                       | Scenario: To verify the Country field  value length validation in Create Mode of Employee Information Page
	| EM137      | Address 1 should not exceed 150 characters.    | Scenario: To verify the Additional Address 1 field  value length validation in Create Mode of Employee Information Page
	| EM138      | Address 2 should not exceed 35 characters.     | Scenario: To verify the Additional Address 2 field  value length validation in Create Mode of Employee Information Page
	| EM139      | Address 3 should not exceed 35 characters.     | Scenario: To verify the Additional Address 3 field value length validation in Create Mode of Employee Information Page
	| EM217      | Required.                                      | Scenario: 110170 To verify the bankAccountHolderName field  value name with Null  in Create Mode of Employee Information Page
	| EM215      | Required.                                      |Scenario:To verify the bankAccountName field  value name with Null  in Create Mode of Employee Information Page

Scenario: To verify the Additional ZipCode field  value length validation in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value               |
| additionalZipcode | random 37 numerics  |
| country           | Others              |
| countryId         |                   2 |
| foreignCountry    |                     |
| additionalCity    | random 36 alphabets |
| accountHolderName | random 10 numerics  |
| bankAccountName | random 51 alphabets  |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 3 following errors 
	| error_code | error_message                                                 |
	| EM152      | ZIP Code should not exceed 36 characters.                     |
	| EM021      | Required                                                      | Scenario: To verify the Foreign Country field value length validation in Create Mode of Employee Information Page
	| EM142      | City name should not exceed 35 characters.                    | Scenario: To verify the Additional City field  value length validation in Create Mode of Employee Information Page
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only. | Scenario: 110172 To verify the bankAccountHolderName field with numerics of below 10  in Create Mode of Employee Information Page
	| EM188      | Bank Name should not exceed 50 characters.                    |Scenario:To verify the bankAccountName field with alphabets of above 50  in Create Mode of Employee Information Page


Scenario: To verify the Additional ZipCode field  value format validation in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                      | value                       |
| additionalZipcode        |                         123 |
| additionalCity           | random 10 specialCharacters |
| additionalForeignCountry | random 31 alphabets         |
| address1                 | random 151 alphabets        |
| address2                 | random 36 alphabets         |
| address3                 | random 40 alphabets         |
| accountHolderName        | random 10 specialCharacters |
| bankAccountName        | random 10 numerics |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                                                      |
	| EM153      | ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number |
	| EM143      | City name should have spaces, dot, hyphen, (‘) and letters only.                   | Scenario: To verify the Additional City field  value Character acceptance in Create Mode of Employee Information Page
	| EM146      | Country name should not exceed 30 characters.                                      | Scenario: To verify the Additional Country field  value Character acceptance in Create Mode of Employee Information Page
	| EM048      | Address 1 should not exceed 150 characters.                                        | Scenario: 20402 To verify the Address 1 field  value with above 150 characters in Create Mode of Employee Information Page
	| EM049      | Address 2 should not exceed 35 characters.                                         | Scenario: 20413 To verify the Address 2 field  value with above 35 characters in Create Mode of Employee Information Page
	| EM050      | Address 3 should not exceed 35 characters.                                         | Scenario: 20424 To verify the Address 3 field  value with above 35 characters in Create Mode of Employee Information Page
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only                       | Scenario: 110173 To verify the bankAccountHolderName field with special characrets of below 10  in Create Mode of Employee Information Page
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                                | Scenario:To verify the bankAccountName field with numerics of  10  in Create Mode of Employee Information Page


Scenario: 110174 To verify the bankAccountHolderName field with alphaNumerics of below 10  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                   |
| accountHolderName | random 10 alphanumerics |
| bankAccountName | random 10 specialCharacters |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                                |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only |
	| EM187      | Bank Name contains hyphen ,spaces and letters only.          |Scenario:To verify the bankAccountName field with specialCharacters of  10  in Create Mode of Employee Information Page


Scenario:To verify the bankAccountHolderName field with alphaNumericWithSpecialCharacters of below 10  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                      | value                       |
| accountHolderName        | random 10 alphaNumericWithSpecialCharacters |
| bankAccountName        | random 10 alphaNumericWithSpecialCharacters |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                                |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only |
	| EM187      | Bank Name contains hyphen ,spaces and letters only.          |Scenario:To verify the bankAccountName field with alphaNumericWithSpecialCharacters of  10  in Create Mode of Employee Information Page


Scenario:To verify the bankAccountHolderName field with alphabets of above 150 characters  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/v1/Payroll/SaveEmployee"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                   |
| accountHolderName | random 151 alphabets    |
| bankAccountName   | random 10 alphaNumerics |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                         |
	| EM218      | Account Holder Name should not exceed 150 characters. |
	| EM187      | Bank Name contains hyphen ,spaces and letters only.   |Scenario:To verify the bankAccountName field with alphaNumerics of  10  in Create Mode of Employee Information Page




Scenario: 20393 To verify the Address 1 field  value with lower case in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value               |
| address1          | <Address1>          |
| address2          | <Address2>          |
| address3          | <Address3>          |
| accountHolderName | <AccountHolderName> |
When API request has been sent to the "IEmployee" with the method name "SaveEmployeeAsync"
Then API should respond with successful message

Examples: 
| Address1                                    | Address2                                    | Address3                                    | AccountHolderName    |
| abc                                         |                                             |                                             | random 10 alphabets  |
| abc                                         | abc                                         | abc                                         | random 100 alphabets |
| ABC                                         | ABC                                         | ABC                                         | random 150 alphabets |
| ABc                                         | ABc                                         | ABc                                         | random 10 alphabets  |
| random 10 numerics                          | random 10 numerics                          | random 10 numerics                          | random 10 alphabets  |
| random 10 specialCharacters                 | random 10 specialCharacters                 | random 10 specialCharacters                 | random 10 alphabets  |
| random 10 alphaNumerics                     | random 10 alphaNumerics                     | random 10 alphaNumerics                     | random 10 alphabets  |
| random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | random 10 alphabets  |
| random 30 alphabets                         | random 30 alphabets                         | random 30 alphabets                         | random 10 alphabets  |
| random 150 alphabets                        | random 35 alphabets                         | random 35 alphabets                         | random 10 alphabets  |
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
