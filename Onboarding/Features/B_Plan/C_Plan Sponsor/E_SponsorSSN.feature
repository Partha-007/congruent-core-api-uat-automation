Feature: E_SponsorSSN

Scenario: SponsorSSN field validate(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "<SSN>"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL052 : Social Security Number is required in the format XXX-XX-XXXX"
Examples: 
| SSN                                        |
| 123-22-22                                  |
| random 10 alphabets                        |
| random 5 alphabets                         |
| random 5 numerics                          |
| random 5 SpecialCharacters                 |
| random 5 alphanumerics                     |
| random 5 alphaNumericWithSpecialCharacters |


Scenario: SponsorSSN field validate of assigning same values(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "<SSN>"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL059 : Social Security Number digits should not be all the same."
  Examples: 
| SSN                                        |
| 000-00-0000                                | 
| 111-11-1111                                | 
| 222-22-2222                                |
| 333-33-3333                                |
| 444-44-4444                                |
| 555-55-5555                                |
| 666-66-6666                                |
| 777-77-7777                                | 
| 888-88-8888                                |
| 999-99-9999                                |


  Scenario: SponsorSSN field validate equal to 9 numerics(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured with "numerics" with 9 characters
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL052 : Social Security Number is required in the format XXX-XX-XXXX"


Scenario: SponsorSSN field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "<SSN>"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| SSN         |
|             |
| 000-45-6789 |
| 666-45-6789 |
| 950-45-6789 |

Scenario: SponsorSSN field validate existing ssn
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-6789"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test123@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-6789"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test223@test.com"
  And the property "mobilePhoneNumber" is configured as "133-456-7899"
   And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL060 : This Social Security Number already belongs to Sponsor with same Plan"