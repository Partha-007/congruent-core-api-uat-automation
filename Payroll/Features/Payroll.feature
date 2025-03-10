Feature: Payroll



@SaveEmployee
Scenario: Payroll file upload for an active plan
	Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value      |
| HIRE DATE         | 01/01/2025 |
| HOURS             | 1000       |
| PAY DATE          | 02/01/2025 |
| BIRTH DATE        | 04/01/1996 |
| PAYROLL FREQUENCY | Daily      |
| Pretax            | 100        |
When File upload is executed for the file "CombinedFile.csv"

@SaveEmployee
Scenario: Employee save through payroll file upload

