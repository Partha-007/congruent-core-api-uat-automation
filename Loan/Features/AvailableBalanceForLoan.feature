Feature: AvailableBalanceForLoan

This feature file contains scenarios which handles the available balance for a participant for Loan

@PlanActivation
Scenario: 59909 : To verify the Calculation Avilable Balance for loan valuefiled for  in Loan request page when participant have already 1 loan
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 100000     |
| PLAN COMPENSATION  | 100000     |
| GROSS COMPENSATION | 100000     |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                  |
| loanType              | General Purpose        |
| interestRate          | 6                      |
| requestedAmount       | 12000                  |
| periodicPaymentAmount | 1032.80                |
| paymentMethod         | 1                      |
| repaymentMethod       | 1                      |
| firstRepaymentDate    | 3/31/2025, 12:00:00 AM |
| repaymentFrequency    | 4                      |
| tenureYears           | 1                      |
| tenureMonths          | 0                      |
| loanStatus            | 3                      |
| loanFeeAmount         | 1                      |
| chequeFees            | 1                      |
| eftFees               | 1                      |

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan request has been approved and trade for loan is executed for "New Loan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 03/31/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| LOAN REPAYMENT    | 1000       |
| Pretax            | 10         |

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate    | RepaymentAmount |
| 04/30/2025 | 1000            |
| 05/31/2025 | 1000            |
| 06/30/2025 | 1000            |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Then Available balance for the employee to avail loan should be 38000





@PlanActivationWithoutInvestmentAndEnrollment
Scenario: 59905 : To verify the Calculation Avilable Balance for loan valuefiled in Loan request page

Given Investment "SEAS001" has been mapped to the plan

And Investment "SEAS002" has been mapped to the plan

And Enrollment configuration

#Given Model is selected for the endpoint "/api/Enrollment/SaveEnrollmentSetting"
#
#When Configuration has been made as per following
#| key                                     | value |
#| enrollmentId                            |     0 |
#| sameInvestmentElectionToAllParticipants | true  |
#| investmentElectionBasedOn               |       |
#| subjecttoAutoEnrollment                 | true  |
#| usePlanDefaultDeferralElection          | true  |
#| usePlanDefaultInvestmentElection        | true  |
#| numberOfDaysWindowIsOpenNumber          |    10 |
#| numberOfDaysWindowIsOpen                |     3 |
#| numberOfDaysWindowIsOpenForOptoutNumber |    10 |
#| numberOfDaysWindowIsOpenForOptout       |     1 |
#| isAutoReEnroll                          | false |
#| exclusionType                           |     0 |
#| sameInvestmentElectionToAllSources      | true  |
#| sendEnrollmentInvite                    |     1 |
#| deferralContributionRateUponRehire      |     2 |
#
#
#When Collection in a model is configured with 2 blocks for the property "AutoEnrollmentDeferralSources" with values as given below
#| BlockNumber | Key                      | Value            |
#|           1 | SourceId                 | <PretaxSourceID> |
#|           1 | DeferralSourceName       | EEPretax         |
#|           1 | DeferralSourcePercentage |               30 |
#|           2 | SourceId                 | <RothSourceID>   |
#|           2 | DeferralSourceName       | EERoth           |
#|           2 | DeferralSourcePercentage |               30 |
#
#When Collection in a model is configured with 2 blocks for the property "DeferralSourceContribution" with values as given below
#| BlockNumber | Key              | Value            |
#|           1 | SourceId         | <PretaxSourceID> |
#|           1 | SourceName       | EEPretax         |
#|           1 | ContributionRate |            20.00 |
#|           2 | SourceId         | <RothSourceID>   |
#|           2 | SourceName       | EERoth           |
#|           2 | ContributionRate |            30.00 |
#
#When Collection in a model is configured with 2 blocks for the property "PlanInvestment" with values as given below
#| BlockNumber | Key                       | Value     |
#|           1 | InvestmentId              | <SEAS001> |
#|           1 | InvestmentName            | SEAS001   |
#|           1 | InvestmentPercentage      |     70.00 |
#|           1 | DefaultElectionSettingsId |         0 |
#|           2 | InvestmentId              | <SEAS002> |
#|           2 | InvestmentName            | SEAS002   |
#|           2 | InvestmentPercentage      |     30.00 |
#|           2 | DefaultElectionSettingsId |         0 |
#
#When Collection in a model is configured with 2 blocks for the property "InvestmentElectionValuesList" with values as given below
#| BlockNumber | Key                  | Value     |
#|           1 | InvestmentId         | <SEAS001> |
#|           1 | InvestmentName       | SEAS001   |
#|           1 | InvestmentPercentage |     70.00 |
#|           2 | InvestmentId         | <SEAS002> |
#|           2 | InvestmentName       | SEAS002   |
#|           2 | InvestmentPercentage |     30.00 |
#
#When Collection in a model is configured with 1 blocks for the property "InvestmentElectionBasedOnList" with values as given below
#| BlockNumber | Key                  | Value            |
#|           1 | AutoEnrollmentId     |                0 |
#|           1 | InvestmentBasedOn    |                  |
#
#When API request has been sent to the "IPlanDetailsSave" with the method name "SaveEnrollmentSettings"

Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 10000      |
| PLAN COMPENSATION  | 10000      |
| GROSS COMPENSATION | 10000      |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Then Available balance for the employee to avail loan when no loan has been taken already should be 5000.00





