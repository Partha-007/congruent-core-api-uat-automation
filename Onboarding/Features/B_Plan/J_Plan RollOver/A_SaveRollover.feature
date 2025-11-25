Feature: A_SaveRollover
[BeforeTestRun]

Scenario:  Rollover Save configuration
  Given Model is selected for the endpoint "/api/Rollover/SaveRollover"
   When Configuration has been made as per following
           | key              | value |
           | rollOversAllowed | true  |
           | rollOversFee     |   200 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveRollOverAsync"
  Then API should respond with successful message

  Scenario:  Rollover fee is null
  Given Model is selected for the endpoint "/api/Rollover/SaveRollover"
   When Configuration has been made as per following
           | key              | value |
           | rollOversAllowed | true  |
           | rollOversFee     |       |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveRollOverAsync"
 Then API should give response as "PL1080 : Required"