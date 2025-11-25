Feature: F_Validation of Eligiblity Name 
[BeforeTestRun]

 Scenario:  Eligiblity Name field acceptance
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "<name>"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
 Examples: 
 | name                                        |
 | random 10 alphabets                         |
 | random 10 numerics                          |
 | random 10 specialCharacters                 |
 | random 10 alphaNumericWithSpecialCharacters |
 | random 30 alphabets                         |
 | random 29 alphabets                        |

  Scenario:  Eligiblity Name field acceptance with requird validation
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 61 characters
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL168 : Eligibility Name length should not exceed 60 characters"

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

   Scenario:  To verify the Eligibility name field by leaving empty
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 0 characters
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL167 : Required"

   Scenario:  To verify the Eligibility name field by entering space 
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL167 : Required"