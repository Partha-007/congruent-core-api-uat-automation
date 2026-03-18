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
#Scenario: To Verify the excludedEmployeeClassifications as empty
#Scenario: To Verify the excludedEmploymentStatuses as empty
#Scenario: Loan Interest rate is configured with Prime
#Scenario: loan Reamortization allowed Yes
#Scenario: loan Reamortization fee configured with 1
#Scenario: Number of loan Reamortization configured with zero
#Scenario: loanPerPlanYear as 3
#Scenario: Loan type as General purpose 
#Scenario: Maximum amount as allowed by loan regulators
#Scenario: Minimum Tenure month field as equal as  11 months
#Scenario: Maximum Tenure year field as equal as 5 years 
#Scenario: Maximum Length years is configured with five
#Scenario: Minimum Length is configured with 3 months
#Scenario: Minimum Loan Repay amount as one
#Scenario: numberOfLoansAllowed as 3
#Scenario: To Verify the numberOfSuspensionsPerLoanAllowed as accept as 1 to 99
#Scenario: To Save overnightDeliveryFees  field as null
#Scenario: To Validate Refinancing allowed? field  as yes
#Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) loanRefinancingFee field allow 3 characters with 2 decimal points as numerics
#Scenario: Loan Save configuration
#Scenario: Service Requirement for Loan is configured with true
#Scenario: To Verify the isServiceRequirementApplicable field as yes
#Scenario: To Verify the defaultMethod field as benefit offset 
#           | sourceHierarchies                     | 1,     |
#UI changes
           #| spousalConsentRequired                | true   |
           #| sponsorApprovalRequired               | true   |

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
           | refinancingAllowed                    | true   |
           | loanRefinancingFee                    | 999.99 |
           | curePeriod                            |      1 |
           | curePeriodForEmployeeTermination      |      1 |
           | defaultMethod                         |      1 |
           | feesPaymentMethodsApplicable          | 1,     |
           | checkFee                              | 999.99 |
           | excludedEmployeeClassifications       | 0,     |
           | excludedEmploymentStatuses            | 0,     |
           | loanInterestRate                      |      1 |
           | loanReamortizationAllowed             | true   |
           | loanReAmortizationFee                 |      1 |
           | numberOfLoanReAmortizationsAllowed    |      0 |
           | numberOfLoansAllowed                  |      3 |
           | loanPerPlanYear                       |      3 |
           | masterLoanTypeId                      |      1 |
           | maximumAmount                         |      1 |
           | minimumLengthMonths                   |     11 |
           | maximumLengthYears                    |      5 |
           | minimumLength                         |      1 |
           | minimumLoanRepaymentAmount            |      1 |
           | numberOfSuspensionsPerLoanAllowed     |     99 |
           | overnightDeliveryFees                 |        |
           | isServiceRequirementApplicable        | true   |
           | defaultMethod                         |      1 |
   And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           #| maximumLengthYears           |     3 |
           #| maximumLengthMonths          |     0 |
           #| minimumLengthYears           |     1 |
           #| minimumLengthMonths          |     0 |
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
#Scenario: Loan Interest rate is configured with Prime+a%
#Scenario: loan Reamortization allowed No
#Scenario: loanPerPlanYear with max value
#Scenario: Loan type as Residential
#Scenario: Maximum amount as Percentage of balances is configured with  value
#Scenario: Maximum Tenure month field as equal as  11 months
#Scenario: Minimum Length is configured with 6 months
#Scenario: Minimum Loan Repay amount as 99
#Scenario: numberOfLoansAllowed with max value
#Scenario: To Verify the numberOfSuspensionsPerLoanAllowed as blank
#Scenario: To Save overnightDeliveryFees  field as length of 3 digits with 2 decimal points
#Scenario: To Validate Refinancing allowed? field  as NO
#Scenario: Service Requirement for Loan is configured with false
#Scenario: To Verify the defaultMethod field as deemed distribution


