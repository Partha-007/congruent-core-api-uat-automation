Feature: H_RKPlanNumber
[BeforeTestRun]

 Scenario: RK Plan number field validate error message as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  When Configuration has been made as per following
           | key          | value          |
           | PlanName     | <planName>     |
           | RkPlanNumber | <rkPlanNumber> |
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 3 following errors
| block | error_code | error_message                                                        |
| 1     | PL007      | Required                                                             |
| 2     | PL009      | Recording Keeping Plan Number length should not exceed 15 characters |
| 3     | PL008      | Record Keeping Plan Number must be alphanumeric (including hyphen)   |

Examples:
| planName            | rkPlanNumber                |
| random 10 alphabets | random 0 alphabets          |
| random 20 alphabets | random 20 alphabets         |
| random 10 alphabets | random 10 specialCharacters |
    




 Scenario: RK Plan number field acceptance
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key          | value          |
           | PlanName     | <planName>     |
           | RkPlanNumber | <rkPlanNumber> |
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Examples:
| planName            | rkPlanNumber            |
| random 15 alphabets | random 15 alphabets     |
| random 10 alphabets | random 13 alphabets     |
| random 10 alphabets | random 10 alphabets     |
| random 10 alphabets | random 10 numerics      |
| random 10 alphabets | random 10 alphaNumerics |



Scenario: RkPlannumber already exist field validate error message 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "PlanName" is configured with "alphabets" with 10 characters
And the property "Category" is configured as "0" 
And the property "RkPlanNumber" is configured as "ABC" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
When the property "PlanName" is configured with "alphabets" with 10 characters
And the property "Category" is configured as "0" 
And the property "RkPlanNumber" is configured as "ABC" 
Then API should give response as "PL014 : RKPlanNumber already exists."

