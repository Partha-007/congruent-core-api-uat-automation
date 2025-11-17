Feature: B_Validation for EntryDate Name

[BeforeTestRun]

Scenario: Entry date Name field validation
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as "<RuleName>"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should respond with successful message
Examples: 
| RuleName            |
| random 10 alphabets |
| random 10 numerics  |
| random 50 alphabets |
| random 49 alphabets |


Scenario: Entry date Name field acceptance specialCharacters and alphanumericwithspecialCharacters
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as "<RuleName>"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
 Then API should give response as "PL1021 : Rule name should be alphanumeric"
Examples: 
| RuleName                                    |
| random 10 specialCharacters                 |
| random 10 alphaNumericWithSpecialCharacters |

Scenario: Entry date Name field validation when null
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
 Then API should give response as "PL173 : Required"

 Scenario: Entry date Name field validation when  space
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as " "
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
 Then API should give response as "PL173 : Required"

Scenario: Entry date Name field validation when above 50 charecters
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as "<RuleName>"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
 Then API should give response as "PL985 : Rule name should not exceed 50 characters"
 Examples: 
| RuleName             |
| random 100 alphabets |