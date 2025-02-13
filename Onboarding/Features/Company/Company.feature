Feature: Company




Scenario: Company name field required validation
	Given Model is selected for the endpoint "/api/v1/Company"
	When the property "name" is configured with "alphabets" with 10 characters
	And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
	Then API should give response as "CM001 : Required"


Scenario Outline: Company name field positive acceptance
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured as "<companyName>" 

Examples: 
| companyName |
| abcd        |
| 1234        |
| !@#$        |


Scenario: Company model with multiple properties configured
Given Model is selected for the endpoint "/api/v1/Company"
When Configuration has been made as per following
| propertyName | value |
| name         |       |
| postalCode   | abced |
| taxEIN       |       |  
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM001 : Required"
