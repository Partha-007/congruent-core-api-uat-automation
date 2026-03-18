Feature: CombinedFileValidations

As a CORE user, I want to validate the payroll file upload




Scenario: CMB001: To verify the FirstName,LastName,BirthDate,HireDate,Address1,City,Country with Null in combined template

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| FIRST NAME         |           |
| LAST NAME          |           |
| BIRTH DATE         |           |
| HIRE DATE          |           |
| ADDRESS 1          |           |
| ADDRESS 2          |           |
| CITY               |           |
| COUNTRY            |           |
| ZIP CODE           |           |
| PAYROLL FREQUENCY  | Daily     |
| HOURS              |         0 |
| GROSS COMPENSATION |      -100 |
| PAY DATE           | 5-29-2023 |
| STATE              |           |
| SSN                |           |
| MARITAL STATUS     |           |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "firstName" with Error report message as "EM000 : First Name is required." and ECR page message as "EM013 : Required"
And Payroll API should respond for "lastName" with Error report message as "EM001 : Last Name is required." and ECR page message as "EM014 : Required"
And Payroll API should respond for "countryId" with Error report message as "EM008 : Country is required." and ECR page message as "EM021 : Required"
And Payroll API should respond for "birthDate" with Error report message as "EM002 : Employee's Date of Birth in the format mm/dd/yyyy is required." and ECR page message as "EM015 : Required"
And Payroll API should respond for "hireDate" with Error report message as "EM010 : Employee's Hire Date in the format mm/dd/yyyy is required." and ECR page message as "EM023 : Required"
And Payroll API should respond for "address1" with Error report message as "EM004 : Employee's Address is required." and ECR page message as "EM017 : Required"
#And Payroll API should respond for "city" with Error report message as "EM105 : City is Required" and ECR page message as "EM104 : Required"
#And Payroll API should respond for "zipCode" with Error report message as "EM006 : Zip Code is Required" and ECR page message as "EM019 : Required"
And Payroll API should respond for "payPeriodHours" with Error report message as "PY007 : Year to Date Hours is zero for an active employee" and ECR page message as "PY026 : YTD Hours is zero for an active employee. Enter the number of hours and click on ‘Submit’.  To continue without adding YTD hours click on ‘Accept Warning’."
And Payroll API should respond for "payPeriodGrossCompensation" with Error report message as "PY041 : Negative YTD Gross Compensation is not allowed." and ECR page message as "PY059 : A negative YTD gross compensation is not allowed. Please correct the YTD compensation amount and click ‘Submit’"
And Payroll API should respond for "state" with Error report message as "EM007 : State Name is Required" and ECR page message as "EM020 : Required"
And Payroll API should respond for "ssn" with Error report message as "EM003 : Social Security Number is required." and ECR page message as "EM016 : Required"
And Payroll API should respond for "maritalStatus" with Error report message as "EM249 : Marital Status is required." and ECR page message as "EM248 : Required."



