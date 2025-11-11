Feature: B_Settings

A short summary of the feature


Scenario: Validating the settings page
Given Model is selected for the endpoint "/api/v1/Company"
When the property "modeOfCompensation" is configured as "1"
And the property "modeOfContribution" is configured as "1"
And the property "modeOfHours" is configured as "1"
And the property "isPayrollCalenderRequire" is configured as "true"
And the property "isLatePayrollApplicable" is configured as "true"
And the property "isPayrollConfirmationApplicable" is configured as "true"
And the property "isRehireDateLogicApplicable" is configured as "true"
And Configuration has been done as mentioned below
| key                        | value    |
| frequencyName              | Daily    |
| frequencyType              | 1        |
| modeOfHours                | 1        |
| modeOfCompensation         | 1        |
| modeOfContribution         | 1        |
| employeeClassificationType | 1        |
| code                       | L1       |
| classificationName         | Location |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message


Scenario: Validating the settings page with alternative values
Given Model is selected for the endpoint "/api/v1/Company"
When the property "modeOfCompensation" is configured as "2"
And the property "modeOfContribution" is configured as "2"
And the property "modeOfHours" is configured as "2"
And the property "isPayrollCalenderRequire" is configured as "false"
And the property "isLatePayrollApplicable" is configured as "false"
And the property "isPayrollConfirmationApplicable" is configured as "false"
And the property "isRehireDateLogicApplicable" is configured as "false"
And Configuration has been done as mentioned below
| key                        | value    |
| frequencyName              | Daily    |
| frequencyType              | 1        |
| modeOfHours                | 1        |
| modeOfCompensation         | 1        |
| modeOfContribution         | 1        |
| employeeClassificationType | 1        |
| code                       | L1       |
| classificationName         | Location |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message



