Feature: A_EntryDate
[BeforeTestRun]

Scenario: o verify the validation message for Prospective/retrospective criteria is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "1"
  And the property "prospectiveOrRetrospective" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL722 : Required"

  Scenario: To verify the validation message for plan entry date field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "entryDateRule" is configured as ""
# And the property "prospectiveOrRetrospective" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL715 : Required"

  Scenario:To verify the validation message for source entry date field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "entryDateRule" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  When the property "ruleName" is configured as "abc1263"
  When the property "entryDateRule" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL715 : Required"

  Scenario: To verify the validation message for Other Entry date month field
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "7"
  And the property "month" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1115 : Required"


  Scenario: To verify the validation message for source name field empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
   When the property "ruleName" is configured as "abc123"
  When the property "entryDateRule" is configured as "2"
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

      Scenario:To verify the validation message for already exit month and date 
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "ruleName" is configured as "abc123" 
    When the property "entryDateRule" is configured as "7"
  When the property "month" is configured as "2"
  When the property "day" is configured as "1"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
      When the property "entryDateRule" is configured as "7"
      When the property "ruleName" is configured as "abc1243" 
  When the property "month" is configured as "2"
  When the property "day" is configured as "1"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1042 : The entered day and month already exists for the plan"

      Scenario:To verify the validation message for Is coinciding with applicable field is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "1"
   When the property "ruleName" is configured as "abc1243" 
  When the property "prospectiveOrRetrospective" is configured as "1"
   When the property "isCoincidingApplicable" is configured as "true"
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

   Scenario:To verify the validation message for already exit month and date when Switch to plan year is "yes"
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "isSwitchToPlanYearHaveDifferentEntryDates" is configured as "true"
  When the property "additionalEntryDateRule" is configured as "7"
  When the property "month" is configured as "2"
   When the property "day" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  When the property "month" is configured as "2"
   When the property "day" is configured as "0"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL1044 : The entered day and month already exists for the plan"