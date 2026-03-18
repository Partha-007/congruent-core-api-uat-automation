Feature: ForfeitureIn



Scenario: Forfeiture In through Break in service

Given Investment "SEAS003" has been mapped to the plan and trade identifier generated for the investment

And Configure Forfeiture In with the below details and map the investment "SEAS003" to the plan
| Key                  | Value |
| ForfeitureFundIn     |     1 |
| ForfeitureTreatment  |     1 |
| ForfeiturePeriodType |     1 |
| ForfeiturePeriod     |     1 |
| ForfeitureAtTerm     |     0 |

And Vesting model is selected

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2020 |
| HOURS              |       1000 |
| PAY DATE           | 02/01/2020 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| EEPreTax           |       5000 |
| Match              |       5000 |
| PLAN COMPENSATION  |      10000 |
| GROSS COMPENSATION |      10000 |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

And Trade procedures completed for the transaction "Forfeiture In through Break in service"