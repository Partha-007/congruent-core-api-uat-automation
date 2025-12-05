Feature: D_Source Effective Start Date Validation
[BeforeTestRun]
    
Scenario: To verify the Effective start date acceptance criteria of format "mm/dd/yyyy"Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                    |
           | SourceName         | random 10 alphaNumerics  |
           | EffectiveStartDate | 2023-04-01T10:02:00.490Z |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the validation message for Effective start date by leaving empty 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "EffectiveStartDate" is configured as "" 
Then API should give response as "PL182 :Required"