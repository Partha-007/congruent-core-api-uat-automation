Feature: A_SaveRollover
[BeforeTestRun]

Scenario:  Rollover Save configuration
  Given Model is selected for the endpoint "/api/Rollover/SaveRollover"
   When Configuration has been made as per following
           | key              | value          |
           | rollOversAllowed | true           |
           | rollOversFee     | <RollOversFee> |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveRollOverAsync"
  Then API should respond with successful message
  Examples: 
  | RollOversFee |
  |          200 |
  |       555.55 | Scenario: Rollover fee field length accept 3 character with 2 decimal points
  |      4444.55 | Scenario: Rollover fee field length accept above 3 character with 2 decimal points
  |        44.44 | Scenario: Rollover fee field length accept less than 3 character with 2 decimal points
  |      343.343 |Scenario: Rollover fee field length accept  3 character with 3 decimal points


  Scenario:  Rollover fee is null
  Given Model is selected for the endpoint "/api/Rollover/SaveRollover"
   When Configuration has been made as per following
           | key              | value |
           | rollOversAllowed | true  |
           | rollOversFee     |       |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveRollOverAsync"
 Then API should give response as "PL1080 : Required"

Scenario: Validate No RollOVer Source Created
  Given Model is selected for the endpoint "/api/Rollover/SaveRollover"
   When Configuration has been made as per following
           | key              | value |
           | rollOversAllowed | true  |
           | rollOversFee     |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveRollOverAsync"
 Then API should give response as "PL482 : No Rollover Sources created"