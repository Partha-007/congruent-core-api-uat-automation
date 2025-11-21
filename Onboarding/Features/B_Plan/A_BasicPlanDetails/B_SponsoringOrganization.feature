Feature: B_SponsoringOrganization
[BeforeTestRun]

Scenario:Select a plan level field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | propertyName | value               |
 | PlanName     | random 10 alphabets |
 | Level        |                     |
 | RkPlanNumber | random 10 alphabets |
 
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL002 : Required"

Scenario: Select a plan type field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | PlanName     | random 10 alphabets |
 | PlanType     |                     |
 | RkPlanNumber | random 10 alphabets |
 | PlanName     | random 10 alphabets |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL003 : Required"


Scenario: Select a company name field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | Category     | 0                   |
 | Level        |                     |
 | CompanyId    |                     |
 | RkPlanNumber | random 10 alphabets |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL954 : Required"

 Scenario:Select a sponsoring organization field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | PlanName     | random 10 alphabets |
 | Category     | 1                   |
 | Level        | 1                   |
 | CompanyId    |                     |
 | RkPlanNumber | random 10 alphabets |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL013 : Required"









