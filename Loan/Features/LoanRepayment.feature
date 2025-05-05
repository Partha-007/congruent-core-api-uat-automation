Feature: LoanRepayment

A short summary of the feature

@PlanActivation
Scenario: 95359 - To verify whether system accepts the repayment against a invalid loan id via Combined file
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
| loanInterestRate                              | 3               |
| loanInterestRateValue                         | 5               |
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
| refinancingAllowed                            | true            |
| numberOfRefinancingAllowed                    | 2               |
| loanRefinancingFee                            | 10              |
| loanReAmortizationAllowed                     | true            |
| loanReAmortizationFee                         | 2               |
| numberOfLoanReAmortizationsAllowed            | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
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

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value           |
| loanType              | General Purpose |
| interestRate          | 5               |
| requestedAmount       | 5000            |
| periodicPaymentAmount | 149.85          |
| paymentMethod         | 1               |
| repaymentMethod       | 1               |
| firstRepaymentDate    | 2/1/2023        |
| repaymentFrequency    | 4               |
| tenureYears           | 3               |
| tenureMonths          | 0               |
| loanStatus            | 3               |
| loanFeeAmount         | 1               |
| chequeFees            | 1               |
| eftFees               | 1               |

And The date property "firstRepaymentDate" is configured as "month" and should add "-11" days to the current date

And API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

And Loan request has been approved and trade for loan is executed for "New Loan Request"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2021 |
| HOURS             | 1000       |
| PAY DATE          | 05/08/2024 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| LOAN REPAYMENT    | 149.85     |
| Pretax            | 0          |
| LOANID            | 123        |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"