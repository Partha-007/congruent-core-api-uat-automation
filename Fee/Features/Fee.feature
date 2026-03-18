Feature: Fee

This feature file contains scenarios for Transfer transaction and its impact on employee units 

Scenario: Fee

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              |       1000 |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| EEPreTax           |      10000 |
| PLAN COMPENSATION  |      10000 |
| GROSS COMPENSATION |      10000 |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

And Create a basic details fee for "Participant"

When Create specification for the fee as mentioned below
| Key               | Value     |
| Id                |         0 |
| FeeType           |         1 |
| AllocationType    |         1 |
| AllocationSubType |         1 |
| FeeAmount         |         1 |
| Name              | Test spec |
| FeeFor            |         1 |

And Create calculation for the fee as mentioned below
| Key                                   | Value |
| FeeFor                                |     1 |
| FeeType                               |     1 |
| ProcessMinAmount                      | true  |
| PercentageOfAccountBalanceAvailable   |   100 |
| ExcludeFullyPaidOutParticipants       | true  |
| RunFeeFor                             |     1 |
| IncludeLoanBalancesInAssetComputation | false |
| MinimumThresholdBalance               |   100 |
| FeeTransactionTypeCategory            |     6 |
| FeeTransactionCategoryStatus          | []    |


And Create applicable to for the fee as mentioned below
| Key                              | Value |
| Step                             |     3 |
| FeeFor                           |     1 |
| ApplicableTo                     |     2 |
| AllocationMethod                 |     3 |
| CollectFeeFromOnlyThisInvestment | false |
| DeductFeeFromForfeitureBalance   | false |
| ForfeitureFeePercentage          |       |
| ExcludedInvestments              | []    |
| ExcludedEmployeeClassifications  | []    |
| InvestmentHeirarchy              | []    |
| SourceHeirarchy                  | []    |
| DeductFeeFrom                    |     1 |
| PlanGroupMappings                | []    |
| ExcludedPlanMappings             | []    |

And Configure schedule for the fee schedule as mentioned below
| Key               | Value |
| ScheduleType      |       |
| MonthAnnually     |       |
| DayAnnually       |       |
| MonthSemiAnnually |       |
| DaySemiAnnually   |       |
| StartDay          |       |
| FirstDate         |       |
| SecondDate        |       |
| MonthQuarterly    |       |
| DayQuarterly      |       |
| StartDayWeekly    |       |

And Create schedule for the fee as mentioned below
| Key                | Value |
| FeeRunType         |     1 |
| EffectiveStartDate | []    |
| EffectiveEndDate   | []    |
| FeeProcess         |     1 |
| ProcessDate        | []    |
| BasisDate          |     1 |
| BasisAsOfDate      |       |
| BasisAsOfFrequency |     1 |
| Step               |     4 |

And Submit the "Fee" request

And Trade procedures completed for the transaction "Fee"