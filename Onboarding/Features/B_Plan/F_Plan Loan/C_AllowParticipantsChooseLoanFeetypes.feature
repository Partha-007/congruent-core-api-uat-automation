Feature: C_AllowParticipantsChooseLoanFeetypes
[BeforeTestRun]

Scenario: Allow participant to choose loan fee type
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                  | value  |
           | allowParticipantsToChooseLoanFeeType | <bool> |
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
| bool  |
| true  |
| false |

Scenario: Loan fee type deducted from account balance
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                  | value  |
           | allowParticipantsToChooseLoanFeeType | <bool> |
           | loanFeeTypeDeductedFrom              | <fee>  |
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
| bool  | fee |
| true  |   1 |
| true  |   2 |
| false |   1 |
| false |   2 |

Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as yes when Loan fee type deducted from is not selected
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                                  | value |
           | allowParticipantsToChooseLoanFeeType | true  |
           | loanFeeTypeDeductedFrom              |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL290 : Required"