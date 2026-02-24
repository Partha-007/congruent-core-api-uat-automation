Feature: A_EligibilityReEvaluationandBreakInServiceAndTermination
[BeforeTestRun]

@CompanyAndPlanBasicDetails
Scenario: eligibilityReEvaluationandBreakInServiceAndTermination field validate(error message)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "isRevaluationRequired" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should give response as "PL503 : Required"

 @CompanyAndPlanBasicDetails
Scenario: EligibilityReEvaluationAndTermination field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "<Name>"
  And the property "<condition>" is configured as "<data>"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
Examples: 
| Name                | <condition>           | <data> |
| random 10 alphabets | isRevaluationRequired | true   |
| random 10 alphabets | isRevaluationRequired | false  |

@CompanyAndPlanBasicDetails
Scenario: EligibilityBreakInServiceAndTermination field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured as "<Name>"
  And the property "<condition>" is configured as "<data>"
  And the property "ltptHours" is configured as "500"
  #And the property "ltptAgeInYears" is configured as "16"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then API should respond with successful message
Examples: 
| Name                | <condition>           | <data> |
| random 10 alphabets | isBreakInService      | true   |
| random 10 alphabets | isBreakInService      | false  |



