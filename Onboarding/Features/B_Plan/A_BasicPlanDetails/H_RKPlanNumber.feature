Feature: H_RKPlanNumber
[BeforeTestRun]

 Scenario: RK Plan number field validate error message as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  When Configuration has been made as per following
           | key          | value          |
           | PlanName     | random 10 alphabets     |
           | RkPlanNumber | random 0 alphabets  |
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
 Then API should give response as "PL007 : Required"


 Scenario:  RK Plan number field validate above 15 characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  When Configuration has been made as per following
           | key          | value               |
           | PlanName     | random 20 alphabets |
           | RkPlanNumber | random 20 alphabets |
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
 Then API should give response as "PL009 : Recording Keeping Plan Number length should not exceed 15 characters"

 Scenario: RK Plan number field acceptance special characters
   Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  When Configuration has been made as per following
           | key          | value                       |
           | PlanName     | random 10 alphabets         |
           | RkPlanNumber | random 10 specialCharacters |
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
 Then API should give response as "PL008 : Record Keeping Plan Number must be alphanumeric (including hyphen) "
    




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
| random 15 alphabets | random 15 alphabets     |13880
| random 10 alphabets | random 13 alphabets     |13881
| random 10 alphabets | random 10 alphabets     |13882
| random 10 alphabets | random 10 numerics      |13883
| random 10 alphabets | random 10 alphaNumerics |13885



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

