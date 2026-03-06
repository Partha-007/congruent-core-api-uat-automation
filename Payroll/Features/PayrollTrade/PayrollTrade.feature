@PayrollTradeSetup
Feature: PayrollTrade

Scenario: Validate Employee Account balance After Payroll Contribution Trade(Positive Flow)


Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              |       1000 |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| EEPreTax           |       4000 |
| EERoth             |       3000 |
| Match              |       3000 |
| PLAN COMPENSATION  |      10000 |
| GROSS COMPENSATION |      10000 |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"


Then The source "EEPreTax" should match the following balances
  | Level      | Name     | RegularAccountBalance | TotalAccountBalance | TotalEarningsBalance |
  | Source     | EEPreTax |               4000.00 |            10000.00 |                 0.00 |
  | Investment | SEAS001  |               7000.00 |             7000.00 |               100.00 |
  | Investment | SEAS002  |               3000.00 |             3000.00 |               100.00 |  
