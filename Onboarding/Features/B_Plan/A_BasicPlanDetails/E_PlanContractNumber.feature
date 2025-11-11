Feature: E_PlanContractNumber
[BeforeTestRun]

 Scenario: Plan Contract number field mandatory validation(error message)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key           | value              |
           | PlanName      | random 5 alphabets |
           | RkPlanNumber  | random 10 Numerics |
           | TrsContractId | <trsContractId>    |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 2 following errors
| block | error_code | error_message                                              |
| 1     | PL043      | Contract Number must be alphanumeric and 5 characters long |
| 2     | PL043      | Contract Number must be alphanumeric and 5 characters long |

Examples: 
| trsContractId     |
| random 6 Numerics |
| random 4 Numerics |






 Scenario: Plan Contract number field mandatory validation
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
And Configuration has been made as per following
           | key           | value              |
           | PlanName      | random 5 alphabets |
           | RkPlanNumber  | random 10 Numerics |
           | TrsContractId | <trsContractId>    |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message
Examples: 
| trsContractId      |
| random 5 Numerics  |
| random 0 alphabets |


Scenario: Plan contract number field already exist validation
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When the property "PlanName" is configured with "alphabets" with 10 characters
And the property "RkPlanNumber" is configured with "alphabets" with 10 characters
And the property "TrsContractId" is configured as "12345" 
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
When the property "PlanName" is configured with "alphabets" with 10 characters
And the property "RkPlanNumber" is configured with "alphabets" with 10 characters
And the property "TrsContractId" is configured as "12345" 
Then API should give response as "PL044 : Contract number already exists."
