
Feature: A_SavePlan
[BeforeTestRun]

Scenario: save plan (successful response)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
#And Collection in a model is configured with 15 blocks for the property "PlanAdministrator" with values to save model portfolio as given below
#| BlockNumber | Key  | Value |
#| 1           | Name | ABCD  |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message


 Scenario: validating the save plan page
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
  And Configuration has been made as per following
| propertyName | value               |
| planName     |                     |
| rkPlanNumber |                     |
#| planName     |                     |
#| rkPlanNumber |                     |
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors
| error_code | error_message |
| PL001      | Required      |
