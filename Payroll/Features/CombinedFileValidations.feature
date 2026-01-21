Feature: CombinedFileValidations


@PlanActivationWithoutInvestmentAndEnrollment
Scenario: To verify the Address 1 column value name with Null  in Census Excel/CSV template
Given Investment "SEAS001" has been mapped to the plan

And Investment "SEAS002" has been mapped to the plan

And Enrollment configuration

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key         | Value |
| ADDRESS 1   |       |
| ADDRESS 2   |       |
| HIRE DATE   |       |
| FIRST NAME  |       |
| EMPLOYEE ID |       | 

When File upload is executed for the file "CombinedFile.csv" to the test endpoint

Then Payroll API should respond for "address1" with Error report message as "EM004 : Employee's Address is required." and ECR page message as "EM017 : Required".
