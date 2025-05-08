Feature: ModelPortfolio

A short summary of the feature

@PlanActivationWithoutInvestmentAndEnrollment
Scenario: Model portfolio investment added and account balance verified

Given Model is selected for the endpoint "/api/v1/Investment/AddMasterInvestment"

When Configuration has been made as per following
| Key                   | Value |
| includeInvestmentIn   | 1     |
| type                  | 1     |
| status                | 1     |
| riskType              | 2     |
| isReallocationAllowed | true  |
| isRebalanceAllowed    | true  |
| handlePortfolio       | 1     |
| marketTimingRule      | 1     |
| suspendedFromDate     |       |
| suspendedToDate       |       |
| investmentCategory    |       |
| companyId             |       |
| fundCode              |       |
| cusip                 |       |
| ticker                |       |
| fundFamily            |       |
| sedol                 |       |
| isin                  |       |

When the property "name" is configured with "alphabets" with 10 characters

And Model portfolio investment configured with 2 investments with ids as 5630 and 5631 for the property "ApplicableInvestments"

And Collection in a model is configured with 2 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 5630  |
| 1           | AllocationPercentage | 60.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 5631  |
| 2           | AllocationPercentage | 40.00 |
| 2           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 2 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 5630  |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 5631  |
| 2           | Status            | 1     |

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value              |
| 1           | InvestmentId              | <MPInvestmentId>   |
| 1           | InvestmentName            | <MPInvestmentName> |
| 1           | InvestmentPercentage      | 50.00              |
| 1           | DefaultElectionSettingsId | 0                  |
| 2           | InvestmentId              | <RInvestmentId>    |
| 2           | InvestmentName            | <RInvestmentName>  |  
| 2           | InvestmentPercentage      | 50.00              |
| 2           | DefaultElectionSettingsId | 0                  |

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values as given below
| BlockNumber | Key                  | Value              |
| 1           | InvestmentId         | <MPInvestmentId>   |
| 1           | InvestmentName       | <MPInvestmentName> |
| 1           | InvestmentPercentage | 50.00              |
| 2           | InvestmentId         | <RInvestmentId>    |
| 2           | InvestmentName       | <RInvestmentName>  |  
| 2           | InvestmentPercentage | 50.00              |

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 10000      |
| PLAN COMPENSATION  | 1000       |
| GROSS COMPENSATION | 500        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 10000 |
| ModelPortfolioBalance | 5000  |
| MPInv1Balance         | 3000  |
| MPInv2Balance         | 2000  |
| RInvBalance           | 5000  |
| MPInv1Units           | 300   |
| MPInv2Units           | 200   |
| RInvUnits             | 500   |
