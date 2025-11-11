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
