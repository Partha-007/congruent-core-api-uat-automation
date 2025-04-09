Feature: CurePeriodConsideration

A short summary of the feature

@PlanActivation
Scenario: 59961 - To verify the employment status change in UI and check status change according to plan setup in UI(Active to term-file upload)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 17500      |
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

And The date property "firstRepaymentDate" is configured as "month" and should add "-4" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | Currentdate |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 0           |
| PLAN COMPENSATION      | 0           |
| GROSS COMPENSATION     | 0           |
| EMPLOYMENT STATUS CODE | T           |
| MOST RECENT TERM DATE  | Currentdate |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "File"

Then Loan status should be updated as "Delinquent"






@PlanActivation
Scenario: 59959 - To verify the employment status change in UI and check status change according to plan setup in UI(Active to term)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              | 1000       |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| Pretax             | 17500      |
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

And The date property "firstRepaymentDate" is configured as "month" and should add "-4" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

And Employee has been edited as mentioned below
| Key             | Value      |
| terminationDate | 04/08/2025 |






@PlanActivation
Scenario: 59962 - To verify the employment status change in UI and check status change according to plan setup in UI(Term to Active-file upload)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |
| EMPLOYMENT STATUS CODE | T           |
| MOST RECENT TERM DATE  | 01/01/2022  |  

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

And The date property "firstRepaymentDate" is configured as "month" and should add "-4" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                     | Value       |
| HIRE DATE               | 01/01/2021  |
| HOURS                   | 1000        |
| PAY DATE                | Currentdate |
| BIRTH DATE              | 04/01/1996  |
| PAYROLL FREQUENCY       | Daily       |
| Pretax                  | 0           |
| PLAN COMPENSATION       | 0           |
| GROSS COMPENSATION      | 0           |
| EMPLOYMENT STATUS CODE  | A           |
| MOST RECENT REHIRE DATE | Currentdate |  
| MOST RECENT TERM DATE   |             |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "File"

Then Loan status should be updated as "Delinquent"






@PlanActivation
Scenario: 59949 - To verify the loan status when repayment is missed and not paid during cure period(Fixed number of days)(Benefit offset)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-145" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "DefaultBenefitOffset"






@PlanActivation
Scenario: 59951 - To verify the loan status when repayment is missed and not paid during cure period(Fixed number of days)(Deemed Distribution)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-145" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "DefaultDeemedDistribution"




@PlanActivation
Scenario: 59948 - To verify the loan status when repayment is missed and paid during cure period(End of calendar Quarter following default quarter)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-155" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    | 149.85      |
| Pretax            | 0           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"





@PlanActivation
Scenario: 59950 - To verify the loan status when repayment is missed and paid during cure period(End of calendar Quarter following default quarter)(Benefit offset)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-145" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "DefaultBenefitOffset"





@PlanActivation
Scenario: 59952 - To verify the loan status when repayment is missed and paid during cure period(End of calendar Quarter following default quarter)(Deemed Distribution)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-145" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "DefaultDeemedDistribution"







@PlanActivation
Scenario: 59947 - To verify the loan status when repayment is missed and paid during cure period(Fixed number of days)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-155" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    | 149.85      |
| Pretax            | 0           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"





@PlanActivation
Scenario: 59957 - To verify the loan status when the employee got Suspended on repayment date rejoins after 10 days where Repayment is not paid(End of calendar quarter following default quarter)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | S           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Suspended"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | +20 days    |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | A           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"





@PlanActivation
Scenario: 59955 - To verify the loan status when the employee got Suspended on repayment date rejoins after 10 days where Repayment is paid(End of calendar quarter following default quarter)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | S           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Suspended"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | +11 days    |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    | 149.85      |
| Pretax            | 0           |
| EMPLOYMENT STATUS | A           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"






@PlanActivation
Scenario: 59956 - To verify the loan status when the employee got Suspended on repayment date rejoins after 10 days where Repayment is paid(fixed number of days)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | S           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Suspended"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | +11 days    |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    | 149.85      |
| Pretax            | 0           |
| EMPLOYMENT STATUS | A           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Active"






@PlanActivation
Scenario: 59958 - To verify the loan status when the employee got Suspended on repayment date rejoins after 10 days where Repayment is paid(fixed number of days)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key                   | Value      |
| HIRE DATE             | 01/01/2021 |
| HOURS                 | 1000       |
| PAY DATE              | -10 days   |
| BIRTH DATE            | 04/01/1996 |
| PAYROLL FREQUENCY     | Daily      |
| LOAN REPAYMENT        |            |
| Pretax                | 0          |
| EMPLOYMENT STATUS     | S          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Suspended"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | A           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"






