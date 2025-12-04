Feature: B_HardshipEarlyPenalty
[BeforeTestRun]


  Scenario: Hardship Early Penalty configured with Null
  Given Model is selected for the endpoint "/api/Withdrawal/SaveWithdrawal"
   When Configuration has been made as per following
           | key                          | value |
           | withDrawalType               | 2 |
           | hardshipReason               | 1 |
           | earlyWithdrawalPenalty       |  |
           | paymentMethod                | 1, |
           | distributionAllocationMethod | 1,|
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveWithdrawalAsync"
  Then API should give response as "PL1128 : Required"
