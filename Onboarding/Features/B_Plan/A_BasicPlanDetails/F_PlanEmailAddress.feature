Feature: F_PlanEmailAddress
[BeforeTestRun]

 Scenario: Plan Email Address criteria of invalid email 

  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key           | value              |
           | PlanName      | random 5 alphabets |
           | RkPlanNumber  | random 10 Numerics |
           | Email         | <email>            |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 2 following errors
| block | error_code | error_message                                                  |
| 1     | PL040      | Email is in invalid format                                     |
| 2     | PL041      | Email address length should not exceed more than 80 characters |

Examples: 
| email              |
| random 5 Numerics  |
| random 76 Numerics |






 Scenario: Plan Email Address mandatory validation 

  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
                      | key           | value              |
                      | PlanName      | random 5 alphabets |
                      | RkPlanNumber  | random 10 Numerics |
                      | Email         | <email>            |
                      | TrsContractId | <trsContractId>    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message
Examples: 
| trsContractId     | email               |
| random 5 Numerics | random 0 alphabets  |
| random 5 Numerics | random 70 alphabets |
| random 5 Numerics | random 50 alphabets |