Feature: S_ LoanType
[BeforeTestRun]

Scenario: Loan type as
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key              | value              |
           | masterLoanTypeId | <MasterLoanTypeId> |
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
  | MasterLoanTypeId |
  |                1 |
  |                2 |
  |                3 |
  
  Scenario: Loan type leaving as null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key              | value |
           | masterLoanTypeId |     0 |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL376 : Required"