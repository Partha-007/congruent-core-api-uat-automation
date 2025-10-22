Feature: PayrollFrequency

A short summary of the feature

#@tag1
#scenario: [scenario name]
#	given [context]
#	when [action]
#	then [outcome]

#Scenario: Alphabets acceptance of payroll frequency page 
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 



 #Scenario: Numerics acceptance of payroll frequency page
 # Given Model is selected for the endpoint "/api/v1/Company"
 # When the property "FrequencyName" is configured with "Numerics" with 5 characters
  #When the property "FrequencyType" is configured with "Numerics" with 0 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 0        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
# Then API should give response as "CM012:Required"

# Scenario: specialCharacters acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "specialCharacters" with 5 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should give response as "CM090:Frequency Name should be alpha numeric (including hyphen)."
#
#
#Scenario: AlphaNumerics acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphaNumerics" with 5 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
# Then API should respond with successful message
#
#Scenario: AlphaNumeric WithSpecialCharacters acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphaNumericWithSpecialCharacters" with 15 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
# Then API should give response as "CM090:Frequency Name should be alpha numeric (including hyphen)."

# Scenario: Alphabets acceptance with 20 characters in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphabets" with 20 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 
#
#   Scenario: Alphabets acceptance with below 20 characters in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphabets" with 18 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 
#
#  Scenario: Alphabets acceptance with null characters in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphabets" with 0 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should give response as "CM052:Required"
#
#   Scenario: Alphabets acceptance with more than 20 characters in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "FrequencyName" is configured with "alphabets" with 21 characters
#  And Configuration has been done as mentioned below
#| key                        | value    |
#| FrequencyType              | 1        |
#| modeOfHours                | 1        |
#| modeOfCompensation         | 1        |
#| modeOfContribution         | 1        |
#| employeeClassificationType | 1        |
#| code                       | L1       |
#| classificationName         | Location |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should give response as "CM024:Frequency name length should not exceed  20 characters."
#
#  Scenario: freq type 4 acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 4     |
#| startDay      | 1     |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 
#
#  
#  Scenario: freq type 5 acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 5     |
#| startMonth    | 1     |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 
#
#  Scenario: freq type 6 acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 6     |
#| startMonth    | 1     |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 
#
#  Scenario: freq type 7 acceptance of payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#				| Key           | Value      |
#				| frequencyType |    7	     |
#				| startMonth	|    1		 |
#				| startDay		|    1		 |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should respond with successful message 
##
#    Scenario: startDay as null in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 2     |
#| startDay      |       |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#Then API should give response as "CM013:Required"
#
#    Scenario:  secondBeginDay as null in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key            | Value |
#| frequencyType  | 3     |
#| secondBeginDay |       |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
# Then API should give response as "CM016:Required"
#
# 
#    Scenario:  firstBeginDay as null in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 3     |
#| firstBeginDay |       |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
# Then API should give response as "CM015:Required"
#
# 
#   Scenario:  starting month of every month as null in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 6     |
#| startMonth    |       |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
# Then API should give response as "CM019:Required"
#
#  Scenario: starting month for quarterly as null in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When the property "frequencyName" is configured with "alphabets" with 5 characters
#  And Configuration has been done as mentioned below
#| Key           | Value |
#| frequencyType | 5     |
#| startMonth    |       |
#  And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#  Then API should give response as "CM018:Required"
#
# Scenario: validating the frequencytype as null an values in payroll frequency page
#  Given Model is selected for the endpoint "/api/v1/Company"
#  When Collection in a model is configured with 24 blocks for the property "PayrollFrequencies" with values to save model portfolio as given below
#| BlockNumber | Key               | Value                                      |
##| 1           | FrequencyName     | random 5 alphabets                         |
##| 1           | FrequencyType     | 1                                          |
##| 2           | FrequencyName     | random 5 alphabets                         |
##| 2           | FrequencyType     | 4                                          |
##| 2           | StartDay          | 1                                          |
#| 3           | FrequencyName     | random 5 alphabets                         |
#| 3           | FrequencyType     | 5                                          |
#| 3           | StartMonth        |                                            |
#| 4           | FrequencyName     | random 5 alphabets                         |
#| 4           | FrequencyType     | 6                                          |
#| 4           | StartMonth        |                                            |
##| 5           | FrequencyName     | random 5 alphabets                         |
##| 5           | FrequencyType     | 7                                          |
##| 5           | StartMonth        | 1                                          |
##| 5           | StartDay          | 1                                          |
#| 6           | FrequencyName     | random 5 alphabets                         |
#| 6           | FrequencyType     | 2                                          |
#| 6           | StartDay          |                                            |
#| 7           | FrequencyName     | random 5 alphabets                         |
#| 7           | FrequencyType     | 3                                          |
#| 7           | FirstBeginDay     | 1                                          |
#| 7           | SecondBeginDay    |                                            |
#| 8           | FrequencyName     | random 5 alphabets                         |
#| 8           | FrequencyType     | 3                                          |
#| 8           | FirstBeginDay     |                                            |
##| 9           | FrequencyName     | random 5 alphabets                         |
##| 9           | FrequencyType     | 6                                          |
##| 9           | StartMonth        | 1                                           |
##| 10          | FrequencyName     | random 5 alphabets                         |
##| 10          | FrequencyType     | 5                                          |
##| 10          | StartMonth        | 1                                           |
#| 11          | FrequencyName     | random 5 alphabets                         |
#| 11          | FrequencyType     | 7                                          |
#| 11          | StartMonth        |                                            |
#| 11          | StartDate         | 8                                          |
#| 12          | FrequencyName     | random 5 alphabets                         |
#| 12          | FrequencyType     | 7                                          |
#| 12          | StartMonth        | 1                                          |
#| 12          | StartDate         |                                            |
#| 13          | FrequencyName     | random 5 alphabets                         |
#| 13          | FrequencyType     | 4                                          |
#| 13          | StartDate         |                                            |
#| 14          | FrequencyName     | random 5 alphabets                         |
#| 14          | FrequencyType     | 3                                          |
#| 14          | FirstBeginDay     | 1                                          |
#| 14          | SecondBeginDay    | 1                                          |
#| 15          | FrequencyName     | random 5 numerics                          |
#| 15          | FrequencyType     | 0                                          |
#| 16          | FrequencyName     | random 5 specialCharacters                 |
#| 16          | FrequencyType     | 1                                          |
#| 17          | FrequencyName     | random 5 alphaNumerics                     |
#| 17          | FrequencyType     | 1                                          |
#| 18          | FrequencyName     | random 5 alphaNumericWithSpecialCharacters |
#| 18          | FrequencyType     | 1                                          |
##| 19          | FrequencyName     | random 20 alphabets                        |
##| 19          | FrequencyType     | 1                                          |
##| 20          | FrequencyName     | random 18 alphabets                        |
##| 20          | FrequencyType     | 1                                          |
#| 21          | FrequencyName     | random 0 alphabets                         |
#| 21          | FrequencyType     | 1                                          |
#| 22          | FrequencyName     | random 30 alphabets                        |
#| 22          | FrequencyType     | 1                                          |
##| 23          | FrequencyName     | random 5 numerics                          |
##| 23          | FrequencyType     | 1                                          |
#| 24          | FrequencyName     | random 21 alphabets                        |
#| 24          | FrequencyType     | 8                                          |
#| 24          | BiWeeklyStartDate |                                            |
#
##|             | FrequencyName     | weeklyFreqInput1                           |
##|             | FrequencyType     | 1                                          |
##|             | StartDay          | 1                                          |
#And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
#Then the API response should contain the 15 following errors
#| error_code | error_message                                               |
#| CM013      | Required                                                    |
#| CM016      | Required                                                    |
#| CM015      | Required                                                    |
#| CM019      | Required                                                    |
#| CM018      | Required                                                    |
#| CM021      | Required                                                    |
#| CM020      | Required                                                    |
#| CM017      | Required                                                    |
#| CM022      | Second Begin Day should not be equal to the First Begin Day |
#| CM012      | Required                                                    |
#| CM090      | Frequency Name should be alpha numeric (including hyphen).  |
#| CM090      | Frequency Name should be alpha numeric (including hyphen).  |
#| CM052      | Required                                                    |
#| CM024      | Frequency name length should not exceed 20 characters.      |
#| CM051      | Required                                                    |

