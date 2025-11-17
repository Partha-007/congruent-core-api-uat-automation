Feature: A_ComputationPeriod
[BeforeTestRun]

Scenario: Computation Period is Null
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
  When the property "allowLoansIfAnotherLoanIsDelinquentDefaultDeemed" is configured as "<bool>"
When the property "computationPeriod" is configured as "0"
And the property "responsibleForCalculation" is configured as "1"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
  Then API should give response as "PL1092 : Required"

Scenario: Computation Period is configured with Plan year 
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
  When the property "allowLoansIfAnotherLoanIsDelinquentDefaultDeemed" is configured as "<bool>"
When the property "computationPeriod" is configured as "2"
And the property "responsibleForCalculation" is configured as "1"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
  Then API should respond with successful message
