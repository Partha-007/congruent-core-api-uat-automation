Feature: A_EntryDate
[BeforeTestRun]

Scenario: o verify the validation message for Prospective/retrospective criteria is empty
  Given Model is selected for the endpoint "/api/EntryDate/SaveEntryDate"
  When the property "entryDateRule" is configured as "1"
  And the property "prospectiveOrRetrospective" is configured as ""
  And API request has been sent to the "IPlanDetailsSave" with the method name "SaveEntryDate"
  Then API should give response as "PL722 : Required"