Feature: E_Source Limit and Maximum Compensation validation
[BeforeTestRun]


#Scenario: verify the Add Custom Source name data type acceptance of only Special Characters
Scenario:To verify when user leave the limit (minimum) field as Blank in the percentage option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                       |
           | sourceName             | random 10 specialCharacters |Scenario: 8308 To verify the Source name data type acceptance of only Special Characters
           | effectiveStartDate     |                             |
           | contributionType       |                           1 |
           | limitMinimumPercentage |                             |
           | limitMaximumPercentage |                             |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 4 following errors
 | error_code | error_message                      |
 | PL995      | Required                           |
 | PL182      | Required                           | Scenario: To verify the validation message for Effective start date by leaving empty
 | PL1001     | Required                           | Scenario:To verify the validation message for Limit (maximum) field by leaving empty
 | PL400      | Source name should be alphanumeric | Scenario: 8308 To verify the Source name data type acceptance of only Special Characters

#REstricted in UI

#Scenario:To veriy data Acceptance -Number in the percentage limit(minimum) field
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                    | value                   |
#           | sourceName             | random 10 alphaNumerics |
#           | contributionType       |                       1 |
#           | limitMinimumPercentage |                      12 |
#           | limitMaximumPercentage |                     120 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

# two backend validations
Scenario:To verify the validation message for Limit (minimum) acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                     101 |
           | limitMaximumPercentage |                     80|
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL185 : Minimum limit should not exceed 100 percentage"

Scenario:To verify the validation message for Limit (minimum) acceptance criteria of values more than 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |        1000000000000.00 |
           | limitMaximumPercentage |                      80 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL185 : Minimum limit should not exceed 100 percentage"

Scenario:To verify the Limit (minimum) acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                     100 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL398 : Maximum limit amount should not be equal or lesser than minimum limit"



Scenario:To verify the validation message for Limit (maximum) acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                      101|
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

#restricted in UI

#Scenario:To verify the validation message for Limit (maximum) acceptance criteria of values more than 10000000000.00 dollar
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                    | value                   |
#           | sourceName             | random 10 alphaNumerics |
#           | contributionType       |                       1 |
#           | limitMinimumPercentage |                      60 |
#           | limitMaximumPercentage |        1000000000000.00 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00"

Scenario:To verify the Limit (maximum) acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                    |
           | sourceName             | random 10 alphabets      | Scenario: 8306 To verify the Source name data type acceptance of only alphabets
           | effectiveStartDate     | 2023-04-01T10:02:00.490Z | Scenario: To verify the Effective start date acceptance criteria of format "mm/dd/yyyy"Given Model is selected for the endpoint "/api/Source/SaveSource"
           | contributionType       |                        1 |
           | limitMinimumPercentage |                       60 |
           | limitMaximumPercentage |                      100 |
           | sourceCode             | A                        |
           | recordKeepingNumber    | random 30 alphabets      | Scenario: To verify the Source ID data type acceptance of only alphabets and equals with 30 characters
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:To verify the  Limit (maximum) acceptance criteria of values below 100 percentage

#Scenario:To verify the Add Custom Source name data type acceptance of only numeric

Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value              |
           | sourceName             | random 10 numerics | Scenario: 8307 To verify the Source name data type acceptance of only numeric
           | contributionType       |                  1 |
           | limitMinimumPercentage |                 60 |
           | limitMaximumPercentage |                 80 |
           | recordKeepingNumber    | random 10 numerics | Scenario: To verify the Source ID  data type acceptance of only numeric

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the validation message for Limit (minimum) by entering values greater than maximum limit value
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       1 |
           | limitMinimumDollar |                    1500 |
           | limitMaximumDollar |                    1000 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1017 : Maximum limit amount should not be equal or lesser than minimum limit"

