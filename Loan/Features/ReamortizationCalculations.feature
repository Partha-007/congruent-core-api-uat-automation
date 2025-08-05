Feature: ReamortizationCalculations

A short summary of the feature

@PlanActivation
Scenario: Reamortization
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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |  
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Model is selected for the endpoint "/api/v1/Loan/SaveLoanRefinance"

When Configuration has been made as per following
| propertyName          | value  |
| loanAmount            | 0      |
| interestRate          | 5      |
| tenureYears           | 3      |
| tenureMonths          | 0      |
| repaymentFrequency    | 2      |
| periodicPaymentAmount | 34.52  |
| transactionFees       | 2      |
| repaymentMethod       | 1      |
| modificationType      | 1      |
| loanDocument          |        |

And API request has been sent to the "ILoan" with the method name "SaveLoanRefinance"

And Loan request has been approved and trade for loan is executed for "Loan Refinancing"

Then Employee loan amortization schedule should contain 36 installments and should look like this
| Principal | Interest | PaymentPerPeriod | OutstandingPrincipal |
|           |          |                  | 4,870.70             |
|           |          |                  | 4,741.53             |
|           |          |                  | 4,611.17             |
|           |          |                  | 4,480.90             |  
|           |          |                  | 4,350.08             |
|           |          |                  | 4,218.11             |
|           |          |                  | 4,086.17             |
|           |          |                  | 3,953.11             |
|           |          |                  | 3,820.05             |
|           |          |                  | 3,686.42             |
|           |          |                  | 3,550.71             |
|           |          |                  | 4,374.43             |







@PlanActivation
Scenario: Reamortization - By changing payment per period and frequency
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
| loanReAmortizationAllowed                     | True            |
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

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

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
| Monthly | 149.85          |  
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Model is selected for the endpoint "/api/v1/Loan/SaveLoanRefinance"

When Configuration has been made as per following
| propertyName          | value |
| loanAmount            | 0     |
| interestRate          | 5     |
| tenureYears           | 3     |
| tenureMonths          | 0     |
| repaymentFrequency    | 2     |
| periodicPaymentAmount | 33.32 |  
| transactionFees       | 2     |
| repaymentMethod       | 1     |
| modificationType      | 1     |
| loanDocument          |       |

And API request has been sent to the "ILoan" with the method name "SaveLoanRefinance"

And Loan request has been approved and trade for loan is executed for "Loan Refinancing"

Then Employee loan amortization schedule should contain 120 installments and should look like this
| Principal | Interest | PaymentPerPeriod | OutstandingPrincipal |
|           |          |                  | 4,870.70             |
|           |          |                  | 4,741.53             |
|           |          |                  | 4,611.17             |
|           |          |                  | 4,480.90             |  
|           |          |                  | 4,350.08             |
|           |          |                  | 4,218.11             |
|           |          |                  | 4,086.17             |
|           |          |                  | 3,953.11             |
|           |          |                  | 3,820.05             |
|           |          |                  | 3,686.42             |
|           |          |                  | 3,550.71             |
|           |          |                  | 4,374.43             |





#story id : 33895, Filename - Reamortization Calculation Master
@PlanActivation
Scenario: Reamortization - Month - 10 Years
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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |  
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveLoanRefinance"

When Configuration has been made as per following
| propertyName          | value  |
| loanAmount            | 0      |
| interestRate          | 5      |
| tenureYears           | 3      |
| tenureMonths          | 0      |
| repaymentFrequency    | 2      |
| periodicPaymentAmount | 34.52  |
| transactionFees       | 2      |
| repaymentMethod       | 1      |
| modificationType      | 1      |
| loanDocument          |        |

And API request has been sent to the "ILoan" with the method name "SaveLoanRefinance"

And Loan request has been approved and trade for loan is executed for "Loan Refinancing"

Then Employee loan amortization schedule should contain 104 installments and should look like this
| Principal | Interest | PaymentPerPeriod | OutstandingPrincipal |
|           |          |                  | 4,870.70             |
|           |          |                  | 4,741.53             |
|           |          |                  | 4,611.17             |
|           |          |                  | 4,480.90             |  
|           |          |                  | 4,350.08             |
|           |          |                  | 4,218.11             |
|           |          |                  | 4,086.17             |
|           |          |                  | 3,953.11             |
|           |          |                  | 3,820.05             |
|           |          |                  | 3,686.42             |
|           |          |                  | 3,550.71             |
|           |          |                  | 4,374.43             |








@PlanActivation
Scenario: Reamortization - By changing the frequency
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
| loanReAmortizationAllowed                     | True            |
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

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

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
| Monthly | 149.85          |  
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Model is selected for the endpoint "/api/v1/Loan/SaveLoanRefinance"

