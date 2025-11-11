Feature: G_PlanIRS
[BeforeTestRun]

 Scenario: Plan IRS field validation as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key           | value               |
           | PlanName      | random 10 alphabets |
           | RkPlanNumber  | random 10 Numerics  |
           | IrsPlanNumber | <irsPlanNumber>     |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 6 following errors
| block | error_code | error_message                                            |
| 1     | PL026      | Required                                                 |
| 2     | PL041      | IRS Plan Nu	mber length should not exceed  3 characters |
| 3     | PL022      | IRS PlanNumber should be Numbers                         |
| 4     | PL022      | IRS PlanNumber should be Numbers                         |
| 5     | PL022      | IRS PlanNumber should be Numbers                         |
| 6     | PL022      | IRS PlanNumber should be Numbers                         |

Examples: 
| irsPlanNumber                              |
|                                            |
| random 10 Numerics                         |
| random 3 alphabets                         |
| random 3 specialCharacters                 |
| random 3 alphanumericwithSpecialCharacters |
| random 3 alphanumerics                     |







 Scenario: Plan IRS field acceptance

  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
                      | key           | value              |
                      | PlanName      | random 5 alphabets |
                      | RkPlanNumber  | random 10 Numerics |
                      | IrsPlanNumber | <irsPlanNumber>    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message
Examples: 
| irsPlanNumber     | 
| random 3 Numerics | 
| random 2 Numerics | 

Scenario: Plan IRS field already exist validation
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "PlanName" is configured with "alphabets" with 10 characters
And the property "RkPlanNumber" is configured with "alphabets" with 10 characters
And the property "IrsPlanNumber" is configured as "123" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
When the property "PlanName" is configured with "alphabets" with 10 characters
And the property "RkPlanNumber" is configured with "alphabets" with 10 characters
And the property "IrsPlanNumber" is configured as "123" 
Then API should respond with successful message