Scenario: CMB002: To verify the RehireDate,Address1,length of firstname,lastname, with Null in combined template

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                     | Value                                                                                                                                                   |
| FIRST NAME              | QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPR |
| LAST NAME               | QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOPR |
| HIRE DATE               | 01-01-2026                                                                                                                                              |
| MOST RECENT TERM DATE   | 01-02-2026                                                                                                                                              |
| MOST RECENT REHIRE DATE |                                                                                                                                                         |
| ADDRESS 1               |                                                                                                                                                         |
| PAYROLL FREQUENCY       | Daily                                                                                                                                                   |
| HOURS                   |                                                                                                                                                     -57 |
| PLAN COMPENSATION       |                                                                                                                                                    -100 |
| PAY DATE                | 5-29-2023                                                                                                                                               |
| SSN                     |                                                                                                                                               111111111 |
| PRIMARY PHONE NUMBER    |                                                                                                                                                     123 |
| MIDDLE INITIAL          | qwertyuiopasdfghjklzx                                                                                                                                   |
| MARITAL STATUS          | Z                                                                                                                                                       |
| HCE INDICATOR           | s                                                                                                                                                       |
| GENDER                  | Z                                                                                                                                                       |
| COUNTRY                 | qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyu                                                                                               |
| PRIMARY EMAIL ADDRESS   | 123.com                                                                                                                                                 |
| CITY                    | qwertyuiopasdfghjklzxcvbnmqwertyuiop                                                                                                                    |
| BIRTH DATE              | +0 day                                                                                                                                                  |
| ADDRESS 3 | qwertyuiopqwertyuiopqwertyuiopqwerty |
| ADDRESS 2 | qwertyuiopqwertyuiopqwertyuiopqwerty |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "firstName" with Error report message as "EM027 : First Name should not exceed 150 characters." and ECR page message as "EM027 : First Name should not exceed 150 characters."
And Payroll API should respond for "lastName" with Error report message as "EM031 : Last Name should not exceed 150 characters." and ECR page message as "EM031 : Last Name should not exceed 150 characters."
And Payroll API should respond for "reHireDate" with Error report message as "EM133 : Rehire Date Required" and ECR page message as "EM132 : Required"
And Payroll API should respond for "address1" with Error report message as "EM012 : Review if Address 2 is necessary. Complete Address 1, then determine if Address 2 is needed." and ECR page message as "EM025 : Required"
And Payroll API should respond for "payPeriodHours" with Error report message as "PY001 : Year to Date Hours is negative" and ECR page message as "PY020 : Negative YTD Hours is not allowed. Please update or remove the YTD Hours value and click on 'Submit'"
And Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY042 : Negative YTD plan Compensation is not allowed." and ECR page message as "PY060 : A negative YTD plan compensation is not allowed. Please correct the YTD compensation amount and click ‘Submit'"
And Payroll API should respond for "ssn" with Error report message as "EM061 : Social Security Number digits all should not be same" and ECR page message as "EM061 : Social Security Number digits all should not be same"
And Payroll API should respond for "mobilePhoneNumber" with Error report message as "EM036 : Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number" and ECR page message as "EM036 : Primary Phone number must be in a valid format - XXX-XXX-XXXX or XXXXXXXXXX, X being a number"
And Payroll API should respond for "middleInitial" with Error report message as "EM102 : Middle Initial should not be greater than 20 characters." and ECR page message as "EM102 : Middle Initial should not be greater than 20 characters."
And Payroll API should respond for "maritalStatus" with Error report message as "EM033 : Invalid Marital Status." and ECR page message as "EM033 : Invalid Marital Status."
And Payroll API should respond for "hceIndicator" with Error report message as "EM051 : HCE Indicator is not valid" and ECR page message as "EM051 : HCE Indicator is not valid"
And Payroll API should respond for "gender" with Error report message as "EM032 : Gender is not valid" and ECR page message as "EM032 : Gender is not valid"
And Payroll API should respond for "countryId" with Error report message as "EM045 : Country name should not exceed 30 characters." and ECR page message as "EM045 : Country name should not exceed 30 characters."
And Payroll API should respond for "email" with Error report message as "EM040 : Email ID is invalid." and ECR page message as "EM040 : Email ID is invalid."
And Payroll API should respond for "city" with Error report message as "EM034 : City name should not exceed 35 characters." and ECR page message as "EM034 : City name should not exceed 35 characters."
And Payroll API should respond for "birthDate" with Error report message as "EM053 : Date of Birth must be prior to the current date." and ECR page message as "EM053 : Date of Birth must be prior to the current date."
And Payroll API should respond for "address3" with Error report message as "EM050 : Address 3 should not exceed 35 characters." and ECR page message as "EM050 : Address 3 should not exceed 35 characters."
And Payroll API should respond for "address2" with Error report message as "EM049 : Address 2 should not exceed 35 characters." and ECR page message as "EM049 : Address 2 should not exceed 35 characters."


