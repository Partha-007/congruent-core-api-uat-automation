Feature: Payroll




Scenario: [scenario name]
	Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key               | Value         |
| HIRE DATE         | 01/01/2021    |
| HOURS             | 1000          |
| PAY DATE          | 12/01/2021    |
| BIRTH DATE        | 04/01/1996    |
| PAYROLL FREQUENCY | DemoFrequency |
When File upload is executed for the file "CombinedFile.csv"

@SaveEmployee
Scenario: Employee save through payroll file upload

