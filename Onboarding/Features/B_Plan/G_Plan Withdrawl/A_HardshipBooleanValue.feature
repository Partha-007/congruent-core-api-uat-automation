Feature: A_HardshipBooleanValue
[BeforeTestRun]

#Scenario: Hardship Save configuration
#Scenario: Hardship paymentMethod field configure with check
#Scenario: Hardship paymentMethod field configure with eft
Scenario: Hardship restrictNumberOfHardshipsInDefinedPeriod field accepts true
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                               | value               |
           | restrictNumberOfHardshipsInDefinedPeriod          | true                |
           | lengthOfSuspensionApplicable                      | true                | Scenario: Hardship lengthOfSuspensionApplicable field accepts true
           | requiresLoanRequestPriorToHardshipRequest         | true                | Scenario: Hardship requiresLoanRequestPriorToHardshipRequest field accepts true
           | requiresInServiceWithdrawalPriorToHardshipRequest | true                | Scenario: Hardship requiresInServiceWithdrawalPriorToHardshipRequest field accepts true
           | processLesserAmountIfMaximumIsNotAvailable        | true                | Scenario: Hardship processLesserAmountIfMaximumIsNotAvailable field accepts true
           | spouseConsentRequired                             | true                | Scenario: Hardship spouseConsentRequired field accepts true
           | sponsorApprovalRequired                           | true                | Scenario: Hardship sponsorApprovalRequired field accepts true
           | availableToBeneficiaries                          | true                | Scenario: Hardship availableToBeneficiaries field accepts true
           | availableToAlternatePayees                        | true                | Scenario: Hardship availableToAlternatePayees field accepts true
           | allowOptingOutOfFederlWithholdingTax              | true                | Scenario: Hardship allowOptingOutOfFederlWithholdingTax field accepts true
           | allowOptingOutOfStateWithholdingTax               | true                | Scenario: Hardship allowOptingOutOfStateWithholdingTax field accepts true
           | allowChangingOfFederalWithholdingTax              | true                | Scenario: Hardship allowChangingOfFederalWithholdingTax field accepts true
           | allowChangingOfStateWithholdingTax                | true                | Scenario: Hardship allowChangingOfStateWithholdingTax field accepts true
           | withDrawalType                                    |                   2 |
           | distributionAllocationMethod                      | 1,                  |
           | paymentMethod                                     | 1,                  |
           | suspensionPeriodYears                             |                   1 | Scenario: HardshipLengthofserviceYears configured with 1
           | suspensionPeriodMonths                            |                   1 |
           | minimumWithDrawalLimitAmount                      |              550.00 | Scenario: Hardship minimum limit configured with value as decimal
           | maximumWithDrawalLimitAmount                      |              560.00 | Scenario: Hardship maximum limit configured with value as decimal
           | hardshipReason                                    |                   1 | Scenario: Hardship Reason Certain Medical Expenses
           | hardshipWithdrawalFee                             |           999999999 | Scenario: Hardship hardshipWithdrawalFee field accepts 9 digits
           | overnightExpressDeliveryFee                       |          9999999999 | Scenario: Hardship overnightExpressDeliveryFee field accepts 10 digits
           | earlyWithdrawalPenalty                            |                 100 | Scenario: Hardship Early Penalty configured with 100

   And the property "withdrawalDescription" is configured with "alphabets" with 10 characters          
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
  Then API should respond with successful message

Scenario: Hardship restrictNumberOfHardshipsInDefinedPeriod field accepts false
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                               | value        |
           | restrictNumberOfHardshipsInDefinedPeriod          | false        |
           | lengthOfSuspensionApplicable                      | false        | Scenario: Hardship lengthOfSuspensionApplicable field accepts false
           | requiresLoanRequestPriorToHardshipRequest         | false        | Scenario: Hardship requiresLoanRequestPriorToHardshipRequest field accepts false
           | requiresInServiceWithdrawalPriorToHardshipRequest | false        | Scenario: Hardship requiresInServiceWithdrawalPriorToHardshipRequest field accepts false
           | processLesserAmountIfMaximumIsNotAvailable        | false        | Scenario: Hardship processLesserAmountIfMaximumIsNotAvailable field accepts false
           | spouseConsentRequired                             | false        | Scenario: Hardship spouseConsentRequired field accepts false
           | sponsorApprovalRequired                           | false        | Scenario: Hardship sponsorApprovalRequired field accepts false
           | availableToBeneficiaries                          | false        | Scenario: Hardship availableToBeneficiaries field accepts false
           | availableToAlternatePayees                        | false        | Scenario: Hardship availableToAlternatePayees field accepts false
           | allowOptingOutOfFederlWithholdingTax              | false        | Scenario: Hardship allowOptingOutOfFederlWithholdingTax field accepts false
           | allowOptingOutOfStateWithholdingTax               | false        | Scenario: Hardship allowOptingOutOfStateWithholdingTax field accepts false
           | allowChangingOfFederalWithholdingTax              | false        | Scenario: Hardship allowChangingOfFederalWithholdingTax field accepts false
           | allowChangingOfStateWithholdingTax                | false        | Scenario: Hardship allowChangingOfStateWithholdingTax field accepts false
           | withDrawalType                                    |            2 |
           | distributionAllocationMethod                      | 1,           |
           | paymentMethod                                     | 1,           |
           | suspensionPeriodYears                             |           99 | Scenario: HardshipLengthofserviceYears configured with 99
           | suspensionPeriodMonths                            |            1 |
           | hardshipReason                                    |            1 |
           | hardshipWithdrawalFee                             | 999999999.00 | Scenario: Hardship hardshipWithdrawalFee field accepts 9 digits with decimal
           | overnightExpressDeliveryFee                       |        99999 | Scenario: Hardship overnightExpressDeliveryFee field accepts 5 digits
           | earlyWithdrawalPenalty                            |            1 | Scenario: Hardship Early Penalty configured with 1
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
  Then API should respond with successful message


  
