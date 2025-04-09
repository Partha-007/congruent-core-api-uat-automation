Feature: LoanRequestPageValidations

This feature file consists of test scenarios in the loan request page of an employee

@PlanActivation
Scenario: 54276 : To Verify the Leave empty of Select Loan type field  in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              |                       |  
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |
| loanSettingId         |                       |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO001 : Required"




@PlanActivation
Scenario: 54513 : To Verify the Loan type when participant excluded particular loan type   in Loan Request page in Loan module

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

Given Model is selected for the endpoint "/api/Loan/SaveLoan"

When Configuration has been made as per following
| propertyName                                  | value       |
| loanType                                      | 2           |
| numberOfLoansAllowed                          | 5           |
| loanPerPlanYear                               | 3           |
| minimumAmount                                 | 10          |
| processingTimeForLoan                         | 10          |
| waitingPeriodBetweenLoansPayoffAndLoanRequest | 10          |
| numberOfSuspensionsPerLoanAllowed             | 1           |
| checkFee                                      | 2           |
| overnightDeliveryFees                         | 1           |
| maximumAmount                                 | 1           |
| withdrawalBasis                               | 1           |
| refinancingAllowed                            | false       |
| curePeriod                                    | 1           |
| curePeriodForEmployeeTermination              | 1           |
| defaultMethod                                 | 1           |
| minimumLoanRepaymentAmount                    | 10          |
| loanApportioningMethod                        | 1           |
| loanInterestRate                              | 1           |
| loanFeeAmount                                 | 5           |
| minimumLengthYears                            | 1           |
| minimumLengthMonths                           | 0           |
| maximumLengthYears                            | 5           |
| maximumLengthMonths                           | 0           |
| firstRepaymentDateFallsAfter                  | 20          |
| firstRepaymentDateFallsWithin                 | 25          |
| masterLoanTypeId                              | 2           |
| isMaster                                      | true        |
| loanDescription                               | Residential |
| employeeClassificationId                      |             |

And Save Loan details in Plan

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Then Employee plan loans should respond with loan count as 1 with loan type as 1 and Loan description should be "General Purpose"






@PlanActivation
Scenario: To Verify the error message when user hasn't defined reason for the loan in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |
| reasonForLoan         |                       |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO002 : Required"





@PlanActivation
Scenario: To Verify the error message when user gives more than 150 characters in reason for loan field in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |
| reasonForLoan         |                       |

And the property "reasonForLoan" is configured with "alphabets" with 151 characters

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO003 : Reason for loan should not exceed 150 characters"






@PlanActivation
Scenario: To Verify the error message when Loan Request Amount field is left blank in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       |                       |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO004 : Required"




@PlanActivation
Scenario: To Verify the error message when Periodic Payment field is left blank in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount |                       |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO005 : Required"




@PlanActivation
Scenario: To Verify the error message when Tenure years field is left blank in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           |                       |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO007 : Required"




@PlanActivation
Scenario: To Verify the error message when Tenure months field is left blank in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          |                       |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO008 : Required"




@PlanActivation
Scenario: To Verify the error message when Tenure is given as less than minimum tenure set in Plan loans in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 0                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "Tenure should be between <Minimum Length (months)> and <Maximum Length (x years, y months)>"






@PlanActivation
Scenario: To Verify the error message when Tenure is given as more than minimum tenure set in Plan loans in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 5                     |
| tenureMonths          | 1                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "Tenure should be between <Minimum Length (months)> and <Maximum Length (x years, y months)>"






@PlanActivation
Scenario: To Verify the error message when user provides the periodic payment amount that exceeds the loan request amount in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 21                    |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO006 : Periodic payment amount cannot be greater than loan request amount"






@PlanActivation
Scenario: To Verify the error message when Loan fee amount is left blank in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |
| loanFeeAmount         |                       |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO010 : Required"




@PlanActivation
Scenario: To Verify the error message when Check fee amount is left blank in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 20                    |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |
| chequeFees            |                       |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO013 : Required"






@PlanActivation
Scenario: To Verify the error message when user attempts to submit a loan request that is either greater than permitted cap in Loan Request page in Loan module

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
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 1000       |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Payroll file "TradeOrder.csv" is selected and Edit payroll file as mentioned below
| Key          | Value |
| Order Number |       |

When File upload is executed for the file "TradeOrder.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Loan/SaveInprogressLoanRequest"

When Configuration has been made as per following
| propertyName          | value                 |
| loanType              | 1                     |
| interestRate          | 6                     |
| requestedAmount       | 600                   |
| periodicPaymentAmount | 2                     |
| paymentMethod         | 1                     |
| repaymentMethod       | 1                     |
| firstRepaymentDate    | 4/1/2025, 12:00:00 AM |
| repaymentFrequency    | 1                     |
| tenureYears           | 1                     |
| tenureMonths          | 0                     |
| loanStatus            | 3                     |

When API request has been sent to the "ILoan" with the method name "SaveInprogressLoanRequest"

Then Employee Loan request API should respond with error message as "LO004 : You may request a min. of $10.00 to a max. of -$53.55"