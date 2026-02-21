Feature: Transfer

This feature file contains scenarios for Transfer transaction and its impact on employee units 

Scenario: Transfer by units

Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"

When Configuration has been made as per following
| key                      | value |
| isTransferAllowed        | true  |
| showProspectusNotice     |     1 |
| numberOfTransfersAllowed |     5 |
| transferFrequency        |     1 |
| transfersCountStartsFrom |     1 |
| transferFee              |     1 |

When API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              |       1000 |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| EEPreTax           |      10000 |
| PLAN COMPENSATION  |      10000 |
| GROSS COMPENSATION |      10000 |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/v1/Transfer/SaveTransferDetailsForAdmin"

When Configuration has been made as per following
| Key            | Value        |
| employeeId     | <EmployeeId> |
| transferBy     |            1 |
| planId         | <PlanId>     |
| accountBalance |        10000 |
| vestedBalance  |        10000 |
| transferStatus |            2 |
| transferAmount |          100 |
| isProceed      | false        |

And Collection in a model is configured with 1 blocks for the property "TransferSourceDetails" with values as given below
| BlockNumber | Key        | Value            |
|           1 | SourceId   | <PretaxSourceID> |
|           1 | SourceName | EEPreTax         |

And Collection in a model is configured with 2 blocks for the property "InvestmentDetails" with values as given below
| BlockNumber | Key                   | Value              |
|           1 | InvestmentId          |                 92 |
|           1 | InvestmentType        |                  2 |
|           1 | SellInvestmentId      |                  0 |
|           1 | TradeType             |                  2 |
|           1 | InvestmentName        | SEAS001            |
|           1 | CurrentHoldingsAmount |               7000 |
|           1 | DraftPercentage       | 1.4285714285714286 |
|           1 | DraftAmount           |                100 |
|           1 | DraftUnits            |                 10 |
|           2 | InvestmentId          |                 93 |
|           2 | InvestmentType        |                  2 |
|           2 | SellInvestmentId      |                 92 |
|           2 | TradeType             |                  1 |
|           2 | InvestmentName        | SEAS002            |
|           2 | CurrentHoldingsAmount |               3000 |
|           2 | DraftPercentage       |                100 |
|           2 | DraftAmount           |                100 |
|           2 | DraftUnits            |                  0 |

When API request has been sent to the "ITransfer" with the method name "SaveTransferDetailsForAdminAsync"

And Trade procedures completed for the transaction "Transfer"

Then The source "EEPreTax" should match the following balances
  | Level      | Name     | RegularAccountBalance | TotalAccountBalance | TotalEarningsBalance |
  | Source     | EEPreTax | 10000.00              | 10000.00            | 0.00                 |
  | Investment | SEAS001  | 6900.00               | 6900.00             | -100.00              |
  | Investment | SEAS002  | 3100.00               | 3100.00             | 100.00               |