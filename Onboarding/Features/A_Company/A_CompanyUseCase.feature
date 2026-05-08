Feature: A_CompanyUseCase


Scenario: incorporation details page required validation when assigned as null
	Given Model is selected for the endpoint "/api/v1/Company"
	When the property "1name" is configured as ""
	When the property "address1" is configured as ""
	When the property "address2" is configured as ""
	When the property "city" is configured as ""
    When the property "postalCode" is configured as ""
	When the property "sponsorPostalCode" is configured as ""
	When the property "email" is configured as ""
	When the property "phoneNumber" is configured as ""
	When the property "website" is configured as ""
	When the property "taxEIN" is configured as ""
	When the property "sicCode" is configured as ""
	When the property "taxedAs" is configured as ""
	When the property "country" is configured as ""
	When the property "state" is configured as ""
	When the property "companyStartDate" is configured as ""
	When the property "operatesAs" is configured as ""
	When the property "fisicalYearMonth" is configured as ""
	When the property "fisicalYearDay" is configured as ""
	When the property "stateOfIncorporation" is configured as ""
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
	Then the API response should contain the 2 following errors 
	| error_code |   error_message |
    | CM001      |   Required      |
    | CM057      |   Required      |





  

Scenario: Validating the incorporation details page with exact length
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "1name" is configured with "alphabets" with 128 characters
  And the property "address1" is configured with "alphabets" with 100 characters
  And the property "address2" is configured with "alphabets" with 100 characters
  And the property "city" is configured with "alphabets" with 30 characters
  And the property "postalCode" is configured as "12345-6789"
  And the property "sponsorPostalCode" is configured with "Numerics" with 10 characters
  And the property "email" is configured as "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdes@test.com"
  And the property "phoneNumber" is configured as " 123-234-1234"
  And the property "website" is configured as "abcdeabcdeabcdeabcdeaabcdeabcde@test.com"
  And the property "state" is configured as "AT"
  And the property "stateOfIncorporation" is configured as "AL"
  And the property "country" is configured as "other"
  And the property "businessType" is configured as "4"
  And the property "taxedAs" is configured as "1"
  And the property "operatesAs" is configured as "1"
  And the property "fisicalYearMonth" is configured as "2"
  And the property "fisicalYearDay" is configured as "2"
  And the property "companyStartDate" is configured as "2006-07-08T00:00:00Z"
	And the property "taxEIN" is configured with "TaxEIN" with 9 characters
  And the property "sicCode" is configured with "Numerics" with 4 characters
  And the property "businessCode" is configured with "Numerics" with 6 characters
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

Scenario: Validating the incorporation details page with exceeded limit
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "name" is configured with "alphabets" with 129 characters
  And the property "address1" is configured with "alphabets" with 101 characters
  And the property "address2" is configured with "alphabets" with 101 characters
  And the property "city" is configured with "alphabets" with 31 characters
  And the property "postalCode" is configured with "Numerics" with 10 characters
  And the property "sponsorPostalCode" is configured with "Numerics" with 10 characters
  And the property "email" is configured as "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdefghchgabcdeabcdeabcdeabcdes@test.com"
  And the property "phoneNumber" is configured with "Numerics" with 11 characters
  And the property "website" is configured as "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdes@test.com"
  And the property "taxEIN" is configured with "Numerics" with 10 characters
  And the property "sicCode" is configured with "Numerics" with 5 characters
  And the property "businessCode" is configured with "Numerics" with 7 characters
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
  Then the API response should contain the 11 following errors 
| error_code | error_message                                                 |
| CM011      | Company Website length should not be more than 40 Characters. |
| CM002      | Company name length should not exceed 128 characters.         |
| CM004      | Address 1 length should not exceed 100 characters.            |
| CM005      | Address 2 length should not exceed 100 Characters.            |
| CM006      | City length should not exceed 30 characters.                  |
| CM007      | ZIP Code should be either 5 or 9 characters.                  |
| CM008      | Phone Number should be in the format XXX-XXX-XXXX             |
| CM054      | SIC should be of valid format (xxxx)                          |
| CM056      | Business Code should be of valid format (xxxxxx)              |
| CM003      | Tax EIN should be of valid format (xx-xxxxxxx)                |
| CM010      | Email Address should not exceed 80 characters.                |




Scenario: Validating the taxEIN field with existing taxEIN
Given Model is selected for the endpoint "/api/v1/Company"

When the property "taxEIN" is configured as "31-2229682" 

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

And the property "name" is configured with "alphabets" with 5 characters

And the property "taxEIN" is configured as "31-2229682" 

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

Then API should give response as "CM014 : Tax EIN already exists"

