Scenario: Hardship Early Penalty configured with Null
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                          | value               |
           | withDrawalType               |                   2 |
           | hardshipReason               |                     |
           | withdrawalDescription        | random 10 alphabets |
           | earlyWithdrawalPenalty       |                     |
           | overnightExpressDeliveryFee  |                     |
           | hardshipWithdrawalFee        |                     |
           | suspensionPeriodYears        |                     |
           | suspensionPeriodMonths       |                     |
           | minimumWithDrawalLimitAmount |                     |
           | maximumWithDrawalLimitAmount |                     |
           | distributionAllocationMethod | 1,                  |
           | paymentMethod                |                     |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
  Then the API response should contain the 9 following errors 
	| error_code |   error_message |
    | PL1128      |   Required      |
    | PL350      |   Required      |Scenario: Hardship overnightExpressDeliveryFee field accepts null
    | PL444      |   Required      |Scenario: Hardship hardshipWithdrawalFee field accepts zero
    | PL428      |   Required      |Scenario: HardshipLengthofserviceYears configured with null
    | PL429      |   Required      |Scenario: HardshipLengthofserviceMonths configured with Null
    | PL343      |   Required      |Scenario: Hardship minimum limit configured with null
    | PL704      |   Required      |Scenario: Hardship maximum limit configured with null
    | PL1007      |   Required      |Scenario: Hardship paymentMethod field configure with null
    | PL424      |   Required      |Scenario: Hardship Reason with Null







Scenario: Hardship Early Penalty configured with 0
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                          | value |
           | withDrawalType               |     2 |
           | hardshipReason               |     1 |
           | earlyWithdrawalPenalty       |     0 |
           | overnightExpressDeliveryFee       |     0 |
           | hardshipWithdrawalFee       |     0 |
           | distributionAllocationMethod | 1,    |
           | paymentMethod                | 1,    |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
  Then the API response should contain the 3 following errors 
	| error_code | error_message |
	| PL1128     | Required      |
	| PL350      | Required      | Scenario: Hardship overnightExpressDeliveryFee field accepts zero
	| PL444      | Required      | Scenario: Hardship hardshipWithdrawalFee field accepts null digit with decimal


Scenario: Hardship hardshipWithdrawalFee field accepts 1 digit
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                          | value               |
           | withDrawalType               |                   2 |
           | hardshipReason               |                   2 | Scenario: Hardship Reason Cost Related to expenses
           | withdrawalDescription        | random 10 alphabets |
           | hardshipWithdrawalFee        |                   9 |
           | suspensionPeriodMonths       |                   1 | Scenario: HardshipLengthofserviceMonths configured with 1
           | distributionAllocationMethod | 1,                  |
           | paymentMethod                | 1,                  |

           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message


Scenario: Hardship hardshipWithdrawalFee field accepts 1 digit with decimal
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                          | value               |
           | withDrawalType               |                   2 |
           | hardshipReason               |                   3 | Scenario: Hardship Reason College tution and Education fee
           | withdrawalDescription        | random 10 alphabets | 
           | hardshipWithdrawalFee        |                 9.0 |
           | suspensionPeriodMonths       |                  99 | Scenario: HardshipLengthofserviceMonths configured with 99
           | distributionAllocationMethod | 1,                  |
           | eftFee                       |                   1 | Scenario: Hardship paymentMethod field configure with checkandEft
           | paymentMethod                |                 1,2 |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: Hardship Reason Expenses required to avoid a foreclosure
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                          | value               |
           | withDrawalType               |                   2 |
           | hardshipReason               | <reason>            |
           | withdrawalDescription        | random 10 alphabets |
           | distributionAllocationMethod | 1,                  |
           | paymentMethod                | 1,                  |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Examples: 
| reason |
|      4 |
|      5 |Scenario: Hardship Reason Burial or Funeral cost
|      6 |Scenario: Hardship Reason Home Repair after a natural disaster
|      7 |Scenario: Hardship Reason Home Repair after a Covid19
|      8 |Scenario: Hardship Reason Home Repair after a Other


#InserviceWithdrawal


#Scenario: Inservice distributionAllocationMethod field configure with ProrataofChoice
#Scenario: Inservice paymentMethod field configure with check
#Scenario: Inservice paymentMethod field configure with eft

