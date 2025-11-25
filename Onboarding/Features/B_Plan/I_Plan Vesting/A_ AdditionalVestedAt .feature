Feature: A_ AdditionalVestedAt 
[BeforeTestRun]

Scenario: Additional VestedAt field configure with Death
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When "plan" "vestedAt" parse "1" to the list
And "additionalVestings" "vestedAt" parse "1" to the list
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
  Then API should give response as "PL1092 : Required"