When Configuration has been made as per following
| propertyName          | value |
| loanAmount            | 0     |
| interestRate          | 5     |
| tenureYears           | 3     |
| tenureMonths          | 0     |
| repaymentFrequency    | 2     |
| periodicPaymentAmount | 34.53 |  
| transactionFees       | 2     |
| repaymentMethod       | 1     |
| modificationType      | 1     |
| loanDocument          |       |

And API request has been sent to the "ILoan" with the method name "SaveLoanRefinance"

And Loan request has been approved and trade for loan is executed for "Loan Refinancing"

Then Employee loan amortization schedule should contain 120 installments and should look like this
| Principal | Interest | PaymentPerPeriod | OutstandingPrincipal |
|           |          |                  | 4,870.70             |
|           |          |                  | 4,741.53             |
|           |          |                  | 4,611.17             |
|           |          |                  | 4,480.90             |  
|           |          |                  | 4,350.08             |
|           |          |                  | 4,218.11             |
|           |          |                  | 4,086.17             |
|           |          |                  | 3,953.11             |
|           |          |                  | 3,820.05             |
|           |          |                  | 3,686.42             |
|           |          |                  | 3,550.71             |
|           |          |                  | 4,374.43             |






@PlanActivation
Scenario: Reamortization - Missed repayment for 2 installments and frequency change
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
| loanReAmortizationAllowed                     | True            |
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

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

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
| Monthly | 149.85          |  
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Model is selected for the endpoint "/api/v1/Loan/SaveLoanRefinance"

When Configuration has been made as per following
| propertyName          | value |
| loanAmount            | 0     |
| interestRate          | 5     |
| tenureYears           | 3     |
| tenureMonths          | 0     |
| repaymentFrequency    | 2     |
| periodicPaymentAmount | 36.24 |  
| transactionFees       | 2     |
| repaymentMethod       | 1     |
| modificationType      | 1     |
| loanDocument          |       |

And API request has been sent to the "ILoan" with the method name "SaveLoanRefinance"

And Loan request has been approved and trade for loan is executed for "Loan Refinancing"

Then Employee loan amortization schedule should contain 120 installments and should look like this
| Principal | Interest | PaymentPerPeriod | OutstandingPrincipal |
|           |          |                  | 4,870.70             |
|           |          |                  | 4,741.53             |
|           |          |                  | 4,611.17             |
|           |          |                  | 4,480.90             |  
|           |          |                  | 4,350.08             |
|           |          |                  | 4,218.11             |
|           |          |                  | 4,086.17             |
|           |          |                  | 3,953.11             |
|           |          |                  | 3,820.05             |
|           |          |                  | 3,686.42             |
|           |          |                  | 3,550.71             |
|           |          |                  | 4,374.43             |


@PlanActivationWithoutInvestmentAndEnrollment

Scenario: To verify  Reamortization when Model portfolio investment is added and verify the account balance

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
| 1           | AllocationPercentage | 60.00 |
| 1           | IsDeleted            | false |
| 2           | InvestmentId         | 3   |
| 2           | AllocationPercentage | 40.00 |
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

When Loan repayment file "LoanRepayment.csv" is selected and edit loan repayment date and loan repayment amount as mentioned below
| Paydate | RepaymentAmount |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |  
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |
| Monthly | 149.85          |

When File upload is executed for the file "LoanRepayment.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by ""

Given Model is selected for the endpoint "/api/v1/Loan/SaveLoanRefinance"

When Configuration has been made as per following
| propertyName          | value  |
| loanAmount            | 0      |
| interestRate          | 5      |
| tenureYears           | 3      |
| tenureMonths          | 0      |
| repaymentFrequency    | 2      |
| periodicPaymentAmount | 34.52  |
| transactionFees       | 2      |
| repaymentMethod       | 1      |
| modificationType      | 1      |
| loanDocument          |        |

And API request has been sent to the "ILoan" with the method name "SaveLoanRefinance"

And Loan request has been approved and trade for loan is executed for "Loan Refinancing"

Then Employee loan amortization schedule should contain 36 installments and should look like this
| Principal | Interest | PaymentPerPeriod | OutstandingPrincipal |
|           |          |                  | 4,870.70             |
|           |          |                  | 4,741.53             |
|           |          |                  | 4,611.17             |
|           |          |                  | 4,480.90             |  
|           |          |                  | 4,350.08             |
|           |          |                  | 4,218.11             |
|           |          |                  | 4,086.17             |
|           |          |                  | 3,953.11             |
|           |          |                  | 3,820.05             |
|           |          |                  | 3,686.42             |
|           |          |                  | 3,550.71             |
|           |          |                  | 4,374.43             |

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
