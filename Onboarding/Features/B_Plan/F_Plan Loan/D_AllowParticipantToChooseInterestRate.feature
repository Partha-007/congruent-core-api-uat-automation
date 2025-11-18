Feature: D_AllowParticipantToChooseInterestRate
[BeforeTestRun]

Scenario: To Verify the allowParticipantsToChooseInterestRate field as NO 
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | false |
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

Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as null 
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMinimum                   |       |
           | interestRateMaximum                   |   100 |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL287 : Required"

 
Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximm as null 
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMaximum                   |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL289 : Required"

 Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum 
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMinimum                   | <min> |
           | interestRateMaximum                   | <max> |
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
| min | max |
| 100 | 100 |
|   0 |   0 |
|  30 |  80 |
Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as below and above  100
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMinimum                   | <min> |
           | interestRateMaximum                   |   102 |
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
| min |
|   2 |
| 101 |

 
Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMaximum                   | <max> |
           | interestRateMinimum                   |     3 |
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
| max |
| 100 |
|   7 |

Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as above  100
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMaximum                   |   101 |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then the API response should contain the 1 following errors
| block | error_code | error_message |
|     1 |            |               |


 Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum is lesser than interestRateMinimum
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMinimum                   | <min> |
           | interestRateMaximum                   | <max> |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should give response as "PL291 : Minimum Interest Rate should not exceed Maximum Interest Rate"
Examples: 
| min | max |
|  80 |  30 |
