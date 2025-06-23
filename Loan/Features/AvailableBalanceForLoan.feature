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

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Then Available balance for the employee to avail loan should be 38000





@PlanActivation
Scenario: 59905 : To verify the Calculation Avilable Balance for loan valuefiled in Loan request page
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

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

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







@PlanActivation
Scenario: 59908 : To verify the Calculation Avilable Balance for loan valuefiled in Loan request page when participant have already 1 loan
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
| Pretax             | 30000      |
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

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

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

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 100000|
| ModelPortfolioBalance | 5000  |
| MPInv1Balance         | 3000  |
| MPInv2Balance         | 2000  |
| RInvBalance           | 5000  |
| MPInv1Units           | 300   |
| MPInv2Units           | 200   |
| RInvUnits             | 500   |


@PlanActivationWithoutInvestmentAndEnrollment
Scenario: To verify Loan Repayment when Model portfolio investment is added and verify the account balance

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

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee account balance for the source "Pretax" should be splitted as mentioned below
| Key                   | Value |
| SourceBalance         | 100000|
| ModelPortfolioBalance | 5000  |
| MPInv1Balance         | 3000  |
| MPInv2Balance         | 2000  |
| RInvBalance           | 5000  |
| MPInv1Units           | 300   |
| MPInv2Units           | 200   |
| RInvUnits             | 500   |