Scenario: Inservice ageLimitApplicable configured with true
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                        | value               |
           | withDrawalType                             |                   1 |
           | allowChangingOfFederalWithholdingTax                             |     true|Scenario: Inservice allowChangingOfFederalWithholdingTax field accepts true
           | allowChangingOfStateWithholdingTax                             |     true|Scenario: Inservice allowChangingOfStateWithholdingTax field accepts true
           | allowOptingOutOfStateWithholdingTax        | true                | Scenario: Inservice allowOptingOutOfStateWithholdingTax field accepts true
           | allowOptingOutOfFederlWithholdingTax       | true                | Scenario: Inservice allowOptingOutOfFederlWithholdingTax field accepts true
           | availableToAlternatePayees                 | true                | Scenario: Inservice availableToAlternatePayees field accepts true
           | sponsorApprovalRequired                    | true                | Scenario: Inservice sponsorApprovalRequired field accepts true
           | availableToBeneficiaries                   | true                | Scenario: Inservice availableToBeneficiaries field accepts true
           | spouseConsentRequired                      | true                | Scenario: Inservice spouseConsentRequired field accepts true
           | processLesserAmountIfMaximumIsNotAvailable | true                | Scenario: Inservice processLesserAmountIfMaximumIsNotAvailable field accepts true
           | minimumWithDrawalLimitAmount               |              550.00 | Scenario: Inservice minimum limit configured with value as decimal
           | maximumWithDrawalLimitAmount               |              560.00 | Scenario: Inservice maximum limit configured with value as decimal
           | withdrawalLimitPerPeriod                   |                   1 | Scenario: Inservice limitPerPeriod configured with Annually
           | withdrawalOneTimeOriginateFee              |          9999999999 | Scenario: Inservice sfsWithdrawalOneTimeOriginateFee field accepts 10 digits
           | withdrawalDescription                      | random 10 alphabets | Scenario: Inservice description field accepts alphabets
           | ageLimitApplicable                         | true                |
           | overnightExpressDeliveryFee                |          9999999999 | Scenario: Inservice overnightExpressDeliveryFee field accepts 10 digits
           | distributionAllocationMethod               | 1,                  |
           | paymentMethod                              | 1,                  |
           | months                                     |                   1 |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message


Scenario: Inservice distributionAllocationMethod field configure with ProrataofChoice&AllowmetoChoose
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                           | value              |
           | withDrawalType                |                  1 |
           | withdrawalLimitPerPeriod      |                  2 | Scenario: Inservice limitPerPeriod configured with Quarterly
           | withdrawalOneTimeOriginateFee |              99999 | Scenario: Inservice sfsWithdrawalOneTimeOriginateFee field accepts 5 digits
           | overnightExpressDeliveryFee   |              99999 | Scenario: Inservice overnightExpressDeliveryFee field accepts 5 digits
           | withdrawalDescription         | random 10 numerics | Scenario: Inservice description field accepts numerics
           | ageLimitApplicable            | true               |
           | distributionAllocationMethod  |                1,2 |
           | paymentMethod                 | 1,                 |
           | months                        |                  1 |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: Inservice ageLimitApplicable configured with false
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                        | value         |
           | withDrawalType                             |             1 |
           | allowOptingOutOfFederlWithholdingTax       | false         | Scenario: Inservice allowOptingOutOfFederlWithholdingTax field accepts false
           | withdrawalLimitPerPeriod                   |             3 | Scenario: Inservice limitPerPeriod configured with SemiAnnually
           | numberOfWithdrawalAllowed                  |            12 | Scenario: Inservice number of withdrawals allowed configured with twelve
           | withdrawalOneTimeOriginateFee              |         99999 | Scenario: Inservice sfsWithdrawalOneTimeOriginateFee field accepts 5 digits
           | ageLimitApplicable                         | false         |
           | allowChangingOfStateWithholdingTax                         | false         |Scenario: Inservice allowChangingOfStateWithholdingTax field accepts false
           | allowChangingOfFederalWithholdingTax                         | false         |Scenario: Inservice allowChangingOfFederalWithholdingTax field accepts false
           | allowOptingOutOfStateWithholdingTax                         | false         |Scenario: Inservice allowOptingOutOfStateWithholdingTax field accepts false
           | availableToAlternatePayees                 | false         | Scenario: Inservice availableToAlternatePayees field accepts false
           | availableToBeneficiaries                   | false         | Scenario: Inservice availableToBeneficiaries field accepts false
           | sponsorApprovalRequired                    | false         | Scenario: Inservice sponsorApprovalRequired field accepts false
           | spouseConsentRequired                      | false         | Scenario: Inservice spouseConsentRequired field accepts false
           | processLesserAmountIfMaximumIsNotAvailable | false         | Scenario: Inservice processLesserAmountIfMaximumIsNotAvailable field accepts false
           | withdrawalDescription                      | <description> |
           | distributionAllocationMethod               | 2,            | Scenario: Inservice distributionAllocationMethod field configure with AllowmetoChoose
           | paymentMethod                              | 1,            |
           | years                                      |            99 |
           | months                                     |             0 | Scenario: Inservice ageLimitApplicable configured with equal 99 years
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Examples: 
| description                                  |
| random 10 alphaNumerics                      | Scenario: Inservice description field accepts alphanumerics
| random 10 SpecialCharacters                  | Scenario: Inservice description field accepts specialCharacters
| random 10 AlphaNumericWithSpecialCharacters  | Scenario: Inservice description field accepts alphanumericsspecialcharacters
| random 149 AlphaNumericWithSpecialCharacters | Scenario: Inservice description field accepts below 150
| random 150 AlphaNumericWithSpecialCharacters | Scenario: Inservice description field accepts equal 150

Scenario: Inservice ageLimitApplicable configured with years as Null
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                           | value                                        |
           | withDrawalType                |                                            1 |
           | withdrawalLimitPerPeriod      |                                              |
           | numberOfWithdrawalAllowed     |                                           13 |
           | minimumWithDrawalLimitAmount  |                                              |
           | maximumWithDrawalLimitAmount  |                                              |
           | overnightExpressDeliveryFee   |                                              |
           | withdrawalOneTimeOriginateFee |                                              |
           | withdrawalDescription         | random 151 AlphaNumericWithSpecialCharacters |
           | ageLimitApplicable            | true                                         |
           | years                         |                                              |
           | months                        |                                              |
           | distributionAllocationMethod  | 1,                                           |
           | paymentMethod                 | 1,                                           |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 9 following errors 
	| error_code | error_message                                           |
	| PL445      | Required                                                |
	| PL446      | Required                                                | Scenario: Inservice ageLimitApplicable configured with months as Null
	| PL434      | Withdrawal Description should not exceed 150 characters | Scenario: Inservice description field accepts above 150
	| PL350      | Required                                                | Scenario: Inservice overnightExpressDeliveryFee field accepts null
	| PL266      | Required                                                | Scenario: Inservice sfsWithdrawalOneTimeOriginateFee field accepts null
	| PL257      | Required                                                | Scenario: Inservice limitPerPeriod configured with null
	| PL346      | Required                                                | Number of Withdrawals allowed should not be more than 12"
	| PL343      | Required                                                | Scenario: Inservice minimum limit configured with null
	| PL704      | Required                                                |  Scenario: Inservice maximum limit configured with null





