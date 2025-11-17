Feature: A_ReallocationLimit
[BeforeTestRun]

Scenario:  Transfer reallocationLimit configure with 1
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
   When the property "reallocationLimit" is configured as "1"
   And "plan" "typesPermitted" parse "1" to the list
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

  Scenario:  Transfer reallocationLimit configure with null
   Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
   When the property "reallocationLimit" is configured as ""
   And "plan" "typesPermitted" parse "1" to the list
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
 Then API should give response as "PL1080 : Required"