Scenario: CMB003: To verify the Firstname, Lastname, address1, with special characters in combined template

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                   | Value                                                                             |
| FIRST NAME            | !@#$%                                                                             |
| LAST NAME             | !@#$%                                                                             |
| CITY                  | !@#$%                                                                             |
| PRIMARY PHONE NUMBER  | !@#$%                                                                             |
| PRIMARY EMAIL ADDRESS | !@#$%                                                                             |
| ZIP CODE              | !@#$%                                                                             |
| GENDER                | !@#$%                                                                             |
| MARITAL STATUS        | !@#$%                                                                             |
| PAYROLL FREQUENCY     | Daily                                                                             |
| HOURS                 |                                                                              3500 |
| HIRE DATE             | 1-29-2021                                                                         |
| MOST RECENT TERM DATE | 2-28-2021                                                                         |
| PLAN COMPENSATION     |                                                                              1000 |
| PAY DATE              | 5-29-2023                                                                         |
| SSN                   |                                                                         911001111 |
| MIDDLE INITIAL        | !@#                                                                               |
| COUNTRY               | India                                                                             |
| STATE                 | QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTY                                              |
| EMPLOYEE ID           | !@#                                                                               |
| PRIMARY EMAIL ADDRESS | abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeab@test.com |
| BIRTH DATE            | 1-29-2020                                                                         |
| ADDRESS 2          |           |


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
And Payroll API should respond for "payPeriodHours" with Error report message as "PY005 : Year to Date Hours received is greater than 3000" and ECR page message as "PY024 : The YTD Hours submitted is very high. Please correct the YTD hours and click on 'Submit'. To accept the hours, click on ‘Accept Warning’."
And Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY044 : Plan Compensation received for employee with termination date more than 40 days prior to current date." and ECR page message as "PY062 : Compensation received for employee who is separated from service and with termination date more than 40 days prior to current date. To accept the compensation click on ‘Accept Warning’."
And Payroll API should respond for "ssn" with Error report message as "EM062 : Social Security Number fourth and fifth digits should not be zero." and ECR page message as "EM062 : Social Security Number fourth and fifth digits should not be zero."
And Payroll API should respond for "ssn" with Error report message as "EM181 : The middle two digits of the Social Security Number should be "70-88", "90-92" or "94-99" if it starts with 9." and ECR page message as "EM181 : The middle two digits of the Social Security Number should be "70-88", "90-92" or "94-99" if it starts with 9."
And Payroll API should respond for "middleInitial" with Error report message as "EM028 : Middle Initial should have letter only." and ECR page message as "EM028 : Middle Initial should have letter only."
And Payroll API should respond for "state" with Error report message as "EM046 : State name should not exceed 35 characters." and ECR page message as "EM046 : State name should not exceed 35 characters."
And Payroll API should respond for "employeeId" with Error report message as "EM042 : Employee ID should be alphanumeric." and ECR page message as "EM042 : Employee ID should be alphanumeric."
And Payroll API should respond for "email" with Error report message as "EM041 : Email Address should not exceed 80 characters." and ECR page message as "EM041 : Email Address should not exceed 80 characters."
And Payroll API should respond for "birthDate" with Error report message as "EM056 : Age of the employee cannot be less than 16 years. Please review and update Date of Birth." and ECR page message as " EM056 : Age of the employee cannot be less than 16 years. Please review and update Date of Birth."
And Payroll API should respond for "address2" with Error report message as "EM012 : Review if Address 2 is necessary. Complete Address 1, then determine if Address 2 is needed." and ECR page message as "EM025 : Required"



Scenario: CMB004: To verify the RehireDate,Address1,length of firstname,lastname, with Numerics in combined template