Scenario: allowLoansIfAnotherLoanIsDelinquentDefaultDeemed is false
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
  When the property "allowLoansIfAnotherLoanIsDelinquentDefaultDeemed" is configured as "false"
     And Configuration has been made as per following
           | key                                               | value            |
           | allowMultipleActiveLoans                          | false            |
           | allowParticipantsToChooseLoanFeeType              | false            |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest     |              999 |
           | loanFeeTypeDeductedFrom                           |                1 |
           | applicablePaymentMethods                          | 2,               |
           | sourceId                                          | <PretaxSourceID> |
           | spousalConsentRequired                            | false            |
           | sponsorApprovalRequired                           | false            |
           | refinancingAllowed                                | false            |
           | curePeriod                                        |                2 |
           | curePeriodForEmployeeTermination                  |                2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |                0 |
           | defaultMethod                                     |                2 |
           | feesPaymentMethodsApplicable                      | 2,               |
           | eftFees                                           |           999.99 |
           | loanInterestRate                                  |                2 |
           | loanInterestRateValue                             |               10 |
           | loanReamortizationAllowed                         | false            |
           | numberOfLoansAllowed                              |                9 |
           | loanPerPlanYear                                   |                9 |
           | masterLoanTypeId                                  |                2 |
           | maximumAmount                                     |                2 |
           | maximumAmountPercentageValue                      |               10 |
           | maximumLengthMonths                               |               11 |
           | minimumLength                                     |                2 |
           | minimumLoanRepaymentAmount                        |               99 |
           | numberOfSuspensionsPerLoanAllowed                 |                  |
           | overnightDeliveryFees                             |           999.99 |
           | isServiceRequirementApplicable                    | false            |
           | defaultMethod                                     |                2 |
   And Configuration has been made as per following
           | key                          | value | 
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
           #| maximumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message

#Scenario: To Verify the Applicable repayment method field as empty 
#Scenario: loanPerPlanYear should not exceed numberOfLoansAllowed
#Scenario: Maximum Length years is configured with Null
#Scenario: Maximum Length month is configured with null
#Scenario: Minimum Length is configured with Null
#Scenario: Warning period between loans payoffs and loan request with null 

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
           | numberOfRefinancingAllowed                    |       |
           | firstRepaymentDateFallsAfter                  |       |
           | firstRepaymentDateFallsWithin                 |       |
           | loanFeeAmount                                 |       |
           | loanApportioningMethod                        |       |
           | loanInterestRate                              |       |
           | loanReamortizationAllowed                     |       |
           | numberOfLoansAllowed                          |     2 |
           | loanPerPlanYear                               |     3 |
           | masterLoanTypeId                              |     0 |
           | maximumAmount                                 |     2 |
           | maximumAmountPercentageValue                  |       |
           | minimumLengthYears                            |       |
           | minimumLengthMonths                           |       |
           | maximumLengthYears                            |       |
           | maximumLengthMonths                           |       |
           | minimumLoanRepaymentAmount                    |     0 |
   #And Configuration has been made as per following
   #        | key                          | value |
   #        | loanPerPlanYear              |     1 |
   #        | firstRepaymentDateFallsAfter |     1 |
   #        #| maximumLengthYears           |     3 |
   #        #| maximumLengthMonths          |     0 |
   #        #| minimumLengthYears           |     1 |
   #        #| minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then the API response should contain the 23 following errors 
	| error_code | error_message                                             |
	| PL316      | Required                                                  |
	| PL287      | Required                                                  | Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as null
	| PL289      | Required                                                  | Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as null
	| PL315      | Required                                                  | Scenario: Applicable Re-Payment methods is configured with Null
	| PL275      | Required                                                  | Scenario: Cure Period with Null
	| PL280      | Required                                                  | Scenario: Cure Period for employee termination with Null
	| PL307      | Required                                                  | Scenario: Default method is configured with Null
	| PL865      | Required                                                  | Scenario: To Save feesPaymentMethodsApplicable field as empty
	| PL302      | Required                                                  | Scenario: To Validate First repayment date falls after field  is empty
	| PL303      | Required                                                  | Scenario: To Validate First repayment date falls within field  is empty
	| PL337      | Required                                                  | Scenario: To Save loanFeeAmount  field as null
	| PL309      | Required                                                  | Scenario: Loan apportion method is configured with null
	| PL338      | Required                                                  | Scenario: Loan Interest rate is configured with Null
	| PL286      | Required                                                  | Scenario: loan Reamortization allowed with Null
	| PL321      | Loans per plan year should not exceed Total loans allowed | Scenario: loanPerPlanYear should not exceed numberOfLoansAllowed
	| PL376      | Required                                                  | Scenario: Loan type leaving as null
	| PL328      | Required                                                  | Scenario: Maximum amount as Percentage of balances is Null
	| PL329      | Required                                                  | Scenario: Minimum Tenure year field as null
	| PL1009     | Required                                                  | Scenario: Minimum Tenure month field as null
	| PL333      | Required                                                  | Scenario: Maximum Tenure year field as null
	| PL1011     | Required                                                  | Scenario: Maximum Tenure month field as null
	| PL509      | Required                                                  | Scenario: Minimum Loan Repay amount as zero
	| PL340      | Required                                                  | Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) allowed field is empty

    #Scenario: Check fee is configured with null
#Restricted in UI
#Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as length as 4 digits

