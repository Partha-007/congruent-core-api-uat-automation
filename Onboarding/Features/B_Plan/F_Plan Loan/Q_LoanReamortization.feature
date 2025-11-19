Feature: Q_LoanReamortization
[BeforeTestRun]

Scenario: loan Reamortization allowed Yes/No
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                       | value                       |
           | loanReamortizationAllowed | <LoanReamortizationAllowed> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message
  Examples: 
  | LoanReamortizationAllowed |
  | true                      |
  | false                     |

  Scenario: loan Reamortization allowed with Null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                       | value |
           | loanReamortizationAllowed |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL286 : Required"

  
Scenario: loan Reamortization fee configured with
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                   | value                   |
           | loanReAmortizationFee | <LoanReAmortizationFee> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then API should respond with successful message
  Examples: 
  | LoanReAmortizationFee |
  |                     1 |
  |                    99 |
  |                   100 |
  |                   999 |
  |                     0 |

  Scenario: loan Reamortization fee configured with Null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                   | value                   |
          | loanReAmortizationFee |                         |
 And Configuration has been made as per following
         | key                          | value |
         | loanperplanyear              |     1 |
         | firstrepaymentdatefallsafter |     1 |
         | maximumlengthyears           |     3 |
         | maximumlengthmonths          |     0 |
         | minimumlengthyears           |     1 |
         | minimumlengthmonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL373 : Required"

    
Scenario: Number of loan Reamortization configured
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                | value                                |
           | numberOfLoanReAmortizationsAllowed | <NumberOfLoanReAmortizationsAllowed> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then API should respond with successful message
  Examples: 
  | NumberOfLoanReAmortizationsAllowed |
  |                                  0 |
  |                                  1 |
  |                                  9 |

  
  Scenario: Number of loan Reamortization configured with null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                | value |
           | numberOfLoanReAmortizationsAllowed |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL285 : Required"