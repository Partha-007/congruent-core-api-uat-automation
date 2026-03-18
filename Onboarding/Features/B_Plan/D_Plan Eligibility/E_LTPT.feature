Feature: E_LTPT
[BeforeTestRun]

Scenario:  Save Long Term Part Time (LTPT) Eligibility with valid data(error message)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors
| block | error_code | error_message                                                           |
|     1 | PL299      | Eligibility age must be less than or equal to 21 years and 0 months.    |
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths |
 | true             |             21 |               6 |

 Scenario:  Save Long Term Part Time (LTPT) Eligibility with valid data(error message2)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors
| block | error_code | error_message                                                           |
|     1 | PL213      | Eligibility age must be equal to or greater than 16 years and 0 months. |
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths |
 | true             |             11 |               6 |
 | true             |              0 |               0 |

Scenario: Save Long Term Part Time (LTPT) Eligibility with valid data( succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
   When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths |
 | true             |             21 |               0 |
 | true             |             16 |               0 |



 Scenario:  To validate Long Term Part Time (LTPT) Eligibility Hours(error message)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
           | ltptHours        | <LtptHours>        |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors
| block | error_code | error_message                                              |
|     1 | PL212      | Number of hours of service should not be greater than 1000 |
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths | LtptHours |
 | true             |             20 |               0 |      2000 |


 
 Scenario:  To validate Long Term Part Time (LTPT) Eligibility Hours(error message2)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
           | ltptHours        | <LtptHours>        |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors
| block | error_code | error_message                                              |
|     1 | PL1143     | Number of hours of service should not be less than 500     |
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths | LtptHours |
 | true             |             20 |               0 |       100 |
 | true             |             20 |               0 |         0 |
 


 Scenario: To validate Long Term Part Time (LTPT) Eligibility Hours (succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
   When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
           | ltptHours        | <LtptHours>        |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths | LtptHours |
 | true             |             20 |               0 |      1000 |
 | true             |             20 |               0 |       500 |



 Scenario: To validate Long Term Part Time (LTPT) Eligibility consecutiveYears (succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
   When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
           | consecutiveYears | <ConsecutiveYears> |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths | ConsecutiveYears |
 | true             |             20 |               0 |                9 |
 | true             |             20 |               0 |               19 |
 | true             |             20 |               0 |                1 |
 | true             |             20 |               0 |                0 |


 Scenario:  STo validate Long Term Part Time (LTPT) Eligibility when Eligibility calculation period is null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                          | value |
           | isLTPTApplicable             | true  |
           | ltptAgeInYears               |    20 |
           | ltptAgeInMonths              |     0 |
           | ltptVestingComputationPeriod |       |
           | ltptHours                    |   500 |
 #And the property "ltptVestingComputationPeriod" is configured as ""
  #And the property "ltptHours" is configured as "500"
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL216 : Required"

  Scenario:  To validate Long Term Part Time (LTPT) Eligibility when ltptServiceCreditPeriod is null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                     | value |
           | isLTPTApplicable        | true  |
           | ltptAgeInYears          |    20 |
           | ltptAgeInMonths         |     0 |
           | ltptServiceCreditPeriod |       |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL217 : Required"

  Scenario:  To validate Long Term Part Time (LTPT) Eligibility when Eligibility calculation period is selected as Anniversary of hire
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                          | value |
           | isLTPTApplicable             | true  |
           | ltptAgeInYears               |    20 |
           | ltptAgeInMonths              |     0 |
           | ltptVestingComputationPeriod |     1 |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Scenario: To validate Long Term Part Time (LTPT) Eligibility when ltptServiceCreditPeriod is selected At the end of eligibility calculation period
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                     | value |
           | isLTPTApplicable        | true  |
           | ltptAgeInYears          |    20 |
           | ltptAgeInMonths         |     0 |
           | ltptServiceCreditPeriod |     1 |
  And the property "ltptHours" is configured as "500"

  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Scenario: To validate Long Term Part Time (LTPT) Eligibility when Eligibility calculation period is selected Plan year after anniversary of hire
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                          | value |
           | isLTPTApplicable             | true  |
           | ltptAgeInYears               |    20 |
           | ltptAgeInMonths              |     0 |
           | ltptVestingComputationPeriod |     2 |
  And the property "ltptHours" is configured as "500"

  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Scenario: To validate Long Term Part Time (LTPT) Eligibility when ltptServiceCreditPeriod is selected as Immediately after the hours condition is satisfied
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                     | value |
           | isLTPTApplicable        | true  |
           | ltptAgeInYears          |    20 |
           | ltptAgeInMonths         |     0 |
           | ltptServiceCreditPeriod |     2 |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message



  Scenario:  To validate Long Term Part Time (LTPT) Eligibility when Effective date is null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                     | value |
           | isLTPTApplicable        | true  |
           | ltptAgeInYears          |    20 |
           | ltptAgeInMonths         |     0 |
   And the property "effectiveDate" is configured as ""  
   And the property "ltptHours" is configured as "500"

  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL218 : Required"

  Scenario:   To validate Long Term Part Time (LTPT) Eligibility when Effective date is before 01/01/2024
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                     | value |
           | isLTPTApplicable        | true  |
           | ltptAgeInYears          |    20 |
           | ltptAgeInMonths         |     0 |
   And the property "effectiveDate" is configured as "01/01/2021"        
     And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1036 : Effective date prior to 01/01/2024"
 

   Scenario:To validate Long Term Part Time (LTPT) Eligibility when Effective date is accepts future date as 01/01/2060
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And Configuration has been made as per following
           | key                     | value |
           | isLTPTApplicable        | true  |
           | ltptAgeInYears          |    20 |
           | ltptAgeInMonths         |     0 |
 And the property "effectiveDate" is configured as "01/01/2060"  
   And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message


 
