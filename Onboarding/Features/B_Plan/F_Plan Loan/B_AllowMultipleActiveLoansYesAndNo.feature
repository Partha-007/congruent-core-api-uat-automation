Feature: B_AllowMultipleActiveLoansYesAndNo
[BeforeTestRun]

Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                           | value |
           | allowMultipleActiveLoans                      | false |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | minimumLength                |     3 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL316 : Required"