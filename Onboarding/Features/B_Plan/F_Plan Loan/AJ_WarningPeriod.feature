Feature: AJ_WarningPeriod
[BeforeTestRun]

Scenario:  Warning period between loans payoffs and loan request with null 
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                           | value |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL316 : Required"

Scenario: To Verify the defaultMethod field as benefit offset / deemed distribution
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                           | value           |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest | <waitingPeriod> |
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
| waitingPeriod |
|             1 |
|            99 |
|           100 |
|           999 |
|          1000 |
|          9999 |
|         999.9 |
