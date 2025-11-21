Feature: Y_MinimumLoanRepayamount
[BeforeTestRun]

Scenario:  Minimum Loan Repay amount as
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key           | value |
           | minimumLoanRepaymentAmount | <min> |
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
| min      |
|        1 |
|       99 |
|      100 |
|      999 |
|     1000 |
|     9999 |
|    10000 |
|    99999 |
| 99999.00 |


Scenario: Minimum Loan Repay amount as zero
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                        | value |
           | minimumLoanRepaymentAmount | <min> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL509 : Required"
Examples: 
| min |
|   0 |
|     |