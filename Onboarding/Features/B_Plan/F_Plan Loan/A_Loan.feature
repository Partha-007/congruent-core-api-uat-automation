Feature: A_Loan
[BeforeTestRun]


#Scenario: To Validate Allow multiple active loans? field  as yes
#Scenario: Allow participant to choose loan fee type is true
#Scenario: Loan fee type deducted from account balance
#Scenario: To Verify the allowParticipantsToChooseInterestRate field as NO 
#Scenario: Applicable Payment methods is configured with direct payment
#Scenario: To validate select direct payment in Applicable repayment method field 
#Scenario: spousal consent required as Yes 
#Scenario: spousal approval required as Yes 
#Scenario: Refinancing allowed required as Yes 
#Scenario: Cure Period with End of the Calendar Quarter following default quarter
#Scenario: Cure period for employee termination with End of the Calendar Quarter following default quarter
#Scenario: Default method is configured with Benefit offset
#Scenario: To Save feesPaymentMethodsApplicable field when  check fee length as 3 digits with 2 decimal points
#Scenario: To Save feesPaymentMethodsApplicable field when check fee  length is greater than 3 digits with 2 decimal points


Scenario: allowLoansIfAnotherLoanIsDelinquentDefaultDeemed is true
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When the property "allowLoansIfAnotherLoanIsDelinquentDefaultDeemed" is configured as "true"
   And Configuration has been made as per following
           | key                                   | value  |
           | allowMultipleActiveLoans              | true   |
           | allowParticipantsToChooseLoanFeeType  | true   |
           | loanFeeTypeDeductedFrom               |      1 |
           | allowParticipantsToChooseInterestRate | false  |
           | applicablePaymentMethods              | 1,     |
           | sourceHierarchies                     | 1,     |
           | spousalConsentRequired                | true   |
           | sponsorApprovalRequired               | true   |
           | refinancingAllowed                    | true   |
           | curePeriod                            |      1 |
           | curePeriodForEmployeeTermination      |      1 |
           | defaultMethod                         |      1 |
           | feesPaymentMethodsApplicable          | 1,     |
           | checkFee                              | 999.99 |
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

#Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as length as 3 digits
#Scenario: Allow participant to choose loan fee type is false
#Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as no 
#Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as yes when Loan fee type deducted from is  selected as Account balance
#Scenario: Applicable Payment methods is configured with Payroll deductions
#Scenario: To Verify select payroll deduction in Applicable repayment method field 
#Scenario: spousal consent required as No 
#Scenario: spousal approval required as No 
#Scenario: Refinancing allowed required as No 
#Scenario: Cure Period with Fixed number of days
#Scenario: Cure Period for employee termination with Fixed number of days
#Scenario: Cure Period for employee termination with Fixed number of days as zero
#Scenario: Default method is configured with Deemed distribution
#Scenario: To Save feesPaymentMethodsApplicable field when  EFT length as 3 digits with 2 decimal points
#Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is greater than 3 digits with 2 decimal points

Scenario: allowLoansIfAnotherLoanIsDelinquentDefaultDeemed is false
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When the property "allowLoansIfAnotherLoanIsDelinquentDefaultDeemed" is configured as "false"
     And Configuration has been made as per following
           | key                                               | value  |
           | allowMultipleActiveLoans                          | false  |
           | allowParticipantsToChooseLoanFeeType              | false  |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest     |    999 |
           | loanFeeTypeDeductedFrom                           |      1 |
           | applicablePaymentMethods                          | 2,     |
           | sourceHierarchies                                 | 2,     |
           | spousalConsentRequired                            | false  |
           | sponsorApprovalRequired                           | false  |
           | refinancingAllowed                                | false  |
           | curePeriod                                        |      2 |
           | curePeriodForEmployeeTermination                  |      2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |      0 |
           | defaultMethod                                     |      2 |
           | feesPaymentMethodsApplicable                      | 2,     |
           | eftFees                                           | 999.99 |

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

#Scenario: To Verify the Applicable repayment method field as empty 
Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as null
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                           | value |
           | allowMultipleActiveLoans                      | false |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest |       |
           | allowParticipantsToChooseInterestRate         | true  |
           | interestRateMinimum                           |       |
           | interestRateMaximum                           |       |
           | applicablePaymentMethods                      |       |
           | curePeriod                                    |       |
           | curePeriodForEmployeeTermination              |       |
           | defaultMethod                                 |       |
           | feesPaymentMethodsApplicable                  | 0,    |
           | refinancingAllowed                            | true  |
           | firstRepaymentDateFallsAfter                  |       |
           | firstRepaymentDateFallsWithin                  |       |
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
	| error_code | error_message |
	| PL316      | Required      |
	| PL287      | Required      | Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as null
	| PL289      | Required      | Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as null
	| PL315      | Required      | Scenario: Applicable Re-Payment methods is configured with Null
	| PL275      | Required      | Scenario: Cure Period with Null
	| PL280      | Required      | Scenario: Cure Period for employee termination with Null
	| PL307      | Required      | Scenario: Default method is configured with Null
	| PL865      | Required      | Scenario: To Save feesPaymentMethodsApplicable field as empty
	| PL302      | Required      | Scenario: To Validate First repayment date falls after field  is empty
	| PL303      | Required      |Scenario: To Validate First repayment date falls within field  is empty



Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as length as 4 digits
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                           | value |
           | allowMultipleActiveLoans                      | false |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest |  1000 |
           | curePeriod                                    |     2 |
           | curePeriodFixedNumberOfDays                   |       |
           | feesPaymentMethodsApplicable                   |    1,  |
           | checkFee                   |       |
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
	| error_code | error_message |
	| PL316      | Required      |
	| PL276      | Required      | Scenario: Cure Period with Fixed number of days as Null
	| PL866      | Required      |Scenario: To Save feesPaymentMethodsApplicable field when  check fee as empty



#Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as 100  
#Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as yes when Loan fee type deducted from is  selected as Loan amount
#Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as  100  
#Scenario: Applicable Payment methods is configured with both
#Scenario: To Verify select direct payment and payroll deduction in Applicable repayment method field as both 
#Scenario: Cure Period for employee termination with Fixed number of days as 1
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length as 3 digits with 2 decimal points

Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as length as 2 digits
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value |
           | allowMultipleActiveLoans                          | false |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest     |    20 |
           | allowParticipantsToChooseLoanFeeType              | false |
           | loanFeeTypeDeductedFrom                           |     2 |
           | allowParticipantsToChooseInterestRate             | true  |
           | interestRateMinimum                               |   100 |
           | interestRateMaximum                               |   100 |
           | applicablePaymentMethods                          |   1,2 |
           | sourceHierarchies                                 |   1,2 |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |     1 |
           | feesPaymentMethodsApplicable                      | 1,2     |
           | checkFee                                           | 999.99 |
           | eftFees                                           | 999.99 |
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

  #Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as below  100
  #Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as below  100
  #Scenario: Cure Period with Fixed number of days as zero
#Scenario: Cure Period for employee termination with Fixed number of days as 99
#Scenario: To Save feesPaymentMethodsApplicable field when check fee  length is less than 3 digits with 2 decimal points

Scenario: Loan fee type deducted from loan amount
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseLoanFeeType  | true  |
           | loanFeeTypeDeductedFrom               |     2 |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMaximum                   |     7 |
           | interestRateMinimum                   |     2 |
           | curePeriod                            |     2 |
           | curePeriodFixedNumberOfDays           |     0 |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |     99 |
           | feesPaymentMethodsApplicable                      | 1,    |
           | checkFee                                           | 99.99 |
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


Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as yes when Loan fee type deducted from is not selected
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value |
           | allowParticipantsToChooseLoanFeeType              | true  |
           | loanFeeTypeDeductedFrom                           |       |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |       |
           | feesPaymentMethodsApplicable                   |    2, |
           | eftFees                   |       |
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
	| error_code | error_message |
	| PL290      | Required      |
	| PL281      | Required      | Scenario: Cure Period for employee termination with Fixed number of days as Null
	| PL868      | Required      | Scenario: To Save feesPaymentMethodsApplicable field when  EFT as empty



            
Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as above  100
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
            | allowParticipantsToChooseInterestRate | true        |
            | interestRateMaximum | 101        |
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
	| error_code | error_message |
	|            |               |

#Scenario: Cure Period with Fixed number of days as 1
#Scenario: Cure Period for employee termination with Fixed number of days as 100
#Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is less than 3 digits with 2 decimal points

Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum and  interestRateMaximum as 0 
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMinimum                   |     0 |
           | interestRateMinimum                   |     0 |
           | curePeriod                            |     2 |
           | curePeriodFixedNumberOfDays           |     1 |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |     100 |
           | feesPaymentMethodsApplicable                      | 2,    |
           | eftFees                                           | 99.99 |
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



Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum is lesser than interestRateMinimum
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
            | allowParticipantsToChooseInterestRate | true        |
            | interestRateMinimum | 80        |
            | interestRateMinimum | 30        |
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
	| error_code | error_message                                                 |
	| PL291      | Minimum Interest Rate should not exceed Maximum Interest Rate |

#Scenario: Cure Period with Fixed number of days as 99
#Scenario: Cure Period for employee termination with Fixed number of days as 999
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length is less than 3 digits with 2 decimal points

Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum is lesser than interestRateMaximum
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value |
           | allowParticipantsToChooseInterestRate             | true  |
           | interestRateMinimum                               |    30 |
           | interestRateMaximum                               |    80 |
           | curePeriod                                        |     2 |
           | curePeriodFixedNumberOfDays                       |    99 |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |   999 |
           | feesPaymentMethodsApplicable                      | 1,2,    |
           | checkFee                                           | 99.99 |
           | eftFees                                           | 99.99 |
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

#Scenario: To Save feesPaymentMethodsApplicable field when check fee is 0
Scenario: Cure Period with Fixed number of days as 100
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                          | value |
           | curePeriod                   |     2 |
           | curePeriodFixedNumberOfDays  |   100 |
           | feesPaymentMethodsApplicable | 1,    |
           | checkFee                     |     0 |

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

#Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is 0
Scenario: Cure Period with Fixed number of days as 999
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
           | curePeriod                            |     2 |
           | curePeriodFixedNumberOfDays           |     999 |
           | feesPaymentMethodsApplicable | 2,    |
           | eftFees                     |     0 |
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

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length is 0
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
           | feesPaymentMethodsApplicable | 1,2,    |
           | checkFee                     |     0 |
           | eftFees                     |     0 |
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

#################
#Restricted in UI
#
#Scenario: To Save feesPaymentMethodsApplicable field when EFT field accept special characters
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when check fee field accept special characters
#Scenario: To Save feesPaymentMethodsApplicable field when check fee  field accept alphanumeric with special characters
#Scenario: To Save feesPaymentMethodsApplicable field when EFT  field accept alphanumeric with special characters
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when check fee field accept alphanumeric with special characters
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when eft fee field accept alphabets
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when eft fee field accept alphanumeric
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when eft fee field accept special characters
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when eft fee field accept alphanumeric with special characters



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

