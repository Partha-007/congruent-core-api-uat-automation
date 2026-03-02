Feature: A_Allowloanisinanothertype
[BeforeTestRun]

Scenario: allowLoansIfAnotherLoanIsDelinquentDefaultDeemed is true/false
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When the property "allowLoansIfAnotherLoanIsDelinquentDefaultDeemed" is configured as "<bool>"
   And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
           | loanDocumentType             |       |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message
Examples: 
| bool  |
| true  |
| false |



