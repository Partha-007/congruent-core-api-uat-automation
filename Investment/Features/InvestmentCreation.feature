Feature: Investment creation



@PlanActivationWithoutInvestmentAndEnrollment
Scenario: Investment creation

Given Model is selected for the endpoint "/api/v1/Investment/AddMasterInvestment"

When Configuration has been made as per following
| Key                 | Value        |
| includeInvestmentIn | 1            |
| type                | 2            |
| status              | 1            |
| name                | SEAS010      |
| typeOfEarnings      | 1            |
| isInvestmentQDIA    | true         |
| investmentCategory  | 2            |
| fundCode            | ABshyy       |
| cusip               | SEAS00010    |
| ticker              | SEA10        |
| fundFamily          |              |
| volatility          | 1            |
| accountType         | 1            |
| tenantId            | 1            |
| shareClass          | 1            |
| isin                | SEAS00001210 |
| sedol               | SEAS010      |
| suspendedFromDate   |          |
| suspendedToDate     |          |


When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"