Scenario: Inservice ageLimitApplicable configured with below 18 years
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                           | value |
           | withDrawalType                |     1 |
           | withdrawalLimitPerPeriod      |     3 |
           | numberOfWithdrawalAllowed     |     0 |
           | withdrawalOneTimeOriginateFee |     0 |
           | ageLimitApplicable            | true  |
           | years                         |    17 |
           | months                        |    10 |
           | distributionAllocationMethod  |       | Scenario: Inservice distributionAllocationMethod field configure with null
           | paymentMethod                 | 1,    |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                           |
	| PL711      | Age should be between limit of 18 to 99 |
	| PL708      | Required                                |
	| PL266      | Required                                |Scenario: Inservice sfsWithdrawalOneTimeOriginateFee field accepts zero
	| PL258      | Required                                |Scenario: Inservice number of withdrawals allowed configured with zero



Scenario: Inservice ageLimitApplicable configured with above 99 years
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                           | value |
           | withDrawalType                |     1 |
           | withdrawalLimitPerPeriod                |     3 |
           | numberOfWithdrawalAllowed                |      |
           | overnightExpressDeliveryFee   |     0 | 
           | ageLimitApplicable            | true  |
           | years                         |    99 |
           | months                        |     5 |
           | distributionAllocationMethod  | 1,    |
           | paymentMethod                 |     |
           | withdrawalOneTimeOriginateFee |    10 |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                           |
	| PL711      | Age should be between limit of 18 to 99 |
	| PL350      | Required                                | Scenario: Inservice overnightExpressDeliveryFee field accepts zero
	| PL258      | Required                                | Scenario: Inservice number of withdrawals allowed configured with null
	| PL1007     | Required                                | Scenario: Inservice paymentMethod field configure with null


 

Scenario: Inservice limitPerPeriod configured with Notapplicable
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                           | value               |
           | withDrawalType                |                   1 |
           | withdrawalDescription         | random 10 alphabets |
           | withdrawalLimitPerPeriod      |                   4 |
           | withdrawalOneTimeOriginateFee |               99999 |
           | withdrawalDescription         | random 10 alphabets |
           | ageLimitApplicable            | true                |
           | overnightExpressDeliveryFee   |          9999999999 |
           | distributionAllocationMethod  | 1,                  |
           | paymentMethod                 |                 1,2 |
           | months                        |                   1 |
           | eftFee                        |                   1 | Scenario: Inservice paymentMethod field configure with checkandEft

           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message


Scenario: Distribution save without Withdrawal type
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                           | value               |
           | withDrawalType                |                     |
           | withdrawalDescription         | random 10 alphabets |
           | withdrawalLimitPerPeriod      |                   4 |
           | withdrawalOneTimeOriginateFee |               99999 |
           | withdrawalDescription         | random 10 alphabets |
           | ageLimitApplicable            | true                |
           | overnightExpressDeliveryFee   |          9999999999 |
           | distributionAllocationMethod  | 1,                  |
           | paymentMethod                 |                 1, |
            And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL423      | Required      |

#PermissableWithdrawal

#Scenario: Permissible Withdrawal Save configuration
Scenario: Permissible spouseConsentRequired field accepts true
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                  | value               |
           | withDrawalType                       |                   5 |
           | maximumWithDrawalLimitAmount         |                   0 | Scenario: Permissible maximum limit configured with zero
           | withdrawalDescription                | random 10 alphabets | Scenario: Permissible description field accepts alphabets
           | spouseConsentRequired                | true                |
           | allowChangingOfStateWithholdingTax   | true                | Scenario: Permissible allowChangingOfStateWithholdingTax field accepts true
           | allowChangingOfFederalWithholdingTax | true                | Scenario: Permissible allowChangingOfFederalWithholdingTax field accepts true
           | allowOptingOutOfStateWithholdingTax  | true                | Scenario: Permissible allowOptingOutOfStateWithholdingTax field accepts true
           | allowOptingOutOfFederlWithholdingTax | true                | Scenario: Permissible allowOptingOutOfFederlWithholdingTax field accepts true
           | availableToAlternatePayees           | true                | Scenario: Permissible availableToAlternatePayees field accepts true
           | availableToBeneficiaries             | true                | Scenario: Permissible availableToBeneficiaries field accepts true
           | sponsorApprovalRequired              | true                | Scenario: Permissible sponsorApprovalRequired field accepts true
           | paymentMethod                        | 1,                  |
           | calculationMethods                   | 1,                  |
           | distributionAllocationMethod         | 1,                  |
                    
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: Permissible spouseConsentRequired field accepts false
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                  | value              |
           | withDrawalType                       |                  5 |
           | maximumWithDrawalLimitAmount         |                    | Scenario: Permissible maximum limit configured with null
           | withdrawalDescription                | random 10 numerics | Scenario: Permissible description field accepts numerics
           | spouseConsentRequired                | false              |
           | allowChangingOfStateWithholdingTax   | false              | Scenario: Permissible allowChangingOfStateWithholdingTax field accepts false
           | allowChangingOfFederalWithholdingTax | false              | Scenario: Permissible allowChangingOfFederalWithholdingTax field accepts false
           | allowOptingOutOfStateWithholdingTax  | false              | Scenario: Permissible allowOptingOutOfStateWithholdingTax field accepts false
           | allowOptingOutOfFederlWithholdingTax | false              | Scenario: Permissible allowOptingOutOfFederlWithholdingTax field accepts false
           | availableToAlternatePayees           | false              | Scenario: Permissible availableToAlternatePayees field accepts false
           | availableToBeneficiaries             | false              | Scenario: Permissible availableToBeneficiaries field accepts false
           | sponsorApprovalRequired              | false              | Scenario: Permissible sponsorApprovalRequired field accepts false
           | paymentMethod                        | 1,                 |
           | calculationMethods                   | 1,                 |
           | distributionAllocationMethod         | 1,                 |
                    
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: Permissible description field accepts alphanumerics
 When Configuration has been made as per following
         | key                          | value         |
         | withDrawalType               |             5 |
         | maximumWithDrawalLimitAmount |        560.00 | Scenario: Permissible maximum limit configured with value as decimal
         | withdrawalDescription        | <description> |
         | periodicPaymentApplicable    | true          |
         | paymentMethod                | 1,            |
         | distributionAllocationMethod | 1,            |
         | calculationMethods           | 1,            |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message
