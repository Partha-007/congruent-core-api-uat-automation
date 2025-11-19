Feature: M_LoanAmountField
[BeforeTestRun]

Scenario:  To Save loanFeeAmount  field as null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key           | value |
           | loanFeeAmount |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL337 : Required"


Scenario:   To Save loanFeeAmount  field as length
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key           | value    |
           | loanFeeAmount | <amount> |
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
| amount  |
|  999.99 |
|   99.99 |
| 999.999 |

