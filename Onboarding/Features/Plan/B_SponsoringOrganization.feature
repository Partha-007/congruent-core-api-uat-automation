Feature: B_SponsoringOrganization
[BeforeTestRun]

 Scenario: validating the save plan page(error message)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
| block | propertyName | value               |
| 1     | PlanName     | random 10 alphabets |
| 1     | Level        |                     |
| 1     | RkPlanNumber | random 10 alphabets |
| 2     | PlanName     | random 10 alphabets |
| 2     | PlanType     |                     |
| 2     | RkPlanNumber | random 10 alphabets |
| 3     | PlanName     | random 10 alphabets |
| 3     | Category     | 0                   |
| 3     | Level        |                     |
| 3     | CompanyId    |                     |
| 3     | RkPlanNumber | random 10 alphabets |
| 4     | PlanName     | random 10 alphabets |
| 4     | Category     | 1                   |
| 4     | Level        | 1                   |
| 4     | CompanyId    |                     |
| 4     | RkPlanNumber | random 10 alphabets |

And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAsync"
Then the API response should contain the 4 following errors
| block | error_code | error_message |
| 1     | PL002      | Required      |
| 2     | PL003      | Required      |
| 3     | PL954      | Required      |
| 4     | PL013      | Required      |