Scenario: PayrollFrequency (successful response)
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 8 blocks for the property "PayrollFrequencies" with values to save model portfolio as given below
| BlockNumber | Key           | Value               |
| 1           | FrequencyName | weeklyFreqInput1    |
| 1           | FrequencyType | 1                   |
| 1           | StartDay      | 1                   |
| 2           | FrequencyName | random 5 alphabets  |
| 2           | FrequencyType | 4                   |
| 2           | StartDay      | 1                   |
| 3           | FrequencyName | random 5 alphabets  |
| 3           | FrequencyType | 7                   |
| 3           | StartMonth    | 1                   |
| 3           | StartDay      | 1                   |
| 4           | FrequencyName | random 5 alphabets  |
| 4           | FrequencyType | 6                   |
| 4           | StartMonth    | 1                   |
| 5           | FrequencyName | random 5 alphabets  |
| 5           | FrequencyType | 5                   |
| 5           | StartMonth    | 1                   |
| 6           | FrequencyName | random 20 alphabets |
| 6           | FrequencyType | 1                   |
| 7           | FrequencyName | random 18 alphabets |
| 7           | FrequencyType | 1                   |
| 8           | FrequencyName | random 5 numerics   |
| 8           | FrequencyType | 1                   |
| 9           | FrequencyName | weeklyFreqInput1    |
| 9           | FrequencyType | 1                   |
| 9           | StartDay      | 1                   |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message


 Scenario: validating the frequencytype with given values in payroll frequency page
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 15 blocks for the property "PayrollFrequencies" with values to save model portfolio as given below
| BlockNumber | Key               | Value                                       |
| 1           | FrequencyName     | random 5 specialCharacters                  |
| 1           | FrequencyType     | 1                                           |
| 2           | FrequencyName     | random 15 alphaNumericWithSpecialCharacters |
| 2           | FrequencyType     | 1                                           |
| 3           | FrequencyName     | random 0 alphabets                          |
| 3           | FrequencyType     | 1                                           |
| 4           | FrequencyName     | random 30 alphabets                         |
| 4           | FrequencyType     | 1                                           |
| 5           | FrequencyName     | random 5 alphabets                          |
| 5           | FrequencyType     | random 0 numerics                           |
| 6           | FrequencyName     | random 5 alphabets                          |
| 6           | FrequencyType     | 2                                           |
| 6           | StartDay          |                                             |
| 7           | FrequencyName     | random 5 alphabets                          |
| 7           | FrequencyType     | 3                                           |
| 7           | FirstBeginDay     | 1                                           |
| 7           | SecondBeginDay    |                                             |
| 8           | FrequencyName     | random 5 alphabets                          |
| 8           | FrequencyType     | 3                                           |
| 8           | FirstBeginDay     |                                             |
| 8           | SecondBeginDay    | 1                                           |
| 9           | FrequencyName     | random 5 alphabets                          |
| 9           | FrequencyType     | 8                                           |
| 9           | BiWeeklyStartDate |                                             |
| 10          | FrequencyName     | random 5 alphabets                          |
| 10          | FrequencyType     | 6                                           |
| 10          | StartMonth        |                                             |
| 11          | FrequencyName     | random 5 alphabets                          |
| 11          | FrequencyType     | 5                                           |
| 11          | StartMonth        |                                             |
| 12          | FrequencyName     | random 5 alphabets                          |
| 12          | FrequencyType     | 7                                           |
| 12          | StartMonth        |                                             |
| 12          | StartDate         | 8                                           |
| 13          | FrequencyName     | random 5 alphabets                          |
| 13          | FrequencyType     | 7                                           |
| 13          | StartMonth        | 1                                           |
| 13          | StartDate         |                                             |
| 14          | FrequencyName     | random 5 alphabets                          |
| 14          | FrequencyType     | 4                                           |
| 14          | StartDate         |                                             |
| 15          | FrequencyName     | random 5 alphabets                          |
| 15          | FrequencyType     | 3                                           |
| 15          | FirstBeginDay     | 1                                           |
| 15          | SecondBeginDay    | 1                                           |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then the API response should contain the 15 following errors
| error_code | error_message                                               |
| CM090      | Frequency Name should be alpha numeric (including hyphen).  |
| CM090      | Frequency Name should be alpha numeric (including hyphen).  |
| CM052      | Required                                                    |
| CM024      | Frequency name length should not exceed 20 characters.      |
| CM012      | Required                                                    |
| CM013      | Required                                                    |
| CM016      | Required                                                    |
| CM015      | Required                                                    |
| CM051      | Required                                                    |
| CM019      | Required                                                    |
| CM018      | Required                                                    |
| CM021      | Required                                                    |
| CM020      | Required                                                    |
| CM017      | Required                                                    |
| CM022      | Second Begin Day should not be equal to the First Begin Day |



 














