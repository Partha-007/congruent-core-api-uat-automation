Feature: AB_OvernightDeliveryField
[BeforeTestRun]

Scenario:   To Save overnightDeliveryFees  field as
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                   | value  |
           | overnightDeliveryFees | <fees> |
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
| fees    |
|         |
|  999.99 |
|   99.99 |
| 999.999 |