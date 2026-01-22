Feature: A_BeneficiaryDetails
[BeforeTestRun]

#Scenario: To Verify the data acceptance for Routing number field when user enters a numerics - create mode
#Scenario: To Verify the data acceptance for Routing number field when user enters a numerics - create mode
Scenario: To verify the Most recent Term Date  value with valid date format of Current date + 29 date MM/DD/YYYY in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                |
| address1          | <Address1>           |
| address2          | <Address2>           |
| address3          | <Address2>           |
| accountNumber     | <AccountNumber>      |
| accountHolderName | <AccountHolderName>  |
| accountName       | <AccountName>        |
| accountType       | <AccountType>        |
| city              | <City>               |
| country           |                    2 |
| foreignCountry    | <ForeignCountry>     |
| foreignState      | <ForeignState>       |
| zipCode           | <ZipCode>            |
| name              | random 150 alphabets | Scenario:To verify the beneficiaryName field  value with equal 150 alphaebts  in Create Mode of Employee Information Page
| routingNumber     | random 9 numerics    |
| email             | <Email>              |
When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then API should respond with successful message
Examples: 																				  
| Address1                                    | Address2                                    | Address3                                    | AccountNumber      | AccountHolderName    | AccountName         | AccountType | City                | ForeignCountry                              | ForeignState                               | ZipCode                              | Email                                                                            |
| random 149 alphabets                        |                                             |                                             | random 10 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 10 alphabets | random 5 alphabets                          | random 5 alphabets                         | abc123                               | abc@core.com                                                                     |
| random 150 alphabets                        | random 30 alphabets                         | random 30 alphabets                         | random 10 numerics | random 150 alphabets | random 50 alphabets |           2 | random 30 alphabets | random 30 alphabets                         | random 34 alphabets                        | 1234567890qwertyuio                  | adf123@core.com                                                                  |
| random 10 alphabets                         | random 35 alphabets                         | random 35 alphabets                         | random 18 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 35 alphabets | random 25 alphabets                         | random 35 alphabets                        | 123456789012345678901234567890abcdef | testbeneficiary@test.com                                                         |
| random 10 numerics                          | random 10 alphabets                         | random 10 alphabets                         | random 10 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 10 alphabets | random 5 alphabets                          | random 5 alphabets                         | abc123                               | beneficiarytestbeneficiarytestbeneficiarytestbeneficiarytestbeneficiary@test.com |
| random 10 specialCharacters                 | random 10 numerics                          | random 10 numerics                          | random 10 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 10 alphabets | random 5 numerics                           | random 5 specialCharacters                 | abc123                               | abc1@core.com                                                                    |
| random 10 alphaNumerics                     | random 10 specialCharacters                 | random 10 specialCharacters                 | random 10 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 10 alphabets | random 5 specialCharacters                  | random 5 alphaNumerics                     | abc123                               | abc2@core.com                                                                    |
| random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumerics                     | random 10 alphaNumerics                     | random 10 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 10 alphabets | random 30 alphaNumerics                     | random 5 numerics                          | abc123                               | abc4@core.com                                                                    |
| random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | random 10 alphaNumericWithSpecialCharacters | random 10 numerics | random 10 alphabets  | random 10 alphabets |           1 | random 10 alphabets | random 30 alphaNumericWithSpecialCharacters | random 5 alphaNumericWithSpecialCharacters | abc123                               | abc3@core.com                                                                    |

#Scenario:To verify the address1 field  value with below 150 alphaebts  in Create Mode of Employee Information Page
#Scenario:To verify the address1 field  value with equal 150 alphaebts  in Create Mode of Employee Information Page
#Scenario:To verify the address1 field  value with alphabets  in Create Mode of Employee Information Page
#Scenario:To verify the address1 field  value with numerics  in Create Mode of Employee Information Page
#Scenario:To verify the address1 field  value with specialCharacters  in Create Mode of Employee Information Page
#Scenario:To verify the address1 field  value with alphaNumerics  in Create Mode of Employee Information Page
#Scenario:To verify the address1 field  value with alphaNumericWithSpecialCharacters  in Create Mode of Employee Information Page

#Scenario:To verify the address2 field  value with Null  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with below 35 alphaebts  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with equal 35 alphaebts  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with alphabets  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with numerics  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with specialCharacters  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with alphaNumerics  in Create Mode of Employee Information Page
#Scenario:To verify the address2 field  value with alphaNumericWithSpecialCharacters  in Create Mode of Employee Information Page

