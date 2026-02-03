@MatchPlanActivation
Feature: MatchCalculation

Scenario: Validate Match Calculation Based on Age Tiered when the Participant have less than configured Age(<18)
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
| propertyName                  | value            |
| sourceName                    | ERMatch          |
| sourceType                    | 2                |
| sourceCategory                | 6                |
| sourceCode                    | D                |
| effectiveStartDate            | 01/01/2021       |
| responsibleMode               | 2                |
| eligiblePaymentType           | 1                |
| sourceId                      | <PretaxSourceID> |
| employerContributionType      | 4                |
| periodForCalculation          | 0                |
| catchUpType                   | 1                |
| limitMaximumPercentage        | 50               |
| limitMinimumPercentage        | 10               |
| maximumPercentageCompensation | 60               |

And Collection in a model is configured with 3 blocks for the property "MatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value |
| 1           | Order                  | 1     |
| 1           | From                   | 18    |
| 1           | To                     | 30    |
| 1           | MatchPercentage        | 50.55 |
| 1           | CompensationPercentage | 22.22 |
| 2           | From                   | 31    |
| 2           | To                     | 45    |
| 2           | MatchPercentage        | 40.44 |
| 2           | CompensationPercentage | 15.15 |
| 3           | From                   | 46    |
| 3           | To                     | 60    |
| 3           | MatchPercentage        | 30.33 |
| 3           | CompensationPercentage | 10.10 |

And Collection in a model is configured with 1 blocks for the property "AdditionalMatchSources" with values as given below
| BlockNumber | Key                          | Value                |
|           1 | AllocationEffectiveStartDate | -10_day              |
|           1 | AllocationEffectiveEndDate   | +10_day              |
|           1 | IsSafeHarbourMatch           | false                |
|           1 | EmployerContributionType     |                    4 |
|           1 | AllocationFormulaAppliesTo   |                    1 |
#|           1 | EmployeeClassificationCodeId | <ClassificationL1Id> |

And Collection in a model is configured with 3 blocks for the property "AdditionalMatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value |
| 1           | Order                  | 1     |
| 1           | From                   | 18    |
| 1           | To                     | 30    |
| 1           | MatchPercentage        | 23.66 |
| 1           | CompensationPercentage | 22.22 |
| 2           | From                   | 31    |
| 2           | To                     | 45    |
| 2           | MatchPercentage        | 21.78 |
| 2           | CompensationPercentage | 22.22 |
| 3           | From                   | 46    |
| 3           | To                     | 60    |
| 3           | MatchPercentage        | 15.67 |
| 3           | CompensationPercentage | 22.22 |


And Collection in a model is configured with 1 blocks for the property "AvailableEmployeeClassifications" with values as given below
| BlockNumber | Key                          | Value                |
|           1 | EmployeeClassificationCodeId | <ClassificationL1Id> |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"

Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
| propertyName                  | value            |
| sourceName                    | Match            |
| sourceType                    | 2                |
| sourceCategory                | 6                |
| sourceCode                    | C                |
| effectiveStartDate            | 01/01/2021       |
| responsibleMode               | 2                |
| eligiblePaymentType           | 1                |
| sourceId                      | <PretaxSourceID> |
| employerContributionType      | 5                |
| periodForCalculation          | 0                |
| catchUpType                   | 1                |
| limitMaximumPercentage        | 50               |
| limitMinimumPercentage        | 10               |
| maximumPercentageCompensation | 60               |

And Collection in a model is configured with 3 blocks for the property "MatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value |
| 1           | Order                  | 1     |
| 1           | From                   | 0     |
| 1           | To                     | 2     |
| 1           | MatchPercentage        | 50.55 |
| 1           | CompensationPercentage | 22.22 |
| 2           | From                   | 3     |
| 2           | To                     | 5     |
| 2           | MatchPercentage        | 40.44 |
| 2           | CompensationPercentage | 15.15 |
| 3           | From                   | 6     |
| 3           | To                     | 8     |
| 3           | MatchPercentage        | 30.33 |
| 3           | CompensationPercentage | 10.10 |

And Collection in a model is configured with 1 blocks for the property "AdditionalMatchSources" with values as given below
| BlockNumber | Key                          | Value   |
| 1           | AllocationEffectiveStartDate | -10_day |
| 1           | AllocationEffectiveEndDate   | +10_day |
| 1           | IsSafeHarbourMatch           | false   |
| 1           | EmployerContributionType     | 5       |
| 1           | AllocationFormulaAppliesTo   | 1       |