@PlanActivation
Scenario: 59954 - To verify the loan status when the employee moves to Suspended during cure period rejoins during cure period(End of calendar quarter following default quarter)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key                   | Value      |
| HIRE DATE             | 01/01/2021 |
| HOURS                 | 1000       |
| PAY DATE              | -10 days   |
| BIRTH DATE            | 04/01/1996 |
| PAYROLL FREQUENCY     | Daily      |
| LOAN REPAYMENT        |            |
| Pretax                | 0          |
| EMPLOYMENT STATUS     | S          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Suspended"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | A           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"








@PlanActivation
Scenario: 59953 - To verify the loan status when the employee moves to Suspended during cure period rejoins durong cure period(Fixed number of days)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key                   | Value      |
| HIRE DATE             | 01/01/2021 |
| HOURS                 | 1000       |
| PAY DATE              | -10 days   |
| BIRTH DATE            | 04/01/1996 |
| PAYROLL FREQUENCY     | Daily      |
| LOAN REPAYMENT        |            |
| Pretax                | 0          |
| EMPLOYMENT STATUS     | S          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Suspended"

Given Payroll file "LoanRepayment.csv" is selected and Edit payroll file as mentioned below
| Key               | Value       |
| HIRE DATE         | 01/01/2021  |
| HOURS             | 1000        |
| PAY DATE          | Currentdate |  
| BIRTH DATE        | 04/01/1996  |
| PAYROLL FREQUENCY | Daily       |
| LOAN REPAYMENT    |             |
| Pretax            | 0           |
| EMPLOYMENT STATUS | A           |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"







@PlanActivation
Scenario: 59941 - To verify the loan status when the user missed a repayment during cure period(Cure period should be set as End of calendar quarter following default quarter is set in Loan setup)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 1               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 2               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 2               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "day" and should add "-140" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "Delinquent"







@PlanActivation
Scenario: 59943 - To verify the loan status when the user missed a repayment during cure period(Cure period should be set as Fixed number of days for Active employee and End of calendar quarter for terminated employee is set in Loan setup)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 1               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "month" and should add "-8" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "DefaultBenefitOffset"





@PlanActivation
Scenario: 59945 - To verify the loan status when the user missed a repayment during cure period(Cure period should be set as Fixed number of days for Active employee and End of calendar quarter for terminated employee is set in Loan setup)
Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                      | value           |
| loanType                                          | 1               |
| numberOfLoansAllowed                              | 5               |
| loanPerPlanYear                                   | 3               |
| minimumAmount                                     | 10              |
| processingTimeForLoan                             | 10              |
| waitingPeriodBetweenLoansPayoffAndLoanRequest     | 10              |
| numberOfSuspensionsPerLoanAllowed                 | 1               |
| checkFee                                          | 2               |
| overnightDeliveryFees                             | 1               |
| maximumAmount                                     | 1               |
| withdrawalBasis                                   | 1               |
| refinancingAllowed                                | false           |
| curePeriod                                        | 2               |
| curePeriodFixedNumberOfDays                       | 10              |
| curePeriodForEmployeeTermination                  | 1               |
| curePeriodFixedNumberOfDaysForEmployeeTermination | 20              |
| defaultMethod                                     | 1               |
| minimumLoanRepaymentAmount                        | 10              |
| loanApportioningMethod                            | 1               |
| loanInterestRate                                  | 3               |
| loanInterestRateValue                             | 5               |
| loanFeeAmount                                     | 5               |
| minimumLengthYears                                | 1               |
| minimumLengthMonths                               | 0               |
| maximumLengthYears                                | 5               |
| maximumLengthMonths                               | 0               |
| firstRepaymentDateFallsAfter                      | 20              |
| firstRepaymentDateFallsWithin                     | 25              |
| masterLoanTypeId                                  | 1               |
| isMaster                                          | true            |
| loanDescription                                   | General Purpose |
| refinancingAllowed                                | true            |
| numberOfRefinancingAllowed                        | 2               |
| loanRefinancingFee                                | 10              |
| loanReAmortizationAllowed                         | true            |
| loanReAmortizationFee                             | 2               |
| numberOfLoanReAmortizationsAllowed                | 9               |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                    | Value       |
| HIRE DATE              | 01/01/2021  |
| HOURS                  | 1000        |
| PAY DATE               | 02/01/2021  |
| BIRTH DATE             | 04/01/1996  |
| PAYROLL FREQUENCY      | Daily       |
| Pretax                 | 17500       |
| PLAN COMPENSATION      | 10000       |
| GROSS COMPENSATION     | 10000       |

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

And The date property "firstRepaymentDate" is configured as "month" and should add "-8" days to the current date

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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Loan status should be updated as "DefaultBenefitOffset"