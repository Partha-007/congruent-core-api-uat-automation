Feature: B_sponsorFirstName
[BeforeTestRun]

Scenario: Sponsor first name field required validation
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 0 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL049 : Required"

  Scenario: Sponsor first name field required validation (numerics)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "numerics" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL051 : First Name is not valid"

  Scenario: Sponsor first name field required validation(specialCharacters)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "specialCharacters" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL051 : First Name is not valid"

  Scenario: Sponsor first name field required validation(alphaNumericWithSpecialCharacters)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphaNumericWithSpecialCharacters" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL051 : First Name is not valid"

  Scenario: Sponsor first name field required validation(alphaNumerics)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphaNumerics" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL051 : First Name is not valid"

  Scenario: Sponsor first name field required validation more than 30 characters
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 35 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL050 : FirstName length should not exceed 30 characters"
#


Scenario: Sponsor first name field( succcessfull response)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured as "<Name>"
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com" 
  And the property "mobilePhoneNumber" is configured with "Phone" with 10 characters
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| Name                |
| random 5 alphabets  |
| random 29 alphabets |
| random 30 alphabets |

