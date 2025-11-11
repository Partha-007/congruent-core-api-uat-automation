Feature: C_Exclusion type field validation
[BeforeTestRun]

Scenario:  Save Long Term Part Time (LTPT) Eligibility with valid data(error message)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  
  And the property "exclusionType" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL179 : Effective date prior to 01/01/2024"

 Scenario: Eligiblitydescription field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "<Name>"
  And the property "description" is configured as "<Description>"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
Examples: 
| Name                | <Description>                               |
| random 10 alphabets | random 10 alphabets                         |
| random 10 alphabets | random 10 numerics                          |

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