Examples: 
| description                                  |
| random 10 alphaNumerics                      |
| random 10 specialCharacters                  | Scenario: Permissible description field accepts specialCharacters
| random 10 AlphaNumericWithSpecialCharacters  | Scenario: Permissible description field accepts alphanumericsspecialcharacters
| random 149 AlphaNumericWithSpecialCharacters | Scenario: Permissible description field accepts below 150
| random 150 AlphaNumericWithSpecialCharacters | Scenario: Permissible description field accepts equal 150



Scenario: Permissible description field accepts above 150
 When Configuration has been made as per following
         | key                          | value         |
         | withDrawalType               |             5 |
         | withdrawalDescription        | random 151 AlphaNumericWithSpecialCharacters|
         | paymentMethod                | 1,            |
         | distributionAllocationMethod | 1,            |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                           |
	| PL434      | Withdrawal Description should not exceed 150 characters |

#RMD

#Scenario: RMD distributionAllocationMethod field configure with ProrataofChoice
#Scenario: RMD paymentMethod field configure with check
#Scenario: RMD paymentMethod field configure with eft
#Scenario: RMD Save configuration

Scenario: RMD allowOptingOutOfFederlWithholdingTax field accepts true
 When Configuration has been made as per following
         | key                                  | value               |
         | withDrawalType                       |                   3 |
         | allowOptingOutOfFederlWithholdingTax | true                |
         | withdrawalOneTimeOriginateFee        |          9999999999 | Scenario: RMD sfsWithdrawalOneTimeOriginateFee field accepts 10 digits
         | overnightExpressDeliveryFee          |          9999999999 | Scenario: RMD overnightExpressDeliveryFee field accepts 10 digits
         | withdrawalDescription                | random 10 alphabets | Scenario: RMD description field accepts alphabets
         | sponsorApprovalRequired              | true                | Scenario: RMD sponsorApprovalRequired field accepts true
         | allowChangingOfStateWithholdingTax   | true                | Scenario: RMD allowChangingOfStateWithholdingTax field accepts true
         | allowChangingOfFederalWithholdingTax | true                | Scenario: RMD allowChangingOfFederalWithholdingTax field accepts true
         | allowOptingOutOfStateWithholdingTax  | true                | Scenario: RMD allowOptingOutOfStateWithholdingTax field accepts true
         | paymentMethod                        | 1,                  |
         | distributionAllocationMethod         | 1,                  |
         | calculationMethods                   | 1,                  |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: RMD allowOptingOutOfFederlWithholdingTax field accepts false
 When Configuration has been made as per following
         | key                                  | value              |
         | withDrawalType                       |                  3 |
         | withdrawalOneTimeOriginateFee        |              99999 | Scenario: RMD sfsWithdrawalOneTimeOriginateFee field accepts 5 digits
         | overnightExpressDeliveryFee          |              99999 | Scenario: RMD overnightExpressDeliveryFee field accepts 5 digits
         | allowOptingOutOfFederlWithholdingTax | false              |
         | withdrawalDescription                | random 10 numerics | Scenario: RMD description field accepts numerics
         | sponsorApprovalRequired              | false              | Scenario: RMD sponsorApprovalRequired field accepts false
         | allowChangingOfStateWithholdingTax   | false              | Scenario: RMD allowChangingOfStateWithholdingTax field accepts false
         | allowChangingOfFederalWithholdingTax | false              | Scenario: RMD allowChangingOfFederalWithholdingTax field accepts false
         | allowOptingOutOfStateWithholdingTax  | false              | Scenario: RMD allowOptingOutOfStateWithholdingTax field accepts false
         | paymentMethod                        | 1,                 |
         | distributionAllocationMethod         | 1,                 |
         | calculationMethods                   | 1,                 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: RMD description field accepts alphanumerics
 When Configuration has been made as per following
         | key                          | value         |
         | withDrawalType               |             3 |
         | withdrawalDescription        | <description> |
         | paymentMethod                | 1,            |
         | calculationMethods           | 1,            |
         | distributionAllocationMethod | 2,            |Scenario: RMD distributionAllocationMethod field configure with AllowmetoChoose

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message
Examples:
| description             |
| random 10 alphaNumerics |
| random 149 AlphaNumericWithSpecialCharacters |Scenario: RMD description field accepts below 150
| random 10 AlphaNumericWithSpecialCharacters |Scenario: RMD description field accepts alphanumericsspecialcharacters
| random 10 specialCharacters |Scenario: RMD description field accepts specialCharacters