#bug
Scenario: Cure Period with Fixed number of days as Null
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                           | value |
           | allowMultipleActiveLoans                      | false |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest |  1    |
           | curePeriod                                    |     2 |
           | curePeriodFixedNumberOfDays                   |       |
           | feesPaymentMethodsApplicable                  | 1,    |
           | checkFee                                      |       |
           | refinancingAllowed                            | true  |
           | firstRepaymentDateFallsWithin                 |    91 |
           | loanInterestRate                              |     2 |
           | loanInterestRateValue                         |       |
           | loanReamortizationAllowed                     | true  |
           | loanReAmortizationFee                         |       |
           | numberOfLoanReAmortizationsAllowed            |       |
           | numberOfLoansAllowed                          |     2 |
           | loanPerPlanYear                               |       |
           | maximumAmount                                 |     2 |
           | maximumAmountPercentageValue                  |     0 |
           | minimumLengthYears                            |     5 |
           | maximumLengthYears                            |     5 |
           | defaultMethod                                 |       |
   #And Configuration has been made as per following
   #        | key                          | value |
   #        | loanPerPlanYear              |     1 |
   #        | firstRepaymentDateFallsAfter |     1 |
   #        #| maximumLengthYears           |     3 |
   #        #| maximumLengthMonths          |     0 |
   #        #| minimumLengthYears           |     1 |
   #        #| minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then the API response should contain the 11 following errors 
	| error_code | error_message                                                            |
	| PL276      | Required                                                                 | 
	| PL866      | Required                                                                 | Scenario: To Save feesPaymentMethodsApplicable field when  check fee as empty
	| PL304      | First repayment date falls after date should be between 0 and 30 days.   | Scenario: To Validate First repayment date falls after field  is above 30
	| PL377      | Required                                                                 | Scenario: Loan Interest rate value is configured with Null
	| PL373      | Required                                                                 | Scenario: loan Reamortization fee configured with Null
	| PL285      | Required                                                                 | Scenario: Number of loan Reamortization configured with null
	| PL320      | Required                                                                 | Scenario: loanPerPlanYear leaving as null
	| PL328      | Required                                                                 | Scenario: Maximum amount as Percentage of balances is zero
	| PL330      | Minimum Length should not be equal to or greater than the Maximum Length | Scenario: Minimum Tenure year field as equal as 5 years when maximum tenure year is 5 years ***
	| PL307      | Required                                                                 | Scenario: To Verify the defaultMethod field as empty 



#Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as 100  
#Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as yes when Loan fee type deducted from is  selected as Loan amount
#Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as  100  
#Scenario: Applicable Payment methods is configured with both
#Scenario: To Verify select direct payment and payroll deduction in Applicable repayment method field as both 
#Scenario: Cure Period for employee termination with Fixed number of days as 1
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length as 3 digits with 2 decimal points
#Scenario: To Validate First repayment date falls after field  is equal as 30
#Scenario: To Save loanFeeAmount  field as length of 3 digits with 2 decimal points
#Scenario: Loan apportion method is configured with Prorata
#Scenario: Loan Interest rate is configured with Other
#Scenario: loan Reamortization fee configured with 99
#Scenario: Number of loan Reamortization configured with 1
#Scenario: Loan type as Others
#Scenario: Maximum amount as Percentage of balances is configured with decimal value
#Scenario: Minimum Tenure month field as above 11 months
#Scenario: Minimum Length is configured with 12 months
#Scenario: Minimum Loan Repay amount as 100
#Scenario: To Save overnightDeliveryFees  field as length is less than 3 digits with 2 decimal points
#Scenario: To verify Refinancing allowed? as yes Number of refinancing(s) allowed field allow as equal as 9
#Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) loanRefinancingFee field allow below 3 characters with 2 decimal points as numerics
#Scenario: Service Requirement for Loan number is 1 with month
#| sourceHierarchies                                 |    1,2 |


