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

And Model portfolio investment configured with 2 investments with ids as 281 and 282 for the property "ApplicableInvestments"

And Collection in a model is configured with 2 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 281   |
| 1           | AllocationPercentage | 60.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 282   |
| 2           | AllocationPercentage | 40.00 |
| 2           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 2 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 281   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 282   |
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

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values to save model portfolio as given below
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



@PlanActivationWithoutInvestmentAndEnrollment
Scenario:181829  Model Portfolio Transaction with single source contribution- Payroll

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

And Model portfolio investment configured with 3 investments with ids as 281 and 282 and 2037 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 281   |
| 1           | AllocationPercentage | 40.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 282   |
| 2           | AllocationPercentage | 40.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2037  |
| 3           | AllocationPercentage | 20.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 281   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 282   |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2037  |
| 3           | Status            | 1     |

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value              |
| 1           | InvestmentId              | <MPInvestmentId>   |
| 1           | InvestmentName            | <MPInvestmentName> |
| 1           | InvestmentPercentage      | 80.00              |
| 1           | DefaultElectionSettingsId | 0                  |
| 2           | InvestmentId              | <RInvestmentId>    |
| 2           | InvestmentName            | <RInvestmentName>  |  
| 2           | InvestmentPercentage      | 20.00              |
| 2           | DefaultElectionSettingsId | 0                  |

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values to save model portfolio as given below
| BlockNumber | Key                  | Value              |
| 1           | InvestmentId         | <MPInvestmentId>   |
| 1           | InvestmentName       | <MPInvestmentName> |
| 1           | InvestmentPercentage | 80.00              |
| 2           | InvestmentId         | <RInvestmentId>    |
| 2           | InvestmentName       | <RInvestmentName>  |  
| 2           | InvestmentPercentage | 20.00              |

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
| ModelPortfolioBalance | 8000  |
| MPInv1Balance         | 3200  |
| MPInv2Balance         | 3200  |
| MPInv3Balance         | 1600  |
| RInvBalance           | 2000  |
| MPInv1Units           | 320   |
| MPInv2Units           | 320   |
| MPInv3Units           | 160   |
| RInvUnits             | 200   |


@PlanActivationWithoutInvestmentAndEnrollment
Scenario:181829 Model Portfolio Transaction with multiple sources contribution - Payroll

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

And Model portfolio investment configured with 3 investments with ids as 281 and 282 and 2037 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 281   |
| 1           | AllocationPercentage | 40.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 282   |
| 2           | AllocationPercentage | 40.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2037  |
| 3           | AllocationPercentage | 20.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 281   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 282   |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2037  |
| 3           | Status            | 1     |

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value              |
| 1           | InvestmentId              | <MPInvestmentId>   |
| 1           | InvestmentName            | <MPInvestmentName> |
| 1           | InvestmentPercentage      | 80.00              |
| 1           | DefaultElectionSettingsId | 0                  |
| 2           | InvestmentId              | <RInvestmentId>    |
| 2           | InvestmentName            | <RInvestmentName>  |  
| 2           | InvestmentPercentage      | 20.00              |
| 2           | DefaultElectionSettingsId | 0                  |

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values to save model portfolio as given below
| BlockNumber | Key                  | Value              |
| 1           | InvestmentId         | <MPInvestmentId>   |
| 1           | InvestmentName       | <MPInvestmentName> |
| 1           | InvestmentPercentage | 80.00              |
| 2           | InvestmentId         | <RInvestmentId>    |
| 2           | InvestmentName       | <RInvestmentName>  |  
| 2           | InvestmentPercentage | 20.00              |

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 150      |
| Roth               | 220       |
| Match              | 600       |
| PLAN COMPENSATION  | 1000       |
| GROSS COMPENSATION | 500        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 150   |
| ModelPortfolioBalance1| 120   |
| MPInv1Balance         | 48    |
| MPInv2Balance         | 48    |
| MPInv3Balance         | 24    |
| RInvBalance           | 30    |
| MPInv1Units           | 4.8   |
| MPInv2Units           | 4.8   |
| MPInv3Units           | 2.4   |
| RInvUnits             | 3     |  