Scenario: RMD description field accepts above 150
 When Configuration has been made as per following
         | key                           | value                                        |
         | withDrawalType                |                                            3 |
         | overnightExpressDeliveryFee   |                                              |
         | withdrawalOneTimeOriginateFee |                                              |
         | withdrawalDescription         | random 151 AlphaNumericWithSpecialCharacters |
         | paymentMethod                 | 1,                                           |
         | calculationMethods            | 1,                                           |
         | distributionAllocationMethod  |                                              |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message                                           |
	| PL434      | Withdrawal Description should not exceed 150 characters |
	| PL708      | Required                                                | Scenario: RMD distributionAllocationMethod field configure with null
	| PL350      | Required                                                | Scenario: RMD overnightExpressDeliveryFee field accepts null
	| PL266      | Required                                                | Scenario: RMD sfsWithdrawalOneTimeOriginateFee field accepts null

Scenario: RMD distributionAllocationMethod field configure with ProrataofChoice&AllowmetoChoose
 When Configuration has been made as per following
         | key                          | value                                       |
         | withDrawalType               |                                           3 |
         | withdrawalDescription        | random 10 AlphaNumericWithSpecialCharacters | Scenario: RMD description field accepts equal 150
         | paymentMethod                |                                         1,2 |
         | eftFee                       |                                           1 | Scenario: RMD paymentMethod field configure with checkandEft
         | calculationMethods           | 1,                                          |
         | distributionAllocationMethod | 1,2,                                        |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: RMD overnightExpressDeliveryFee field accepts zero
 When Configuration has been made as per following
         | key                           | value |
         | withDrawalType                |     3 |
         | overnightExpressDeliveryFee   |     0 |
         | withdrawalOneTimeOriginateFee |     0 | Scenario: RMD sfsWithdrawalOneTimeOriginateFee field accepts zero
         | paymentMethod                 |       |
         | calculationMethods            | 1,    |
         | distributionAllocationMethod  |       |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 3 following errors 
	| error_code | error_message |
	| PL350      | Required      |
	| PL266      | Required      |
	| PL1007     | Required      |Scenario: RMD paymentMethod field configure with null

#SFS

#Scenario: SFS Calculation save configuration
#Scenario: SFS Calculation is configured with SpecificTenure
#Scenario: SFS distributionAllocationMethod field configure with ProrataofChoice
#Scenario: SFS paymentMethod field configure with check
#Scenario: SFS paymentMethod field configure with eft
#Scenario: SFS Save configuration




Scenario: SFS processLesserAmountIfMaximumIsNotAvailable field accepts true
When Configuration has been made as per following
         | key                                        | value               |
         | withDrawalType                             |                   4 |
         | periodicPaymentApplicable                  | true                |
         | withdrawalDescription                      | random 10 alphabets | Scenario: SFS description field accepts alphabets
         | processLesserAmountIfMaximumIsNotAvailable | true                |
         | maximumWithDrawalLimitAmount               |                     | Scenario: SFS maximum limit configured with null
         | minimumWithDrawalLimitAmount               |                     | Scenario: SFS minimum limit configured with null
         | WithdrawalOneTimeOriginateFee              |          9999999999 | Scenario: SFS sfsWithdrawalOneTimeOriginateFee field accepts 10 digits
         | overnightExpressDeliveryFee                |          9999999999 | Scenario: SFS overnightExpressDeliveryFee field accepts 10 digits
         | maximumNumberOfDirectRolloverPayees        |                   1 | Scenario: SFS DirectRolloverPayees field accepts one
         | interestRate                               |                   1 | Scenario: SFS interestRate field 1 digit
         | allowChangingOfStateWithholdingTax         | true                | Scenario: SFS allowChangingOfStateWithholdingTax field accepts true
         | allowChangingOfFederalWithholdingTax       | true                | Scenario: SFS allowChangingOfFederalWithholdingTax field accepts true
         | allowOptingOutOfStateWithholdingTax        | true                | Scenario: SFS allowOptingOutOfStateWithholdingTax field accepts true
         | allowOptingOutOfFederlWithholdingTax       | true                | Scenario: SFS allowOptingOutOfFederlWithholdingTax field accepts true
         | availableToAlternatePayees                 | true                | Scenario: SFS availableToAlternatePayees field accepts true
         | availableToBeneficiaries                   | true                | Scenario: SFS availableToBeneficiaries field accepts true
         | sponsorApprovalRequired                    | true                | Scenario: SFS sponsorApprovalRequired field accepts true
         | spouseConsentRequired                      | true                | Scenario: SFS spouseConsentRequired field accepts true
         | withdrawalLimitPerPeriod                   |                   1 | Scenario: SFS limitPerPeriod configured with Annually
         | paymentMethod                              | 1,                  |
         | calculationMethods                         | 1,                  |
         | dateOfAnnuityPayments                      | 1,                  | Scenario: SFS Date of Annuity as Fixed date configuration
         | distributionAllocationMethod               | 1,                  |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS processLesserAmountIfMaximumIsNotAvailable field accepts false
