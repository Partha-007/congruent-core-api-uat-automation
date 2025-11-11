Feature: D_SponsorPhoneNumber
[BeforeTestRun]

Scenario: Sponsor PhoneNumber field validate(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "<Phone>"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL053 : Phone Number is Required in the format XXX-XXX-XXXX"
#| block | error_code | error_message                                       |
#|     1 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
#|     2 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
#|     3 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
#|     4 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
#|     5 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
#|     6 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
#|     7 | PL053      | Phone Number is Required in the format XXX-XXX-XXXX |
Examples: 
| Phone                                      |
| random 9 numerics                          |
| random 5 alphabets                         |
| random 5 numerics                          |
| random 5 specialCharacters                 |
| random 5 alphanumerics                     |
| random 5 alphaNumericWithSpecialCharacters |
| random 11 numerics                         |


Scenario: Sponsor PhoneNumber field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "<Phone>"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| Phone        |
|              |
| 123-456-7899 |



