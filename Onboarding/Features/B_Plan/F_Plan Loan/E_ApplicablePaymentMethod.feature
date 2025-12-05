Feature: E_ApplicablePaymentMethod
[BeforeTestRun]

#F_Scenario: To Verify the Applicable repayment method field as empty 
Scenario: Applicable Re-Payment methods is configured with Null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value |
           | applicablePaymentMethods     |       |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL315 : Required"

Scenario: Applicable Payment methods is configured with direct payment
 Given Model is selected for the endpoint "/api/oan/SaveLoan"
 When Configuration has been made as per following
           | key                          | value     | 
           | applicablePaymentMethods     | <methods> |
           | loanPerPlanYear              |         1 |
           | firstRepaymentDateFallsAfter |         1 |
           | maximumLengthYears           |         3 |
           | maximumLengthMonths          |         0 |
           | minimumLengthYears           |         1 |
           | minimumLengthMonths          |         0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message
Examples: 
| methods |
| 1,      |
| 2,      |Scenario: Applicable Payment methods is configured with Payroll deductions
|     1,2 |Scenario: Applicable Payment methods is configured with both

