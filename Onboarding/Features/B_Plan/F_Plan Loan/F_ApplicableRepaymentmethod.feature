Feature: F_ApplicableRepaymentmethod
[BeforeTestRun]

Scenario: To validate select direct payment in Applicable repayment method field 
 Given Model is selected for the endpoint "/api/oan/SaveLoan"
 When Configuration has been made as per following
           | key                          | value               |
           | sourceHierarchies            | <SourceHierarchies> |
           | loanPerPlanYear              |                   1 |
           | firstRepaymentDateFallsAfter |                   1 |
           | maximumLengthYears           |                   3 |
           | maximumLengthMonths          |                   0 |
           | minimumLengthYears           |                   1 |
           | minimumLengthMonths          |                   0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message
Examples: 
| SourceHierarchies |
| 1,                |
| 2,                | Scenario: To Verify select payroll deduction in Applicable repayment method field
|               1,2 | Scenario: To Verify select direct payment and payroll deduction in Applicable repayment method field as both
