Feature: Transfer

This feature file contains scenarios for Transfer transaction and its impact on employee units 

@PlanActivationWithoutInvestmentAndEnrollment
Scenario: Transfer by units
Given Investment "Auto Transfer1" has been mapped to the plan

And Investment "Auto Transfer2" has been mapped to the plan

Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"

When Configuration has been made as per following
| key                                     | value |
| enrollmentId                            |     0 |
| sameInvestmentElectionToAllParticipants | true  |
| investmentElectionBasedOn               |       |
| subjecttoAutoEnrollment                 | true  |
| usePlanDefaultDeferralElection          | true  |
| usePlanDefaultInvestmentElection        | true  |
| numberOfDaysWindowIsOpenNumber          |    10 |
| numberOfDaysWindowIsOpen                |     3 |
| numberOfDaysWindowIsOpenForOptoutNumber |    10 |
| numberOfDaysWindowIsOpenForOptout       |     1 |
| isAutoReEnroll                          | false |
| exclusionType                           |     0 |
| sameInvestmentElectionToAllSources      | true  |
| sendEnrollmentInvite                    |     1 |
| deferralContributionRateUponRehire      |     2 |


When Collection in a model is configured with 2 blocks for the property "AutoEnrollmentDeferralSources" with values as given below
| BlockNumber | Key                      | Value            |
|           1 | SourceId                 | <PretaxSourceID> |
|           1 | DeferralSourceName       | EEPretax         |
|           1 | DeferralSourcePercentage |               30 |
|           2 | SourceId                 | <RothSourceID>   |
|           2 | DeferralSourceName       | EERoth           |
|           2 | DeferralSourcePercentage |               30 |

When Collection in a model is configured with 2 blocks for the property "DeferralSourceContribution" with values as given below
| BlockNumber | Key              | Value            |
|           1 | SourceId         | <PretaxSourceID> |
|           1 | SourceName       | EEPretax         |
|           1 | ContributionRate |            20.00 |
|           2 | SourceId         | <RothSourceID>   |
|           2 | SourceName       | EERoth           |
|           2 | ContributionRate |            30.00 |

When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
| BlockNumber | Key                       | Value            |
|           1 | InvestmentId              | <Auto Transfer1> |
|           1 | InvestmentName            | Auto Transfer1   |
|           1 | InvestmentPercentage      |            70.00 |
|           1 | DefaultElectionSettingsId |                0 |
|           2 | InvestmentId              | <Auto Transfer2> |
|           2 | InvestmentName            | Auto Transfer2   |
|           2 | InvestmentPercentage      |            30.00 |
|           2 | DefaultElectionSettingsId |                0 | 

When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values as given below
| BlockNumber | Key                  | Value            |
|           1 | InvestmentId         | <Auto Transfer1> |
|           1 | InvestmentName       | Auto Transfer1   |
|           1 | InvestmentPercentage |            70.00 |
|           2 | InvestmentId         | <Auto Transfer2> |
|           2 | InvestmentName       | Auto Transfer2   |  
|           2 | InvestmentPercentage |            30.00 |

When Collection in a model is configured with 1 blocks for the property "InvestmentElectionBasedOnList" with values as given below
| BlockNumber | Key                  | Value            |
|           1 | AutoEnrollmentId     |                0 |
|           1 | InvestmentBasedOn    |                  |

When API request has been sent to the "IPlanDetailsSave" with the method name "SaveEnrollmentSettings"

Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"

When Configuration has been made as per following
| key                      | value |
| isTransferAllowed        | true  |
| showProspectusNotice     |     1 |
| numberOfTransfersAllowed |     5 |
| transferFrequency        |     1 |
| transfersCountStartsFrom |     1 |
| transferFee              |     1 |

When API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransfers"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| EEPretax             | 10000      |
| PLAN COMPENSATION  | 10000      |
| GROSS COMPENSATION | 10000      |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"
	#When [action]
	#Then [outcome]
