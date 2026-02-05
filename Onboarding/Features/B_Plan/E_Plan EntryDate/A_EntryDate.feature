Feature: A_EntryDate
[BeforeTestRun]

#Scenario: Entry date Name field validation when above 50 charecters
Scenario: o verify the validation message for Prospective/retrospective criteria is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "1"
  And the property "prospectiveOrRetrospective" is configured as ""
   When Configuration has been made as per following
           | key      | value                |
           | ruleName | random 100 alphabets |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then the API response should contain the 2 following errors 
	| error_code | error_message                             |
	| PL722      | Required                                  |
	| PL985      | Rule name should not exceed 50 characters |

  #Scenario: Entry date Name field validation when null
  Scenario: To verify the validation message for plan entry date field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "entryDateRule" is configured as ""
  And the property "ruleName" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL715      | Required      |
	| PL173      | Required      |

  Scenario:To verify the validation message for source entry date field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "entryDateRuleFor" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  When the property "ruleName" is configured as "abc1263"
  When the property "entryDateRule" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL715 : Required"
  #Scenario: Enrty date Name field validation when entetering space

  Scenario: To verify the validation message for Other Entry date month field
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "7"
  And the property "month" is configured as "0"
    And the property "ruleName" is configured as "    "
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL1115     | Required      |
	| PL173      | Required      |


  Scenario: To verify the validation message for source name field empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "entryDateRuleFor" is configured as "2"
  When the property "entryDateRule" is configured as "2"
  When the property "entryDateSources" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1086 : Required"

  Scenario: To verify the validation message for Other Entry date day field
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "7"
  When the property "month" is configured as "2"
  When the property "day" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1082 : Required"

    Scenario:To verify the validation message for Other description field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"   
  When the property "entryDateRule" is configured as "7"
  When the property "otherDescription" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL726 : Required"

Scenario: To verify the validation message for already exit month and date 
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as "abc123" 
  When the property "entryDateRuleFor" is configured as "1"
  When the property "entryDateRule" is configured as "7"
   When Collection in a model is configured with 2 blocks for the property "OtherEntryDates" with values as given below
   | BlockNumber | Key   | Value |
   |           1 | Month |     2 |
   |           1 | Day   |     1 |
   |           2 | Month |     2 |
   |           2 | Day   |     1 |
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1042 : The entered day and month already exists for the plan"

      Scenario:To verify the validation message for Is coinciding with applicable field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "1"
   When the property "ruleName" is configured as "abc1243" 
  When the property "prospectiveOrRetrospective" is configured as "1"
   When the property "isCoincidingApplicable" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL723 : Required"

  
      Scenario:To verify the switch to plan year entry date is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  When the property "additionalEntryDateRule" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL721 : Required"

        Scenario:To verify the Prospective/retrospective criteria is after selection of Yes Does switch to plan year have different entry dates is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  When the property "additionalEntryDateRule" is configured as "1"
  When the property "additionalProspectiveOrRetrospective" is configured as ""
  When the property "isCoincidingApplicableForAdditional" is configured as "true"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL724 : Required"


          Scenario:To verify the Is coinciding with applicable is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  When the property "additionalEntryDateRule" is configured as "1"
  When the property "additionalProspectiveOrRetrospective" is configured as "1"
   When the property "isCoincidingApplicableForAdditional" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL725 : Required"

         Scenario:To verify the validation message for Other Entry date month field when Switch to plan year is "yes"
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  When the property "additionalEntryDateRule" is configured as "7"
  When the property "month" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1166 : Required"

  
  Scenario:To verify the validation message for Other Entry date day field when Switch to plan year is "yes"
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as "abc123"
  When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  When the property "additionalEntryDateRule" is configured as "7"
  When the property "month" is configured as "2"
   When the property "day" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1084 : Required"

  #Handled in frontend
  # Scenario:To verify the validation message for already exit month and date when Switch to plan year is "yes"
  #Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  #When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  #When the property "ruleName" is configured as "truabcdee"
  #When the property "additionalEntryDateRule" is configured as "7"
  #   When Collection in a model is configured with 2 blocks for the property "OtherEntryDates" with values as given below
  # | BlockNumber | Key     | Value |
  # |           1 | Month   |     2 |
  # |           1 | Day     |     0 |
  # |           2 | Month   |     2 |
  # |           2 | Day     |     0 |
  #And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  #Then API should give response as "PL1044 : The entered day and month already exists for the plan"

  Scenario: Entry date Name field validation
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
 When Configuration has been made as per following
           | key      | value      |
           | ruleName | <RuleName> |
   And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should respond with successful message
Examples: 
| RuleName            |
| random 10 alphabets |Scenario: Entry date Name field acceptance alphabets
| random 10 numerics  |Scenario: Entry date Name field acceptance numerics
| random 50 alphabets |Scenario: Entry date Name field acceptance when equal to 50 charecters
| random 49 alphabets |Scenario: Entry date Name field acceptance when below 50 charecters



#Restricted in UI:

#Scenario: Entry date Name field acceptance alphanumericwithspecialCharacters
#Scenario: Entry date Name field acceptance specialCharacters 
#  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
#  When the property "ruleName" is configured as "<RuleName>"
#  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
# Then API should give response as "PL1021 : Rule name should be alphanumeric"
#Examples: 
#| RuleName                                    |
#| random 10 specialCharacters                 |
#| random 10 alphaNumericWithSpecialCharacters |