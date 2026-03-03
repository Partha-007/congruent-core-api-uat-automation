Feature: CombinedFileValidations

As a CORE user, I want to validate the payroll file upload


@PlanActivationWithoutInvestmentAndEnrollment

Scenario: CMB001: To verify the FirstName,LastName,BirthDate,HireDate,Address1,City,Country with Null in combined template

Given Investment "SEAS001" has been mapped to the plan

And Investment "SEAS002" has been mapped to the plan

And Enrollment configuration

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key        | Value |
| FIRST NAME |       |
| LAST NAME  |       |
| BIRTH DATE |       |
| HIRE DATE  |       |
| ADDRESS 1  |       |
| ADDRESS 2  |       |
| CITY       |       |
| COUNTRY    |       |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "firstName" with Error report message as "EM000 : First Name is required." and ECR page message as "EM013 : Required"
And Payroll API should respond for "lastName" with Error report message as "EM001 : Last Name is required." and ECR page message as "EM014 : Required"
And Payroll API should respond for "countryId" with Error report message as "EM008 : Country is required." and ECR page message as "EM021 : Required"
And Payroll API should respond for "birthDate" with Error report message as "EM002 : Employee's Date of Birth in the format mm/dd/yyyy is required." and ECR page message as "EM015 : Required"
And Payroll API should respond for "hireDate" with Error report message as "EM010 : Employee's Hire Date in the format mm/dd/yyyy is required." and ECR page message as "EM023 : Required"
And Payroll API should respond for "address1" with Error report message as "EM004 : Employee's Address is required." and ECR page message as "EM017 : Required"
#And Payroll API should respond for "city" with Error report message as "EM105 : City is Required" and ECR page message as "EM104 : Required"
#And Payroll API should respond for "zipCode" with Error report message as "EM006 : Zip Code is Required" and ECR page message as "EM019 : Required"


@PlanActivationWithoutInvestmentAndEnrollment
Scenario: CMB002: To verify the RehireDate,Address1,length of firstname,lastname, with Null in combined template

Given Investment "SEAS001" has been mapped to the plan

And Investment "SEAS002" has been mapped to the plan

And Enrollment configuration

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                     | Value                                                                                                                                                   |
| FIRST NAME              | QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPR |
| LAST NAME               | QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPR |
| HIRE DATE               | 01-01-2026                                                                                                                                              |
| MOST RECENT TERM DATE   | 01-02-2026                                                                                                                                              |
| MOST RECENT REHIRE DATE |                                                                                                                                                         |
| ADDRESS 1               |                                                                                                                                                         |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "firstName" with Error report message as "EM027 : First Name should not exceed 150 characters." and ECR page message as "EM027 : First Name should not exceed 150 characters."
And Payroll API should respond for "lastName" with Error report message as "EM031 : Last Name should not exceed 150 characters." and ECR page message as "EM031 : Last Name should not exceed 150 characters."
And Payroll API should respond for "reHireDate" with Error report message as "EM133 : Rehire Date Required" and ECR page message as "EM132 : Required"
And Payroll API should respond for "address1" with Error report message as "EM012 : Review if Address 2 is necessary. Complete Address 1, then determine if Address 2 is needed." and ECR page message as "EM025 : Required"


@PlanActivationWithoutInvestmentAndEnrollment
Scenario: CMB003: To verify the Firstname, Lastname, address1, with special characters in combined template

Given Investment "SEAS001" has been mapped to the plan

And Investment "SEAS002" has been mapped to the plan

And Enrollment configuration

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                   | Value |
| FIRST NAME            | !@#$% |
| LAST NAME             | !@#$% |
| CITY                  | !@#$% |
| PRIMARY PHONE NUMBER  | !@#$% |
| PRIMARY EMAIL ADDRESS | !@#$% |
| ZIP CODE              | !@#$% |
| GENDER                | !@#$% |
| MARITAL STATUS        | !@#$% |



When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "firstName" with Error report message as "EM026 : First Name should have spaces, hyphen, (') and letters only." and ECR page message as "EM026 : First Name should have spaces, hyphen, (') and letters only."
And Payroll API should respond for "lastName" with Error report message as "EM030 : Last Name should have spaces, dot, hyphen, (‘), (,) and letters only." and ECR page message as "EM030 : Last Name should have spaces, dot, hyphen, (‘), (,) and letters only."
And Payroll API should respond for "city" with Error report message as "EM035 : City name should have spaces, dot, hyphen, (‘) and letters only." and ECR page message as "EM035 : City name should have spaces, dot, hyphen, (‘) and letters only."
And Payroll API should respond for "mobilePhoneNumber" with Error report message as "EM036 : Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number" and ECR page message as "EM036 : Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number"
And Payroll API should respond for "primaryEmailAddress" with Error report message as "EM040 : Email ID is invalid." and ECR page message as "EM040 : Email ID is invalid."
And Payroll API should respond for "zipCode" with Error report message as "EM044 : ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number" and ECR page message as "EM044 : ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number"
And Payroll API should respond for "gender" with Error report message as "EM032 : Gender is not valid" and ECR page message as "EM032 : Gender is not valid"
And Payroll API should respond for "maritalStatus" with Error report message as "EM033 : Invalid Marital Status." and ECR page message as "EM033 : Invalid Marital Status."
And Payroll API should respond for "maritalStatus" with Error report message as "EM249 : Marital Status is required." and ECR page message as "EM248 : Required"





