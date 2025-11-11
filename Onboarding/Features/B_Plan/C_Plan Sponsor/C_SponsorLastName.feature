Feature: C_SponsorlastNameFeature
[BeforeTestRun]

Scenario: Sponsor Last name field(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured as "<LastName>"
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured with "Phone" with 10 characters
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then the API response should contain the 6 following errors 
| block | error_code | error_message                                   |
|     1 | PL045      | Required                                        |
|     2 | PL047      | FLast Name is not valid                         |
|     3 | PL047      | FLast Name is not valid                         |
|     4 | PL047      | FLast Name is not valid                         |
|     5 | PL047      | FLast Name is not valid                         |
|     6 | PL046      | LastName length should not exceed 30 characters |
Examples: 
| LastName                                   |
|                                            |
| random 5 specialCharacters                 |
| random 5 numerics                          |
| random 5 alphaNumericWithSpecialCharacters |
| asdfg1345                                  |
| random 35 alphabets                        |

Scenario: Sponsor Last name field( succcessfull response)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured as "<LastName>"
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured with "Phone" with 10 characters
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| LastName           |
| random 5 alphabets  |
| random 29 alphabets |
| random 30 alphabets |