#Scenario:To verify the address3 field  value with Null  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with below 35 alphaebts  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with equal 35 alphaebts  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with alphabets  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with numerics  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with specialCharacters  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with alphaNumerics  in Create Mode of Employee Information Page
#Scenario:To verify the address3 field  value with alphaNumericWithSpecialCharacters  in Create Mode of Employee Information Page

#Scenario:To Verify the data acceptance of  Bank Account Number field when user enters numerics  - create mode
#Scenario:To verify the BeneficiaryBankaAccountNumber field with Numerics of below 18  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryBankaAccountNumber field with Numerics of equal 18 in Create Mode of Employee Information Page

#Scenario:To verify the BeneficiaryBankAccountHolderName field with alphabets in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryBankAccountHolderName field with alphabets of equal 150 characters  in Create Mode of Employee Information Page

#Scenario:To verify the BeneficiaryBankAccountName field with alphabets of below 50  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryBankAccountName field with alphabets of equal 50  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryBankAccountName field with alphabets  in Create Mode of Employee Information Page

#Scenario:To verify the BeneficiaryBankaccountType field with savingsaccount  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryBankaccountType field with checkingaccount  in Create Mode of Employee Information Page

#Scenario:To verify the city field  value with valid alphabets  in Create Mode of Employee Information Page
#Scenario:To verify the city field  value with below 35 alphabets  in Create Mode of Employee Information Page
#Scenario:To verify the city field  value with equal 35 alphabets  in Create Mode of Employee Information Page

#Scenario:To verify the BeneficiaryForiegnCountry field with valid value  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with equal of 30 characters  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with below of 30 characters  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with alphabets  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with numerics  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with specialCharacters  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with alphaNumerics  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnCountry field  with alphaNumericWithSpecialCharacters  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnState field  with alphabets  in Create Mode of Employee Information Page
#Scenario:To Verify the length acceptance of Foreign State field when value is below 35 characters  - create mode
#Scenario:To Verify the length acceptance of Foreign State field when value is equal to 35 characters  - create mode
#Scenario:To verify the BeneficiaryForiegnState field  with numerics  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnState field  with special characters  in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnState field  with alphanumerics in Create Mode of Employee Information Page
#Scenario:To verify the BeneficiaryForiegnState field  with alphanumerics with special characters in Create Mode of Employee Information Page

#Scenario: To Verify the data acceptance Foreign Zipcode when user enters alpha numerics  - create mode
#Scenario: To Verify the length acceptance of Foreign Zipcode when value is below 36 characters  - create mode
#Scenario: To Verify the length acceptance of Foreign Zipcode when value is equal 36 characters  - create mode

#Scenario: To Verify the length accpetance of Email field when user enter Alphabets - create mode
#Scenario: To Verify the length accpetance of Email field when user enter alphanumerics - create mode
#Scenario:To verify the beneficiaryEmail field  value name with valid email  in Create Mode of Employee Information Page
#Scenario:To verify the beneficiaryEmail field  value name equal 80 characters in Create Mode of Employee Information Page


Scenario:To verify the address1 field  value with Null  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value |
| address1          |       |
| accountNumber     |       |
| accountHolderName |       |
| accountName       |       |
| accountType       |       |
| city              |       |
| country           |       |
| name              |       |
| routingNumber     |       |
| email             |       |
| phoneNumber       |       |
When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| EM192      | Required.     |
	| EM189      | Required.     | Scenario:To verify the BeneficiaryBankaAccountNumber field  value name with Null  in Create Mode of Employee Information Page
	| EM217      | Required.     | Scenario:To verify the BeneficiaryBankAccountHolderName field  value name with Null  in Create Mode of Employee Information Page
	| EM215      | Required.     | Scenario:To verify the BeneficiaryBankAccountName field  value name with Null  in Create Mode of Employee Information Page
	| EM191      | Required.     | Scenario:To verify the BeneficiaryBankaccountType field  value name with Null  in Create Mode of Employee Information Page
	| EM193      | Required.     | Scenario:To verify the city field  value with Null  in Create Mode of Employee Information Page
	| EM196      | Required.     | Scenario:To verify the BeneficiaryCountry field  value with Null  in Create Mode of Employee Information Page
	| EM201      | Required.     | Scenario:To verify the beneficiaryName field  value name with Null  in Create Mode of Employee Information Page
	| EM211      | Required.     | Scenario:To verify the BeneficiaryRoutingNumber field  value name with Null  in Create Mode of Employee Information Page
	| EM232      | Required.     | Scenario:To verify the beneficiaryEmail field  value name with Null  in Create Mode of Employee Information Page
	| EM203      | Required.     |Scenario:To verify the phoneNumber field  value name with Null  in Create Mode of Employee Information Page


