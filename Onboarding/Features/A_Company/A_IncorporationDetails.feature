Feature: A_IncorporationDetails


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




Scenario: Alphabets acceptance of incorporation details page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "1name" is configured with "alphabets" with 10 characters
  And the property "address1" is configured with "alphabets" with 10 characters
  And the property "address2" is configured with "alphabets" with 10 characters
  And the property "city" is configured with "alphabets" with 10 characters
  And the property "postalCode" is configured with "alphabets" with 10 characters
  And the property "sponsorPostalCode" is configured with "alphabets" with 10 characters
  And the property "email" is configured as "test123@test.com"
  And the property "phoneNumber" is configured with "alphabets" with 10 characters
  And the property "website" is configured as "test123@test.com"
  And the property "taxEIN" is configured with "alphabets" with 7 characters
  And the property "sicCode" is configured with "alphabets" with 4 characters
  And the property "businessCode" is configured with "alphabets" with 6 characters
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
  Then the API response should contain the 5 following errors 
| error_code | error_message                                                   |
| CM007      | ZIP Code should be either 5 or 9 characters.                    |
| CM008      | Phone Number should be in the format XXX-XXX-XXXX               |
| CM003      | Tax EIN should be of valid format (xx-xxxxxxx)                  |
| CM046      | SIC Code should be Numbers                                      |
| CM048      | Business Code should be Numbers                                 |



 Scenario: Numerics acceptance of incorporation details page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "name" is configured with "Numerics" with 10 characters
  And the property "address1" is configured with "Numerics" with 10 characters
  And the property "address2" is configured with "Numerics" with 10 characters
  And the property "city" is configured with "Numerics" with 10 characters
  And the property "postalCode" is configured with "Numerics" with 9 characters
  And the property "sponsorPostalCode" is configured with "Numerics" with 10 characters
  And the property "email" is configured as "12345@test.com"
  And the property "phoneNumber" is configured with "Numerics" with 10 characters
  And the property "website" is configured as "123@test.com"
  And the property "taxEIN" is configured with "Numerics" with 7 characters
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
  Then the API response should contain the 3 following errors 
| error_code | error_message                                                   |
| CM003      | Tax EIN should be of valid format (xx‑xxxxxxx)                  |
| CM007      | ZIP Code should be either 5 or 9 characters.                    |
| CM008      | Phone Number should be in the format XXX‑XXX‑XXXX               |


 Scenario: specialCharacters acceptance of incorporation details page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "name" is configured with "specialCharacters" with 10 characters
  And the property "address1" is configured with "specialCharacters" with 10 characters
  And the property "address2" is configured with "specialCharacters" with 10 characters
  And the property "city" is configured with "specialCharacters" with 10 characters
  And the property "postalCode" is configured with "specialCharacters" with 10 characters
  And the property "sponsorPostalCode" is configured with "specialCharacters" with 10 characters
  And the property "email" is configured as "&^%$*@test.com"
  And the property "phoneNumber" is configured with "specialCharacters" with 10 characters
  And the property "website" is configured as "@~`!@#$%^&*()@test.com"
  And the property "taxEIN" is configured with "specialCharacters" with 7 characters
  And the property "sicCode" is configured with "specialCharacters" with 4 characters
  And the property "businessCode" is configured with "specialCharacters" with 6 characters
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
  Then the API response should contain the 5 following errors 
| error_code | error_message                                                   |
| CM007      | ZIP Code should be either 5 or 9 characters.                    |
| CM008      | Phone Number should be in the format XXX-XXX-XXXX               |
| CM003      | Tax EIN should be of valid format (xx-xxxxxxx)                  |
| CM046      | SIC Code should be Numbers                                      |
| CM048      | Business Code should be Numbers                                 |


Scenario: AlphaNumerics acceptance of incorporation details page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "name" is configured with "alphaNumerics" with 10 characters
  And the property "address1" is configured with "alphaNumerics" with 10 characters
  And the property "address2" is configured with "alphaNumerics" with 10 characters
  And the property "city" is configured with "alphaNumerics" with 10 characters
  And the property "postalCode" is configured with "alphaNumerics" with 10 characters
  And the property "sponsorPostalCode" is configured with "alphaNumerics" with 10 characters
  And the property "email" is configured as "ab2#v@test.com"
  And the property "phoneNumber" is configured with "alphaNumerics" with 10 characters
  And the property "website" is configured as "vwxyz012345678@test.com"
  And the property "taxEIN" is configured with "alphaNumerics" with 7 characters
  And the property "sicCode" is configured with "alphaNumerics" with 4 characters
  And the property "businessCode" is configured with "alphaNumerics" with 6 characters
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
  Then the API response should contain the 5 following errors 
