Feature: D_ImmediateEligibility
[BeforeTestRun]

 Scenario:  Immediate eligibility field acceptance when it is true
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "immediateEligibility" is configured as "true"
    And Configuration has been made as per following
           | key                          | value                          |
           | isLTPTApplicable             | <IsLTPTApplicable>             |
           | ltptAgeInYears               | <LtptAgeInYears>               |
           | ltptAgeInMonths              | <LtptAgeInMonths>              |
           | ltptHours                    | <LtptHours>                    |
           | consecutiveYears             | <ConsecutiveYears>             |
           | ltptVestingComputationPeriod | <ltptVestingComputationPeriod> |
           | ltptServiceCreditPeriod      | <ltptServiceCreditPeriod>      |
           | exclusionType                |                              1 |
           | dateOfHireType               |                              2 |
           | hiredOnOrBeforeDate          | 2022-04-03T18:30:00.000Z       |
 And the property "effectiveDate" is configured as "01/01/2060"  
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
  Then API should respond with successful message
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths | LtptHours | ConsecutiveYears | ltptVestingComputationPeriod | ltptServiceCreditPeriod |
 | true             |             21 |               0 |      1000 |                9 |                            1 |                       1 |
 | true             |             16 |               0 |       500 |               19 |                            1 |                       1 |
 | true             |             20 |               0 |      1000 |                1 |                            2 |                       2 |
 | true             |             20 |               0 |       500 |                0 |                            2 |                       2 |

 Scenario:  To verify the validation message for Applicable eligibility requirement options by not selecting any option
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 61 characters
  And the property "immediateEligibility" is configured as "false"
  And the property "eligibilityType" is configured as ""
  And the property "ltptHours" is configured as "2000"
    And Configuration has been made as per following
           | key                          | value              |
           | isLTPTApplicable             | <IsLTPTApplicable> |
           | ltptAgeInYears               | <LtptAgeInYears>   |
           | ltptAgeInMonths              | <LtptAgeInMonths>  |
           | ltptVestingComputationPeriod |                    |
           | ltptServiceCreditPeriod      |                    |
           | exclusionType                |                    |
   And the property "effectiveDate" is configured as ""  
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 4 following errors
 | error_code | error_message                                                        |
 | PL504      | Required                                                             |
 | PL168      | Eligibility Name length should not exceed 60 characters              |
 | PL299      | Eligibility age must be less than or equal to 21 years and 0 months. |
 | PL212      | Number of hours of service should not be greater than 1000           |
 | PL216      | Required                                                             |
 | PL217      | Required                                                             |
 | PL218      | Required                                                             |
 | PL179      | Required                                                             |
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths |
 | true             |             21 |               6 |

  @CompanyAndPlanBasicDetails
  Scenario:  Eligiblity Name field wirh existing name
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "PlanELigibility"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "PlanELigibility"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
    Then the API response should contain the 2 following errors 
| error_code | error_message                     |
| PL1039     | Eligibility name should be unique |
| PL519      | Plan Eligibility Already Exists   |

 Scenario:  To verify the validation message for Is this immediate eligibility? Option by without selecting any option
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 0 characters
  And the property "immediateEligibility" is configured as ""
    And Configuration has been made as per following
           | key              | value              |
           | isLTPTApplicable | <IsLTPTApplicable> |
           | ltptAgeInYears   | <LtptAgeInYears>   |
           | ltptAgeInMonths  | <LtptAgeInMonths>  |
           | ltptHours        | <LtptHours>        |
           | exclusionType    |                  1 |
           | dateOfHireType   |                    |
    And the property "effectiveDate" is configured as "01/01/2021"        
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then the API response should contain the 2 following errors 
| error_code | error_message                                                           |
| PL502      | Required                                                                |
| PL167      | Required                                                                |
| PL213      | Eligibility age must be equal to or greater than 16 years and 0 months. |
| PL1143     | Number of hours of service should not be less than 500                  |
| PL1036     | Effective date prior to 01/01/2024                                      |
| PL181      | Required                                                                |
 Examples: 
 | IsLTPTApplicable | LtptAgeInYears | LtptAgeInMonths | LtptHours |
 | true             |             11 |               6 |       100 |
 | true             |              0 |               0 |         0 |


 Scenario:  To verify the Age (Textbox) acceptance criteria of lengh above 2 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as ""
  And the property "immediateEligibility" is configured as "<ImmediatEligibility>"
  And the property "eligibilityType" is configured as "<eligibleType>"
  And the property "age" is configured as "<age>"
  And the property "ltptHours" is configured as "500"
      And Configuration has been made as per following
           | key                 | value |
           | exclusionType       |     1 |
           | dateOfHireType      |     2 |
           | hiredOnOrBeforeDate |       |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
   Then the API response should contain the 2 following errors 