Scenario:To verify the address1 field  value with above 150 alphaebts  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                |
| address1          | random 151 alphabets |
| address2          | random 36 alphabets  |
| address3          | random 36 alphabets  |
| accountNumber     | random 10 alphabets  |
| accountHolderName | random 10 numerics   |
| accountName       | random 51 alphabets  |
| city              | random 10 numerics   |
| country           |                    2 |
| foreignCountry    |                      |
| foreignState      |                      |
| zipCode           |                      |
| name              | random 151 alphabets |
| routingNumber     | random 9 alphabets   |
| email             | 123core34com         |
| phoneNumber       | random 10 alphabets  |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                 |
	| EM225      | Address 1 should not exceed 150 characters.                   |
	| EM226      | Address 2 should not exceed 35 characters.                    | Scenario:To verify the address2 field  value with above 35 alphaebts  in Create Mode of Employee Information Page
	| EM227      | Address 3 should not exceed 35 characters.                    | Scenario:To verify the address3 field  value with above 35 alphaebts  in Create Mode of Employee Information Page
	| EM260      | Bank account number must contain only numeric digits (0–9)    | Scenario:To Verify the data acceptance of  Bank Account Number field when user enters alphabet  - create mode
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only. | Scenario:To verify the BeneficiaryBankAccountHolderName field with numerics  in Create Mode of Employee Information Page
	| EM188      | Bank Name should not exceed 50 characters.                    | Scenario:To verify the BeneficiaryBankAccountName field with alphabets of above 50  in Create Mode of Employee Information Page
	| EM194      | City name should have spaces, dot, hyphen and letters only.   | Scenario:To verify the city field  value with valid numerics  in Create Mode of Employee Information Page
	| EM199      | Required.                                                     | Scenario:To verify the BeneficiaryForiegnCountry field  with Null value  in Create Mode of Employee Information Page
	| EM200      | Required                                                      | Scenario:To verify the BeneficiaryForiegnState field  with null  in Create Mode of Employee Information Page
	| EM208      | Required.                                                     | Scenario: To Verify  validation message when user enters null value in Foreign Zipcode  - create mode
	| EM235      | Beneficiary Name should not be greater than 150 characters.   | Scenario:To verify the beneficiaryName field  value with above 150 alphaebts  in Create Mode of Employee Information Page
	| EM261      | Routing number must contain only numeric digits (0–9).        | Scenario: To Verify the data acceptance for Routing number field when user enters a alphabet - create mode
	| EM233      | Email Id is invalid.                                          | Scenario: To Verify the length accpetance of Email field when user enter numerics - create mode
	| EM203      | Required.                                                     |Scenario:To Verify the data acceptance of Phone number field when user enters Alphabets - create mode


