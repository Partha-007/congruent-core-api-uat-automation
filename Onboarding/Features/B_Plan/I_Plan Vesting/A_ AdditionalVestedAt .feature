Feature: A_ AdditionalVestedAt 
[BeforeTestRun]

Scenario: Additional VestedAt field configure with Death
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
  When Configuration has been made as per following
           | key                  | value |
           | vestedAt   |     1 |
           And Collection in a model is configured with 1 blocks for the property "EmployeeClassificationCodes" with values to save model portfolio as given below
 | BlockNumber | Key  | Value |
 | 1           | Code | 2     |
And "additionalVestings" "vestedAt" parse "1" to the list
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
  Then API should give response as "PL1092 : Required"

