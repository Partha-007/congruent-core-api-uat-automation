Feature: F_Source Name , Source ID , Source custom name validation
[BeforeTestRun]


Scenario: To verify the Source name data type acceptance
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                 | value                 |
           | sourceName          | <SourceName>          |
           | recordKeepingNumber | <RecordKeepingNumber> |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
Examples: 
| SourceName              |
| random 10 alphabets     |
| random 10 numerics      |
| random 10 alphaNumerics |
| random 40 alphabets     |
| random 50 alphabets     |

