Feature: Fund switch


Scenario: Fund switch

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

And Create a fund switch transaction in "Plan" level with investments from "SEAS001" to "SEAS002"

And Trade procedures completed for the transaction "Fund Switch"