| error_code | error_message                           |
| PL506      | PL506 : Eligibility Age must be 18 - 99 |
| PL167      | Required                                |
| PL172      | Required                                |
 Examples: 
 | ImmediatEligibility | eligibleType | age |
 | false               |            1 | 123 |
 | false               |            1 |   2 |
 | false               |            1 | 100 |
 | false               |            1 |  17 |

 Scenario:  Age field acceptance  when Immediate eligibility field is false and Applicable eligibility requirement is age
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
 When Configuration has been made as per following
           | key  | value  |
           | name | <name> |
  And the property "immediateEligibility" is configured as "<ImmediatEligibility>"
  And the property "eligibilityType" is configured as "<eligibleType>"
  And the property "age" is configured as "<age>"
  And the property "ltptHours" is configured as "500"
        And Configuration has been made as per following
           | key                 | value                    |
           | exclusionType       |                        1 |
           | dateOfHireType      |                        1 |
           | hiredOnOrBeforeDate | 2022-04-03T18:30:00.000Z |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message
 Examples: 
 | ImmediatEligibility | eligibleType | age  | name                                        |
 | false               |            1 |   20 | random 10 alphabets                         |
 | false               |            1 |   19 | random 10 numerics                          |
 | false               |            1 |   99 | random 10 specialCharacters                 |
 | false               |            1 |   50 | random 10 alphaNumericWithSpecialCharacters |
 | false               |            1 |   18 | random 30 alphabets                         |
 | false               |            1 | 19.9 | random 29 alphabets                         |
 
  Scenario:  To verify the validation message for Age (Textbox) by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "immediateEligibility" is configured as "false"
  And the property "eligibilityType" is configured as "1"
  And the property "age" is configured as ""
  And the property "ltptHours" is configured as "500"
         And Configuration has been made as per following
           | key                 | value                    |
           | exclusionType       |                        1 |
           | dateOfHireType      |                        1 |
           | hiredOnOrBeforeDate |                          |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
    Then the API response should contain the 3 following errors 
     | error_code | error_message |
     | PL505      | Required      |
     | PL171      | Required      |
 
  Scenario:  To verify the validation message for Applicable eligibility requirement options by selecting Service and not selecting any option
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
           | key                      | value |
           | immediateEligibility     | false |
           | eligibilityType          |     2 |
           | yearsOfServiceDefinition |       |
 And the property "ltptHours" is configured as "500"
 And Configuration has been made as per following
           | key                 | value |
           | exclusionType       |     1 |
           | dateOfHireType      |     3 |
           | hiredOnOrBeforeDate |       |
           | hiredOnOrBeforeDate |       |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
   Then the API response should contain the 3 following errors 
     | error_code | error_message |
     | PL507      | Required      |
     | PL171      | Required      |
     | PL172      | Required      |