@PlanActivation
Scenario: 59911 : To verify the Calculation Avilable Balance for loan valuefiled in Loan request page
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 89000      |
| PLAN COMPENSATION  | 100000     |
| GROSS COMPENSATION | 100000     |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                  |
| loanType              | General Purpose        |
| interestRate          | 6                      |
| requestedAmount       | 12000                  |
| periodicPaymentAmount | 1032.80                |
| paymentMethod         | 1                      |
| repaymentMethod       | 1                      |
| firstRepaymentDate    | 3/31/2025, 12:00:00 AM |
| repaymentFrequency    | 4                      |
| tenureYears           | 1                      |
| tenureMonths          | 0                      |
| loanStatus            | 3                      |
| loanFeeAmount         | 1                      |
| chequeFees            | 1                      |
| eftFees               | 1                      |

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan request has been approved and trade for loan is executed for "New Loan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 03/31/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| LOAN REPAYMENT    | 1000       |
| Pretax            | 0          |

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate    | RepaymentAmount |
| 04/30/2025 | 1000            |
| 05/31/2025 | 1000            |
| 06/30/2025 | 1000            |
| 07/31/2025 | 1000            |
| 08/31/2025 | 1000            |
| 09/30/2025 | 1000            |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Available balance for the employee to avail loan should be 38000






@PlanActivation
Scenario: 59906 : To verify the Calculation Avilable Balance for loan valuefiled in Loan request page based on vestion schedular
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Model is selected for the endpoint "/api/Vesting/SaveVesting"

When Configuration has been made as per following
| propertyName                      | Value        |
| vestingName                       | 2 year cliff |
| exclusionType                     | 0            |
| vestingMethod                     | 1            |
| hoursOfService                    | 1000         |
| startDateIndicator                | 1            |
| vestingComputationalPeriod        | 2            |
| serviceCreditPeriod               | 2            |
| vestingSchedule                   | 3            |
| baseYear                          | 0            |
| firstYear                         | 25           |  
| secondYear                        | 50           |
| thirdYear                         | 75           |
| fourthYear                        | 100          |
| fifthYear                         | 100          |
| sixthYear                         | 100          |
| applyToAllStatuses                | true         |
| hoursOfServiceForEmploymentStatus |              |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2023 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2023 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Match              | 5000       |
| PLAN COMPENSATION  | 1000       |
| GROSS COMPENSATION | 1000       |
 
When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2023 |
| HOURS              | 1000       |
| PAY DATE           | 03/01/2024 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Match              | 5000       |
| PLAN COMPENSATION  | 1000       |
| GROSS COMPENSATION | 1000       |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"







@PlanActivationWithoutInvestmentAndEnrollment
Scenario: 59908 : To verify the Calculation Avilable Balance for loan valuefiled in Loan request page when participant have already 1 loan

Given Investment "SEAS001" has been mapped to the plan

And Investment "SEAS002" has been mapped to the plan

And Enrollment configuration

Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Collection in a model is configured with 1 blocks for the property "LoanApprovalHierarchy" with values as given below
| BlockNumber | Key       | Value |
|           1 | Id        |     0 |
|           1 | Order     |     1 |
|           1 | UserRole  |     1 |
|           1 | Approval  | true  |
|           1 | IsDeleted | true  |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 30000      |
| PLAN COMPENSATION  | 100000     |
| GROSS COMPENSATION | 100000     |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by " "

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                  |
| loanType              | General Purpose        |
| interestRate          |                      6 |
| requestedAmount       |                  12000 |
| periodicPaymentAmount |                1032.80 |
| paymentMethod         |                      1 |
| repaymentMethod       |                      1 |
| firstRepaymentDate    | 3/31/2025, 12:00:00 AM |
| repaymentFrequency    |                      4 |
| tenureYears           |                      1 |
| tenureMonths          |                      0 |
| loanStatus            |                      1 |
| loanFeeAmount         |                      1 |
| chequeFees            |                      1 |
| eftFees               |                      1 |
| loanFeeType           |                        |
| loanActivationDate    |                        |
| routingNumber         |                        |

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan submission is done for the mentioned applicable sources "<PretaxSourceID>"