Scenario:To Verify the data acceptance of  Bank Account Number field when user enters special characters  - create mode
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                       |
| accountNumber     | random 10 specialCharacters |
| accountHolderName | random 10 specialCharacters |
| accountName       | random 10 numerics          |
| city              | random 10 specialCharacters |
| country           |                           2 |
| foreignCountry    | random 31 alphabets         |
| foreignState      | random 36 alphabets         |
| zipCode           | abcde-fghi                  |
| name              | random 15 numerics          |
| routingNumber     | random 9 specialCharacters  |
| email             | #$%@corecom                 |
| phoneNumber       | random 10 specialCharacters  |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                      |
	| EM260      | Bank account number must contain only numeric digits (0–9)         |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only.      | Scenario:To verify the BeneficiaryBankAccountHolderName field with special characrets  in Create Mode of Employee Information Page
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                | Scenario:To verify the BeneficiaryBankAccountName field with numerics  in Create Mode of Employee Information Page
	| EM194      | City name should have spaces, dot, hyphen and letters only.        | Scenario:To verify the city field  value with valid specialCharacters  in Create Mode of Employee Information Page
	| EM197      | Country name should not be greater than 30 characters.             | Scenario:To verify the BeneficiaryForiegnCountry field  with above of 30 characters  in Create Mode of Employee Information Page
	| EM207      | State name should not be greater than 35 characters.               | Scenario:To Verify the length acceptance of Foreign State field when value is above 35 characters  - create mode
	| EM230      | Zipcode contains Alphanumeric only.                                | Scenario: To Verify the data acceptance Foreign Zipcode when user enters alphabets  - create mode
	| EM202      | Beneficiary Name should have spaces, hyphen, (‘) and letters only. | Scenario:To verify the beneficiaryName field  value with numerics  in Create Mode of Employee Information Page
	| EM261      | Routing number must contain only numeric digits (0–9).             | Scenario: To Verify the data acceptance for Routing number field when user enters a special charaters - create mode
	| EM233      | Email Id is invalid.                                               | Scenario: To Verify the length accpetance of Email field when user enter special characters - create mode
	| EM203      | Required.                                                          |Scenario:To Verify the data acceptance of Phone number field when user enters special characters - create mode


Scenario:To Verify the data acceptance of  Bank Account Number field when user enters alphanumerics   - create mode
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                       |
| accountNumber     | random 10 alphaNumerics     |
| accountHolderName | random 10 alphaNumerics     |
| accountName       | random 10 specialCharacters |
| city              | random 10 alphaNumerics     |
| country           |                           1 |
| stateId           |                             | Scenario: To Verify the validation message when State field is empty - create mode
| name              | random 15 specialCharacters |
| routingNumber     | random 9 alphaNumerics      |
| email             | adf123#$@@core.com          |
| phoneNumber       | random 10 alphaNumerics     |
| zipCode           |                             |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                      |
	| EM260      | Bank account number must contain only numeric digits (0–9)         |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only.      | Scenario:To verify the BeneficiaryBankAccountHolderName field with alphaNumerics  in Create Mode of Employee Information Page
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                | Scenario:To verify the BeneficiaryBankAccountName field with specialCharacters  in Create Mode of Employee Information Page
	| EM194      | City name should have spaces, dot, hyphen and letters only.        | Scenario:To verify the city field  value with valid alphaNumerics  in Create Mode of Employee Information Page
	| EM206      | Required.                                                          | Scenario:To verify the BeneficiaryState field  value with Null  in Create Mode of Employee Information Page
	| EM202      | Beneficiary Name should have spaces, hyphen, (‘) and letters only. | Scenario:To verify the beneficiaryName field  value with specialCharacters  in Create Mode of Employee Information Page
	| EM261      | Routing number must contain only numeric digits (0–9).             | Scenario: To Verify the data acceptance for Routing number field when user enters a alphanumerics - create mode
	| EM233      | Email Id is invalid.                                               | Scenario: To Verify the length accpetance of Email field when user enter alphanumerics with special characters - create mode
	| EM203      | Required.                                                          | Scenario:To Verify the data acceptance of Phone number field when user enters  alphanumerics - create mode
	| EM208      | Required.                                                          |Scenario: To Verify the validation message when Zipcode field is empty  - create mode


Scenario:To Verify the data acceptance of  Bank Account Number field when user enters alphanumerics with special characters  - create mode
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                                       |
| accountNumber     | random 10 alphaNumericWithSpecialCharacters |
| accountHolderName | random 10 alphaNumericWithSpecialCharacters |
| accountName       | random 10 alphaNumerics                     |
| city              | random 10 alphaNumericWithSpecialCharacters |
| country           |                                           2 |
| zipCode           | 12345-6789                                  |
| name              | random 15 alphaNumerics                     |
| routingNumber     | random 9 alphaNumericWithSpecialCharacters  |
| email             | testbeneficiary                             |
| phoneNumber       | random 10 alphaNumericWithSpecialCharacters |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                      |
	| EM260      | Bank account number must contain only numeric digits (0–9)         |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only.      | Scenario:To verify the BeneficiaryBankAccountHolderName field with alphaNumericWithSpecialCharacters  in Create Mode of Employee Information Page
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                | Scenario:To verify the BeneficiaryBankAccountName field with alphaNumerics in Create Mode of Employee Information Page
	| EM194      | City name should have spaces, dot, hyphen and letters only.        | Scenario:To verify the city field  value with valid alphaNumericWithSpecialCharacters  in Create Mode of Employee Information Page
	| EM230      | Zipcode contains Alphanumeric only.                                | Scenario: To Verify the data acceptance Foreign Zipcode when user enters numerics  - create mode
	| EM202      | Beneficiary Name should have spaces, hyphen, (‘) and letters only. | Scenario:To verify the beneficiaryName field  value with alphaNumerics  in Create Mode of Employee Information Page
	| EM261      | Routing number must contain only numeric digits (0–9).             | Scenario: To Verify the data acceptance for Routing number field when user enters a alphanumerics with special characters - create mode
	| EM233      | Email Id is invalid.                                               | Scenario:To verify the beneficiaryEmail field  value name with invalid  in Create Mode of Employee Information Page
	| EM203      | Required                                                           |Scenario:To Verify the data acceptance of Phone number field when user enters alphanumerics with special characters - create mode