When Configuration has been made as per following
         | key                                        | value              |
         | withDrawalType                             |                  4 |
         | periodicPaymentApplicable                  | true               | 
         | withdrawalDescription                      | random 10 numerics | Scenario: SFS description field accepts numerics
         | processLesserAmountIfMaximumIsNotAvailable | false              |
         | minimumWithDrawalLimitAmount               |             550.00 | Scenario: SFS minimum limit configured with value as decimal
         | maximumWithDrawalLimitAmount               |             560.00 | Scenario: SFS maximum limit configured with value as decimal
         | interestRate                               |                100 | Scenario: SFS interestRate field 100 digit
         | overnightExpressDeliveryFee                |              99999 | Scenario: SFS overnightExpressDeliveryFee field accepts 5 digits
         | WithdrawalOneTimeOriginateFee              |              99999 | Scenario: Scenario: SFS sfsWithdrawalOneTimeOriginateFee field accepts 5 digits
         | maximumNumberOfDirectRolloverPayees        |                  0 | Scenario: SFS DirectRolloverPayees field accepts zero
         | allowChangingOfStateWithholdingTax         | false              | Scenario: SFS allowChangingOfStateWithholdingTax field accepts false
         | allowChangingOfFederalWithholdingTax       | false              | Scenario: SFS allowChangingOfFederalWithholdingTax field accepts f alse
         | allowOptingOutOfStateWithholdingTax        | false              | Scenario: SFS allowOptingOutOfStateWithholdingTax field accepts false
         | allowOptingOutOfFederlWithholdingTax       | false              | Scenario: SFS allowOptingOutOfFederlWithholdingTax field accepts false
         | availableToAlternatePayees                 | false              | Scenario: SFS availableToAlternatePayees field accepts false
         | availableToBeneficiaries                   | false              | Scenario: SFS availableToBeneficiaries field accepts false
         | sponsorApprovalRequired                    | false              | Scenario: SFS sponsorApprovalRequired field accepts false
         | spouseConsentRequired                      | false              | Scenario: SFS spouseConsentRequired field accepts false
         | withdrawalLimitPerPeriod                   |                  2 | Scenario: SFS limitPerPeriod configured with Quarterly
         | paymentMethod                              | 1,                 |
         | calculationMethods                         | 1,                 |
         | distributionAllocationMethod               | 2,                 | Scenario: SFS distributionAllocationMethod field configure with AllowmetoChoose
         | dateOfAnnuityPayments                      | 2,                 | Scenario: SFS Date of Annuity as participant selcted configuration

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message


Scenario: SFS Calculation is configured with Null
 When Configuration has been made as per following
         | key                                 | value                                        |
         | withDrawalType                      |                                            4 |
         | withdrawalDescription               | random 151 AlphaNumericWithSpecialCharacters | Scenario: SFS description field accepts above 150
         | periodicPaymentApplicable           | true                                         |
         | maximumNumberOfDirectRolloverPayees |                                              |
         | WithdrawalOneTimeOriginateFee       |                                              |
         | withdrawalLimitPerPeriod            |                                              |
         | interestRate                        |                                              |
         | numberOfWithdrawalAllowed           |                                            0 | 
         | overnightExpressDeliveryFee         |                                              |
         | paymentMethod                       | 1,                                           |
         | calculationMethods                  | 0,                                           |
         | distributionAllocationMethod        |                                              | Scenario: SFS distributionAllocationMethod field configure with null
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 9 following errors 
	| error_code | error_message                                           |
	| PL350      | Required                                                |Scenario: SFS overnightExpressDeliveryFee field accepts null
	| PL426      | Required                                                |
	| PL266      | Required                                                |Scenario: SFS sfsWithdrawalOneTimeOriginateFee field accepts null
	| PL257      | Required                                                |Scenario: SFS limitPerPeriod configured with null
	| PL708      | Required                                                |
	| PL258      | Required                                                |Scenario: SFS number of withdrawals allowed configured with zero
	| PL456      | Required                                                |Scenario: SFS interestRate field Null
	| PL434      | Withdrawal Description should not exceed 150 characters |
	| PL271      | Withdrawal Description should not exceed 150 characters |Scenario: SFS DirectRolloverPayees field accepts null


Scenario: SFS Calculation is configured with SpecificDollar
 When Configuration has been made as per following
         | key                          | value         |
         | withDrawalType               |             4 |
         | withdrawalLimitPerPeriod     | <period>      |
         | withdrawalDescription        | <description> |
         | periodicPaymentApplicable    | true          |
         | numberOfWithdrawalAllowed    |            12 | Scenario: SFS number of withdrawals allowed configured with twelve
         | paymentMethod                |           1,2 |
         | eftFee                       |             1 |Scenario: SFS paymentMethod field configure with checkandEft
         | calculationMethods           | <methods>     |
         | distributionAllocationMethod | 1,2,          | Scenario: SFS distributionAllocationMethod field configure with ProrataofChoice&AllowmetoChoose
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message
Examples: 
| period  | description                                  | methods |
|    3    | random 10 alphaNumerics                      | 2,      |
|    4    | random 10 specialCharacters                  | 4,      | Scenario: SFS Calculation is configured with AmortizationMethod
|    1    | random 10 AlphaNumericWithSpecialCharacters  | 5,      | Scenario: SFS Calculation is configured with AnnulizationMethod
|    1    | random 149 AlphaNumericWithSpecialCharacters | 1,2,4,  | Scenario: SFS Calculation is configured with All
|    1    | random 150 AlphaNumericWithSpecialCharacters | 1,      | Scenario: SFS description field accepts equal 150