And Loan request has been approved and trade for loan is executed for "New Loan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by " "

And Disbursement is done for the transaction "Loan"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 03/31/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| LOAN REPAYMENT    | 1000       |
| Pretax            | 0          |

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate    | RepaymentAmount |
| 04/30/2025 | 1000            |
| 05/31/2025 | 1000            |
| 06/30/2025 | 1000            |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by " "

Then Available balance for the employee to avail loan should be 15000



@PlanActivationWithoutInvestmentAndEnrollment
Scenario: To verify Model portfolio investment is added in plan when loan taken and verify the account balance

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

And Model portfolio investment configured with 2 investments with ids as 2 and 3 for the property "ApplicableInvestments"

And Collection in a model is configured with 2 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 2   |
| 1           | AllocationPercentage | 50.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 3   |
| 2           | AllocationPercentage | 50.00 |
| 2           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 2 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 2   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 3   |
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


Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 10000      |
| Roth               | 10000     | 
| PLAN COMPENSATION  | 10000     |
| GROSS COMPENSATION | 10000     |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                  |
| loanType              | General Purpose        |
| interestRate          | 6                      |
| requestedAmount       | 10000                  |
| periodicPaymentAmount | 860.00                 |
| paymentMethod         | 1                      |
| repaymentMethod       | 1                      |
| firstRepaymentDate    | 3/31/2025, 12:00:00 AM |
| repaymentFrequency    | 4                      |
| tenureYears           | 1                      |
| tenureMonths          | 0                      |
| loanStatus            | 3                      |
| loanFeeAmount         | 1                      |
| chequeFees            | 1                      |
| eftFees               | 1                      |

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan request has been approved and trade for loan is executed for "New Loan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value    |
| SourceBalance         | 4,999 |
| ModelPortfolioBalance | 2,499.5 |
| MPInv1Balance         | 1,249.75 |
| MPInv2Balance         | 1,249.75 |
| RInvBalance           | 2,499.5 |
| MPInv1Units           | 124.975 |
| MPInv2Units           | 124.975 |
| RInvUnits             | 249.95 |  

Then Employee account balance for the source "Roth" should be splitted as mentioned below
| Key                   | Value    |
| SourceBalance         | 4,999 |
| ModelPortfolioBalance | 2,499.5 |
| MPInv1Balance         | 1,249.75 |
| MPInv2Balance         | 1,249.75 |
| RInvBalance           | 2,499.5 |
| MPInv1Units           | 124.975 |
| MPInv2Units           | 124.975 |
| RInvUnits             | 249.95 |  



@PlanActivationWithoutInvestmentAndEnrollment
Scenario: To verify 2 Model portfolio investment is added in plan when loan taken and verify the account balance

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

And Model portfolio investment configured with 3 investments with ids as 2 and 3 and 993 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 2         |
#    | 3         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 2   |
| 1           | AllocationPercentage | 50.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 3   |
| 2           | AllocationPercentage | 30.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 993  |
| 3           | AllocationPercentage | 20.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

When Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 2   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 3   |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 993  |
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

And Model portfolio investment configured with 3 investments with ids as 994 and 995 and 1519 for the property "ApplicableInvestments"

#And Model portfolio investment configured with the following investments for the property "ApplicableInvestments"
#    | 2         |
#    | 3         |
 
And Collection in a model is configured with 3 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 994  |
| 1           | AllocationPercentage | 35.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 995  |
| 2           | AllocationPercentage | 35.00 |
| 2           | IsDeleted            | false |
| 3           | InvestmentId         | 1519  |
| 3           | AllocationPercentage | 30.00 |
| 3           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 3 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 994  |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 995  |
| 2           | Status            | 1     |
| 3           | InvestmentId      | 1519  |
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


Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 10000      |
| Roth               | 10000     | 
| PLAN COMPENSATION  | 10000     |
| GROSS COMPENSATION | 10000     |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                  |
| loanType              | General Purpose        |
| interestRate          | 6                      |
| requestedAmount       | 10000                  |
| periodicPaymentAmount | 860.00                 |
| paymentMethod         | 1                      |
| repaymentMethod       | 1                      |
| firstRepaymentDate    | 3/31/2025, 12:00:00 AM |
| repaymentFrequency    | 4                      |
| tenureYears           | 1                      |
| tenureMonths          | 0                      |
| loanStatus            | 3                      |
| loanFeeAmount         | 1                      |
| chequeFees            | 1                      |
| eftFees               | 1                      |

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan request has been approved and trade for loan is executed for "New Loan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value    |
| SourceBalance         | 4,999 |
| ModelPortfolioBalance | 2,499.5 |
| MPInv1Balance         | 1,249.75 |
| MPInv2Balance         | 1,249.75 |
| RInvBalance           | 2,499.5 |
| MPInv1Units           | 124.975 |
| MPInv2Units           | 124.975 |
| RInvUnits             | 249.95 |  