#Given Model is selected for the endpoint "/api/v1/Company"
#When Configuration has been done as mentioned below
#| key                        | value    |
#| modeOfCompensation         | 2        |
#And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                   | Value      |
| FIRST NAME            |      12345 |
| LAST NAME             |      12345 |
| ZIP CODE              |     123456 |
| HIRE DATE             | 1-29-2021  |
| MOST RECENT TERM DATE | 2-28-2021  |
| PAYROLL FREQUENCY     | Daily      |
| GROSS COMPENSATION    |       1000 |
| PAY DATE              | 5-29-2023  |
| PRIMARY PHONE NUMBER  | 0123456789 |
| EMPLOYEE ID | 123456789123456789123 |
#| SSN                   |  997021111 |
|ADDRESS 1|    qwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopqwertyuiopq   |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

#Then Payroll API should respond for "firstName" with Error report message as "EM026 : First Name should have spaces, hyphen, (') and letters only." and ECR page message as "EM026 : First Name should have spaces, hyphen, (') and letters only."
Then Payroll API should respond for "zipCode" with Error report message as "EM044 : ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number" and ECR page message as "EM044 : ZIP Code should be in format of XXXXX or XXXXXXXXX or XXXXX-XXXX, X being a number"
Then Payroll API should respond for "payPeriodGrossCompensation" with Error report message as "PY043 : Gross Compensation received for employee with termination date more than 40 days prior to current date." and ECR page message as "PY061 : Compensation received for employee who is separated from service and with termination date more than 40 days prior to current date. To accept the compensation click on ‘Accept Warning’."
#And Payroll API should respond for "ssn" with Error report message as "EM181 : The middle two digits of the Social Security Number should be "70-88", "90-92" or "94-99" if it starts with 9." and ECR page message as "EM181 : The middle two digits of the Social Security Number should be "70-88", "90-92" or "94-99" if it starts with 9."
And Payroll API should respond for "mobilePhoneNumber" with Error report message as "EM037 : Primary Phone number should not start with zero." and ECR page message as "EM037 : Primary Phone number should not start with zero."
And Payroll API should respond for "employeeId" with Error report message as "EM043 : Employee ID should not exceed 20 characters." and ECR page message as "EM043 : Employee ID should not exceed 20 characters."
And Payroll API should respond for "address1" with Error report message as "EM048 : Address 1 should not exceed 150 characters." and ECR page message as "EM048 : Address 1 should not exceed 150 characters."



Scenario: CMB005: To verify the RehireDate,Address1,length of firstname,lastname, with alphanumerics in combined template

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key        | Value      |
| FIRST NAME | !@#$%12345 |
| LAST NAME | !@#$%12345 |
| HIRE DATE         | 1-29-2021     |
| PAYROLL FREQUENCY | Daily |
| GROSS COMPENSATION| 0             |
| PAY DATE          | 5-29-2023     |
| SSN | 000900003 |
| COUNTRY | India |
| STATE   |   TN    |
| ZIP CODE   |   QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOP    |
                                                                                                                                                

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "firstName" with Error report message as "EM026 : First Name should have spaces, hyphen, (') and letters only." and ECR page message as "EM026 : First Name should have spaces, hyphen, (') and letters only."
And Payroll API should respond for "lastName" with Error report message as "EM030 : Last Name should have spaces, dot, hyphen, (‘), (,) and letters only." and ECR page message as "EM030 : Last Name should have spaces, dot, hyphen, (‘), (,) and letters only."
Then Payroll API should respond for "payPeriodGrossCompensation" with Error report message as "PY049 : Year to Date Gross Compensation is zero for this employee" and ECR page message as "PY067 : YTD Compensation is zero for this employee. Enter the compensation and click on ‘Submit’.  To continue without adding YTD compensation click on ‘Accept Warning’."
Then Payroll API should respond for "ssn" with Error report message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999." and ECR page message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999."
Then Payroll API should respond for "zipCode" with Error report message as "EM047 : ZIP Code should not exceed 36 characters." and ECR page message as "EM047 : ZIP Code should not exceed 36 characters."