Then Employee account balance for the source "Match" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 600   |
| ModelPortfolioBalance1 | 480   |
| MPInv1Balance         | 192   |
| MPInv2Balance         | 192   |
| MPInv3Balance         | 96    |
| RInvBalance           | 120   |
| MPInv1Units           | 19.2  |
| MPInv2Units           | 19.2  |
| MPInv3Units           | 9.6   |
| RInvUnits             | 12.0  |

Then Employee account balance for the source "Roth" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 220   |
| ModelPortfolioBalance1 | 176   |
| MPInv1Balance         | 70.40 |
| MPInv2Balance         | 70.40 |
| MPInv3Balance         | 35.20 |
| RInvBalance           | 44.00 |
| MPInv1Units           | 7.04  |
| MPInv2Units           | 7.04  |
| MPInv3Units           | 3.52  |
| RInvUnits             | 4.4   |  


@PlanActivationWithoutInvestmentAndEnrollment
Scenario:181829 2 Model Portfolio Investment Transaction with single sources contribution with same allocation - Payroll

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

And Model portfolio investment configured with 3 investments with ids as 281 and 282 and 2037 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 281   |
| 1           | AllocationPercentage | 50.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 282   |
| 2           | AllocationPercentage | 30.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2037  |
| 3           | AllocationPercentage | 20.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

When Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 281   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 282   |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2037  |
| 3           | Status            | 1     |


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

And Model portfolio investment configured with 3 investments with ids as 2038 and 2039 and 2040 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 2038  |
| 1           | AllocationPercentage | 35.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 2039  |
| 2           | AllocationPercentage | 35.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2040  |
| 3           | AllocationPercentage | 30.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 2038  |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 2039  |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2040  |
| 3           | Status            | 1     |

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value              |
| 1           | InvestmentId              | <MPInvestmentId>   |
| 1           | InvestmentName            | <MPInvestmentName> |
| 1           | InvestmentPercentage      | 50.00              |
| 1           | DefaultElectionSettingsId | 0                  |
| 2           | InvestmentId              | <MPInvestmentId2>    |
| 2           | InvestmentName            | <MPInvestmentName2>  |  
| 2           | InvestmentPercentage      | 50.00              |
| 2           | DefaultElectionSettingsId | 0                  |

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values to save model portfolio as given below
| BlockNumber | Key                  | Value              |
| 1           | InvestmentId         | <MPInvestmentId>   |
| 1           | InvestmentName       | <MPInvestmentName> |
| 1           | InvestmentPercentage | 50.00              |
| 2           | InvestmentId         | <MPInvestmentId2>  |
| 2           | InvestmentName       | <MPInvestmentName2>|  
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
| ModelPortfolioBalance1| 5000  |
| MPInv1Balance         | 2500  |
| MPInv2Balance         | 1500  |
| MPInv3Balance         | 1000 |
| ModelPortfolioBalance2| 5000  |
| MPInv4Balance         | 1750	|
| MPInv5Balance         | 1750 |
| MPInv6Balance         | 1500 |
| MPInv1Units           | 250 |
| MPInv2Units           | 150  |
| MPInv3Units           | 100  |
| MPInv4Units           | 175  |
| MPInv5Units           | 175  |
| MPInv6Units           | 150  |




@PlanActivationWithoutInvestmentAndEnrollment
Scenario:181829 2 Model Portfolio Investment Transaction with multiple sources Contribution with equal allocation - Payroll

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

And Model portfolio investment configured with 3 investments with ids as 281 and 282 and 2037 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 281   |
| 1           | AllocationPercentage | 50.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 282   |
| 2           | AllocationPercentage | 30.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2037  |
| 3           | AllocationPercentage | 20.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

When Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 281   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 282   |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2037  |
| 3           | Status            | 1     |


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

