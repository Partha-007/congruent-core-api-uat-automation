Feature: I_curePeriodForEmployeeTermination
[BeforeTestRun]

Scenario:   Cure period for employee termination with End of the Calendar Quarter following default quarter and  Fixed number of days
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                              | value   |
           | curePeriodForEmployeeTermination | <Value> |
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
| Value |
|     1 |
|     2 |

Scenario:  curePeriod For EmployeeTermination with Null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                              | value |
           | curePeriodForEmployeeTermination |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL280 : Required"

Scenario: Cure Period for employee termination with Fixed number of days as Null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                               | value |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL281 : Required"


Scenario:  Cure Period for employee termination with Fixed number of day
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                               | value   |
           | curePeriodForEmployeeTermination                  | <Value> |
           | curePeriodFixedNumberOfDaysForEmployeeTermination | <days>  |
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
| Value | days |
|     2 |    0 |
|     2 |    1 |
|     2 |   99 |
|     2 |  100 |
|     2 |  999 |
