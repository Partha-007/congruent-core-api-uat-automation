Feature: F_PlanEmailAddress
[BeforeTestRun]

 Scenario:13915 Plan Email Address criteria of invalid email 
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key          | value              |
           | PlanName     | random 5 alphabets |
           | RkPlanNumber | random 10 Numerics |
           | Email        | random 5 Numerics  |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL040 : Email is in invalid format"


Scenario:13916 Plan Email Address acceptance criteria of above 80 characters   
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key          | value              |
           | PlanName     | random 5 alphabets |
           | RkPlanNumber | random 10 Numerics |
           | Email        | random 76 Numerics |  

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL041 : Email address length should not exceed more than 80 characters"






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