Scenario:To verify the BeneficiaryBankaAccountNumber field with Numerics of above 18 in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                                       |
| accountNumber     | random 19 numerics                          |
| accountHolderName | random 10 numerics                          |
| accountName       | random 10 alphaNumericWithSpecialCharacters |
| city              | random 36 alphabets                         |
| country           |                                           2 |
| zipCode           | ^%$#@                                       |
| dateOfBirth       | 1/1/2022                                    |
| name              | random 15 alphaNumericWithSpecialCharacters |
| routingNumber     | random 10 numerics                          |
| email             | testbeneficiary@                            |
| phoneNumber       | random 9 numerics |


When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                      |
	| EM190      | Bank account Number should not exceed 18 characters.               |
	| EM219      | Account Holder Name contains hyphen ,spaces and letters only.      | Scenario:To verify the BeneficiaryBankAccountHolderName field with numerics of below 15  in Create Mode of Employee Information Page
	| EM187      | Bank Name contains hyphen ,spaces and letters only.                | Scenario:To verify the BeneficiaryBankAccountName field with alphaNumericWithSpecialCharacters in Create Mode of Employee Information Page
	| EM195      | City name should not be greater than 35 characters.                | Scenario:To verify the city field  value with above 35 alphabets  in Create Mode of Employee Information Page
	| EM230      | Zipcode contains Alphanumeric only.                                | Scenario: To Verify the data acceptance Foreign Zipcode when user enters special characters  - create mode
	| EM228      | Age of the beneficiary cannot be less than 16 years.               | Scenario: To verify the Date of Birth field  if user tries to enter date below 16 years of age - create mode
	| EM202      | Beneficiary Name should have spaces, hyphen, (‘) and letters only. | Scenario:To verify the beneficiaryName field  value with alphaNumericswithspecialcharacters  in Create Mode of Employee Information Page
	| EM212      | Routing number should be 9 characters.                             | Scenario:To verify the BeneficiaryRoutingNumber field with numerics of above 9  in Create Mode of Employee Information Page
	| EM233      | Email Id is invalid.                                               | Scenario:To Verify the format of Email field incomplete value- create mode
	| EM205      | Phone Number must be in a valid format – XXX-XXX-XXXX.             |Scenario:To verify the phoneNumber field  value name with below 10 digits  in Create Mode of Employee Information Page

Scenario:To verify the BeneficiaryBankAccountHolderName field with alphabets of above 150 characters  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                |
| accountHolderName | random 151 alphabets |
| country           |                    2 |
| zipCode           | abc12-#$@#           |
| dateOfBirth       | 1/1/2030             |
| email             | testbeneficiary.     |
| phoneNumber       | random 11 numerics |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                          |
	| EM218      | Account Holder Name should not exceed 150 characters.  |
	| EM230      | Zipcode contains Alphanumeric only.                    | Scenario: To Verify the data acceptance Foreign Zipcode when user enters alpha numerics with special characters  - create mode
	| EM229      | Date of Birth must be prior to the current date.       | Scenario: To verify the Date of Birth field value with valid date format of future date MM/DD/YYYY- create mode
	| EM233      | Email Id is invalid.                                   | Scenario:To Verify the format of Email field with dot - create mode
	| EM205      | Phone Number must be in a valid format – XXX-XXX-XXXX. |Scenario:To verify the phoneNumber field  value name with above 10 digits  in Create Mode of Employee Information Page

