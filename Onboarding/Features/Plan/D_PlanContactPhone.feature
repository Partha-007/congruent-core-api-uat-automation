Feature: D_PlanContactPhone
[BeforeTestRun]

 Scenario: validating the save plan page(error message)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key           | value              |
           | PlanName      | random 5 alphabets |
           | RkPlanNumber  | random 10 Numerics |
 And Collection in a model is configured with 1 blocks for the property "PlanAdministrator" with values to save model portfolio as given below
| BlockNumber | Key               | Value               |
| 1           | MobilePhoneNumber | <MobilePhoneNumber> |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 3 following errors
| block | error_code | error_message                                 |
| 1     | PL039      | Valid Phone Number (XXX-XXX-XXXX) is required |  
| 2     | PL039      | Valid Phone Number (XXX-XXX-XXXX) is required |
| 3     | PL039      | Valid Phone Number (XXX-XXX-XXXX) is required |
Examples: 
| MobilePhoneNumber  |
| 123-4567-7890      |
| random 12 Numerics |
| random 5 Numerics  |





 Scenario: validating the save plan page
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key           | value              |
           | PlanName      | random 5 alphabets |
           | RkPlanNumber  | random 10 Numerics |
           | TrsContractId | <trsContractId>    |
 And Collection in a model is configured with 1 blocks for the property "PlanAdministrator" with values to save model portfolio as given below
| BlockNumber | Key               | Value               |
| 1           | MobilePhoneNumber | <MobilePhoneNumber> |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message
Examples: 
| trsContractId     | MobilePhoneNumber |
| random 5 Numerics | random 0 Numerics |
| random 5 Numerics | 123-456-7890      |








