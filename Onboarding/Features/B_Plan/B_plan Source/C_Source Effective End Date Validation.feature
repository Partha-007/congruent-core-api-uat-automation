Feature: C_Source Effective End Date Validation
[BeforeTestRun]

Scenario: To verify the Effective end date acceptance criteria of format "mm/dd/yyyy" 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                    |
           | SourceName         | random 10 alphaNumerics  |
           | EffectiveStartDate | 2023-01-01T10:02:00.490Z |
           | EffectiveEndDate   | 2022-01-01T10:02:00.490Z |
Then API should give response as "PL183 : Effective Start Date should be prior to the Effective End Date"

Scenario: To verify the validation message for Effective Start Date is prior to the Effective End Date in source page
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                |
           | SourceName         | <sourceName>         |
           | EffectiveStartDate | <effectiveStartDate> |
           | EffectiveEndDate   | <effectiveEndDate>   |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
Examples: 
| sourceName              | effectiveStartDate       | effectiveEndDate         |
| random 10 alphaNumerics | 2023-04-01T10:02:00.490Z | 2023-04-02T10:02:00.490Z |
| random 10 alphaNumerics | 2023-01-01T10:02:00.490Z |                          |