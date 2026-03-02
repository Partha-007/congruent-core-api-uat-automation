Feature: C_Compensation

A short summary of the feature

#@tag1
#Scenario: [scenario name]
#	Given [context]
#	When [action]
#	Then [outcome]

Scenario: Validating the Compensation field
Given Model is selected for the endpoint "/api/v1/Company"
 When Configuration has been done as mentioned below
| key                        | value    |
| frequencyName              | Daily    |
| frequencyType              | 1        |
| modeOfHours                | 1        |
| modeOfCompensation         | 1        |
| modeOfContribution         | 1        |
| employeeClassificationType | 1        |
| code                       | L1       |
| classificationName         | Location |
When Configuration has been done as mentioned below
| Object Name | Object Name1           | Key        | Value   |
| company     | compensationCategories | name       | testing |
| company     | compensationCategories | isIncluded | true    |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message
