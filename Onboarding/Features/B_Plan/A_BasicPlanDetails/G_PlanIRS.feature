Feature: G_PlanIRS
[BeforeTestRun]

 Scenario: Plan IRS field validation with
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
Then API should give response as "PL022 : IRS PlanNumber should be Numbers"
Examples: 
| irsPlanNumber                              |
| random 3 alphabets                         |
| random 3 specialCharacters                 |
| random 3 alphanumericwithSpecialCharacters |
| random 3 alphanumerics                     |

Scenario: Plan IRS field validation as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key           | value               |
           | PlanName      | random 10 alphabets |
           | RkPlanNumber  | random 10 Numerics  |
           | IrsPlanNumber |                     |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL026 : Required"

 Scenario: Plan IRS field validation with more than 3 digits
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key           | value               |
           | PlanName      | random 10 alphabets |
           | RkPlanNumber  | random 10 Numerics  |
           | IrsPlanNumber | random 10 Numerics  |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL025 : IRS Plan Number length should not exceed  3 characters"



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

 Scenario:13877 Plan IRS field already exist validation    
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