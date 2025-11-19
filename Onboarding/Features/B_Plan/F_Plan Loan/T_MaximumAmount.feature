Feature: T_MaximumAmount
[BeforeTestRun]

Scenario:  Maximum amount as allowed by loan regulators
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key           | value           |
           | maximumAmount | <MaximumAmount> |
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
  | MaximumAmount |
  |             1 |

  Scenario:  Maximum amount as Percentage of balances is Null/0
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value             |
           | maximumAmount                | <MaximumAmount>   |
           | maximumAmountPercentageValue | <PercentageValue> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL328 : Required"
  Examples: 
  | MaximumAmount | PercentageValue |
  |             2 |                 |
  |             2 |               0 |





  Scenario:  Maximum amount as Percentage of balances is configured with  value
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value             |
           | maximumAmount                | <MaximumAmount>   |
           | maximumAmountPercentageValue | <PercentageValue> |
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
  | MaximumAmount | PercentageValue |
  |             2 |              10 |
  |             2 |           10.90 |


  
  Scenario:  Maximum amount as Other is Null/0
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                     | value             |
           | maximumAmount           | <MaximumAmount>   |
           | maximumAmountOtherValue | <PercentageValue> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL326 : Required"
 Examples: 
  | MaximumAmount | PercentageValue |
  |             3 |                 |
  |             3 |               0 |


    Scenario:  Maximum amount as Other is configured with value
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                     | value             |
           | maximumAmount           | <MaximumAmount>   |
           | maximumAmountOtherValue | <PercentageValue> |
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
  | MaximumAmount | PercentageValue |
  |             3 |            6000 |
  |             3 |           99.99 |
  |             3 |           99999 |
  |             3 |        99999.00 |
  |             3 |        99999.99 |