And Model portfolio investment configured with 3 investments with ids as 2038 and 2039 and 2040 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 2038  |
| 1           | AllocationPercentage | 35.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 2039  |
| 2           | AllocationPercentage | 35.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2040  |
| 3           | AllocationPercentage | 30.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 2038  |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 2039  |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2040  |
| 3           | Status            | 1     |

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value              |
| 1           | InvestmentId              | <MPInvestmentId>   |
| 1           | InvestmentName            | <MPInvestmentName> |
| 1           | InvestmentPercentage      | 50.00              |
| 1           | DefaultElectionSettingsId | 0                  |
| 2           | InvestmentId              | <MPInvestmentId2>    |
| 2           | InvestmentName            | <MPInvestmentName2>  |  
| 2           | InvestmentPercentage      | 50.00              |
| 2           | DefaultElectionSettingsId | 0                  |

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values to save model portfolio as given below
| BlockNumber | Key                  | Value              |
| 1           | InvestmentId         | <MPInvestmentId>   |
| 1           | InvestmentName       | <MPInvestmentName> |
| 1           | InvestmentPercentage | 50.00              |
| 2           | InvestmentId         | <MPInvestmentId2>  |
| 2           | InvestmentName       | <MPInvestmentName2>|  
| 2           | InvestmentPercentage | 50.00              |

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 150      |
| Roth               | 220       |
| Match              | 600       |
| PLAN COMPENSATION  | 1000       |
| GROSS COMPENSATION | 500        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 150   |
| ModelPortfolioBalance1 | 75   |
| ModelPortfolioBalance2 | 75   |
| MPInv1Balance         | 37.50 |
| MPInv2Balance         | 22.50 |
| MPInv3Balance         | 15.00 |
| MPInv4Balance         | 26.25	|
| MPInv5Balance         | 26.25 |
| MPInv6Balance         | 22.50 |
| MPInv1Units           | 3.75  |
| MPInv2Units           | 2.25  |
| MPInv3Units           | 1.50  |
| MPInv4Units           | 2.625  |
| MPInv5Units           | 2.625  |
| MPInv6Units           | 2.25  |

Then Employee account balance for the source "Match" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 600   |
| ModelPortfolioBalance1 | 300   |
| ModelPortfolioBalance2 | 300   |
| MPInv1Balance         | 150.00 |
| MPInv2Balance         | 90.00 |
| MPInv3Balance         | 60.00 |
| MPInv4Balance         | 105.00 |
| MPInv5Balance         | 105.00 |
| MPInv6Balance         | 90.00 |
| MPInv1Units           | 15.00  |
| MPInv2Units           | 9.00  |
| MPInv3Units           | 6.00  |
| MPInv4Units           | 10.50  |
| MPInv5Units           | 10.50  |
| MPInv6Units           | 9.00  |

Then Employee account balance for the source "Roth" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 220   |
| ModelPortfolioBalance1 | 110   |
| ModelPortfolioBalance2 | 110   |
| MPInv1Balance         | 55.00 |
| MPInv2Balance         | 33.00 |
| MPInv3Balance         | 22.00 |
| MPInv4Balance         | 38.50 |
| MPInv5Balance         | 38.50 |
| MPInv6Balance         | 33.00 |
| MPInv1Units           | 5.50  |
| MPInv2Units           | 3.30  |
| MPInv3Units           | 2.20  |
| MPInv4Units           | 3.85  |
| MPInv5Units           | 3.85  |
| MPInv6Units           | 3.30  |



@PlanActivationWithoutInvestmentAndEnrollment
Scenario:181829 2 Model Portfolio Investment with source wise split up Transaction with multiple sources contribution- Payroll

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

And Model portfolio investment configured with 3 investments with ids as 281 and 282 and 2037 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 281   |
| 1           | AllocationPercentage | 50.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 282   |
| 2           | AllocationPercentage | 30.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2037  |
| 3           | AllocationPercentage | 20.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

When Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 281   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 282   |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2037  |
| 3           | Status            | 1     |


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

And Model portfolio investment configured with 3 investments with ids as 2038 and 2039 and 2040 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 281         |
#    | 282         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 2038  |
| 1           | AllocationPercentage | 35.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 2039  |
| 2           | AllocationPercentage | 35.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 2040  |
| 3           | AllocationPercentage | 30.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 2038  |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 2039  |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 2040  |
| 3           | Status            | 1     |

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value              |
| 1           | InvestmentId              | <MPInvestmentId>   |
| 1           | InvestmentName            | <MPInvestmentName> |
| 1           | InvestmentPercentage      | 50.00              |
| 1           | DefaultElectionSettingsId | 0                  |
| 2           | InvestmentId              | <MPInvestmentId2>    |
| 2           | InvestmentName            | <MPInvestmentName2>  |  
| 2           | InvestmentPercentage      | 50.00              |
| 2           | DefaultElectionSettingsId | 0                  |

