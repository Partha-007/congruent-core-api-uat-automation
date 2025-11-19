Feature: R_Loansperplanyear
[BeforeTestRun]

Scenario: loanPerPlanYear as 3 and max
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                  | value         |
           | numberOfLoansAllowed | <loans>       |
           | loanPerPlanYear      | <PerPlanYear> |
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
  | loans | PerPlanYear |
  |     3 |           3 |
  |     9 |           9 |

  Scenario: loanPerPlanYear should not exceed numberOfLoansAllowed
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                  | value |
           | loanPerPlanYear      |     3 |
  And Configuration has been made as per following
           | key                          | value |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then API should give response as "PL321 : Loans per plan year should not exceed Total loans allowed"

     Scenario: loanPerPlanYear leaving as null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key             | value |
           | loanPerPlanYear |       |
  And Configuration has been made as per following
           | key                          | value |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then API should give response as "PL320 : Required"


