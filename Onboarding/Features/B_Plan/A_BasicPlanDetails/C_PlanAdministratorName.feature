Feature: C_PlanAdministratorName
[BeforeTestRun]

 Scenario: validating the save plan page(error message)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  When Configuration has been made as per following
           | key          | value              |
           | PlanName     | random 5 alphabets |
           | RkPlanNumber | random 10 Numerics |
  And Collection in a model is configured with 3 blocks for the property "PlanAdministrator" with values to save model portfolio as given below
| BlockNumber | Key  | Value                                      |
| 1           | Name | random 55 alphabets                        |
| 2           | Name | random 5 specialCharacters                 |
| 3           | Name | random 5 alphanumericwithspecialCharacters |  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 3 following errors
| block | error_code | error_message                                                   |
| 1     | PL028      | Plan Administrator Name length should not exceed  50 characters |
| 2     | PL029      | Plan Administartor Name should be alphanumeric                  |
| 3     | PL029      | Plan Administartor Name should be alphanumeric                  |




 Scenario: validating the save plan page
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key          | value              |
           | PlanName     | random 5 alphabets |
           | RkPlanNumber | random 10 Numerics |
 And Collection in a model is configured with 1 blocks for the property "PlanAdministrator" with values to save model portfolio as given below
| BlockNumber | Key  | Value                  |
| 1           | Name | random 0 alphabets     |
| 2           | Name | random 50 alphabets    |
| 3           | Name | random 45 alphabets    |
| 4           | Name | random 5 alphabets     |
| 5           | Name | random 5 Numerics      |
| 6           | Name | random 5 alphanumerics |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message