#Scenario:To verify the Add Custom Source name data type acceptance of only alphanumeric with Special Characters
#Scenario: To verify the Add Custom Source name field length acceptance of below 30 characters
Scenario:Source Limit Maximum Field validatation when Limit Maximum field  equal to  Limit Minimum field when contribution type is percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                                       |
           | sourceName             | random 10 alphaNumericWithSpecialCharacters |
           | contributionType       |                                           1 |
           | limitMinimumPercentage |                                          50 |
           | limitMaximumPercentage |                                          50 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
 | error_code | error_message                                                         |
 | PL398      | Maximum limit amount should not be equal or lesser than minimum limit |
 | PL400      | Source name should be alphanumeric                                    |Scenario: 8310 To verify the Source name data type acceptance of only alphanumeric with Special Characters

 #Scenario:  To verify the Add Custom Source name data type acceptance of only alphanumeric
Scenario:Source maximumDollarCompensation acceptance when contribution type is percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |Scenario: 8309 To verify the Source name data type acceptance of only alphanumeric
           | contributionType          |                       1 |
           | maximumDollarCompensation |                      80 |
           | recordKeepingNumber    | random 10 specialCharacters      |Scenario: To verify the Source ID   data type acceptance of only Special Characters

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the Maximum compensation acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value               |
           | sourceName                    | random 40 alphabets | Scenario: 8311 To verify the Source name field length acceptance of below 50 characters
           | contributionType              |                   1 |
           | limitMinimumPercentage        |                  10 |
           | limitMaximumPercentage        |                  30 |
           | maximumPercentageCompensation |                  90 |
           | recordKeepingNumber           | random 10 alphaNumerics | Scenario: To verify the Source ID   data type acceptance of only alphanumeric

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

#Scenario: To verify the Add Custom Source name field length acceptance of above 30 characters

Scenario: To verify the Maximum compensation acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                                       |
           | sourceName                | random 50 alphabets                         | Scenario: 8312 To verify the Source name field length acceptance of equals of 50 characters
           | contributionType          |                                           1 |
           | maximumDollarCompensation |                                         100 |
           | recordKeepingNumber       | random 10 alphaNumericWithSpecialCharacters | Scenario: To verify the Source ID   data type acceptance of only alphanumeric with Special Characters


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the validation message for Maximum compensation acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 60 alphabets |
           | contributionType              |                       1 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      30 |
           | maximumPercentageCompensation |                     101 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
 | error_code | error_message                                                |
 | PL189      | Maximum limit compensation  should not exceed 100 percentage |
 | PL180      | Source name should not exceed 50 characters                  | Scenario: 8313 To verify the Source name field length acceptance of above 50 characters

#Scenario: To Verify the validation message for Add Custom Source name by leaving empty
#Scenario: Toverify the validation message for Maximum compensation field by leaving empty
Scenario: To verify the validation message for Maximum compensation field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                    |
           | sourceName                | random 0 alphabets       |
           | effectiveStartDate        | 2023-01-01T10:02:00.490Z |
           | effectiveEndDate          | 2022-01-01T10:02:00.490Z |
           | catchUpType               |                        2 |
           | contributionType          |                        2 |
           | limitMinimumDollar        |                          | Scenario: To verify the validation message for Limit (minimum) field by leaving empty
           | limitMaximumDollar        |                       30 |
           | maximumDollarCompensation |                          |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 4 following errors
 | error_code | error_message                                                  |
 | PL1020     | Required                                                       |
 | PL998      | Required                                                       |
 | PL183      | Effective Start Date should be prior to the Effective End Date | Scenario: To verify the Effective end date acceptance criteria of format "mm/dd/yyyy"
 | PL1141     | Required                                                       | Scenario: 109219 To Verify the validation message for Source name by leaving empty




