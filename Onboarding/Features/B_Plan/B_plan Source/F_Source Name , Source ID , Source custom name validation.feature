Feature: F_Source Name , Source ID , Source custom name validation
[BeforeTestRun]


Scenario: To verify the Source name data type acceptance
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
          | key       | value       |
          | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                 |
           | sourceName             | <SourceName>          |
           | limitMaximumPercentage |                   100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
Examples: 
| SourceName              | 
| random 10 alphabets     | 
| random 10 numerics      | 
| random 10 alphaNumerics | 
| random 40 alphabets     | 
| random 50 alphabets     | 

Scenario: To verify the Source ID data type acceptance
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key                    | value                 |
           | recordKeepingNumber    | <RecordKeepingNumber> |
           | limitMaximumPercentage |                   100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
Examples: 
| SourceName                                  |
| random 30 alphabets                         |
| random 10 specialCharacters                 |
| random 10 alphaNumericWithSpecialCharacters |
| random 25 alphabets                         |
| random 35 alphabets                         |
| random 0 alphabets                          |
| random 10 alphaNumerics                     |
| random 10 numerics                          |

Scenario: To verify the Source name data type validations
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
          | key       | value       |
          | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                 |
           | sourceName             | <SourceName>          |
           | limitMaximumPercentage |                   100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL400 : Source name should be alphanumeric"
Examples: 
| SourceName                                  |
| random 10 specialCharacters                 |
| random 10 alphaNumericWithSpecialCharacters |

Scenario: To verify the Source name field length acceptance of above 50 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
          | key       | value       |
          | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value               |
           | sourceName             | random 60 alphabets |
           | limitMaximumPercentage |                 100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL180 : Source name should not exceed 50 characters"


Scenario: To Verify the validation message for Source name by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
          | key       | value       |
          | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value              |
           | sourceName             | random 0 alphabets |
           | limitMaximumPercentage |                100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1141 : Required"

Scenario: To verify the Add Custom Source name field length acceptance of above 30 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
          | key       | value       |
          | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value               |
           | sourceName             | random 50 alphabets |
           | limitMaximumPercentage |                 100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""