| error_code | error_message                                                   |
| CM007      | ZIP Code should be either 5 or 9 characters.                    |
| CM008      | Phone Number should be in the format XXX-XXX-XXXX               |
| CM003      | Tax EIN should be of valid format (xx-xxxxxxx)                  |
| CM046      | SIC Code should be Numbers                                      |
| CM048      | Business Code should be Numbers                                 |


Scenario: AlphaNumeric WithSpecialCharacters acceptance of incorporation details page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "name" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "address1" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "address2" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "city" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "postalCode" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "sponsorPostalCode" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "email" is configured as "ab25dg@test.com"
  And the property "phoneNumber" is configured with "alphaNumericWithSpecialCharacters" with 10 characters
  And the property "website" is configured as "vwxyz0123456789~`!@#$%^&*()@test.com"
  And the property "taxEIN" is configured with "alphaNumericWithSpecialCharacters" with 7 characters
  And the property "sicCode" is configured with "alphaNumericWithSpecialCharacters" with 4 characters
  And the property "businessCode" is configured with "alphaNumericWithSpecialCharacters" with 6 characters
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
  Then the API response should contain the 5 following errors 
| error_code | error_message                                                   |
| CM007      | ZIP Code should be either 5 or 9 characters.                    |
| CM008      | Phone Number should be in the format XXX-XXX-XXXX               |
| CM003      | Tax EIN should be of valid format (xx-xxxxxxx)                  |
| CM046      | SIC Code should be Numbers                                      |
| CM048      | Business Code should be Numbers                                 |

####################

Scenario: Validating the incorporation details page below the limits
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "1name" is configured with "alphabets" with 127 characters
  And the property "address1" is configured with "alphabets" with 99 characters
  And the property "address2" is configured with "alphabets" with 99 characters
  And the property "city" is configured with "alphabets" with 29 characters
  And the property "postalCode" is configured with "Numerics" with 6 characters
  And the property "sponsorPostalCode" is configured with "Numerics" with 10 characters
  And the property "email" is configured as "abcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdeabcdes@test.com"
  And the property "phoneNumber" is configured with "Numerics" with 9 characters
  And the property "website" is configured as "eabcdeabcdeabcdeaabcdeabcde@test.com"
  And the property "taxEIN" is configured with "Numerics" with 8 characters
  And the property "sicCode" is configured with "Numerics" with 3 characters
  And the property "businessCode" is configured with "Numerics" with 5 characters
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
    Then the API response should contain the 5 following errors 
| error_code | error_message                                     |
| CM003      | Tax EIN should be of valid format (xx-xxxxxxx)    |
| CM008      | Phone Number should be in the format XXX-XXX-XXXX |
| CM054      | SIC should be of valid format (xxxx)              |
| CM056      | Business Code should be of valid format (xxxxxx)  |
| CM007      | ZIP Code should be either 5 or 9 characters.      |

  

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


Scenario: Validating the postalCode field with exact length
Given Model is selected for the endpoint "/api/v1/Company"
When the property "postalCode" is configured with "Numerics" with 5 characters
And the property "state" is configured as "NM"
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

Scenario: Validating the postalCode field below the limits
Given Model is selected for the endpoint "/api/v1/Company"
When the property "postalCode" is configured with "Numerics" with 4 characters
And the property "email" is configured as "abcdefghi"
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
| error_code | error_message                                |
| CM007      | ZIP Code should be either 5 or 9 characters. |
| CM009      | Email address is invalid                     |

Scenario: Validating the incorporation page by leaving space
Given Model is selected for the endpoint "/api/v1/Company"
When the property "address1" is configured as "  "
And the property "address2" is configured as "  "
And the property "city" is configured as "  "
And the property "1name" is configured as "  "
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
Then API should give response as "CM001 : Required"


Scenario: recordkeeper
Given Model is selected for the endpoint "api/v1/Company/SaveRecordKeepers"
  
  When Configuration has been made as per following
           | key  | value              |
           | name | <recordKeeperName> |

  And API request has been sent to the "ICompanyDetails" with the method name "SaveRecordKeepersAsync"
  Given Model is selected for the endpoint "/api/v1/Company"
 When Configuration has been made as per following
           | key  | value  |
           | recordKeeperId | <RecordKeeperId> |

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
Examples: 

| recordKeeperName            |
| random 30 alphabets         |
| random 29 alphabets         |
| random 10 alphabets         |
| random 10 alphaNumerics     |
| random 10 numerics          |
| random 10 specialcharacters |


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

#Scenario: Company taxiEin field required validation
#	Given Model is selected for the endpoint "/api/v1/Company"
#	When the property "taxEIN" is configured as ""
#	And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#	Then API should give response as "CM057 : Required"

























#Scenario: Company model with multiple properties configured
#Given Model is selected for the endpoint "/api/v1/Company"
#When Configuration has been made as per following
#| propertyName | value |
#| name         |       |
#| postalCode   | abced |
#| taxEIN       |       |  
#And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#Then API should give response as "CM001 : Required"
