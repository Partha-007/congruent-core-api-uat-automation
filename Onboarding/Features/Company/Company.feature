Feature: Company




Scenario: Company name field required validation
	Given Model is selected for the endpoint "/api/v1/Company"
	When the property "name" is configured as ""
	And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
	Then API should give response as "CM001 : Required"


Scenario Outline: Company name field positive acceptance
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured as "<companyName>" 
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message
Examples: 
| companyName |
| abcd        |
| 1234        |
| !@#$        |
| abc123      |
| abc123!@#   |

Scenario: Company name field less than 128 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured with "alphabets" with 127 characters
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

Scenario: Company name field equal to 128 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured with "alphabets" with 128 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: Company name field more than 128 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured with "alphabets" with 129 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM002 : Company name length should not exceed 128 characters."

Scenario Outline: Address 1 field positive acceptance
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured as "<address1>" 
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message
Examples: 
| address1  | 
| abcd      |
| 1234      |
| !@#$      |
| abc123    |
| abc123!@# |

Scenario: Address 1 field less than 100 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address1" is configured with "alphabets" with 99 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: Address 1 field equal to 100 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address1" is configured with "alphabets" with 100 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: Address 1 field more than 128 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address1" is configured with "alphabets" with 101 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM004 : Address 1 length should not exceed 100 characters."


Scenario Outline: Address 2 field positive acceptance
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured as "<address2>" 
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message
Examples: 
| address2  | 
| abcd      |
| 1234      |
| !@#$      |
| abc123    |
| abc123!@# |

Scenario: Address 2 field less than 100 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address2" is configured with "alphabets" with 99 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: Address 2 field equal to 100 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address2" is configured with "alphabets" with 100 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: Address 2 field more than 128 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address2" is configured with "alphabets" with 101 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM004 : Address 1 length should not exceed 100 characters."


Scenario Outline: City field positive acceptance
Given Model is selected for the endpoint "/api/v1/Company"
When the property "name" is configured as "<city>" 
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message
Examples: 
| city      | 
| abcd      |
| 1234      |
| !@#$      |
| abc123    |
| abc123!@# |

Scenario: City field less than 30 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "city" is configured with "alphabets" with 29 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: City field equal to 30 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "city" is configured with "alphabets" with 30 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

Scenario: City field more than 30 characters
Given Model is selected for the endpoint "/api/v1/Company"
When the property "city" is configured with "alphabets" with 31 characters
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM004 : Address 1 length should not exceed 100 characters."





























Scenario: Company model with multiple properties configured
Given Model is selected for the endpoint "/api/v1/Company"
When Configuration has been made as per following
| propertyName | value |
| name         |       |
| postalCode   | abced |
| taxEIN       |       |  
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM001 : Required"