#Scenario: CMB006: Validating most recent hours entry in YTD mode
#
#Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
#| Key        | Value      |
#| HIRE DATE               | 1-29-2021 |
#| HOURS                   | 10        |
#| PAY DATE                | 5-29-2023 |
#                                                                                                                                                
#When File upload is executed for the file "CombinedFile.csv" to the test endpoint
#Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
#| Key        | Value      |
#| HIRE DATE               | 1-29-2021 |
#| HOURS                   | 20        |
#| PAY DATE                | 5-29-2023 |
#
#When File upload is executed for the file "CombinedFile.csv" to the test endpoint
#
#Then Payroll API should respond for "payPeriodHours" with Error report message as "PY016 : There is a more recent Hours entry available for this employee." and ECR page message as "PY035 : There is a more recent Hours entry for this employee. To accept the hours click on ‘Accept Warning’  or remove the hours and click on 'Submit'"



Scenario: CMB007: Validating Zero Plan Compensation received in YTD mode
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                       | Value     |
| HIRE DATE                 | 1-29-2021 |
| PAYROLL FREQUENCY         | Daily     |
| PLAN COMPENSATION         |         0 |
| PAY DATE                  | 5-29-2023 |
| isIncluded                | true      |
| SSN                       | 900900003 |
| FOREIGN ADDRESS INDICATOR | Y         |
| COUNTRY                   |           |
                                                                                                                                                

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY050 : Year to Date Plan Compensation is zero for this employee" and ECR page message as "PY068 : YTD Compensation is zero for this employee. Enter the compensation and click on ‘Submit’.  To continue without adding YTD compensation click on ‘Accept Warning’."
Then Payroll API should respond for "ssn" with Error report message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999." and ECR page message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999."
Then Payroll API should respond for "country" with Error report message as "" and ECR page message as ""

Scenario: Validating most recent Gross compensation entry in YTD mode
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value     |
| HIRE DATE          | 1-29-2021 |
| GROSS COMPENSATION | 1000      |
| PAY DATE           | 5-29-2023 |
| HOURS              | 10        |
| SSN | 905900003 |
                                                                                                                                                

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| HIRE DATE          | 1-29-2021 |
| GROSS COMPENSATION |      2000 |
| PAY DATE           | 5-29-2023 |
| HOURS              |         0 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY051 : There is a more recent Gross compensation entry available for this employee." and ECR page message as "PY069 : There is a more recent Compensation entry for this employee. To accept the compensation click on ‘Accept Warning’ or remove the compensation value and click on 'Submit'"
Then Payroll API should respond for "ssn" with Error report message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999." and ECR page message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999."


Scenario: Validating most recent Plan compensation entry in YTD mode
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| HIRE DATE          | 1-29-2021 |
| GROSS COMPENSATION |           |
| PLAN COMPENSATION  | 1000      |
| PAY DATE           | 5-29-2023 |
| HOURS              |    10      |
| SSN | 999900003 |
                                                                                                                                                

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| HIRE DATE          | 1-29-2021 |
| GROSS COMPENSATION |           |
| PLAN COMPENSATION  | 2000      |
| PAY DATE           | 5-29-2023 |
| HOURS              |     0     |                                                                                        

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY052 : There is a more recent Plan compensation  entry available for this employee." and ECR page message as "PY070 : There is a more recent Compensation entry for this employee. To accept the compensation click on ‘Accept Warning’ or remove the compensation value and click on 'Submit'"
Then Payroll API should respond for "ssn" with Error report message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999." and ECR page message as "EM063 : First three digits of Social Security Number should not be 000,666 or between 900 and 999."


Scenario: Validating The pay period Gross Compensation results in a negative YTD compensation
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| PAYROLL FREQUENCY  | Daily     |
| HOURS              |        50 |
| GROSS COMPENSATION |      -100 |
| PAY DATE           | 2-01-2025 |
                                                                                                                                     

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodGrossCompensation" with Error report message as "PY039 : The pay period Gross Compensation results in a negative YTD compensation" and ECR page message as "PY057 : The pay period compensation makes the YTD compensation negative. Please enter the correct value and click on ‘Submit’."


