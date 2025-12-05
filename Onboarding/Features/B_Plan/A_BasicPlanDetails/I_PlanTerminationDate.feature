Feature: I_PlanTerminationDate
[BeforeTestRun]

 Scenario: Plan Termination date field validate error message as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  And the property "EffectiveDate" is configured as "01/01/2023" 
  And the property "PlanTerminationDate" is configured as "06/01/2020" 
  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL017 : Plan Termination Date should exceed Effective Date."




Scenario: PLan short year start date field validate error message  
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value |
           | category           | 0     |
           | shortYearIndicator | true  |
  
When The date property "shortYearStartDate" is configured as "months" and should add "13" days to the current date
When The date property "shortYearEndDate" is configured as "months" and should add "14" days to the current date
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL031 : Start Year Begin Date cannot be greater than Current date + 1 Year."


Scenario:  PLan short year end date greater than start date field validate error message 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value                |
           | ShortYearIndicator | true                 |
           | ShortYearStartDate | 2023-06-01T00:00:00Z |
           | ShortYearEndDate   | 2023-05-01T00:00:00Z |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL023 : Short Year End Date should exceed Short Year Begin Date"
    

Scenario: PLan short year end date  field validate error message as required
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value                |
           | ShortYearIndicator | true                 |
           | ShortYearStartDate | 2023-06-01T00:00:00Z |
           | ShortYearEndDate   | null                 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL024 : Required"



Scenario: PLan short year start date  field validate error message as required
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value |
           | shortYearIndicator | true  |
           | shortYearStartDate | null  |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL371 : Required"

Scenario: PLan short year start and end date difference field validate error message 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value                |
           | shortYearStartDate | 2020-01-01T00:00:00Z |
           | shortYearEndDate   | 2021-05-03T00:00:00Z |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL032 : Difference between Short year begin date and Short year end should be less than one year."

    