Scenario: To Validate Allow multiple active loans? field  as No and waitingPeriodBetweenLoansPayoffAndLoanRequest as length as 2 digits
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value  |
           | allowMultipleActiveLoans                          | false  |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest     |     20 |
           | allowParticipantsToChooseLoanFeeType              | false  |
           | loanFeeTypeDeductedFrom                           |      2 |
           | allowParticipantsToChooseInterestRate             | true   |
           | interestRateMinimum                               |    100 |
           | interestRateMaximum                               |    100 |
           | applicablePaymentMethods                          |    1,2 |
           | curePeriodForEmployeeTermination                  |      2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |      1 |
           | feesPaymentMethodsApplicable                      |    1,2 |
           | checkFee                                          | 999.99 |
           | eftFees                                           | 999.99 |
           | refinancingAllowed                                | true   |
           | numberOfRefinancingAllowed                        |      9 |
           | loanRefinancingFee                                |  94.99 |
           | firstRepaymentDateFallsAfter                      |     30 |
           | firstRepaymentDateFallsWithin                     |     31 |
           | loanFeeAmount                                     | 999.99 |
           | loanApportioningMethod                            |      1 |
           | loanInterestRate                                  |      3 |
           | loanInterestRateValue                             |     10 |
           | loanReamortizationAllowed                         | true   |
           | loanReAmortizationFee                             |     99 |
           | numberOfLoanReAmortizationsAllowed                |      1 |
           | masterLoanTypeId                                  |      3 |
           | maximumAmount                                     |      2 |
           | maximumAmountPercentageValue                      |  10.90 |
           | minimumLengthMonths                               |     12 |
           | minimumLength                                     |      3 |
           | minimumLoanRepaymentAmount                        |    100 |
           | overnightDeliveryFees                             |  99.99 |
           | isServiceRequirementApplicable                    | true   |
           | serviceRequirementForLoan                         |      1 |
           | serviceRequirementForLoanNumber                   |      1 |
    And Configuration has been made as per following
           | key                                               | value  |
    #       | loanPerPlanYear                                   |      1 |
             | maximumLengthYears           |     3 |
             | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
    #       #| minimumLengthMonths          |     0 |
        #       | firstRepaymentDateFallsAfter                      |      1 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message

  #Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as below  100
  #Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum as below  100
  #Scenario: Cure Period with Fixed number of days as zero
#Scenario: Cure Period for employee termination with Fixed number of days as 99
#Scenario: To Save feesPaymentMethodsApplicable field when check fee  length is less than 3 digits with 2 decimal points
#Scenario: To Validate First repayment date falls within field  is equal as 90
#Scenario: To Save loanFeeAmount  field as length is less than 3 digits with 2 decimal points
#Scenario: Loan apportion method is configured with loan status cum loan age
#Scenario: loan Reamortization fee configured with 100
#Scenario: Number of loan Reamortization configured with 1

#Scenario: Maximum amount as Other is configured with value
#Scenario: To Verify the numberOfSuspensionsPerLoanAllowed as blank
#Scenario: To Save overnightDeliveryFees  field as length is  3 digits with 3 decimal points
#Scenario: feesPaymentMethodsApplicable is configured with check
#Scenario: To verify Refinancing allowed? as yes Number of refinancing(s) allowed field allow as below 9
#Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) loanRefinancingFee field allow  3 characters with 3 decimal points as numerics
#Scenario: Service Requirement for Loan number is 99 with month
#Scenario: Maximum Length years is configured with one

Scenario: Loan fee type deducted from loan amount
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value   |
           | allowParticipantsToChooseLoanFeeType              | true    |
           | loanFeeTypeDeductedFrom                           |       2 |
           | allowParticipantsToChooseInterestRate             | true    |
           | interestRateMaximum                               |       7 |
           | interestRateMinimum                               |       2 |
           | curePeriod                                        |       2 |
           | curePeriodFixedNumberOfDays                       |       0 |
           | curePeriodForEmployeeTermination                  |       2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |      99 |
           | feesPaymentMethodsApplicable                      | 1,      |
           | checkFee                                          |   99.99 |
           | refinancingAllowed                                | true    |
           | numberOfRefinancingAllowed                        |       8 |
           | loanRefinancingFee                                | 944.772 |
           | firstRepaymentDateFallsWithin                     |      90 |
           | loanFeeAmount                                     |   99.99 |
           | loanApportioningMethod                            |       2 |
           | loanReAmortizationFee                             |     100 |
           | loanReamortizationAllowed                         | true    |
           | numberOfLoanReAmortizationsAllowed                |       1 |
           | maximumAmount                                     |       3 |
           | maximumAmountPercentageValue                      |    6000 |
           | numberOfSuspensionsPerLoanAllowed                 |         |
           | overnightDeliveryFees                             |  999.99 |
           | overnightDeliveryFees                             |   99.99 |
           | isServiceRequirementApplicable                    | true    |
           | serviceRequirementForLoan                         |       1 |
           | serviceRequirementForLoanNumber                   |      99 |
   And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     1 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
           #| minimumAmount                |     1 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then API should respond with successful message