Scenario: Validating The pay period plan Compensation results in a negative YTD compensation

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value                                    |
| PAYROLL FREQUENCY | Daily                                    |
| PLAN COMPENSATION |                                     -100 |
| PAY DATE          | 2-01-2025                                |
| SSN               |                             911001119981 |
| COUNTRY           | India                                    |
| STATE             | TN                                       |
| ZIP CODE          | QWERTYUIOPQWERTYUIOPQWERTYUIOPQWERTYUIOP |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY040 : The pay period Plan Compensation results in a negative YTD compensation" and ECR page message as "PY058 : The pay period compensation makes the YTD compensation negative. Please enter the correct value and click on ‘Submit’."
Then Payroll API should respond for "ssn" with Error report message as "EM103 : SSN is invalid. Accepted format is xxxxxxxxx or xxx-xx-xxxx, x being a number." and ECR page message as "EM103 : SSN is invalid. Accepted format is xxxxxxxxx or xxx-xx-xxxx, x being a number."
Then Payroll API should respond for "zipCode" with Error report message as "EM047 : ZIP Code should not exceed 36 characters." and ECR page message as "EM047 : ZIP Code should not exceed 36 characters."



Scenario: Validating Gross Compensation exists for the payroll date.

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below

| Key                | Value      |
| HIRE DATE          | 1-29-2021  |
| EMPLOYEE ID        | ab         |
| GROSS COMPENSATION |       1000 |
| PAY DATE           | 2-01-2025  |
| SSN                |  123456788 |
| FIRST NAME         | Sriram     |
| LAST NAME          | N          |
| BIRTH DATE         | 01/01/1997 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below

| Key                | Value     |
| HIRE DATE          | 1-29-2021 |
| EMPLOYEE ID        | ab        |
| GROSS COMPENSATION | 2000      |
| PAY DATE           | 2-01-2025 |
| HOURS              |   0       |     
| SSN        | 123456786  |
| FIRST NAME | Sriram     |
| LAST NAME  | N          |
| BIRTH DATE | 01/01/1997 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodGrossCompensation" with Error report message as "PY053 : Gross Compensation exists for the payroll date." and ECR page message as "PY071 : Compensation entry for this employee is available in the system for the same pay date. Compensation amount on the file {0} will be added to the existing compensation amount {1} in the system.To accept the compensation click on ‘Accept Warning ' or remove the compensation value and click on 'Submit'"
Then Payroll API should respond for "ssn" with Error report message as "EM060 : The SSN on your file does not match the system. The employee has the same name and DOB. Please review the number on your file and the system. If the file is correct, please change the SSN in the employee tab. If the system is correct, please update your file." and ECR page message as "EM060 : The SSN on your file does not match the system. The employee has the same name and DOB. Please review the number on your file and the system. If the file is correct, please change the SSN in the employee tab. If the system is correct, please update your file."


Scenario: Validating Plan Compensation exists for the payroll date.

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| HIRE DATE          | 1-29-2021 |
| EMPLOYEE ID        | ab        |
| PLAN COMPENSATION | 1000      |
| PAY DATE           | 2-01-2025 |                                                                                      

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value     |
| HIRE DATE          | 1-29-2021 |
| EMPLOYEE ID        | ab        |
| PLAN COMPENSATION | 2000      |
| PAY DATE           | 2-01-2025 |                                                                                    

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payPeriodPlanCompensation" with Error report message as "PY054 : Plan Compensation exists for the payroll date." and ECR page message as "PY072 : Compensation entry for this employee is available in the system for the same pay date. Compensation amount on the file {0} will be added to the existing compensation amount {1} in the system.To accept the compensation click on ‘Accept Warning' or remove the compensation value and click on 'Submit'"

Scenario: Validating payroll frequency field null

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below