Scenario:To verify the Actual hours (Textbox) acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
           | key                      | value                      |
           | immediateEligibility     | <immediateEligibility>     |
           | eligibilityType          | <eligibilityType>          |
           | yearsOfServiceDefinition | <yearsOfServiceDefinition> |
           | hours                    | <hours>                    |
 And the property "ltptHours" is configured as "500"
 And Configuration has been made as per following
           | key                 | value                    |
           | exclusionType       |                        1 |
           | dateOfHireType      |                        3 |
           | hiredOnOrBeforeDate | 2023-04-03T18:30:00.000Z |
           | hiredOnOrBeforeDate | 2022-04-01T18:30:00.000Z |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
   Then the API response should contain the 3 following errors 
     | error_code | error_message                                                    |
     | PL197      | Actual hours should not exceed 1000                              |
     | PL192      | Exclusion from date should not be greater than exclusion to date |

 Examples:
 | immediateEligibility | eligibilityType | yearsOfServiceDefinition | hours |
 | false                |               2 |                        1 | 12345 |
 | false                |               2 |                        1 |  1234 |
 | false                |               2 |                        1 |  1001 |

 Scenario:To verify the Actual hours (Textbox) acceptance criteria of length below 4 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
           | key                      | value                      |
           | immediateEligibility     | <immediateEligibility>     |
           | eligibilityType          | <eligibilityType>          |
           | yearsOfServiceDefinition | <yearsOfServiceDefinition> |
           | hours                    | <hours>                    |
           And the property "ltptHours" is configured as "500"
           And the property "ltptAgeInYears" is configured as "16"
           And the property "ltptAgeInMonths" is configured as "0"
            And Configuration has been made as per following
           | key                 | value                    |
           | exclusionType       |                        1 |
           | dateOfHireType      |                        3 |
           | hiredOnOrBeforeDate | 2022-03-03T18:30:00.000Z |
           | hiredOnOrBeforeDate | 2022-04-03T18:30:00.000Z |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

 Examples:
 | immediateEligibility | eligibilityType | yearsOfServiceDefinition | hours |
 | false                |               2 |                        1 |   123 |
 | false                |               2 |                        1 |    10 |
 | false                |               2 |                        1 |  1000 |
 | false                |               2 |                        1 |   248 |

 Scenario: To verify the validation message for Actual hours (Textbox) by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
           | key                          | value |
           | immediateEligibility         | false |
           | eligibilityType              |     2 |
           | yearsOfServiceDefinition     |     1 |
           | hours                        |       |
           | eligibilityCalculationPeriod |       |
           | yearsOfServiceRequirement    |       |
           | serviceCreditPeriod          |       |
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL196 : Required"
 Then the API response should contain the 4 following errors 
| error_code | error_message |
| PL196      | Required      |
| PL198      | Required      | Scenario: To verify the validation message for Eligibility calculation period without selecting any option
| PL199      | Required      | Scenario:  To verify the validation message for Year of service requirement without selecting any option
| PL200      | Required      | Scenario:  To verify the validation message for Service credit period without selecting any option

 
 Scenario:To verify the Length of service requirement (Textbox) by selecting Daily dropdown acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| period                   | <period>                   |
| lengthOfService          | <lengthOfService>          |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | period | lengthOfService |
  | false                |               2 |                        2 |    123 |               1 |
  | false                |               2 |                        2 |     12 |               1 |
  | false                |               2 |                        2 |      2 |               1 |
  | false                |               2 |                        2 |    700 |               1 |
  | false                |               2 |                        2 |    730 |               1 |
  | false                |               2 |                        2 |     20 |               2 |
  | false                |               2 |                        2 |      2 |               2 |
  | false                |               2 |                        2 |     24 |               2 |
  | false                |               2 |                        2 |     22 |               2 |
  | false                |               2 |                        2 |      2 |               3 |
  | false                |               2 |                        2 |      1 |               3 |
  
 Scenario:To verify the Length of service requirement (Textbox) by selecting Daily dropdown acceptance criteria of more than 730
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |   731 |
| lengthOfService          |     1 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL205 : No. of days for length of service period should not exceed 730 days"  

   Scenario:To verify the Length of service requirement (Textbox) by selecting Daily dropdown leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |       |
| lengthOfService          |     1 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL201 : Required" 

     Scenario:To verify the Length of service requirement (Textbox) by selecting Monthly dropdown leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |       |
| lengthOfService          |     2 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL201 : Required" 

  Scenario:To verify the Length of service requirement (Textbox) by selecting Months dropdown acceptance criteria of length above 2 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |    123|
| lengthOfService          |     2 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL203 : No. of Months for length of service period should not exceed 24 months" 

  Scenario:To verify the Length of service requirement (Textbox) by selecting Months dropdown acceptance criteria of value above 24
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |    26 |
| lengthOfService          |     2 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL203 : No. of Months for length of service period should not exceed 24 months" 

   Scenario:To verify the Length of service requirement (Textbox) by selecting Years dropdown acceptance criteria of value above 2
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |     3 |
| lengthOfService          |     3 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL204 : No. of years for length of service period should not exceed 2 years" 

   Scenario: To verify the Length of service requirement (Textbox) by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     2 |
