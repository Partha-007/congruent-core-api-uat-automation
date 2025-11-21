Feature: AG_ServiceRequirementForLoan
[BeforeTestRun]


Scenario:    Service Requirement for Loan is configured with
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                            | value     |
           | isServiceRequirementApplicable | <Service> |
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
| Service |
| true    |
| false   |


Scenario:   Service Requirement for Loan number is
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                             | value        |
           | isServiceRequirementApplicable  | <Service>    |
           | serviceRequirementForLoan       | <loan>       |
           | serviceRequirementForLoanNumber | <loanNumber> |
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
| Service | loan | loanNumber                 |
| true    |    1 |                          1 |
| true    |    1 |                         99 |
| true    |    2 |                          1 |
| true    |    2 |                         99 |
| true    |    1 |                          9 |
| true    |    2 |                          9 |
| true    |    1 |                        100 |
| true    |    2 |                        100 |


Scenario:  Service Requirement for Loan number is null/0 with month  
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                             | value        |
           | isServiceRequirementApplicable  | <Service>    |
           | serviceRequirementForLoan       | <loan>       |
           | serviceRequirementForLoanNumber | <loanNumber> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL317 : Required"
Examples: 
| Service | loan | loanNumber |
| true    |    1 |            |
| true    |    1 |          0 |
| true    |    2 |            |
| true    |    2 |          0 |

# UI restricted
 
Scenario:  To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan field a alphabets
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
 When the property "isServiceRequirementApplicable" is configured as "true"
And the property "serviceRequirementForLoan" is configured as "1"
And the property "serviceRequirementForLoanNumber" is configured as "abc"

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
# UI restricted
 

Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan field as alphanumeric
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
 When the property "isServiceRequirementApplicable" is configured as "true"
And the property "serviceRequirementForLoan" is configured as "1"
And the property "serviceRequirementForLoanNumber" is configured as "ah2"

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

# UI restricted
 

Scenario:  To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan field as special characters
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
 When the property "isServiceRequirementApplicable" is configured as "true"
And the property "serviceRequirementForLoan" is configured as "1"
And the property "serviceRequirementForLoanNumber" is configured as "#@!"

And Configuration has been made as per following
           | key                          | value |
           | loanperplanyear              |     1 |
           | firstrepaymentdatefallsafter |     1 |
           | maximumlengthyears           |     3 |
           | maximumlengthmonths          |     0 |
           | minimumlengthyears           |     1 |
           | minimumlengthmonths          |     0 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message
