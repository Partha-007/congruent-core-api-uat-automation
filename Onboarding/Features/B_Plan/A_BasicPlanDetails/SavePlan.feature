Feature: SavePlan
[BeforeTestRun]

Scenario:7557 creating a plan with one step
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key          | value               |Scenario:7616 PLan name field acceptance below 250 characters
| planName     | random 10 alphabets | Scenario:7611 Plan name field acceptance alphabets
| rkPlanNumber | random 10 alphabets |
| pensionBenefitCode | random 2 alphabets |Scenario:166355 To verify the  Pension Benefit Code field accepting the alphabets in the Plan details page-Plan
| welfareBenefitCode | random 2 alphabets |Scenario:166366 To verify the  Welfare Benefit Code field accepting the numbers in the Plan details page-Plan



When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message


Scenario:7608 PLan name field validate error message as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key           | value               |
| planName      | random 0 alphabets  |
| rkPlanNumber  | random 10 alphabets |
| effectiveDate |                     |  

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL001      | Required      |
	| PL018      | Required      |Scenario:13862 PLan effective date field validate error message as required




Scenario:7609 Plan Name already exist field validate error message 
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key           | value    |
| planName      | testPlan |
| irsPlanNumber |      124 |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
When Configuration has been made as per following
| key           | value    |
| planName      | testPlan |
| irsPlanNumber |      124 |  
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message             |
	| PL975      | Plan name already exists. |

Scenario:7610 PLan name field acceptance special characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key          | value                       |
| planName     | random 10 specialCharacters |
| rkPlanNumber | random 10 alphabets         |
| pensionBenefitCode | random 2 specialCharacters         |
| welfareBenefitCode | random 2 specialCharacters         |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                     |
	| PL011      | Plan Name should be alpha numeric |
	|            |                                   | Scenario:166357 To verify the  Pension Benefit Code accepting the specialcharacters in the Plan details page-Plan
	|            |                                   |Scenario:166368 To verify the  Welfare Benefit Code field accepting the specialcharacters  in the Plan details page-Plan



Scenario:7612 Plan name field acceptance numerics
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key          | value               |
| planName     | random 10 numerics  |
| pensionBenefitCode     | random 2 numerics  |Scenario:166354 To verify the  Pension Benefit Code field accepting the numerics in the Plan details page-Plan
| welfareBenefitCode | random 2 numerics |Scenario:166365 To verify the  Welfare Benefit Code field accepting the numbers in the Plan details page-Plan
| rkPlanNumber | random 10 alphabets |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario:7614 PLan name field above 250 characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key          | value                       |
| planName     | random 251 alphabets |
| rkPlanNumber | random 10 alphabets         |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                     |
	| PL012      | Plan Name length should not exceed 250 characters |

Scenario:7615 PLan name field acceptance equal to 250 characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key          | value                |
| planName     | random 250 alphabets |
| rkPlanNumber | random 10 alphabets  |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario:108844 PLan name field acceptance alphanumerics
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value                   |
| planName           | random 10 alphanumerics |
| pensionBenefitCode | random 2 alphanumerics  | Scenario:166356 To verify the  Pension Benefit Code field accepting the alphanumeric in the Plan details page-Plan
| welfareBenefitCode       | random 2 alphanumerics     |Scenario:166367 To verify the  Welfare Benefit Code field accepting the alpha Numerics in the Plan details page-Plan
| rkPlanNumber       | random 10 alphabets     |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message