| period                   |     1 |
| lengthOfService          |       |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL202 : Required" 

     Scenario: To verify the Equivalency Hours per Frequency " Daily" values acceptance criteria of length above 2 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| dailyHours               |   234 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL207 : Daily Hours should not exceed 24" 

       Scenario: To verify the Equivalency Hours per Frequency " Daily" values acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| dailyHours               | <dailyHours>               |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | dailyHours |
  | false                |               2 |                        3 |         24 |
  | false                |               2 |                        3 |          1 |
  | false                |               2 |                        3 |         16 |

  
     Scenario: To verify the Equivalency Hours per Frequency " Daily" values acceptance criteria of value above 24
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| dailyHours               |    25 |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL207 : Daily Hours should not exceed 24" 

       Scenario: To verify the validation message for Equivalency Hours per Frequency " Daily" by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| dailyHours               |       |
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL206 : Required"
  
    Scenario: To verify the validation message for Equivalency Hours per Frequency " Daily" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| dailyHours               |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL994 : Required" 

  
    Scenario:To verify the Equivalency Hours per Frequency " Weekly" values acceptance criteria of length above 3 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| weeklyHours              |  1234 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1072 : Weekly Hours should not exceed 168"

  Scenario: To verify the Equivalency Hours per Frequency " Weekly" values acceptance criteria of length 
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| weeklyHours              | <weeklyHours>              |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | weeklyHours |
  | false                |               2 |                        3 |         123 |
  | false                |               2 |                        3 |          12 |
  | false                |               2 |                        3 |         168 |
  | false                |               2 |                        3 |         150 |

  
    Scenario:To verify the Equivalency Hours per Frequency " Weekly" values acceptance criteria of value above 168
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| weeklyHours              |   180 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1072 : Weekly Hours should not exceed 168"

    Scenario:To verify the validation message for Equivalency Hours per Frequency " Weekly"  by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| weeklyHours              |       |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL542 : Required"

      Scenario:To verify the Equivalency Hours per Frequency " Bi-Weekly" values acceptance criteria of length above 3 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| biWeeklyHours            |  1234 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL550 : BiWeekly Hours should not exceed 336"   

  Scenario: To verify the Equivalency Hours per Frequency " Bi-Weekly" values acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| biWeeklyHours            | <biWeeklyHours>            |
And the property "ltptHours" is configured as "500"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
And the property "dailyHours" is configured as "12"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | biWeeklyHours |
  | false                |               2 |                        3 |           123 |
  | false                |               2 |                        3 |            12 |
  | false                |               2 |                        3 |           336 |
  | false                |               2 |                        3 |           330 |

   Scenario:To verify the Equivalency Hours per Frequency " Bi-Weekly" values acceptance criteria of value above 336
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| biWeeklyHours            |   340 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL550 : BiWeekly Hours should not exceed 336"

   Scenario:To verify the validation message for Equivalency Hours per Frequency " Bi-Weekly" by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| biWeeklyHours            |       |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1062 : Required"

  Scenario:To verify the validation message for Equivalency Hours per Frequency " Bi-Weekly" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| biWeeklyHours            |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1063 : Required"


