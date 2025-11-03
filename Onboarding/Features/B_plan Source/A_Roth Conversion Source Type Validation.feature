Feature: A_Roth Conversion Source Type Validation
[BeforeTestRun]

Scenario: To verify the Save of the Roth Conversion Source Type with error message 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "SourceName" is configured as "RothConversion" 
And the property "SourceType" is configured as "1" 
And the property "SourceCategory" is configured as "2" 
And the property "SourceSubCategory" is configured as "5" 
And the property "SourceSubSubCategory" is configured as "3" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
And the property "SourceType" is configured as "1" 
And the property "SourceCategory" is configured as "2" 
And the property "SourceSubCategory" is configured as "5" 
And the property "SourceSubSubCategory" is configured as "3" 
Then API should give response as "PL949 : Only one In-Plan Roth Conversion source is allowed per plan"

Scenario: To verify the Save of the Roth Conversion Source Type 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "SourceName" is configured as "RothConversion" 
And the property "SourceType" is configured as "1" 
And the property "SourceCategory" is configured as "2" 
And the property "SourceSubCategory" is configured as "5" 
And the property "SourceSubSubCategory" is configured as "3" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message
