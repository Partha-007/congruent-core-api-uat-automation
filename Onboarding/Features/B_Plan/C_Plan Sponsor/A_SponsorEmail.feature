Feature: A_sponsorEmail
[BeforeTestRun]

Scenario: Sponsor Email field validate with null value(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 0 characters
  And the property "lastName" is configured as ""
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as ""
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
   Then the API response should contain the 3 following errors 
     | error_code | error_message |
     | PL054      | Required      |
     | PL049      | Required      | Scenario: Sponsor first name field required validation
     | PL045      | Required      | Scenario: Sponsor last name field validate error message as required


  Scenario: Sponsor Email field validate(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "numerics" with 5 characters
  And the property "lastName" is configured with "alphabets" with 35 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "(*&^@test.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
     Then the API response should contain the 3 following errors 
     | error_code | error_message                                   |
     | PL055      | Email is in invalid format                      |
     | PL051      | First Name is not valid                         | Scenario: Sponsor first name field required validation (numerics)
     | PL046      | LastName length should not exceed 30 characters | Scenario: Sponsor Last name field accepts above 30


#Scenario: Sponsor Last name field(error message)
#Scenario: Sponsor first name field required validation(specialCharacters)
  Scenario: Sponsor Email field validate more than 80 characters(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "specialCharacters" with 5 characters
  When Configuration has been made as per following
           | key               | value      |
           | lastName          | <lastName> |
           | ssn               | <SSN>      |
           | mobilePhoneNumber | <Phone>    |

  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "aabcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcder@test.com"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
     Then the API response should contain the 5 following errors 
     | error_code | error_message                                                |
     | PL056      | Email Id should not exceed 80 characters                     |
     | PL051      | First Name is not valid                                      | 
     | PL047      | Last Name is not valid                                       |
     | PL053      | Phone Number is Required in the format XXX-XXX-XXXX          |
     | PL052      | Social Security Number is required in the format XXX-XX-XXXX |
Examples: 
| lastName                   |Phone                                      | SSN                                        |
| random 5 specialCharacters |random 9 numerics                          | 123-22-22                                  |
| random 5 numerics          |random 5 alphabets                         | random 10 alphabets                        |  
| $%%a1                      |random 5 numerics                          | random 5 alphabets                         |
| asdfg1345                  |random 5 specialCharacters                 | random 5 numerics                          |
| asdfg1345                  |random 5 alphanumerics                     | random 5 SpecialCharacters                 |
| asdfg1345                  |random 5 alphaNumericWithSpecialCharacters | random 5 alphanumerics                     |
| asdfg1345                  |random 11 numerics                         | random 5 alphaNumericWithSpecialCharacters |
#phnone number 7 cases
#7 cases



  Scenario: Sponsor Email field validate with invalid format(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphaNumericWithSpecialCharacters" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "testtest.com"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
   And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
     Then the API response should contain the 2 following errors 
     | error_code | error_message              |
     | PL055      | Email is in invalid format |
     | PL051      | First Name is not valid    |   Scenario: Sponsor first name field required validation(alphaNumericWithSpecialCharacters)

     

  Scenario: Sponsor first name field required validation(alphaNumerics)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphaNumerics" with 5 characters
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And the property "email" is configured as "test4123@test.com" 
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

Scenario: Sponsor Email field validat( succcessfull response)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key               | value               |
           | firstName         | <firstName>         |
           | lastName          | <lastName>          |
           | email             | <Email>             |
           | mobilePhoneNumber | <mobilePhoneNumber> |
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| Email               | firstName           | lastName            | mobilePhoneNumber |
| test123@test.com    | random 5 alphabets  | random 5 alphabets  |                   |
| 12345@test.com      | random 29 alphabets | random 29 alphabets | 123-456-7899      |
| abcd12345@test.com  | random 30 alphabets | random 30 alphabets | 123-456-7899      |
| abcd12345#@test.com | random 29 alphabets | random 5 alphabets  | 123-456-7899      |
| abcd@test.com       | random 30 alphabets | random 5 alphabets  | 123-456-7899      |
#firsrtname 3 scenarios
#lastName 3 scenarios
#phone number 2 cases

Scenario: Sponsor Email field validat( succcessfull response)(last name 10 characters)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
  And the property "lastName" is configured with "alphabets" with 10 characters
  And the property "ssn" is configured as "123-45-7891"
  And the property "isSponsor" is configured as "false"
   And the property "email" is configured as "abcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcderbcder@test.com"
  And the property "mobilePhoneNumber" is configured as "998-322-3214"
   And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message

 
Scenario: SponsorSSN field validate of assigning same values(error message)
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When the property "firstName" is configured with "alphabets" with 5 characters
     When Configuration has been made as per following
           | key   | value |
           | ssn   | <SSN>   |
           | email | <email> |
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "isSponsor" is configured as "false"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
  Then API should give response as "PL059 : Social Security Number digits should not be all the same."
  Examples: 
| SSN         | email             |
| 000-00-0000 | test123@test.com  |
| 111-11-1111 | test223@test.com  |
| 222-22-2222 | test323@test.com  |
| 333-33-3333 | test1423@test.com |
| 444-44-4444 | test143@test.com  |
| 555-55-5555 | test123@test.com  |
| 666-66-6666 | test133@test.com  |
| 777-77-7777 | test153@test.com  |
| 888-88-8888 | test173@test.com  |
| 999-99-9999 | test183@test.com  |


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
     When Configuration has been made as per following
           | key   | value   |
           | ssn   | <SSN>   |
           | email | <email> |
  And the property "lastName" is configured with "alphabets" with 5 characters
  And the property "isSponsor" is configured as "false"
  And the property "mobilePhoneNumber" is configured as "123-456-7899"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
 Then API should respond with successful message
Examples: 
| SSN         | email             |
|             | test123@test.com  |
| 000-45-6789 | test223@test.com  |
| 666-45-6789 | test323@test.com  |
| 950-45-6789 | test1423@test.com |

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
#Error message got changed
 #This Social Security Number already belongs to Sponsor 