#Scenario: EFT fee is configured with null
#Scenario: Maximum amount as Other is configured with decimal value
Scenario: To Verify the allowParticipantsToChooseLoanFeeType  as yes when Loan fee type deducted from is not selected
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value |
           | allowParticipantsToChooseLoanFeeType              | true  |
           | loanFeeTypeDeductedFrom                           |       |
           | curePeriodForEmployeeTermination                  |     2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |       |
           | feesPaymentMethodsApplicable                      | 2,    |
           | eftFees                                           |       |
           | refinancingAllowed                                | true  |
           | loanRefinancingFee                                |       |
           | firstRepaymentDateFallsAfter                      |    22 |
           | firstRepaymentDateFallsWithin                     |    22 |
           | maximumAmount                                     |     3 |
           | maximumAmountPercentageValue                      | 99.99 |
           | maximumAmountOtherValue                           |       |
           | minimumLengthYears                                |     6 |
           | maximumLengthYears                                |     6 |
           | maximumLengthMonths                               |    12 |
           | isServiceRequirementApplicable                    | true  |
           | serviceRequirementForLoan                         |     2 |
           | serviceRequirementForLoanNumber                   |       |

   #And Configuration has been made as per following
   #        | key                          | value |
   #        | loanPerPlanYear              |     1 |
   #        | firstRepaymentDateFallsAfter |     1 |
   #        #| maximumLengthYears           |     3 |
   #        #| maximumLengthMonths          |     0 |
   #        #| minimumLengthYears           |     1 |
   #        #| minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then the API response should contain the 10 following errors 
	| error_code | error_message                                                                                              |
	| PL290      | Required                                                                                                   |
	| PL281      | Required                                                                                                   | Scenario: Cure Period for employee termination with Fixed number of days as Null
	| PL868      | Required                                                                                                   | Scenario: To Save feesPaymentMethodsApplicable field when  EFT as empty
	| PL305      | First repayment date falls within (days) cannot be lesser than the First repayment date falls after (days) | Scenario: To Validate First repayment date falls after  and First repayment date falls within field  is same
	| PL326      | Required                                                                                                   | Scenario: Maximum amount as Other is Null
	| PL330      | Minimum Length should not be equal to or greater than the Maximum Length                                   | Scenario: Minimum Tenure year field as above 5 years
	| PL1012     | Exceeds loan regulation. Maximum length should not exceed 5 years                                          | Scenario: Maximum Tenure year field  as above 5 years
	| PL335      | Maximum length months should not exceed 11                                                                 | Scenario: Maximum Tenure month field as above  11 months
	| PL339      | Required                                                                                                   | Scenario: To Validate Refinancing allowed? field  as yes when number of refinancing(s) loanRefinancingFee field is empty
	| PL317      | Required                                                                                                   |Scenario: Service Requirement for Loan number is null with year

# UI Restricted           
#Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum as above  100

Scenario: Maximum amount as Other is zero
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | maximumAmount                         |     3 |
           | maximumAmountOtherValue               |     0 |
           | minimumLengthYears                    |     0 |
           | minimumLengthMonths                   |     0 |
           | isServiceRequirementApplicable        | true  |
           | serviceRequirementForLoan             |     2 |
           | serviceRequirementForLoanNumber       |     0 |
           | interestRateMinimum                   |     1 |
   And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
   #        | minimumLengthYears           |     1 |
   #        | minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then the API response should contain the 3 following errors 
	| error_code | error_message                                  |
	| PL326      | Required                                       | 
	| PL869      | Minimum Tenure should be greater than 0 months | Scenario: Minimum Tenure year and month field as 0
	| PL317      | Required                                       | Scenario: Service Requirement for Loan number is zero with year



#Scenario: Cure Period with Fixed number of days as 1
#Scenario: Cure Period for employee termination with Fixed number of days as 100
#Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is less than 3 digits with 2 decimal points
#Scenario: To Validate First repayment date falls after field  is below 30
#Scenario: To Save loanFeeAmount  field as length is  3 digits with 3 decimal points
#Scenario: loan Reamortization fee configured with 999
#Scenario: Number of loan Reamortization configured with 9
#Scenario: Maximum amount as Other is configured with maximum value
#Scenario: Maximum Tenure year and month field as 5 and 0 years 
#Scenario: Minimum Loan Repay amount as 999
#Scenario: Minimum Loan Repay amount as 999
#Scenario: feesPaymentMethodsApplicable is configured with EFT
#Scenario: To verify Refinancing allowed? as yes Number of refinancing(s) allowed field allow as above 9
#Scenario: Service Requirement for Loan is one year

Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum and  interestRateMaximum as 0 
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value  |
           | allowParticipantsToChooseInterestRate             | true   |
           | interestRateMinimum                               |      0 |
           | interestRateMinimum                               |      0 |
           | curePeriod                                        |      2 |
           | curePeriodFixedNumberOfDays                       |      1 |
           | curePeriodForEmployeeTermination                  |      2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |    100 |
           | feesPaymentMethodsApplicable                      | 2,     |
           | eftFees                                           |  99.99 |
           | refinancingAllowed                                | true   |
           | numberOfRefinancingAllowed                        |     10 |
           | firstRepaymentDateFallsAfter                      |     22 |
           | firstRepaymentDateFallsWithin                     |     33 |
           | loanFeeAmount                                     | 999.99 |
           | loanReAmortizationFee                             |    999 |
           | loanReamortizationAllowed                         | true   |
           | numberOfLoanReAmortizationsAllowed                |      9 |
           | maximumAmount                                     |      3 |
           | maximumAmountPercentageValue                      |  99999 |
           | minimumLengthYears                                |      5 |
           | minimumLengthMonths                               |      0 |
           | minimumLoanRepaymentAmount                        |    999 |
           | isServiceRequirementApplicable                    | true   |
           | serviceRequirementForLoan                         |      2 |
           | serviceRequirementForLoanNumber                   |      1 |
           And Configuration has been made as per following
           | key                 | value |
           | maximumLengthYears  |     5 |
           | maximumLengthMonths |     0 |
           #| minimumLengthYears           |     1 |
           #| minimumLengthMonths          |     0 |
           ##| loanPerPlanYear              |     1 |
           ##| firstRepaymentDateFallsAfter |     1 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
    Then API should respond with successful message


