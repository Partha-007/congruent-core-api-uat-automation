Feature: K_feesPaymentMethodsApplicable
[BeforeTestRun]

Scenario: To Save feesPaymentMethodsApplicable field as empty
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  | 0,    |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then the API response should contain the 1 following errors 
	| error_code |   error_message |
    | PL865      |   Required      |


Scenario: To Save feesPaymentMethodsApplicable field when  check fee as empty
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  | 1,    |
           | checkFee                      |       |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then the API response should contain the 1 following errors 
	| error_code |   error_message |
    | PL866      |   Required      |


Scenario: To Save feesPaymentMethodsApplicable field when  EFT as empty
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  | 2,    |
           | eftFees                       |       |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
   Then the API response should contain the 1 following errors 
	| error_code |   error_message |
    | PL868      |   Required      |


Scenario: To Save feesPaymentMethodsApplicable field when  check fee length as 3 digits with 2 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value  |
           | feesPaymentMethodsApplicable  | 1,     |
           | checkFee                      | 999.99 | Scenario: To Save feesPaymentMethodsApplicable field when check fee  length is greater than 3 digits with 2 decimal points
           | loanPerPlanYear               |      1 |
           | firstRepaymentDateFallsAfter  |      1 |
           | firstRepaymentDateFallsWithin |      2 |
           | maximumLengthYears            |      3 |
           | maximumLengthMonths           |      0 |
           | minimumLengthYears            |      1 |
           | minimumLengthMonths           |      0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field when  EFT length as 3 digits with 2 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                           | value  |
           | feesPaymentMethodsApplicable  | 2,     |
           | eftFees                       | 999.99 | Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is greater than 3 digits with 2 decimal points
           | loanPerPlanYear               |      1 |
           | firstRepaymentDateFallsAfter  |      1 |
           | firstRepaymentDateFallsWithin |      2 |
           | maximumLengthYears            |      3 |
           | maximumLengthMonths           |      0 |
           | minimumLengthYears            |      1 |
           | minimumLengthMonths           |      0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length as 3 digits with 2 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value  |
           | feesPaymentMethodsApplicable  |    1,2 |
           | checkFee                      | 999.99 |
           | eftFees                       | 999.99 |
           | loanPerPlanYear               |      1 |
           | firstRepaymentDateFallsAfter  |      1 |
           | firstRepaymentDateFallsWithin |      2 |
           | maximumLengthYears            |      3 |
           | maximumLengthMonths           |      0 |
           | minimumLengthYears            |      1 |
           | minimumLengthMonths           |      0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field when check fee  length is less than 3 digits with 2 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  | 1,    |
           | checkFee                      | 99.99 |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is less than 3 digits with 2 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                          | value  |
           | feesPaymentMethodsApplicable | 2,     |
           | eftFees                      | 99.99 |
           | loanPerPlanYear              |      1 |
           | firstRepaymentDateFallsAfter |      1 |
           | maximumLengthYears           |      3 |
           | maximumLengthMonths          |      0 |
           | minimumLengthYears           |      1 |
           | minimumLengthMonths          |      0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length is less than 3 digits with 2 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  |   1,2 |
           | checkFee                      | 99.99 |
           | eftFees                       | 99.99 |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message



Scenario: To Save feesPaymentMethodsApplicable field when check fee is 0
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When Configuration has been made as per following
           | key                          | value  |
           | feesPaymentMethodsApplicable | 1,     |
           | checkFee                     | 0     |
           | loanPerPlanYear              |      1 |
           | firstRepaymentDateFallsAfter |      1 |
           | firstRepaymentDateFallsWithin |      2 |
           | maximumLengthYears           |      3 |
           | maximumLengthMonths          |      0 |
           | minimumLengthYears           |      1 |
           | minimumLengthMonths          |      0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is 0
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"
 
  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  | 2,    |
           | eftFees                       |     0 |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length is 0
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value |
           | feesPaymentMethodsApplicable  |   1,2 |
           | checkFee                      |     0 |
           | eftFees                       |     0 |
           | loanPerPlanYear               |     1 |
           | firstRepaymentDateFallsAfter  |     1 |
           | firstRepaymentDateFallsWithin |     2 |
           | maximumLengthYears            |     3 |
           | maximumLengthMonths           |     0 |
           | minimumLengthYears            |     1 |
           | minimumLengthMonths           |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message



Scenario: To Save feesPaymentMethodsApplicable field when check fee  length is greater than 3 digits with 3 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value   |
           | feesPaymentMethodsApplicable  | 1,      |
           | checkFee                      | 999.993 |
           | loanPerPlanYear               |       1 |
           | firstRepaymentDateFallsAfter  |       1 |
           | firstRepaymentDateFallsWithin |       2 |
           | maximumLengthYears            |       3 |
           | maximumLengthMonths           |       0 |
           | minimumLengthYears            |       1 |
           | minimumLengthMonths           |       0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is greater than 3 digits with 3 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value   |
           | feesPaymentMethodsApplicable  | 2,      |
           | eftFees                       | 999.939 |
           | loanPerPlanYear               |       1 |
           | firstRepaymentDateFallsWithin |       2 |
           | firstRepaymentDateFallsAfter  |       1 |
           | maximumLengthYears            |       3 |
           | maximumLengthMonths           |       0 |
           | minimumLengthYears            |       1 |
           | minimumLengthMonths           |       0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when check fee length 3 digits with 3 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value   |
           | feesPaymentMethodsApplicable  |     1,2 |
           | checkFee                      | 999.929 |
           | eftFees                       |     999 |
           | loanPerPlanYear               |       1 |
           | firstRepaymentDateFallsAfter  |       1 |
           | firstRepaymentDateFallsWithin |       2 |
           | maximumLengthYears            |       3 |
           | maximumLengthMonths           |       0 |
           | minimumLengthYears            |       1 |
           | minimumLengthMonths           |       0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when eft length is  3 digits with 3 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                           | value   |
           | feesPaymentMethodsApplicable  |     1,2 |
           | checkFee                      |     999 |
           | eftFees                       | 999.929 |
           | loanPerPlanYear               |       1 |
           | firstRepaymentDateFallsAfter  |       1 |
           | firstRepaymentDateFallsWithin |       2 |
           | maximumLengthYears            |       3 |
           | maximumLengthMonths           |       0 |
           | minimumLengthYears            |       1 |
           | minimumLengthMonths           |       0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

