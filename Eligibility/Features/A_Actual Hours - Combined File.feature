Feature: A_Actual Hours - Combined File


Scenario: 144335 To verify the plan Actual Hour Eligibility rule for Anniversary-1yr Immediately satisfied with the Hours less than Actual hours (Ineligible)- Same day
	Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
	When Configuration has been done as mentioned below
| Key                          | Value |
| exclusionType                |     0 |
| immediateEligibility         | false |
| eligibilityType              |     2 |
| yearsOfServiceDefinition     |     1 |
| hours                        |  1000 |
| eligibilityCalculationPeriod |     1 |
| yearsOfServiceRequirement    |     1 |
| serviceCreditPeriod          |     2 |
| serviceCreditDay             |     1 |

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key       | Value      |
| HIRE DATE | 01/01/2023 |
| HOURS     | 900        |
| PAY DATE  | 03/01/2023 |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "File"

	Then the API response should contain the 2 following errors 
	| error_code |   error_message |
    | CM001      |   Required      |
    | CM057      |   Required      |