Then Employee account balance for the source "Roth" should be splitted as mentioned below
| Key                   | Value    |
| SourceBalance         | 4,999 |
| ModelPortfolioBalance | 2,499.5 |
| MPInv1Balance         | 1,249.75 |
| MPInv2Balance         | 1,249.75 |
| RInvBalance           | 2,499.5 |
| MPInv1Units           | 124.975 |
| MPInv2Units           | 124.975 |
| RInvUnits             | 249.95 |  

@PlanActivationWithoutInvestmentAndEnrollment
Scenario: To verify Loan Repayment when  Model portfolio investment is added and verify the account balance

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

And Model portfolio investment configured with 2 investments with ids as 2 and 3 for the property "ApplicableInvestments"

And Collection in a model is configured with 2 blocks for the property "PercentageElections" with values as given below
| BlockNumber | Key                  | Value |
| 1           | InvestmentId         | 2   |
| 1           | AllocationPercentage | 50.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 3   |
| 2           | AllocationPercentage | 50.00 |
| 2           | IsDeleted            | false |

When API request has been sent to the "IInvestment" with the method name "AddMasterInvestment"

And Model portfolio investment added to plan and enrollment configured with 2 blocks for the property "ApplicableInvestments" with values as given below
| BlockNumber | Key               | Value |
| 1           | InvestmentId      | 2   |
| 1           | Status            | 1     |
| 2           | InvestmentId      | 3   |
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


Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value           |
| loanType                                      | 1               |
| numberOfLoansAllowed                          | 5               |
| loanPerPlanYear                               | 3               |
| minimumAmount                                 | 10              |
| processingTimeForLoan                         | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10              |
| numberOfSuspensionsPerLoanAllowed             | 1               |
| checkFee                                      | 2               |
| overnightDeliveryFees                         | 1               |
| maximumAmount                                 | 1               |
| withdrawalBasis                               | 1               |
| refinancingAllowed                            | false           |
| curePeriod                                    | 1               |
| curePeriodForEmployeeTermination              | 1               |
| defaultMethod                                 | 1               |
| minimumLoanRepaymentAmount                    | 10              |
| loanApportioningMethod                        | 1               |
| loanInterestRate                              | 1               |
| loanFeeAmount                                 | 5               |
| minimumLengthYears                            | 1               |
| minimumLengthMonths                           | 0               |
| maximumLengthYears                            | 5               |
| maximumLengthMonths                           | 0               |
| firstRepaymentDateFallsAfter                  | 20              |
| firstRepaymentDateFallsWithin                 | 25              |
| masterLoanTypeId                              | 1               |
| isMaster                                      | true            |
| loanDescription                               | General Purpose |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2025 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2025 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 10000      |
| Roth               | 10000      | 
| PLAN COMPENSATION  | 10000      |
| GROSS COMPENSATION | 10000      |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                  |
| loanType              | General Purpose        |
| interestRate          | 6                      |
| requestedAmount       | 10000                  |
| periodicPaymentAmount | 860.66                 |
| paymentMethod         | 1                      |
| repaymentMethod       | 1                      |
| firstRepaymentDate    | 3/31/2025, 12:00:00 AM |
| repaymentFrequency    | 4                      |
| tenureYears           | 1                      |
| tenureMonths          | 0                      |
| loanStatus            | 3                      |
| loanFeeAmount         | 1                      |
| chequeFees            | 1                      |
| eftFees               | 1                      |

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan request has been approved and trade for loan is executed for "New Loan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 03/31/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| LOAN REPAYMENT    | 416.6      |
| Pretax            |            |


When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate    | RepaymentAmount |
| 04/30/2025 | 416.6            |
| 05/31/2025 | 416.6            |
| 06/30/2025 | 416.6            |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value   |
| SourceBalance         | 5832.2  |
| ModelPortfolioBalance | 2916.1  |
| MPInv1Balance         | 1458.05 |
| MPInv2Balance         | 1458.05 |
| RInvBalance           | 2916.1  |
| MPInv1Units           | 145.805 |
| MPInv2Units           | 145.805 |
| RInvUnits             | 291.61  |  

Then Employee account balance for the source "Roth" should be splitted as mentioned below
| Key                   | Value   |
| SourceBalance         | 5832.2  |
| ModelPortfolioBalance | 2916.1  |
| MPInv1Balance         | 1458.05 |
| MPInv2Balance         | 1458.05 |
| RInvBalance           | 2916.1  |
| MPInv1Units           | 145.805 |
| MPInv2Units           | 145.805 |
| RInvUnits             | 291.61  |  