Scenario:Source Limit Minimum Field acceptance when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                    |
           | sourceName                | random 10 alphaNumerics  |
           | effectiveStartDate        | 2023-04-01T10:02:00.490Z |
           | effectiveEndDate          | 2023-04-02T10:02:00.490Z |Scenario: 8327 To verify the Effective end date acceptance criteria of format "mm/dd/yyyy" 
           | contributionType          |                        2 |
           | limitMinimumDollar        |                      600 |
           | limitMaximumDollar        |                      800 |
           | maximumDollarCompensation |                      800 |
           | recordKeepingNumber    | random 25 alphabets      |Scenario: To verify the Source ID   field length acceptance of below 30 characters


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:Source Limit Maximum Field acceptance when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                    |
           | sourceName                | random 10 alphaNumerics  |
           | effectiveStartDate        | 2023-04-01T10:02:00.490Z |
           | effectiveEndDate          |                          | Scenario: Source Effective End Date Field Accceptance when  its null
           | contributionType          |                        2 |
           | limitMinimumDollar        |                      600 |
           | limitMaximumDollar        |                      800 |
           | maximumDollarCompensation |                      100 |
           | recordKeepingNumber       | random 35 alphabets      | Scenario:To verify the Source ID   field length acceptance of above 30 characters


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: toverify the validation message for Limit (maximum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceSubSubCategory |                       1 |
           | contributionType     |                       2 |
           | limitMinimumDollar   |                     600 |
           | limitMaximumDollar   |                         |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1004 : Required"

Scenario: Source Limit Maximum Field validatation when Limit Maximum field  equal to  Limit Minimum field when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       2 |
           | limitMinimumDollar |                     600 |
           | limitMaximumDollar |                     600 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1017 : Maximum limit amount should not be equal or lesser than minimum limit"


#Restricted in UI
#Scenario: To verify the validation message for Maximum compensation acceptance criteria of values more than 10000000000.00 dollar
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                       | value                   |
#           | sourceName                | random 10 alphaNumerics |
#           | contributionType          |                       2 |
#           | limitMinimumDollar        |                     500 |
#           | limitMaximumDollar        |                     600 |
#           | maximumDollarCompensation |        1000000000000.00 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL190 : Maximum limit compensation amount should not exceed format of 100000000000.00"


#REstricted in UI

#Scenario: To verify when user enter a value greater than 100 in the percentage limit(minimum) field
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | contributionType              |                       3 |
#           | limitMinimumPercentage        |                     120 |
#           | limitMaximumPercentage        |                      80 |
#           | maximumPercentageCompensation |                      90 |
#           | limitMinimumDollar            |                      10 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |                      80 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#	Then the API response should contain the 1 following errors 
#	| error_code | error_message                                  |
#	| PL185      | Minimum limit should not exceed 100 percentage |



Scenario: To verify the Limit (minimum) acceptance criteria of values equal 100 percentage - 2
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | sourceType                    |                       1 |
           | sourceCategory                |                       2 |
           | sourceSubCategory             |                       4 |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                     100 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL398 : Maximum limit amount should not be equal or lesser than minimum limit"


Scenario: To verify when user leave the limit (minimum) field as Blank in the percentage Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | sourceType                    |                       1 |
           | sourceCategory                |                       2 |
           | sourceSubCategory             |                       4 |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                         |
           | limitMaximumPercentage        |                         |
           | maximumPercentageCompensation |                         |
           | limitMinimumDollar            |                         |
           | limitMaximumDollar            |                         |
           | maximumDollarCompensation     |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 6 following errors 
	| error_code | error_message |
	| PL995      | Required      |
	| PL1001     | Required      | Scenario:  To verify when user leave the limit (maximum) field as Blank in the percentage Both option
	| PL998      | Required      | Scenario: To verify when user leave the limit (minimum) field as Blank in the dollar option
	| PL1004     | Required      | Scenario:To verify when user leave the limit (maximum) field as Blank in the dollar Both option
	| PL399      | Required      | Scenario:To verify when user leave the maximum compensation field as Blank in the percentage Both option
	| PL1020     | Required      |Scenario:To verify when user leave the maximum compensation field as Blank in the dollar Both option

Scenario: TC 1 Source Limit Minimum Field acceptance when contribution type is percentage - positive flow
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value               |
           | sourceName                    | random 30 alphabets | Scenario: To verify the Add Custom Source name data type acceptance of only alphabets and equal 30 characters
           | sourceType                    |                   1 |
           | sourceCategory                |                   2 |
           | sourceSubCategory             |                   4 |
           | contributionType              |                   3 |
           | limitMinimumPercentage        |                  10 |
           | limitMaximumPercentage        |                  80 |
           | maximumPercentageCompensation |                  80 |
           | limitMinimumDollar            |                  10 |
           | limitMaximumDollar            |                  40 |
           | maximumDollarCompensation     |                  80 |
           | recordKeepingNumber           | random 0 alphabets  | Scenario:  To Verify the validation message for Source ID  by leaving empty



And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


#Restricted in UI

#Scenario:  To verify when user enter a value greater than 100 in the percentage Both limit(maximum) field
#
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | contributionType              |                       3 |
#           | limitMinimumPercentage        |                      10 |
#           | limitMaximumPercentage        |                      120|
#           | maximumPercentageCompensation |                      80 |
#           | limitMinimumDollar            |                      10 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |                      80 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

#Restricted in UI

#Scenario:  To verify the length of limit (maximum) field in the percentage Both option - contribution type field
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | contributionType              |                       3 |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | limitMinimumPercentage        |                      10 |
#           | limitMaximumPercentage        |                 1234.77 |
#           | maximumPercentageCompensation |                      80 |
#           | limitMinimumDollar            |                      10 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |                      80 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

#restricted in UI

#Scenario: To verify when user enter a value greater than 11 digits with 2 deciamal points in the limit(minimum) Dollar field-Both option
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | contributionType              |                       3 |
#           | sourceSubSubCategory          |                       1 |
#           | isHCEManatory                 | true                    |
#           | contributionType              |                       3 |
#           | limitMinimumPercentage        |                      20 |
#           | limitMaximumPercentage        |                      80 |
#           | maximumPercentageCompensation |                      80 |
#           | limitMinimumDollar            |       8787878887878.787 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |                      80 |
#           | hceMaximumAmount              |                      20 |
#           | hceMinimumAmount              |                      10 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL186 : Minimum limit dollar amount should not exceed format of 100000000000.00"

Scenario:To verify the length of limit (minimum)field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | sourceType                    |                       1 |
           | sourceCategory                |                       2 |
           | sourceSubCategory             |                       4 |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |          12345678901.34 |
           | limitMaximumDollar            |          12345678901.35 |
           | maximumDollarCompensation     |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
 
 #Restricted in UI

# Scenario:To verify when user enter a value greater than 11 didigits with 2 decimal points in the dollar limit(maximum) field
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | contributionType              |                       3 |
#           | limitMinimumPercentage        |                      20 |
#           | limitMaximumPercentage        |                      80 |
#           | maximumPercentageCompensation |                      90 |
#           | limitMinimumDollar            |                      20 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |        1000000000000.00 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL190 : Maximum limit compensation amount should not exceed format of 100000000000.00"

Scenario:To verify the length of limit (maximum) field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | sourceType                    |                       1 |
           | sourceCategory                |                       2 |
           | sourceSubCategory             |                       4 |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      34 |
           | limitMaximumDollar            |          12345678901.34 |
           | maximumDollarCompensation     |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

#Restricted in UI

#Scenario:To verify when user enter a value greater than 100 in the maximum compensation field-percentage
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | contributionType              |                       3 |
#           | limitMinimumPercentage        |                      20 |
#           | limitMaximumPercentage        |                      80 |
#           | maximumPercentageCompensation |                     120 |
#           | limitMinimumDollar            |                      20 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |                      80 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL189 : Maximum limit compensation  should not exceed 100 percentage"

#Restricted in UI
#Scenario:To verify when user enter a value greater than 11 digits and 2 decimal points in the maximum compensation field - Both field
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                           | value                   |
#           | sourceName                    | random 10 alphaNumerics |
#           | sourceType                    |                       1 |
#           | sourceCategory                |                       2 |
#           | sourceSubCategory             |                       4 |
#           | contributionType              |                       3 |
#           | limitMinimumPercentage        |                      10 |
#           | limitMaximumPercentage        |                      80 |
#           | maximumPercentageCompensation |                      80 |
#           | limitMinimumDollar            |                      10 |
#           | limitMaximumDollar            |                      40 |
#           | maximumDollarCompensation     |        100000000000.123 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL190 : Maximum limit compensation amount should not exceed format of 100000000000.00"

Scenario:To verify the length of limit (minimum)field in the percentage  Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | sourceType                    |                       1 |
           | sourceCategory                |                       2 |
           | sourceSubCategory             |                       4 |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                  100.00 |
           | limitMinimumDollar            |                      34 |
           | limitMaximumDollar            |                      60 |
           | maximumDollarCompensation     |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the length of maximum compensation field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | sourceType                    |                       1 |
           | sourceCategory                |                       2 |
           | sourceSubCategory             |                       4 |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                      34 |
           | limitMaximumDollar            |                      60 |
           | maximumDollarCompensation     |          10000000000.12 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:toverify the length of limit (maximum) field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | sourceType                |                       1 |
           | sourceCategory            |                       2 |
           | sourceSubCategory         |                       4 |
           | contributionType          |                       3 |
           | maximumDollarCompensation |                     100 |
           | limitMaximumDollar        |          12345678901.34 |
           | limitMinimumDollar        |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the length of limit (maximum) field in the dollar option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | maximumDollarCompensation |                     100 |
           | limitMaximumDollar        |          12345678901.34 |
           | limitMinimumDollar        |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the HCE Deferral limts field as Yes 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       1 |
           | isHCEManatory    | true                    |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 #  Scenario: To verify the HCE Deferral limts field as Yes and HCE Maximum percentage field is blank
 Scenario:To verify the HCE Deferral limts field as Yes and HCE minimum percentage field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                         |
           | hceMaximumPercentage |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
 | error_code | error_message |
 | PL996      | Required      |
 | PL1002     | Required      |



 #Scenario: To verify the HCE Deferral limts field as Yes and HCE Minimum Amount field is blank
   Scenario:To verify the HCE Deferral limts field as Yes and HCE Maximum Amount field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMaximumAmount |                         |
           | hceMinimumAmount |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
 | error_code | error_message |
 | PL1005     | Required      |
 | PL999      | Required      |


    Scenario:To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field  equal to hce Maximum Percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      20 |
           | hceMaximumPercentage |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:To verify the HCE Deferral limts field as Yes when hce Minimum Amount field  equal to hce Maximum Amount
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       1 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |                      20 |
           | hceMaximumAmount |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:To verify the HCE Deferral limts field as Yes when  hce Minimum Amount field  equal to hce Maximum Amount in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       3 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |                      20 |
           | hceMaximumAmount |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field  equal to hce Maximum Percentage in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | contributionType     |                       3 |
           | sourceSubSubCategory |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      20 |
           | hceMaximumPercentage |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"
 
 Scenario:To verify the HCE Deferral limts field as Yes when hce  Percentage field  as length 3 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                     100 |
           | hceMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 #restricted in UI
# Scenario:To verify the HCE Deferral limts field as Yes when hce  Percentage field  as length 4 characters
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | contributionType     |                       1 |
#           | isHCEManatory        | true                    |
#           | hceMinimumPercentage |                    1000 |
#           | hceMaximumPercentage |                     100 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL986 : Minimum limit should not exceed 100 percentage"

  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field is greater than hce Maximum Percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                     100 |
           | hceMaximumPercentage |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL986 : Minimum limit should not exceed 100 percentage"


  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field and than hce Maximum Percentage is below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      80 |
           | hceMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

#restricted in UI
#  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field is above 100
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | contributionType     |                       1 |
#           | isHCEManatory        | true                    |
#           | hceMinimumPercentage |                     101 |
#           | hceMaximumPercentage |                      90 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL986 : Minimum limit should not exceed 100 percentage"

#restricted in UI
#  Scenario: toverify the HCE Deferral limts field as Yes when hce Maximum Percentage field is above 100
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | contributionType     |                       1 |
#           | isHCEManatory        | true                    |
#           | hceMinimumPercentage |                      90 |
#           | hceMaximumPercentage |                     101 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL990 : Maximum limit should not exceed 100 percentage"

   Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |          20909090909.99 |
           | hceMaximumAmount |          89898989898.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


   Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |           2090909090.99 |
           | hceMaximumAmount |          89898989898.98 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

#REstricted in UI
#  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is above 11 characters with 2 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key              | value                   |
#           | sourceName       | random 10 alphaNumerics |
#           | contributionType |                       2 |
#           | isHCEManatory    | true                    |
#           | hceMinimumAmount |        2090909090234.99 |
#           | hceMaximumAmount |          89898989898.98 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL988 : Minimum limit dollar amount should not exceed format of 100000000000.00"

# Restricted in UI
#  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is above 11 characters with 3 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key              | value                   |
#           | sourceName       | random 10 alphaNumerics |
#           | contributionType |                       2 |
#           | isHCEManatory    | true                    |
#           | hceMinimumAmount |       2090909090234.993 |
#           | hceMaximumAmount |          89898989898.98 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL988 : Minimum limit dollar amount should not exceed format of 100000000000.00"


 
#restricted in UI
#  Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is above 11 characters with 2 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key              | value                   |
#           | sourceName       | random 10 alphaNumerics |
#           | contributionType |                       2 |
#           | isHCEManatory    | true                    |
#           | hceMinimumAmount |          20909090901.99 |
#           | hceMaximumAmount |        2090909090234.99 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL992 : Maximum limit dollar amount should not exceed format of 100000000000.00"

Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |            209090909.99 |
           | hceMaximumAmount |           2090909090.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should respond with successful message

 Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |            209090909.99 |
           | hceMaximumAmount |          20909090901.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should respond with successful message

 #bug
#Restricted in UI
# Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is equal 11 characters with 3 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key              | value                   |
#           | sourceName       | random 10 alphaNumerics |
#           | contributionType |                       2 |
#           | isHCEManatory    | true                    |
#           | hceMinimumAmount |            209090909.99 |
#           | hceMaximumAmount |         20909090901.992 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
# Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00"

#  Scenario:  To verify the HCE Deferral limts field as Yes and HCE Maximum percentage field is blank in both
 Scenario: To verify the HCE Deferral limts field as Yes and HCE minimum percentage field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | isHCEManatory        | true                    |
           | contributionType     |                       3 |
           | hceMinimumPercentage |                         |
           | hceMaximumPercentage |                         |
           | hceMinimumAmount     |            209090909.99 |
           | hceMaximumAmount     |          20909090901.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
| error_code | error_message |
| PL996      | Required      |
| PL1002     | Required      |

#  Scenario:  To verify the HCE Deferral limts field as Yes and HCE minimum Amount field is blank in both
   Scenario:  To verify the HCE Deferral limts field as Yes and HCE Maximum Amount field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | isHCEManatory        | true                    |
           | contributionType     |                       3 |
           | hceMinimumPercentage |                      25 |
           | hceMaximumPercentage |                      35 |
           | hceMinimumAmount     |                         |
           | hceMaximumAmount     |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
| error_code | error_message |
| PL1005     | Required      |
| PL999      | Required      |


 


 #  Scenario:  To verify the isCatchUpManatory field as Yes and catchupMinimumPercentage field is blank

   Scenario:  To verify the isCatchUpManatory field as Yes and catchupMaximumPercentage field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                         |
           | catchupMaximumPercentage |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
| error_code | error_message |
| PL1003     | Required      |
| PL997      | Required      |

 
    Scenario:  To verify the isCatchUpManatory field as Yes and catchupMinimumAmount  field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1000 : Required"

  Scenario:  To verify the isCatchUpManatory field as Yes and catchupMaximumAmount  field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMaximumAmount |                         |   

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1006 : Required"


 Scenario:  To verify the isCatchUpManatory field as Yes and catchupMinimumPercentage field is equal to catchupMaximumPercentage field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      20 |
           | catchupMaximumPercentage |                      20 |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:  To verify the isCatchUpManatory field as Yes  when hce catchupMinimumAmount is equal to catchupMaximumAmount  field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |                      20 |
           | catchupMaximumAmount |                      20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1019 : Maximum limit amount should not be equal or lesser than minimum limit"


 Scenario:To verify the isCatchUpManatory field as Yes  when hce catchupMinimumAmount is equal to catchupMaximumAmount  field in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType          |                       3 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |                      20 |
           | catchupMaximumAmount |                      20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"


 Scenario:To verify the isCatchUpManatory field as Yes and catchupMinimumPercentage field is equal to catchupMaximumPercentage field in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      20 |
           | catchupMaximumPercentage |                      20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"



  Scenario:To verify the isCatchUpManatory field as Yes  when catchup  Percentage field  as length 3 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                     100 |
           | catchupMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"

 #Restricted in UI

#  Scenario:To verify the CatchUpManatory field as Yes  when catchup  Percentage field as length 4 characters
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                      | value                   |
#           | sourceName               | random 10 alphaNumerics |
#           | sourceType               |                       1 |
#           | sourceCategory           |                       2 |
#           | sourceSubCategory        |                       4 |
#           | sourceSubSubCategory     |                       1 |
#           | catchUpType              |                       1 |
#           | isCatchUpManatory        | true                    |
#           | catchupMinimumPercentage |                    1020 |
#           | catchupMaximumPercentage |                     100 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#	Then the API response should contain the 2 following errors 
#	| error_code | error_message                                                         |
#	| PL987      | Minimum limit should not exceed 100 percentage                        |
#	| PL1016     | Maximum limit amount should not be equal or lesser than minimum limit |

 Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is greater than catchupMaximumPercentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                     100 |
           | catchupMaximumPercentage |                      70 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"


  Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is smaller than catchupMaximumPercentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      40 |
           | catchupMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
# Restricted in UI

#  Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is above 100
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                      | value                   |
#           | sourceName               | random 10 alphaNumerics |
#           | sourceType           |                       1 |
#           | sourceCategory       |                       2 |
#           | sourceSubCategory    |                       4 |
#           | sourceSubSubCategory |                       1 |
#           | catchUpType              |                       1 |
#           | isCatchUpManatory        | true                    |
#           | catchupMinimumPercentage |                     101 |
#           | catchupMaximumPercentage |                     100 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL987 : Minimum limit should not exceed 100 percentage"

# Restricted in UI

#  Scenario:To verify the CatchUpManatory field as Yes when catchupMaximumPercentage field is above 100
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                      | value                   |
#           | sourceName               | random 10 alphaNumerics |
#           | sourceType           |                       1 |
#           | sourceCategory       |                       2 |
#           | sourceSubCategory    |                       4 |
#           | sourceSubSubCategory |                       1 |
#           | catchUpType              |                       1 |
#           | isCatchUpManatory        | true                    |
#           | catchupMinimumPercentage |                     100 |
#           | catchupMaximumPercentage |                     101 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL991 : Maximum limit should not exceed 100 percentage"   

  Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumAmount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType            |                       2 |
           | isCatchUpManatory      | true                    |
           | catchupMinimumAmount   |          20909090909.99 |
           | catchupMaximumAmount   |          89898989898.98 |
           | limitMinimumPercentage |                      80 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message   

  Scenario:To verify the CatchUpManatory field field as Yes when catchupMinimumAmount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |           2090909099.99 |
           | catchupMaximumAmount |          89898989898.98 |
           | limitMaximumPercentage |          100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message   

#Restricted in UI

# Scenario:To verify the CatchUpManatory field field as Yes when catchupMinimumAmount field is above 11 characters with 2 decimal point
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | sourceType           |                       1 |
#           | sourceCategory       |                       2 |
#           | sourceSubCategory    |                       4 |
#           | sourceSubSubCategory |                       1 |
#           | catchUpType          |                       2 |
#           | isCatchUpManatory    | true                    |
#           | catchupMinimumAmount |         209090229099.99 |
#           | catchupMaximumAmount |          89898989898.98 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL989 :Minimum limit dollar amount should not exceed format of 100000000000.00" 

#Restricted in UI

# Scenario:To verify the CatchUpManatory field field as Yes when catchupMinimumAmount field is above 11 characters with 3 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | sourceType           |                       1 |
#           | sourceCategory       |                       2 |
#           | sourceSubCategory    |                       4 |
#           | sourceSubSubCategory |                       1 |
#           | catchUpType          |                       2 |
#           | isCatchUpManatory    | true                    |
#           | catchupMinimumAmount |       2090902229099.992 |
#           | catchupMaximumAmount |          89898989898.98 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL989 : Minimum limit dollar amount should not exceed format of 100000000000.00" 

#REstricted in UI
# Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is above 11 characters with 2 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | sourceType           |                       1 |
#           | sourceCategory       |                       2 |
#           | sourceSubCategory    |                       4 |
#           | sourceSubSubCategory |                       1 |
#           | catchUpType          |                       2 |
#           | isCatchUpManatory    | true                    |
#           | catchupMinimumAmount |          20909022299.99 |
#           | catchupMaximumAmount |         898989898982.98 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL993 : Maximum limit dollar amount should not exceed format of 100000000000.00" 

 Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | sourceType           |                       1 |
           | sourceCategory       |                       2 |
           | sourceSubCategory    |                       4 |
           | sourceSubSubCategory |                       1 |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |               209090.99 |
           | catchupMaximumAmount |              8989898.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | sourceType             |                       1 |
           | sourceCategory         |                       2 |
           | sourceSubCategory      |                       4 |
           | sourceSubSubCategory   |                       1 |
           | catchUpType            |                       2 |
           | isCatchUpManatory      | true                    |
           | catchupMinimumAmount   |            209090222.99 |
           | catchupMaximumAmount   |          89898989821.98 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


#bug
#Restricted in UI
# Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is equal 11 characters with 3 decimal points
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#When Configuration has been made as per following
#           | key                  | value                   |
#           | sourceName           | random 10 alphaNumerics |
#           | sourceType           |                       1 |
#           | sourceCategory       |                       2 |
#           | sourceSubCategory    |                       4 |
#           | sourceSubSubCategory |                       1 |
#           | catchUpType          |                       2 |
#           | isCatchUpManatory    | true                    |
#           | catchupMinimumAmount |         20909022288.998 |
#           | catchupMaximumAmount |          20909090901.99 |
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00" 

 
 #Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is blank in both
 Scenario:To verify the CatchUpManatory field as Yes when catchupMaximumPercentage field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                         |
           | catchupMaximumPercentage |                         |
           | catchupMinimumAmount     |            209090222.99 |
           | catchupMaximumAmount     |           2090909090.99 |
           | limitMinimumPercentage   |                      80 |
           | limitMaximumPercentage   |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
 | error_code | error_message |
 | PL1003     | Required      |
 | PL997      | Required      |

#Scenario:To verify  the CatchUpManatory field as Yes when catchupMinimumAmount field is blank in both
Scenario:To verify the CatchUpManatory field as Yes when catchupMaximumAmount field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | sourceType               |                       1 |
           | sourceCategory           |                       2 |
           | sourceSubCategory        |                       4 |
           | sourceSubSubCategory     |                       1 |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      10 |
           | catchupMaximumPercentage |                      40 |
           | catchupMinimumAmount     |                         |
           | catchupMaximumAmount     |                         |
           | limitMinimumPercentage   |                      80 |
           | limitMaximumPercentage   |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 2 following errors
 | error_code | error_message |
 | PL1006     | Required      |
 | PL1000     | Required      |



Scenario: To verify the Save of the Roth Conversion Source Type with error message 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "sourceName" is configured as "RothConversion" 
And the property "sourceType" is configured as "1" 
And the property "sourceCategory" is configured as "2" 
And the property "sourceSubCategory" is configured as "5" 
And the property "sourceSubSubCategory" is configured as "3" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
When the property "sourceName" is configured as "Roth" 
And the property "sourceType" is configured as "1" 
And the property "sourceCode" is configured as "Z" 
And the property "sourceCategory" is configured as "2" 
And the property "sourceSubCategory" is configured as "5" 
And the property "sourceSubSubCategory" is configured as "3" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL949 : Only one In-Plan Roth Conversion source is allowed per plan"

 Scenario: To verify the Save of the Roth Conversion Source Type 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "SourceName" is configured as "RothConversion" 
And the property "SourceType" is configured as "1" 
And the property "SourceCategory" is configured as "2" 
And the property "SourceSubCategory" is configured as "5" 
And the property "SourceSubSubCategory" is configured as "3" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