#Scenario: Minimum Loan Repay amount as 1000
Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMaximum is lesser than interestRateMinimum
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                   | value |
           | allowParticipantsToChooseInterestRate | true  |
           | interestRateMinimum                   |    80 |
           | interestRateMinimum                   |    30 |
           | minimumLengthYears                    |     1 |
           | minimumLengthMonths                   |     1 |
           | maximumLengthYears                    |     0 |
           | maximumLengthMonths                   |     0 |
           | minimumLoanRepaymentAmount            |  1000 |
   And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
   #        #| maximumLengthYears           |     3 |
   #        #| maximumLengthMonths          |     0 |
   #        #| minimumLengthYears           |     1 |
   #        #| minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then the API response should contain the 2 following errors 
	| error_code | error_message                                                 |
	| PL291      | Minimum Interest Rate should not exceed Maximum Interest Rate |
	| PL870      | Maximum Tenure should be greater than 0 months                |
#Scenario: Cure Period with Fixed number of days as 99
#Scenario: Cure Period for employee termination with Fixed number of days as 999
#Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length is less than 3 digits with 2 decimal points
#Scenario: Maximum amount as Other is configured with maximum value with decimal
#Scenario: Minimum Loan Repay amount as 9999
#Scenario: To Verify the numberOfSuspensionsPerLoanAllowed as length of 3 digits
#Scenario: feesPaymentMethodsApplicable is configured with check and EFT
#Scenario: Service Requirement for Loan number is 99 with year


Scenario: To Verify the allowParticipantsToChooseInterestRate field as yes when interestRateMinimum is lesser than interestRateMaximum
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                               | value    |
           | allowParticipantsToChooseInterestRate             | true     |
           | interestRateMinimum                               |       30 |
           | interestRateMaximum                               |       80 |
           | curePeriod                                        |        2 |
           | curePeriodFixedNumberOfDays                       |       99 |
           | curePeriodForEmployeeTermination                  |        2 |
           | curePeriodFixedNumberOfDaysForEmployeeTermination |      999 |
           | feesPaymentMethodsApplicable                      | 1,2,     |
           | checkFee                                          |    99.99 |
           | eftFees                                           |    99.99 |
           | loanReamortizationAllowed                         | true     |
           | loanReAmortizationFee                             |        0 |
           | maximumAmount                                     |        3 |
           | maximumAmountOtherValue                           | 99999.00 |
           | maximumAmountPercentageValue                      | 99999.00 |
           | minimumLoanRepaymentAmount                        |     9999 |
           | numberOfSuspensionsPerLoanAllowed                 |      100 |
           | isServiceRequirementApplicable                    | true     |
           | serviceRequirementForLoan                         |        2 |
           | serviceRequirementForLoanNumber                   |       99 |
           And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
           | maximumLengthYears           |     3 |
           | maximumLengthMonths          |     0 |
           | minimumLengthYears           |     1 |
           | minimumLengthMonths          |     0 |
          #| minimumAmount                                      |        2 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
    Then API should respond with successful message

#Scenario: To Save feesPaymentMethodsApplicable field when check fee is 0
#Scenario: To Validate First repayment date falls within field  is below  90
#Scenario: Maximum amount as Other is configured with maximum value with max decimal
#Scenario: Minimum Loan Repay amount as 10000
#Scenario: To Verify the numberOfSuspensionsPerLoanAllowed as 0

Scenario: Cure Period with Fixed number of days as 100
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                               | value    |
           | curePeriod                        |        2 |
           | curePeriodFixedNumberOfDays       |      100 |
           | feesPaymentMethodsApplicable      | 1,       |
           | checkFee                          |        0 |
           | refinancingAllowed                | true     |
           | firstRepaymentDateFallsWithin     |       33 |
           | maximumAmount                     |        3 |
           | maximumAmountPercentageValue      | 99999.99 |
           | minimumLoanRepaymentAmount        |    10000 |
           | numberOfSuspensionsPerLoanAllowed |        0 |
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

