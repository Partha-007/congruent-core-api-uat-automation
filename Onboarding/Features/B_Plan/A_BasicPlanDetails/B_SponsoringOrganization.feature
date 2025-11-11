Feature: B_SponsoringOrganization
[BeforeTestRun]

 Scenario: validating the save plan page(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | propertyName | value               |
 | PlanName     | random 10 alphabets |
 | Level        |                     |
 #| RkPlanNumber | random 10 alphabets |
 #| PlanName     | random 10 alphabets |
 #| PlanType     |                     |
 #| RkPlanNumber | random 10 alphabets |
 #| PlanName     | random 10 alphabets |
 #| Category     | 0                   |
 #| Level        |                     |
 #| CompanyId    |                     |
 #| RkPlanNumber | random 10 alphabets |
 #| PlanName     | random 10 alphabets |
 #| Category     | 1                   |
 #| Level        | 1                   |
 #| CompanyId    |                     |
 #| RkPlanNumber | random 10 alphabets |

And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL002 : Required"
#Then the API response should contain the 4 following errors
#| error_code | error_message |
#| PL002      | Required      |
#| PL003      | Required      |
#| PL954      | Required      |
#| PL013      | Required      |







