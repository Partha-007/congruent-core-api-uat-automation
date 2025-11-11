Feature: A_sponsorEmail
[BeforeTestRun]

Scenario: Sponsor Email field validate with null value(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as ""
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL054 : Required"

  Scenario: Sponsor Email field validate(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "(*&^@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL055 : Email is in invalid format"

  Scenario: Sponsor Email field validate more than 80 characters(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "aabcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcder@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL056 : Email Id should not exceed 80 characters"

  Scenario: Sponsor Email field validate with invalid format(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "testtest.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL055 : Email is in invalid format"

#| block | error_code | error_message                             |
#|     1 | PL054      | Required                                  |
#|     2 | PL055      | Email is in invalid format                |
#|     3 | PL056      | Email Id should not exceed 80 characters" |
#|     4 | PL055      | Email is in invalid format                |
#Examples: 
#| Email                                                                             |
#|                                                                                   |
#| (*&^@test.com                                                                     |
#| aabcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcder@test.com |
 #| testtest.com                                                                      |

Scenario: Sponsor Email field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "<Email>"
  And the property "mobilePhoneNumber" is configured with "Phone" with 10 characters
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| Email               |
| test123@test.com    |
| 12345@test.com      |
| abcd12345@test.com  |
| abcd12345#@test.com |
| abcd@test.com       |

Scenario: Sponsor Email field validat( succcessfull response)(last name 10 characters)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 10 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
   And the property "email" is configured as "abcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcder@test.com"
  And the property "mobilePhoneNumber" is configured with "Phone" with 10 characters
   And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message

 