#Scenario: Minimum Loan Repay amount as 99999
#Scenario: To Save feesPaymentMethodsApplicable field when EFT  length is 0
#Scenario: EFT fee is configured with zero
Scenario: Cure Period with Fixed number of days as 999
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                          | value |
           | curePeriod                   |     2 |
           | curePeriodFixedNumberOfDays  |   999 |
           | feesPaymentMethodsApplicable | 2,    |
           | eftFees                      |     0 |
           | minimumLoanRepaymentAmount   | 99999 |
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

#Scenario: Minimum Loan Repay amount as 99999.00
Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT length is 0
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                          | value    |
           | feesPaymentMethodsApplicable | 1,2,     |
           | checkFee                     |        0 |
           | eftFees                      |        0 |
           | minimumLoanRepaymentAmount   | 99999.00 |
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

#Scenario: Maximum Length month is configured with 1

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
           | maximumLengthMonths           |       2 |
           | minimumLengthYears            |       1 |
           | minimumLengthMonths           |       0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message

#Scenario: Maximum Length month is configured with equal 11

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
           | maximumLengthYears            |       2 |
           | maximumLengthMonths           |      11 |
           | minimumLengthYears            |       1 |
           | minimumLengthMonths           |       0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message


#Scenario: Check fee is configured with 1
#Scenario: Check fee is configured with 99
#Scenario: Check fee is configured with 100
#Scenario: Check fee is configured with 999
#Scenario: Check fee is configured with 999.00
#Scenario: EFT fee is configured with 1
#Scenario: EFT fee is configured with 99
#Scenario: EFT fee is configured with 100
#Scenario: EFT fee is configured with 999
#Scenario: EFT fee is configured with 999.00

#Scenario: Overnight delivery fees  is configured with zero
#Scenario: Overnight delivery fees is configured with one
#Scenario: Overnight delivery fees is configured with 100
#Scenario: Overnight delivery fees is configured with 999
#Scenario: Overnight delivery fees is configured with 999.00
#
#Scenario: Loan fee amount   is configured with zero
#Scenario: Loan fee amount  is configured with one
#Scenario: Loan fee amount  is configured with 100
#Scenario: Loan fee amount  is configured with 999
#Scenario: Loan fee amount  is configured with 999.00
#Scenario: Processing Time For Loan is accepting One
#Scenario: Processing Time For Loan is accepting 99
#Scenario: Processing Time For Loan is accepting as Zero

#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan year length is 2 digits
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan month digit is 2 digits
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan month digit less than 2 digits
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan year digit less than 2 digits

#Scenario: Warning period between loans payoffs and loan request with 1 
#Scenario: Warning period between loans payoffs and loan request with 99 
#Scenario: Warning period between loans payoffs and loan request with 100 
#Scenario: Warning period between loans payoffs and loan request with 999 
#Scenario: Warning period between loans payoffs and loan request with deciaml values

#Restricted in UI
#Scenario: Warning period between loans payoffs and loan request with 1000 
#Scenario: Warning period between loans payoffs and loan request with 9999 

Scenario: To Save feesPaymentMethodsApplicable field to select both check fee and  EFT when eft length is  3 digits with 3 decimal points
 Given Model is selected for the endpoint "/api/Loan/SaveLoan"

  When Configuration has been made as per following
           | key                                           | value                                           |
           | feesPaymentMethodsApplicable                  |                                             1,2 |
           | checkFee                                      | <checkFee>                                      |
           | eftFees                                       | <eftFees>                                       |
           | overnightDeliveryFees                         | <overnightDeliveryFees>                         |
           | loanFeeAmount                                 | <loanFeeAmount>                                 |
           | processingTimeForLoan                         | <processingTimeForLoan>                         |
           | loanPerPlanYear                               |                                               1 |
           | firstRepaymentDateFallsAfter                  |                                               1 |
           | firstRepaymentDateFallsWithin                 |                                               2 |
           | maximumLengthYears                            |                                               3 |
           | maximumLengthMonths                           |                                               0 |
           | minimumLengthYears                            |                                               1 |
           | minimumLengthMonths                           |                                               0 |
           | isServiceRequirementApplicable                | true                                            |
           | serviceRequirementForLoan                     | <serviceRequirementForLoan>                     |
           | serviceRequirementForLoanNumber               | <serviceRequirementForLoanNumber>               |
           | allowMultipleActiveLoans                      | false                                           |
           | waitingPeriodBetweenLoansPayoffAndLoanRequest | <waitingPeriodBetweenLoansPayoffAndLoanRequest> |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