When Collection in a model is configured with 6 blocks for the property "InvestmentElectionValuesList" with values as given below
| BlockNumber | Key                  | Value               |
| 1           | InvestmentId         | <MPInvestmentId>    |
| 1           | InvestmentName       | <MPInvestmentName>  |
| 1           | InvestmentPercentage | 50.00               |
| 1           | SourceId             | <PretaxSourceID>    |
| 2           | InvestmentId         | <MPInvestmentId2>   |
| 2           | InvestmentName       | <MPInvestmentName2> |
| 2           | InvestmentPercentage | 50.00               |
| 2           | SourceId             | <PretaxSourceID>    |
| 3           | InvestmentId         | <MPInvestmentId>    |
| 3           | InvestmentName       | <MPInvestmentName>  |
| 3           | InvestmentPercentage | 70.00               |
| 3           | SourceId             | <RothSourceID>      |
| 4           | InvestmentId         | <MPInvestmentId2>   |
| 4           | InvestmentName       | <MPInvestmentName2> |
| 4           | InvestmentPercentage | 30.00               |
| 4           | SourceId             | <RothSourceID>      |
| 5           | InvestmentId         | <MPInvestmentId>    |
| 5           | InvestmentName       | <MPInvestmentName>  |
| 5           | InvestmentPercentage | 70.00               |
| 5           | SourceId             | <MatchSourceID>     |
| 6           | InvestmentId         | <MPInvestmentId2>   |
| 6           | InvestmentName       | <MPInvestmentName2> |
| 6           | InvestmentPercentage | 30.00               |
| 6           | SourceId             | <MatchSourceID>     |  


Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 150        |
| Roth               | 220        |
| Match              | 600        |
| PLAN COMPENSATION  | 1000       |
| GROSS COMPENSATION | 500        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 150   |
| ModelPortfolioBalance1 | 75   |
| ModelPortfolioBalance2 | 75   |
| MPInv1Balance         | 37.50 |
| MPInv2Balance         | 22.50 |
| MPInv3Balance         | 15.00 |
| MPInv4Balance         | 26.25	|
| MPInv5Balance         | 26.25 |
| MPInv6Balance         | 22.50 |
| MPInv1Units           | 3.75  |
| MPInv2Units           | 2.25  |
| MPInv3Units           | 1.50  |
| MPInv4Units           | 2.625  |
| MPInv5Units           | 2.625  |
| MPInv6Units           | 2.25  |


Then Employee account balance for the source "Match" should be splitted as mentioned below
| Key                    | Value  |
| SourceBalance          | 600    |
| ModelPortfolioBalance1 | 300    |
| ModelPortfolioBalance2 | 300    |
| MPInv1Balance          | 150.00 |
| MPInv2Balance          | 90.00  |
| MPInv3Balance          | 60.00  |
| MPInv4Balance          | 105.00 |
| MPInv5Balance          | 105.00 |
| MPInv6Balance          | 90.00  |
| MPInv1Units            | 15.00  |
| MPInv2Units            | 9.00   |
| MPInv3Units            | 6.00   |
| MPInv4Units            | 10.50  |
| MPInv5Units            | 10.50  |
| MPInv6Units            | 9.00   |  

Then Employee account balance for the source "Roth" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 220   |
| ModelPortfolioBalance1 | 110   |
| ModelPortfolioBalance2 | 110   |
| MPInv1Balance         | 55.00 |
| MPInv2Balance         | 33.00 |
| MPInv3Balance         | 22.00 |
| MPInv4Balance         | 38.50 |
| MPInv5Balance         | 38.50 |
| MPInv6Balance         | 33.00 |
| MPInv1Units           | 5.50  |
| MPInv2Units           | 3.30  |
| MPInv3Units           | 2.20  |
| MPInv4Units           | 3.85  |
| MPInv5Units           | 3.85  |
| MPInv6Units           | 3.30  |