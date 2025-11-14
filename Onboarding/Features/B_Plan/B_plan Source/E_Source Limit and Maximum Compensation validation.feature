Feature: E_Source Limit and Maximum Compensation validation
[BeforeTestRun]


Scenario:To verify when user leave the limit (minimum) field as Blank in the percentage option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                         |
           | limitMaximumPercentage |                      80 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL995 : Required"

Scenario:To veriy data Acceptance -Number in the percentage limit(minimum) field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      12 |
           | limitMaximumPercentage |                     120 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

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

Scenario:To verify the validation message for Limit (maximum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                         |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1001 : Required"

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

Scenario:To verify the validation message for Limit (maximum) acceptance criteria of values more than 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |        1000000000000.00 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00"

Scenario:To verify the Limit (maximum) acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:To verify the  Limit (maximum) acceptance criteria of values below 100 percentage

Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                      80 |
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

Scenario:Source Limit Maximum Field validatation when Limit Maximum field  equal to  Limit Minimum field when contribution type is percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      50 |
           | limitMaximumPercentage |                      50 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL398 : Maximum limit amount should not be equal or lesser than minimum limit"

Scenario:Source maximumDollarCompensation acceptance when contribution type is percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       1 |
           | maximumDollarCompensation |                      80 |
          
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the Maximum compensation acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       1 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      30 |
           | maximumPercentageCompensation |                      90 |          
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Maximum compensation acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       1 |
           | maximumDollarCompensation |                     100 |
          
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the validation message for Maximum compensation acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       1 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      30 |
           | maximumPercentageCompensation |                     101 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL189 : Maximum limit compensation  should not exceed 100 percentage"


Scenario: To verify the validation message for Maximum compensation field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                      10 |
           | limitMaximumDollar        |                      30 |
           | maximumDollarCompensation |                         |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1020 : Required"


Scenario:Source Limit Minimum Field acceptance when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                     600 |
           | limitMaximumDollar        |                     800 |
           | maximumDollarCompensation |                     800 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the validation message for Limit (minimum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       2 |
           | limitMinimumDollar |                         |
           | limitMaximumDollar |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL998 : Required"

Scenario:Source Limit Maximum Field acceptance when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                     600 |
           | limitMaximumDollar        |                     800 |
           | maximumDollarCompensation |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: toverify the validation message for Limit (maximum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       2 |
           | limitMinimumDollar |                     600 |
           | limitMaximumDollar |                         |

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
           | limitMaximumDollar |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1004 : Required"