Then API should respond with successful message
Examples: 
| checkFee | eftFees | overnightDeliveryFees | loanFeeAmount | processingTimeForLoan | serviceRequirementForLoan | serviceRequirementForLoanNumber | waitingPeriodBetweenLoansPayoffAndLoanRequest |
|      999 | 999.929 |                     0 |             0 |                     1 |                         2 |                              99 |                                             1 |
|        1 |       1 |                     1 |             1 |                    99 |                         1 |                              99 |                                            99 |
|       99 |      99 |                   100 |           100 |                     0 |                         1 |                               9 |                                           100 |
|      100 |     100 |                   999 |           999 |                     1 |                         2 |                               9 |                                           999 |
|      999 |     999 |                999.00 |        999.00 |                     1 |                         2 |                               9 |                                           999 |
|   999.00 |  999.00 |                     1 |             1 |                     1 |                         2 |                               9 |                                           999 |





#Scenario: Maximum Length years is configured with above 5 Years

Scenario: To Validate First repayment date falls after field value is greater than First repayment date falls within field
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                  | value |
           | allowParticipantsToChooseLoanFeeType | true  |
           | minimumLengthYears                   |     5 |
           | minimumLengthMonths                  |     0 |
           | maximumLengthYears                   |     6 |
           | maximumLengthMonths                  |     0 |
           | feesPaymentMethodsApplicable         |       |
           | overnightDeliveryFees                | 99.99 |
           | isServiceRequirementApplicable       | true  |
           | serviceRequirementForLoan            |     1 |
           | serviceRequirementForLoanNumber      |       |
           | firstRepaymentDateFallsAfter         |    30 |
           | firstRepaymentDateFallsWithin        |    22 |
   #And Configuration has been made as per following
   #        | key                          | value |
   #        | loanPerPlanYear              |     1 |
   #        | firstRepaymentDateFallsAfter |     1 |
   #        #| maximumLengthYears           |     3 |
   #        #| maximumLengthMonths          |     0 |
   #        #| minimumLengthYears           |     1 |
   #        #| minimumLengthMonths          |     0 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then the API response should contain the 4 following errors 
	| error_code | error_message                                                                                              |
	| PL305      | First repayment date falls within (days) cannot be lesser than the First repayment date falls after (days) |
	| PL1012     | Exceeds loan regulation. Maximum length should not exceed 5 years                                          | Scenario: Minimum Tenure year and month field as 5 and 0 years
	| PL865      | Required                                                                                                   | Scenario: feesPaymentMethodsApplicable is configured with null
	| PL317      | Required                                                                                                   |Scenario: Service Requirement for Loan number is null with month

#Scenario: Maximum Length month is configured with null
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan is empty

Scenario: Maximum Length years is configured with zero
  Given Model is selected for the endpoint "/api/Loan/SaveLoan"
   When Configuration has been made as per following
           | key                                  | value |
           | allowParticipantsToChooseLoanFeeType | true  |
           | minimumLengthYears                   |     5 |
           | minimumLengthMonths                  |     0 |
           | maximumLengthYears                   |     6 |
           | maximumLengthMonths                  |     0 |
           | minimumLoanRepaymentAmount           |       |
           | numberOfLoansAllowed                 |       |
           | feesPaymentMethodsApplicable         |   1,2 |
           | loanFeeAmount                        |       |
           | processingTimeForLoan                |       |
           | overnightDeliveryFees                | 99.99 |
           | isServiceRequirementApplicable       | true  |
           | serviceRequirementForLoan            |     1 |
           | serviceRequirementForLoanNumber      |     0 |
           | sourceHierarchies                    |       |
   And Configuration has been made as per following
           | key                          | value |
           | loanPerPlanYear              |     1 |
           | firstRepaymentDateFallsAfter |     1 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveLoan"
  Then the API response should contain the 7 following errors 
	| error_code | error_message                                                            |
	| PL330      | Minimum Length should not be equal to or greater than the Maximum Length |
	| PL509      | Required                                                                 | Scenario: Minimum Loan Repay amount as Null
	| PL322      | Required                                                                 | Scenario: Loan type leaving as null
	| PL337      | Required                                                                 | Scenario: Loan fee amount  is configured with null
	| PL301      | Required                                                                 | Scenario: Processing Time For Loan is accepting as Null
	| PL317      | Required                                                                 | Scenario: Service Requirement for Loan number is zero with month
	| PL292       | Required                                                                 | Scenario: To Validate Sources available for determining loan amount field as null #validation changed





#UI Changes
#Scenario: ACH fee is configured with zero
#Scenario: ACH fee is configured with one
#Scenario: ACH fee is configured with 100
#Scenario: ACH fee is configured with 999
#Scenario: ACH fee is configured with 999.00
#Scenario: ACH fee is configured with null

#UI restricted
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan field a alphabets
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan field as alphanumeric
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan field as special characters
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan month digit more than 2 digits
#Scenario: To Verify the isServiceRequirementApplicable field as yes and Service requirement for loan month year is 3 digits
