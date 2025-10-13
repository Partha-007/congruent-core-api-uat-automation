Feature: PayrollFrequency

A short summary of the feature

#@tag1
#scenario: [scenario name]
#	given [context]
#	when [action]
#	then [outcome]

Scenario: Alphabets acceptance of payroll frequency page 
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
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



 Scenario: Numerics acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "Numerics" with 5 characters
  When the property "frequencyType" is configured with "Numerics" with 0 characters
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
 Then API should give response as "CM012:Required"

 Scenario: specialCharacters acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "specialCharacters" with 5 characters
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
  Then API should give response as "CM090:Frequency Name should be alpha numeric (including hyphen)."


Scenario: AlphaNumerics acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphaNumerics" with 5 characters
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

Scenario: AlphaNumeric WithSpecialCharacters acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphaNumericWithSpecialCharacters" with 15 characters
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
 Then API should give response as "CM090:Frequency Name should be alpha numeric (including hyphen)."

 Scenario: Alphabets acceptance with 20 characters in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 20 characters
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

   Scenario: Alphabets acceptance with below 20 characters in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 18 characters
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

  Scenario: Alphabets acceptance with null characters in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 0 characters
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
  Then API should give response as "CM052:Required"

   Scenario: Alphabets acceptance with more than 20 characters in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 21 characters
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
  Then API should give response as "CM024:Frequency name length should not exceed  20 characters."

  Scenario: freq type 4 acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 4     |
| startDay      | 1     |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
  Then API should respond with successful message 

  
  Scenario: freq type 5 acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 5     |
| startMonth    | 1     |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
  Then API should respond with successful message 

  Scenario: freq type 6 acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 6     |
| startMonth    | 1     |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
  Then API should respond with successful message 

  Scenario: freq type 7 acceptance of payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
				| Key           | Value      |
				| frequencyType |    7	     |
				| startMonth	|    1		 |
				| startDay		|    1		 |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
  Then API should respond with successful message 

    Scenario: startDay as null in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 2     |
| startDay      |       |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should give response as "CM013:Required"

    Scenario:  secondBeginDay as null in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key            | Value |
| frequencyType  | 3     |
| secondBeginDay |       |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
 Then API should give response as "CM016:Required"

 
    Scenario:  firstBeginDay as null in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 3     |
| firstBeginDay |       |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
 Then API should give response as "CM015:Required"

 
   Scenario:  starting month of every month as null in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 6     |
| startMonth    |       |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
 Then API should give response as "CM019:Required"

  Scenario: starting month for quarterly as null in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When the property "frequencyName" is configured with "alphabets" with 5 characters
  And Configuration has been done as mentioned below
| Key           | Value |
| frequencyType | 5     |
| startMonth    |       |
  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
  Then API should give response as "CM018:Required"
 














