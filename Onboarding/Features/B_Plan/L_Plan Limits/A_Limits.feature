Feature: A_Limits
[BeforeTestRun]

Scenario:  To validate Combined Limit Name field is length equal as 100 characters
  Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
   When the property "name" is configured with "alphabets" with 100 characters
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
  Then API should respond with successful message

  Scenario: To validate Combined Limit Name field is null
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
   When the property "name" is configured with "alphabets" with 0 characters
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then API should give response as "PL940 : Required"