And Collection in a model is configured with 1 blocks for the property "AdditionalMatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value |
| 1           | Order                  | 1     |
| 1           | From                   | 0     |
| 1           | To                     | 2     |
| 1           | MatchPercentage        | 23.66 |
| 1           | CompensationPercentage | 22.22 |
| 2           | From                   | 3     |
| 2           | To                     | 5     |
| 2           | MatchPercentage        | 21.78 |
| 2           | CompensationPercentage | 22.22 |
| 3           | From                   | 6     |
| 3           | To                     | 8     |
| 3           | MatchPercentage        | 15.67 |
| 3           | CompensationPercentage | 22.22 |

And Collection in a model is configured with 1 blocks for the property "AvailableEmployeeClassifications" with values as given below
| BlockNumber | Key                    | Value |
| 1           | EmployeeClassificationCodeId | <ClassificationL1Id> |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"

Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
| propertyName                  | value            |
| sourceName                    | ERQACAMatch      |
| sourceType                    | 2                |
| sourceCategory                | 6                |
| sourceCode                    | 6                |
| effectiveStartDate            | 01/01/2021       |
| responsibleMode               | 2                |
| eligiblePaymentType           | 1                |
| sourceId                      | <PretaxSourceID> |
| employerContributionType      | 6                |
| periodForCalculation          | 0                |
| catchUpType                   | 1                |
| limitMaximumPercentage        | 50               |
| limitMinimumPercentage        | 10               |
| maximumPercentageCompensation | 60               |

And Collection in a model is configured with 3 blocks for the property "MatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value      |
| 1           | Order                  | 1          |
| 1           | FromDate               | 05/05/2016 |
| 1           | MatchPercentage        | 50.55      |
| 1           | CompensationPercentage | 22.22      |
| 1           | Condition              | 1          |
| 2           | FromDate               | 05/05/2019 |
| 2           | ToDate                 | 05/05/2021 |
| 2           | MatchPercentage        | 40.44      |
| 2           | CompensationPercentage | 15.15      |
| 2           | Condition              | 2          |
| 3           | FromDate               | 05/05/2022 |
| 3           | MatchPercentage        | 30.33      |
| 3           | CompensationPercentage | 10.10      |
| 3           | Condition              | 3          |


And Collection in a model is configured with 1 blocks for the property "AdditionalMatchSources" with values as given below
| BlockNumber | Key                          | Value   |
| 1           | AllocationEffectiveStartDate | -10_day |
| 1           | AllocationEffectiveEndDate   | +10_day |
| 1           | IsSafeHarbourMatch           | false   |
| 1           | EmployerContributionType     | 6       |
| 1           | AllocationFormulaAppliesTo   | 1       |

And Collection in a model is configured with 1 blocks for the property "AdditionalMatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value      |
| 1           | Order                  | 1          |
| 1           | FromDate               | 05/05/2016 |
| 1           | MatchPercentage        | 23.66      |
| 1           | CompensationPercentage | 22.22      |
| 1           | Condition              | 1          |
| 2           | FromDate               | 05/05/2019 |
| 2           | ToDate                 | 05/05/2021 |
| 2           | MatchPercentage        | 21.78      |
| 2           | CompensationPercentage | 22.22      |
| 2           | Condition              | 2          |
| 3           | FromDate               | 05/05/2022 |
| 3           | MatchPercentage        | 15.67      |
| 3           | CompensationPercentage | 22.22      |
| 3           | Condition              | 3          |

And Collection in a model is configured with 1 blocks for the property "AvailableEmployeeClassifications" with values as given below
| BlockNumber | Key                    | Value |
| 1           | EmployeeClassificationCodeId | <ClassificationL1Id> |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value          |
| HIRE DATE         | <HireDate>     |
| HOURS             | <Hours>        |
| PAY DATE          | <PayDate>      |
| BIRTH DATE        | <BirthDate>    |
| PAYROLL FREQUENCY | <Frequency>    |
| PLAN COMPENSATION | <PlanComp>     |
| Pretax            | <Pretax>       |
| LOCATION          | <LocationCode> |

