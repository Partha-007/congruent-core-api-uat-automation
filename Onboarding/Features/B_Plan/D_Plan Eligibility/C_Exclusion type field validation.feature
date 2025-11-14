Feature: C_Exclusion type field validation
[BeforeTestRun]

 Scenario:  Exclusion type field validation when null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL179 : Required"

 
Scenario:  Save Long Term Part Time (LTPT) Eligibility with valid data(error message)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL181 : Required"