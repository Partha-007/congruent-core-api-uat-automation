Feature: A_HardshipBooleanValue
[BeforeTestRun]

Scenario: Hardship restrictNumberOfHardshipsInDefinedPeriod field accepts true
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                                      | value |
           | restrictNumberOfHardshipsInDefinedPeriod | true  |
           | withDrawalType                           |     2 |
           | distributionAllocationMethod             |     1 |
           | paymentMethod                            |     1 |
           
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
  Then API should respond with successful message

  


