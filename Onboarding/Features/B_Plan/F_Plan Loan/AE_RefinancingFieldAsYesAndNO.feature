Feature: AE_RefinancingFieldAsYesAndNO
[BeforeTestRun]

Scenario:   To Validate Refinancing allowed? field  as
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                   | value  |
           | refinancingAllowed | <refinancing> |
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
| refinancing |
| false       |
| true        |

Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) allowed field is empty
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                        | value |
           | refinancingAllowed         | true  |
           | numberOfRefinancingAllowed |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL340 : Required"

Scenario:To verify Refinancing allowed? as yes Number of refinancing(s) allowed field allow as equal as
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                        | value                 |
           | refinancingAllowed         | <refinancing>         |
           | numberOfRefinancingAllowed | <numberOfRefinancing> |
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
| refinancing | numberOfRefinancing |
| true        |                   9 |
| true        |                   8 |
| true        |                  10 |



Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) loanRefinancingFee field is empty
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                | value |
           | refinancingAllowed | true  |
           | loanRefinancingFee |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL339 : Required"


Scenario:To Validate Refinancing allowed? field  as yes when number of refinancing(s) loanRefinancingFee field allow 
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                | value                |
           | refinancingAllowed | <refinancing>        |
           | loanRefinancingFee | <loanRefinancingFee> |
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
| refinancing | loanRefinancingFee |
| true        |             999.99 |
| true        |              94.99 |
| true        |            944.772 |