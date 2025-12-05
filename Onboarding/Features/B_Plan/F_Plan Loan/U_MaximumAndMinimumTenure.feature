Feature: U_MaximumAndMinimumTenure
[BeforeTestRun]

Scenario: Min andMax Tenure year/month field as null 
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                 | value |
           | minimumLengthYears  |       |
           | minimumLengthMonths |       |
           | maximumLengthYears |       |
           | maximumLengthMonths |       |
  And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  	Then the API response should contain the 4 following errors
	| error_code | error_message |
	| PL329      | Required      |
	| PL1009     | Required      |
	| PL333      | Required      |
	| PL1011     | Required      |

    
Scenario: Minimum Tenure year field as equal as 5 years when maximum tenure year is 5 yearsGiven Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                | value |
           | minimumLengthYears |     5 |
           | maximumLengthYears |     5 |
  And Configuration has been made as per following
                    | key                          | value |
                    | loanPerPlanYear              |     1 |
                    | firstRepaymentDateFallsAfter |     1 |
                    | maximumLengthMonths          |     0 |
                    | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should give response as "PL330 : Minimum Length should not be equal to or greater than the Maximum Length"
	
    
Scenario: Min andMax Tenure year/month field with values
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                 | value |
           | minimumLengthYears  |     1 |
           | minimumLengthMonths |    11 |
           | maximumLengthYears  |     5 |
           And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthMonths          |     0 | -2S
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: Max Tenure month field with values
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
          When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthMonths          |     11| 
           | maximumLengthYears           |     3 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 | 
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message


Scenario:  Minimum Tenure year field as above 5 years 
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
          When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     6 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL330 : Minimum Length should not be greater than the Maximum Length"
  #error message PL330:Minimum Length should not be equal to or greater than the Maximum Length..got updated
               

 Scenario: Minimum Tenure month field as above 11 months
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |    12 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

  Scenario:  Maximum Tenure year/month feild
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
          When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     6 |
           | maximumLengthMonths          |    12 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 | -2S
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then the API response should contain the 2 following errors 
	| error_code | error_message                                                     |
	| PL1012     | Exceeds loan regulation. Maximum length should not exceed 5 years |
	| PL335      | Maximum length months should not exceed 11                        |

    Scenario:  Minimum Tenure year and month field as 0
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
          When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     0 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL869 : Minimum Tenure should be greater than 0 months"


     Scenario:  Maximum Tenure year and month field as 0
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
          When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     0 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     1 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL870 : Maximum Tenure should be greater than 0 months"


  Scenario: Minimum Tenure year and month field as 5 and 0 years 
Given Model is selected for the endpoint "/api/Loan/SaveLoan"
          When Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     6 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     5 |
           | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
 Then API should give response as "PL1012 : Exceeds loan regulation. Maximum length should not exceed 5 years"

   Scenario: Maximum  Tenure year and month field as 5 and 0 years 
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

	

