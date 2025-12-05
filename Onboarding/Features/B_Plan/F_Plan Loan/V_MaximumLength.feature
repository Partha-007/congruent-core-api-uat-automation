Feature: V_MaximumLength
[BeforeTestRun]

Scenario: Maximum Length year maximumLengthMonths is configured with Null
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
 When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |       |
           | maximumLengthMonths          |       |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |  -2s
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL333      | Required      |
	| PL1011     | Required      |

    
  Scenario: Maximum Length years is configured with above 5 Years
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
         | key                           | value |
         | firstRepaymentDateFallsAfter  |     2 |
         | firstRepaymentDateFallsWithin |     3 |
         | maximumlengthyears            |     6 |
         | maximumLengthMonths           |     0 |
         | minimumLengthYears            |     1 |
         | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL1012 : Exceeds loan regulation. Maximum length should not exceed 5 years"

  Scenario: Maximum Length year maximumLengthMonths is configured with zero
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
 When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     0 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 | -2s
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then the API response should contain the 2 following errors 
	| error_code | error_message                                                            |
	| PL330      | Minimum Length should not be equal to or greater than the Maximum Length |
	| PL330      | Minimum Length should not be equal to or greater than the Maximum Length |

    
Scenario: Maximum Length year maximumLengthMonth is configured with 2
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     2 |
           | maximumLengthMonths          |     2 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 | -2s
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message


  Scenario: Maximum Length years is configured with five
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     5 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 | 
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message

   Scenario: Maximum Length month is configured with equal 11
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     2 |
           | maximumLengthMonths          |     11|
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 | 
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message