| Key               | Value |
| PAYROLL FREQUENCY |       |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payrollFrequencyId" with Error report message as "EM011 : Employee's Payroll Frequency is required." and ECR page message as "EM024 : Required"


Scenario: Validating paydate configure with future date
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                       | Value      |
| PAY DATE                  | +31 day    |
| FOREIGN ADDRESS INDICATOR | Y          |
| COUNTRY                   |            |
| SSN                       |  123121102 |
| HIRE DATE                 | 01/01/2021 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "payDate" with Error report message as "EM066 : Pay Date cannot be more than 30 days in the future." and ECR page message as "EM066 : Pay Date cannot be more than 30 days in the future."
Then Payroll API should respond for "countryId" with Error report message as "" and ECR page message as ""
Then Payroll API should respond for "" with Error report message as "EM182 : We notice that all employees in the file are new employees. Please make sure you are uploading the correct file." and ECR page message as "We notice that all employees in the file are new employees. Please make sure you are uploading the correct file : We notice that all employees in the file are new employees. Please make sure you are uploading the correct file"

Scenario: Validating termdate field null
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value     |
| MOST RECENT TERM DATE  | 1-29-2021 |
| EMPLOYMENT STATUS CODE | T         |
| HIRE DATE              | 1-29-2022 |
| PAY DATE               | 5-29-2023 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "mostRecentTermDate" with Error report message as "EM088 : Most recent term should not be prior to Hire date" and ECR page message as "EM088 : Most recent term should not be prior to Hire date"



Scenario: Validating Rehire date field which is more than 30 days in future
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                     | Value     |
| HIRE DATE               | 1-29-2021 |
| MOST RECENT TERM DATE   | 3-29-2021 |
| MOST RECENT REHIRE DATE | 12-29-2025|
| EMPLOYMENT STATUS CODE  | A         |
| PAY DATE                | 5-29-2023 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "mostRecentRehireDate" with Error report message as "EM092 : The Employee’s Most Recent Rehire Date cannot be more than 30 days in future." and ECR page message as "EM092 : The Employee’s Most Recent Rehire Date cannot be more than 30 days in future."


Scenario: Validating term date after rehire date
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                     | Value     |
| HIRE DATE               | 1-29-2021 |
| MOST RECENT TERM DATE   | 2-28-2021 |
| MOST RECENT REHIRE DATE | 3-29-2021 |
| EMPLOYMENT STATUS CODE  | A         |
| PAY DATE                | 5-29-2023 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint
Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                     | Value     |
| HIRE DATE               | 1-29-2021 |
| MOST RECENT TERM DATE   | 3-15-2021 |
| MOST RECENT REHIRE DATE | 3-29-2021 |
| EMPLOYMENT STATUS CODE  | T         |
| PAY DATE                | 5-29-2023 |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "mostRecentTermDate" with Error report message as "EM095 : Most Recent Term Date must be after the Most Recent Rehire Date." and ECR page message as "EM095 : Most Recent Term Date must be after the Most Recent Rehire Date."


Scenario: Validating hire term and rehire not in sequence

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below

| Key                     | Value     |
| HIRE DATE               | 1-21-2021 |
| MOST RECENT TERM DATE   | 2-25-2021 |
| MOST RECENT REHIRE DATE | 1-24-2022 |
| EMPLOYMENT STATUS CODE  | A         |
| PAY DATE                | 5-29-2023 |

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below

| Key                     | Value     |
| HIRE DATE               | 1-21-2021 |
| MOST RECENT TERM DATE   | 1-25-2021 |
| MOST RECENT REHIRE DATE | 1-24-2021 |
| EMPLOYMENT STATUS CODE  | A         |
| PAY DATE                | 5-29-2023 |


When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "mostRecentTermDate" with Error report message as "EM224 : The Hire/Term/Rehire dates are not in sequence. Please review." and ECR page message as "EM224 : The Hire/Term/Rehire dates are not in sequence. Please review."
