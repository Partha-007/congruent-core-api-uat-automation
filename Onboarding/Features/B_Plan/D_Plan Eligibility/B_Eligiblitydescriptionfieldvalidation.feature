Feature: B_Eligiblitydescriptionfieldvalidation.feature
[BeforeTestRun]

@CompanyAndPlanBasicDetails
Scenario: Eligiblitydescription field validate(error message)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "description" is configured with "alphabets" with 51 characters
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL169 : Eligibility Description length should not exceed  50 characters"

 @CompanyAndPlanBasicDetails
Scenario: Eligiblitydescription field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "<Name>"
  And the property "description" is configured as "<Description>"
  And the property "ltptHours" is configured as "500"
  And the property "ltptAgeInYears" is configured as "17"
  And the property "shortYearStartDate" is configured as "2023-06-01T00:00:00Z"
  And the property "shortYearEndDate" is configured as "2026-05-01T00:00:00Z"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
Examples: 
| Name                | <Description>                               |
| random 10 alphabets | random 10 alphabets                         |
| random 10 alphabets | random 10 numerics                          |
| random 10 alphabets | random 10 specialCharacters                 |
| random 10 alphabets | random 10 alphaNumericWithSpecialCharacters |
| random 10 alphabets | alp123                                      |
| random 10 alphabets | random 50 alphabets                         |
| random 10 alphabets | random 48 alphabets                         |