When File upload is executed for the file "CombinedFile.csv"

Then API should respond Match Calculated values as
| SourceName  | CalculatedAmount   | PP Amount        | YTD Amount        |
| ERMatch     | <ERMatch_Calc>     | <ERMatch_PP>     | <ERMatch_YTD>     |
| Match       | <Match_Calc>       | <Match_PP>       | <Match_YTD>       |
| ERQACAMatch | <ERQACAMatch_Calc> | <ERQACAMatch_PP> | <ERQACAMatch_YTD> |



Examples: 
| HireDate   | Hours | PayDate    | BirthDate  | Frequency | LocationCode | PlanComp | Pretax | ERMatch_Calc | ERMatch_PP | ERMatch_YTD | Match_Calc | Match_PP | Match_YTD | ERQACAMatch_Calc | ERQACAMatch_PP | ERQACAMatch_YTD |
| 05/05/2015 | 1000  | 06/05/2024 | 04/04/2007 | Monthly   |              | 10000    | 10000  | 0.00         | 0.00       | 0.00        | 0.00       | 0.00     | 0.00      | 1123.22          | 1123.22        | 1123.22         |
| 5/5/2016   | 1000  | 6/5/2024   | 4/4/2006   | Monthly   |              | 10000    | 10000  | 1123.22      | 1123.22    | 1123.22     | 206.33     | 206.33   | 206.33    | 1123.22          | 1123.22        | 1123.22         |
| 1/5/2020   | 1000  | 6/5/2024   | 4/4/1992   | Monthly   |              | 10000    | 10000  | 612.67       | 612.67     | 612.67      | 612.67     | 612.67   | 612.67    | 612.67           | 612.67         | 612.67          |
| 5/5/2022   | 1000  | 6/5/2024   | 4/4/1964   | Monthly   |              | 10000    | 10000  | 306.33       | 306.33     | 306.33      | 1123.22    | 1123.22  | 1123.22   | 306.33           | 306.33         | 306.33          |
| 5/5/2023   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   |              | 10000    | 10000  | 0.00         | 0.00       | 0.00        | 1123.22    | 1123.22  | 1123.22   | 306.33           | 306.33         | 306.33          |
| 5/5/2015   | 1000  | 6/5/2024   | 4/4/2007   | Monthly   | L1           | 10000    | 10000  | 0.00         | 0.00       | 0.00        | 0.00       | 0.00     | 0.00      | 525.73           | 525.73         | 525.73          |
| 5/5/2016   | 1000  | 6/5/2024   | 4/4/2006   | Monthly   | L1           | 10000    | 10000  | 525.73       | 525.73     | 525.73      | 348.19     | 348.19   | 348.19    | 525.73           | 525.73         | 525.73          |
| 1/5/2020   | 1000  | 6/5/2024   | 4/4/1992   | Monthly   | L1           | 10000    | 10000  | 483.95       | 483.95     | 483.95      | 483.95     | 483.95   | 483.95    | 483.95           | 483.95         | 483.95          |
| 5/5/2022   | 1000  | 6/5/2024   | 4/4/1964   | Monthly   | L1           | 10000    | 10000  | 348.19       | 348.19     | 348.19      | 525.73     | 525.73   | 525.73    | 348.19           | 348.19         | 348.19          |
| 5/5/2024   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   | L1           | 10000    | 10000  | 0.00         | 0.00       | 0.00        | 525.73     | 525.73   | 525.73    | 348.19           | 348.19         | 348.19          |
| 5/5/2019   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   |              | 10000    | 10000  | 612.67       | 612.67     | 612.67      |            |          |           | 612.67           | 612.67         | 612.67          |
| 5/5/2021   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   |              | 10000    | 10000  | 483.95       | 483.95     | 483.95      |            |          |           | 483.95           | 483.95         | 483.95          |
| 5/5/2019   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   | L1           | 10000    | 10000  | 0            | 0          | 0           | 0          | 0        | 0         | 483.95           | 483.95         | 483.95          |
| 5/5/2021   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   | L1           | 10000    | 10000  | 0            | 0          | 0           | 0          | 0        | 0         | 483.95           | 483.95         | 483.95          |
| 5/5/2017   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   |              | 10000    | 10000  | 0            | 0          | 0           | 0          | 0        | 0         | 0                | 0              | 0               |
| 5/5/2017   | 1000  | 6/5/2024   | 4/4/1963   | Monthly   | L1           | 10000    | 10000  | 0            | 0          | 0           | 0          | 0        | 0         | 0                | 0              |                 |

