Scenario:To verify the Equivalency Hours per Frequency " Semi-monthly" values acceptance criteria of length above 3 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiMonthlyHours         |  1234 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1073 : Semi-monthly Hours should not exceed 384"

    Scenario: To verify the Equivalency Hours per Frequency " Semi-monthly" values acceptance criteria of length 
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| semiMonthlyHours         | <semiMonthlyHours>         |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | semiMonthlyHours |
  | false                |               2 |                        3 |              120 |
  | false                |               2 |                        3 |               22 |
  | false                |               2 |                        3 |              384 |
  | false                |               2 |                        3 |              234 |

  Scenario: To verify the Equivalency Hours per Frequency " Semi-monthly" values acceptance criteria of value above 384
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiMonthlyHours         |   412 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1073 : Semi-monthly Hours should not exceed 384"


  Scenario: To verify the validation message for Equivalency Hours per Frequency " Semi-monthly" by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiMonthlyHours         |       |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL544 : Required"

    Scenario: To verify the validation message for Equivalency Hours per Frequency " Semi-monthly" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiMonthlyHours         |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1064 : Required"

   Scenario: To verify the Equivalency Hours per Frequency " Monthly" values acceptance criteria of length above 3 charactes
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| monthlyHours             |  1234 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1074 : Monthly Hours should not exceed 744"

  Scenario: To verify the Equivalency Hours per Frequency " Monthly" values acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| monthlyHours             | <monthlyHours>             |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | monthlyHours |
  | false                |               2 |                        3 |          123 |
  | false                |               2 |                        3 |           12 |
  | false                |               2 |                        3 |          744 |
  | false                |               2 |                        3 |          515 |

  
   Scenario: To verify the Equivalency Hours per Frequency " Monthly" values acceptance criteria of value above 744
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| monthlyHours             |   818 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1074 : Monthly Hours should not exceed 744"

    
   Scenario: To verify the validation message for Equivalency Hours per Frequency " Monthly" by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| monthlyHours             |       |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL545 : Required"

     Scenario:To verify the validation message for Equivalency Hours per Frequency " Monthly" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| monthlyHours             |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1065 : Required"


     Scenario:To verify the Equivalency Hours per Frequency " Quarterly" values acceptance criteria of length above 4 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| quarterlyHours           | 12345 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1075 : Quarterly Hours should not exceed 2208"

  Scenario: To verify the Equivalency Hours per Frequency " Quarterly" values acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| quarterlyHours           | <quarterlyHours>           |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | quarterlyHours |
  | false                |               2 |                        3 |           1234 |
  | false                |               2 |                        3 |             12 |
  | false                |               2 |                        3 |           2208 |
  | false                |               2 |                        3 |            189 |

       Scenario:To verify the Equivalency Hours per Frequency " Quarterly" values acceptance criteria of value above 2208
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| quarterlyHours           |  2400 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1075 : Quarterly Hours should not exceed 2208"

         Scenario:To verify the validation message for Equivalency Hours per Frequency " Quarterly" by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| quarterlyHours           |       |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1066 : Required"

         Scenario:To verify the validation message for Equivalency Hours per Frequency " Quarterly" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| quarterlyHours           |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1067 : Required"


           Scenario:To verify the Equivalency Hours per Frequency "Semi annually" values acceptance criteria of length above 4 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiAnnuallyHours        | 12345 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1076 : Semi-Annually Hours should not exceed 4392"

    Scenario: To verify the Equivalency Hours per Frequency "Semi annually" values acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| semiAnnuallyHours        | <semiAnnuallyHours>        |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | semiAnnuallyHours |
  | false                |               2 |                        3 |              1234 |
  | false                |               2 |                        3 |               123 |
  | false                |               2 |                        3 |              4392 |
  | false                |               2 |                        3 |              2000 |

  
   Scenario:To verify the Equivalency Hours per Frequency "Semi annually" values acceptance criteria of value above 4392
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiAnnuallyHours        |  5000 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1076 : Semi-Annually Hours should not exceed 4392"

     Scenario:To verify the validation message for Equivalency Hours per Frequency "Semi annually"  by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiAnnuallyHours        |       |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1068 : Required"

     Scenario:To verify the validation message for Equivalency Hours per Frequency "Semi annually" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| semiAnnuallyHours        |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1069 : Required"

   Scenario:To verify the Equivalency Hours per Frequency "Annually" values acceptance criteria of length above 4 characters
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| annuallyHours            | 12345 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL555 : Annually Hours should not exceed 8760"

  Scenario: To verify the Equivalency Hours per Frequency "Annually" values acceptance criteria of length
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value                      |
| immediateEligibility     | <immediateEligibility>     |
| eligibilityType          | <eligibilityType>          |
| yearsOfServiceDefinition | <yearsOfServiceDefinition> |
| annuallyHours            | <annuallyHours>            |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should respond with successful message

  Examples: 
  | immediateEligibility | eligibilityType | yearsOfServiceDefinition | annuallyHours |
  | false                |               2 |                        3 |          1234 |
  | false                |               2 |                        3 |           456 |
  | false                |               2 |                        3 |          8760 |
  | false                |               2 |                        3 |            46 |


   Scenario:To verify the Equivalency Hours per Frequency "Annually" values acceptance criteria of value above 8760
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| annuallyHours            |  9000 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL555 : Annually Hours should not exceed 8760"


    Scenario:To verify the validation message for Equivalency Hours per Frequency "Annually"  by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| annuallyHours            |       |
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1070 : Required"

    Scenario:To verify the validation message for Equivalency Hours per Frequency "Annually" by enter 0
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
 And Configuration has been made as per following
| key                      | value |
| immediateEligibility     | false |
| eligibilityType          |     2 |
| yearsOfServiceDefinition |     3 |
| annuallyHours            |     0 |
And the property "ltptHours" is configured as "500"
And the property "dailyHours" is configured as "12"
And the property "ltptAgeInYears" is configured as "16"
And the property "ltptAgeInMonths" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
  Then API should give response as "PL1071 : Required"