#Scenario: To Verify the length acceptance when values are equal 5 characters in Zipcode field - create mode
#Scenario:To Verify the data acceptance of Phone number field when user enters numerics - create mode
#Scenario:To verify the phoneNumber field  value name with equal 9 digits  in Create Mode of Employee Information Page
#Scenario:To verify the beneficiaryName field  value name with below 150 alphaebts  in Create Mode of Employee Information Page
#Scenario: To Verify the of valid format of  Date of Birth field - create mode
#Scenario:To verify the BeneficiaryRoutingNumber field with numerics of below 9  in Create Mode of Employee Information Page
Scenario:To verify the BeneficiaryCountry field  value USA  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key           | value                |
| country       |                    1 |
| dateOfBirth   | 1/1/2000             |
| name          | random 149 alphabets |
| routingNumber | random 7 numerics    |
| phoneNumber   | 987-908-1234         |
| zipCode       |                12345 |
When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then API should respond with successful message

Scenario: To Verify the length acceptance of Foreign Zipcode when value is above 36 characters  - create mode
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                                                                                               |
| accountHolderName | random 151 alphabets                                                                                |
| country           |                                                                                                   2 |
| zipCode           | 123456789012345678901234567890abcdefh                                                               |
| dateOfBirth       | days_0                                                                                              |
| email             | testbeneficiarytestbeneficiarytestbeneficiarytestbeneficiarytestbeneficiarytestbeneficiary@test.com |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                      |
	| EM210      | ZIP Code should not be greater than 36 characters. |
	| EM229      | Date of Birth must be prior to the current date.   | Scenario: To verify the Date of Birth field value with valid date format of Current date MM/DD/YYYY- create mode
	| EM234      | Email Address should not exceed 80 characters.     |Scenario:To verify the beneficiaryEmail field  value name above 80 characters  in Create Mode of Employee Information Page


Scenario:To verify the beneficiaryName field  value name with alphabets  in Create Mode of Employee Information Page
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value               |
| name              | random 10 alphabets |
| type              |                   1 |
| relationshipType  |                   1 |
| phoneNumber       | 333-222-3434        |
| email             | test@test.com       |
| address1          | chennai             |
| address2          | chennai             |
| address3          | chennai             |
| city              | chennai             |
| country           |                   1 |
| state             |                   1 |
| postalCode        | random 5 numerics   |
| accountNumber     | random 10 numerics  |
| accountName       | random 10 alphabets |
| routingNumber     | random 9 numerics   |
| accountHolderName | random 10 alphabets |
| accountType       |                   1 |
| zipCode           |12345-6789          |
When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then API should respond with successful message
#Scenario: To Verify the data acceptance when user enter numerics in Zipcode field - create mode
#Scenario: To Verify the length acceptance when values are equal to  9 characters in Zipcode field - create mode



#dob mentioned as optional field
#Scenario: To verify the Date of Birth field value with valid date format of Current date MM/DD/YYYY- create mode


Scenario: To Verify the data acceptance when user enter alphabets in Zipcode field - create mode
  Given Model is selected for the endpoint "api/v1/Payroll/AddBeneficary"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key     | value     |
| country |         1 |
| zipCode | <ZipCode> |

When API request has been sent to the "IEmployee" with the method name "AddBeneficaryAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                               |
	| EM209      | ZIP Code must be in a valid format – XXXXX-XXXX or XXXXX, X being a number. |
Examples: 
| ZipCode    |
| abcde-fghi |
| !@#$%^&*&  | Scenario: To Verify the data acceptance when user enter special characters in Zipcode field - create mode
| abcde-1234 | Scenario: To Verify the data acceptance when user enter alphanumerics in Zipcode field - create mode
| ab123-@#g  | Scenario: To Verify the data acceptance when user enter alphanumerics with special characters in Zipcode field - create mode
|       1234 | Scenario: To Verify the length acceptance when values are below  5 characters in Zipcode field - create mode
|     123456 | Scenario: To Verify the length acceptance when values are above 5 characters in Zipcode field - create mode
|     123456 | Scenario: To Verify the length acceptance when values are below 9 characters in Zipcode field - create mode
|    1234567 | Scenario: To Verify the length acceptance when values are above 9 characters in Zipcode field - create mode
|     123456 |Scenario: To Verify the length acceptance when values are above 5 and below 9 characters in Zipcode field - create mode