Scenario: Validate Match Calculation Based on Age Tiered when the Participant have equal configured Age(=18)
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
| propertyName                  | value            |
| sourceName                    | ERMatch          |
| sourceType                    | 2                |
| sourceCategory                | 6                |
| sourceCode                    | D                |
| effectiveStartDate            | 01/01/2021       |
| responsibleMode               | 2                |
| eligiblePaymentType           | 1                |
| sourceId                      | <PretaxSourceID> |
| employerContributionType      | 4                |
| periodForCalculation          | 0                |
| catchUpType                   | 1                |
| limitMaximumPercentage        | 50               |
| limitMinimumPercentage        | 10               |
| maximumPercentageCompensation | 60               |

And Collection in a model is configured with 3 blocks for the property "MatchTierBasedContributionTypes" with values as given below
| BlockNumber | Key                    | Value |
| 1           | Order                  | 1     |
| 1           | From                   | 18    |
| 1           | To                     | 30    |
| 1           | MatchPercentage        | 50.55 |
| 1           | CompensationPercentage | 22.22 |
| 2           | From                   | 31    |
| 2           | To                     | 45    |
| 2           | MatchPercentage        | 40.44 |
| 2           | CompensationPercentage | 15.15 |
| 3           | From                   | 46    |
| 3           | To                     | 60    |
| 3           | MatchPercentage        | 30.33 |
| 3           | CompensationPercentage | 10.10 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value    |
| HIRE DATE         | 0_day    |
| HOURS             | 1000     |
| PAY DATE          | 0_day    |
| BIRTH DATE        | -18_year |
| PAYROLL FREQUENCY | Daily    |
| PLAN COMPENSATION | 10000    |
| Pretax            | 10000    |

When File upload is executed for the file "CombinedFile.csv"

Then API should respond Match Calculated values as
| SourceName | CalculatedAmount | PP Amount | YTD Amount |
| ERMatch    | 1123.22          | 1123.22   | 1123.22    |



#Scenario: Validate Match Calculation Based on Age Tiered when the Participant have equal configured Age(=18)
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#| propertyName                  | value            |
#| sourceName                    | ERMatch          |
#| sourceType                    | 2                |
#| sourceCategory                | 6                |
#| sourceCode                    | D                |
#| effectiveStartDate            | 01/01/2021       |
#| responsibleMode               | 2                |
#| eligiblePaymentType           | 1                |
#| sourceId                      | <PretaxSourceID> |
#| employerContributionType      | 4                |
#| periodForCalculation          | 0                |
#| catchUpType                   | 1                |
#| limitMaximumPercentage        | 50               |
#| limitMinimumPercentage        | 10               |
#| maximumPercentageCompensation | 60               |
#
#And Collection in a model is configured with 3 blocks for the property "MatchTierBasedContributionTypes" with values as given below
#| BlockNumber | Key                    | Value |
#| 1           | Order                  | 1     |
#| 1           | From                   | 18    |
#| 1           | To                     | 30    |
#| 1           | MatchPercentage        | 50.55 |
#| 1           | CompensationPercentage | 22.22 |
#| 2           | From                   | 31    |
#| 2           | To                     | 45    |
#| 2           | MatchPercentage        | 40.44 |
#| 2           | CompensationPercentage | 15.15 |
#| 3           | From                   | 46    |
#| 3           | To                     | 60    |
#| 3           | MatchPercentage        | 30.33 |
#| 3           | CompensationPercentage | 10.10 |
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#
#Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
#| Key               | Value    |
#| HIRE DATE         | 0_day    |
#| HOURS             | 1000     |
#| PAY DATE          | 0_day    |
#| BIRTH DATE        | -31_year |
#| PAYROLL FREQUENCY | Daily    |
#| PLAN COMPENSATION | 10000    |
#| Pretax            | 10000    |
#
#When File upload is executed for the file "CombinedFile.csv"
#
#Then API should respond Match Calculated values as
#| SourceName | CalculatedAmount | PP Amount | YTD Amount |
#| ERMatch    | 612.67           | 612.67    | 612.67     |