#Scenario: SFS description field accepts alphanumerics
#Scenario: SFS description field accepts specialCharacters
#Scenario: SFS description field accepts alphanumericsspecialcharacters
#Scenario: SFS description field accepts below 150
#Scenario: SFS limitPerPeriod configured with SemiAnnually
#Scenario: SFS limitPerPeriod configured with Notapplicable



Scenario: SFS overnightExpressDeliveryFee field accepts zero
 When Configuration has been made as per following
         | key                           | value |
         | withDrawalType                |     4 |
         | periodicPaymentApplicable     | true  |
         | overnightExpressDeliveryFee   |     0 |
         | WithdrawalOneTimeOriginateFee |     0 |
         | withdrawalLimitPerPeriod      |     3 |
         | numberOfWithdrawalAllowed     |       |
         | paymentMethod                 |       |
         | calculationMethods            | 1,    |
         | distributionAllocationMethod  | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 4 following errors 
	| error_code | error_message |
	| PL350      | Required      |
	| PL1007     | Required      | Scenario: SFS paymentMethod field configure with null
	| PL258      | Required      | Scenario: SFS number of withdrawals allowed configured with null
	| PL266      | Required      | Scenario: SFS sfsWithdrawalOneTimeOriginateFee field accepts zero


Scenario: SFS number of withdrawals allowed configured with more than twelve for annually
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | periodicPaymentApplicable    | true  |
         | withdrawalLimitPerPeriod     |     3 |
         | numberOfWithdrawalAllowed    |    13 |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                            |
	| PL346      | Number of Withdrawals allowed should not be more than 12 |


# SFSPaymentFrequencyApplicable

#Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Monday
Scenario: SFS Payment Frequency Applicable is configured with Weekly
 When Configuration has been made as per following
         | key                          | value    |
         | withDrawalType               |        4 |
         | paymentFrequencyApplicable   |        2 |
         | periodicPaymentApplicable    | true     |
         | paymentMethod                | 1,       |
         | startDay                     | <startday> |
         | calculationMethods           | 1,       |
         | distributionAllocationMethod | 1,       |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message
Examples: 
| startday |
|        1 |
|        0 | Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Sunday
|        2 | Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Tuesday
|        3 | Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Wednesday
|        4 | Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Thursday
|        5 | Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Friday
|        6 |Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Saturday


Scenario: SFS Payment Frequency Applicable is configured with SemiMonthly
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     3 |
         | startMonthFirstQuarter       |     1 |Scenario: SFS Payment Frequency Applicable is configured with Quarterly as Starting month for first quarter  is Jan
         | startMonth                   |       | Scenario: SFS Payment Frequency Applicable is configured with Monthly as starting day of every month is 1
         | firstBeginDay                |     1 | Scenario: SFS Payment Frequency Applicable is configured with Semimonthly as First begin date is 1
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS Payment Frequency Applicable is configured with Monthly
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     4 |
         | startDay                     |     1 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS Payment Frequency Applicable is configured with Quarterly
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     5 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS Payment Frequency Applicable is configured with SemiAnnually
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     6 |
         | dateOfAnnuityPayments        | 1,    | Scenario: SFS Payment Frequency Applicable is configured with SemiAnnually as Starting month for the half-year  is Jan
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS Payment Frequency Applicable is configured with Annually
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     7 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS Payment Frequency Applicable is configured with Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |       |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL451      | Required      |

Scenario: SFS Payment Frequency Applicable is configured with Weekly and startday is Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | startDay                     |       |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL452      | Required      |

Scenario: SFS Payment Frequency Applicable is configured with Semimonthly as First begin date is Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | firstBeginDay                |       |
         | secondBeginDay               |       |
         | paymentFrequencyApplicable   |     3 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL453      | Required      |
	| PL454      | Required      |Scenario: SFS Payment Frequency Applicable is configured with Semimonthly as Second begin date is Null



Scenario: SFS Payment Frequency Applicable is configured with Semimonthly as First begin date same as Second begin date
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | firstBeginDay                |     1 |
         | secondBeginDay               |     1 |
         | paymentFrequencyApplicable   |     3 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                               |
	| PL713      | Second Begin Day should not be equal to the First Begin Day |

Scenario: SFS Payment Frequency Applicable is configured with Monthly as starting day of every month is Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | withDrawalType               |     4 |
         | dateOfAnnuityPayments        | 1,    |
         | startDay                     |       |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL455      | Required      |

Scenario: SFS Payment Frequency Applicable is configured with Quarterly as starting month for first quarter is Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     5 |
         | dateOfAnnuityPayments        | 1,    |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | startMonthFirstQuarter       |       |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL457      | Required      |


Scenario: SFS Payment Frequency Applicable is configured with SemiAnnually as Starting month for the half-year  is Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     6 |
         | dateOfAnnuityPayments        | 1,    |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | startMonthFirstHalfYear      |       |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL458      | Required      |

Scenario: SFS Payment Frequency Applicable is configured with Annually as starting date is Jan 1st
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     3 |
         | startMonth                   |     1 |
         | startDay                     |     1 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then API should respond with successful message

Scenario: SFS Payment Frequency Applicable is configured with Annually as starting Month is Null
 When Configuration has been made as per following
         | key                          | value |
         | withDrawalType               |     4 |
         | paymentFrequencyApplicable   |     7 |
         | startMonth                   |       |
         | startDay                     |       |
         | dateOfAnnuityPayments        |     1 |
         | periodicPaymentApplicable    | true  |
         | paymentMethod                | 1,    |
         | calculationMethods           | 1,    |
         | distributionAllocationMethod | 1,    |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL460      | Required      |
	| PL452      | Required      |Scenario: SFS Payment Frequency Applicable is configured with Annually as starting day is Null

