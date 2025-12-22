Feature: PlanModule

[BeforeTestRun]
#Scenario:166352 To verify the Pension Benefit Code field length acceptance  of equal 2  characters in the Plan details page -Plan details
#Scenario:166363 To verify the  Welfare Benefit Codee field length acceptance  of equal 2  characters in the Plan details page -Plan details
#Scenario: New city Creation with below 30 characters
#Scenario: New address1 details with equal to 100 characters
#Scenario: New address2 details with equal to 100 characters
#Scenario:13882 RK Plan number field acceptance alphabets


Scenario:7557 creating a plan with one step
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                 | value               | Scenario:7616 PLan name field acceptance below 250 characters
| planName            | random 10 alphabets | Scenario:7611 Plan name field acceptance alphabets
| rkPlanNumber        | random 10 alphabets |
| name                | random 0 alphabets  | Scenario:13888 Plan administrator name field validation as required
| pensionBenefitCode  | random 2 alphabets  | Scenario:166355 To verify the  Pension Benefit Code field accepting the alphabets in the Plan details page-Plan
| welfareBenefitCode  | random 2 alphabets  | Scenario:166366 To verify the  Welfare Benefit Code field accepting the numbers in the Plan details page-Plan
| taxEIN              |           121234567 | Scenario: Plan Administrator taxEIN Creation with Numerics equal to 9 characters
| city                | random 25 alphabets | Scenario: New city Creation with Alphabets
| address1            | random 50 alphabets | Scenario: New address1 details with Alphabets with below 100 characters
| address2            | random 50 alphabets | Scenario: New address2 details with Alphabets with below 100 characters
| state               | NM                  | Scenario: Validating State field selected as New Mexico
| zipCode             | 75647-3478          | Scenario: New Zipcode Creation with numerics of 9 characters
| country             | USA                 | Scenario: Validating Country field default value USA saved
| postalCode          | 12345-62345         | Scenario: Validating the Postal Code field with length 10 characters
| mobilePhoneNumber   | random 0 numerics   | Scenario:13896 Contact Phone number mandatory validation
| trsContractId       | random 5 numerics   | Scenario:13920 Plan Contract number field acceptance of equal 5 characters



When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message


Scenario:7608 PLan name field validate error message as required
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                                                                                                     |
| planName          | random 0 alphabets                                                                                        |
| name              | random 55 alphabets                                                                                       |
| rkPlanNumber      | random 0 alphabets                                                                                       |
| effectiveDate     |                                                                                                           |
| taxEIN            | asdfghjkl                                                                                                 |
| address1          | random 101 alphabets                                                                                      |
| address2          | random 101 alphabets                                                                                      |
| zipCode           | random 5 alphabets                                                                                        |
| mobilePhoneNumber | 123-4567-7890                                                                                             |
| trsContractId     | random 6 numerics                                                                                         |
| email             | abcgfwehjdgjgfkfgydgvgvfgvgvghfvgvsamvfyfhvdvgvtfvjsyvhgavghcfudkgkfgsnezyertcnvdsyrxkeuhdvnrehu@gmai.com |
| irsPlanNumber     |                                                                                                           |



When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                   |
	| PL001      | Required                                                        |
	| PL018      | Required                                                        | Scenario:13862 PLan effective date field validate error message as required
	| PL901      | Tax EIN should be of valid format (xx-xxxxxxx)                  | Scenario: Plan Administrator the taxEIN field with alphabets
	| PL902      | Address 1 length should not exceed 100 characters.              | Scenario: Validating the address1 field with above 100 characters
	| PL903      | Address 2 length should not  exceed 100 Characters.             | Scenario: Validating the address2 field with above 100 characters
	| PL030      | ZIP Code should be either 5 or 9 characters.                    | Scenario: New Zipcode Creation with alphabets
	| PL028      | Plan Administrator Name length should not exceed  50 characters | Scenario:13889 Plan administrator name field validation as above 50 characters
	| PL039      | Valid Phone Number (XXX-XXX-XXXX) is required                   | Scenario:13909 Contact Phone number invalid validation
	| PL043      | Contract Number must be alphanumeric and 5 characters long      | Scenario:13919 Plan Contract number field acceptance of above 5 characters
	| PL041      | Email address length should not exceed more than 80 characters  | Scenario:13916 Plan Email Address acceptance criteria of above 80 characters
	| PL026      | Required                                                        | Scenario:13869 Plan IRS field validation as required
	| PL007      | Required                                                        | Scenario:13878 RK Plan number field validate error message as required
Scenario:7609 Plan Name already exist field validate error message 
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key           | value    |
| planName      | testPlan |
| irsPlanNumber |      124 |
| trsContractId |    12345 |
| rkPlanNumber  | ABC      |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
When Configuration has been made as per following
| key           | value    |
| planName      | testPlan |
| irsPlanNumber |      124 |
| trsContractId |    12345 |
| rkPlanNumber  | ABC      |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 2 following errors 
	| error_code | error_message                   |
	| PL975      | Plan name already exists.       |
	| PL044      | Contract number already exists. | Scenario: 13922 Plan contract number field already exist validation
	| PL014      | RKPlanNumber already exists.    | Scenario:13886 RkPlannumber already exist field validate error message 

Scenario:7610 PLan name field acceptance special characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                 | value                       |
| planName            | random 10 specialCharacters |
| name                | random 5 specialCharacters  |
| rkPlanNumber        | random 20 alphabets         |
| pensionBenefitCode  | random 2 specialCharacters  |
| welfareBenefitCode  | random 2 specialCharacters  |
| taxEIN              | 12@#$^&*()                  |
| zipCode             | ab-12345                    |
| mobilePhoneNumber   | random 12 numerics          |
| irsPlanNumber       | random 10 numerics          |
| effectiveDate       | 01/01/2023                  |
| planTerminationDate | 06/01/2020                  | Scenario:13863 PLan termination date field validate error message

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                                        |
	| PL011      | Plan Name should be alpha numeric                                    |
	|            |                                                                      | Scenario:166357 To verify the  Pension Benefit Code accepting the specialcharacters in the Plan details page-Plan
	|            |                                                                      | Scenario:166368 To verify the  Welfare Benefit Code field accepting the specialcharacters  in the Plan details page-Plan
	| PL901      | Tax EIN should be of valid format (xx-xxxxxxx)                       | Scenario:Plan Administrator the taxEIN field with special characters
	| PL030      | ZIP Code should be either 5 or 9 characters.                         | Scenario: New Zipcode Creation with alphaNumerics
	| PL029      | Plan Administartor Name should be alphanumeric                       | Scenario:13892 Plan administrator name field acceptance as special characters
	| PL039      | Valid Phone Number (XXX-XXX-XXXX) is required                        | Scenario:13910 Contact Phone number acceptance criteria of above 10 characters
	| PL025      | IRS Plan Number length should not exceed  3 characters               | Scenario:13870 Plan IRS field validation with more than 3 digits
	| PL017      | Plan Termination Date should exceed Effective Date.                  |
	| PL009      | Recording Keeping Plan Number length should not exceed 15 characters |Scenario:13879 RK Plan number field validate above 15 characters





Scenario:7612 Plan name field acceptance numerics
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value               |
| planName           | random 10 numerics  |
| name               | random 50 alphabets | Scenario:13890 Plan administrator name field acceptance equal to 50 characters
| pensionBenefitCode | random 2 numerics   | Scenario:166354 To verify the  Pension Benefit Code field accepting the numerics in the Plan details page-Plan
| welfareBenefitCode | random 2 numerics   | Scenario:166365 To verify the  Welfare Benefit Code field accepting the numbers in the Plan details page-Plan
| rkPlanNumber       | random 15 alphabets  |Scenario:13880 RK Plan number field acceptance equal to 15 characters
| name               | random 5 numerics   | Scenario:13894 Plan administrator name field acceptance of numerics
| city               | random 25 numerics  | Scenario:New city Creation with Numerics
| address1           | random 50 numerics  | Scenario: New address1 details with numerics
| address2           | random 50 numerics  | Scenario: New address2 details with numerics
| zipCode            |               12345 | Scenario: New Zipcode Creation with Numerics of length 5
| country            |                     | Scenario:  Validating Country field selected as null
| postalCode         |                     | Scenario: Validating the Postal Code field with null
| trsContractId      | random 0 alphabets  | Scenario:108841 Plan Contract number field mandatory validation
| email              | random 0 alphabets  | Scenario:13914 Plan Email Address mandatory validation 


When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario:7614 PLan name field above 250 characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key               | value                                      |
| planName          | random 251 alphabets                       |
| name              | random 5 alphanumericwithspecialCharacters |
| rkPlanNumber      | random 10 numerics                        |Scenario:13883 RK Plan number field acceptance numerics
| taxEIN            | abc123456                                  |
| city              | random 36 alphabets                        |
| zipCode           | abc12-3#@#                                 |
| mobilePhoneNumber | random 5 numerics                          |
| trsContractId     | random 4 numerics                          |
| email             | random 5 numerics                          |
| irsPlanNumber             | random 3 alphabets                          |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors 
	| error_code | error_message                                              |
	| PL012      | Plan Name length should not exceed 250 characters          |
	| PL901      | Tax EIN should be of valid format (xx-xxxxxxx)             | Scenario: Plan Administrator the taxEIN field with alpha numerics
	| PL904      | City length should not exceed 35 characters.               | Scenario: Validating the city field above 35 characters
	| L030       | ZIP Code should be either 5 or 9 characters.               | Scenario: New Zipcode Creation with Alphanumerics with Special characters
	| PL029      | Plan Administartor Name should be alphanumeric             | Scenario:108840 Plan administrator name field acceptance of alphanumerics with special characters
	| PL039      | Valid Phone Number (XXX-XXX-XXXX) is required              | Scenario:13912 Contact Phone number acceptance criteria of below 10 characters
	| PL043      | Contract Number must be alphanumeric and 5 characters long | Scenario:13921 Plan Contract number field acceptance of below 5 characters
	| PL040      | Email is in invalid format                                 | Scenario:13915 Plan Email Address criteria of invalid email
	| PL022      | IRS PlanNumber should be Numbers                           | Scenario:13873 Plan IRS field validation with alphabets

	

Scenario:7615 PLan name field acceptance equal to 250 characters
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value                                                                  |
| planName           | random 250 alphabets                                                   |
| name               | random 45 alphabets                                                    | Scenario:13891 Plan administrator name field acceptance as below 50 characters
| rkPlanNumber       | random 13 alphabets                                                    |Scenario:13881 RK Plan number field acceptance below 15 characters
| pensionBenefitCode | random 1 alphabets                                                     | Scenario:166351 To verify the Pension Benefit Code field length acceptance  of below 2  characters in the Plan details page -Plan details
| welfareBenefitCode | random 1 alphabets                                                     | Scenario:166362 To verify the  Welfare Benefit Code field length acceptance  of below 2  characters in the Plan details page -Plan details
| city               | random 30 alphabets                                                    | Scenario: New city Creation with equal of 30 characters
| address1           | random 0 alphabets                                                     | Scenario: New address1 details with null
| address2           | random 0 alphabets                                                     | Scenario: New address2 details with null
| country            | other                                                                  | Scenario:  Validating Country field selected as other
| email              | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefgh@gmail.com | Scenario:13917 Plan Email Address acceptance criteria of equal 80 characters 
| irsPlanNumber      | random 10 numerics          |Scenario:13871 Plan IRS field acceptance 3 digits


When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario:108844 PLan name field acceptance alphanumerics
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value                                             |
| planName           | random 10 alphanumerics                           |
| name               | random 5 alphabets                                | Scenario:13893 Plan administrator name field acceptance of alphabets
| pensionBenefitCode | random 2 alphanumerics                            | Scenario:166356 To verify the  Pension Benefit Code field accepting the alphanumeric in the Plan details page-Plan
| welfareBenefitCode | random 2 alphanumerics                            | Scenario:166367 To verify the  Welfare Benefit Code field accepting the alpha Numerics in the Plan details page-Plan
| rkPlanNumber       | random 10 alphabets                               |
| city               | random 25 SpecialCharacters                       | Scenario: New city Creation with Special characters
| address1           | random 50 SpecialCharacters                       | Scenario: New address1 details with Special characters
| address2           | random 50 SpecialCharacters                       | Scenario: New address2 details with Special characters
| mobilePhoneNumber  | 123-456-7890                                      |
| trsContractId      | random 5 numerics                                 | Scenario:13911 Contact Phone number acceptance criteria of equal 10 characters
| email              | vwxyzabcdefghijklmnopqrstuvwxyzabcdefgh@gmail.com | Scenario:13918 Plan Email Address acceptance criteria of below 80 characters
| irsPlanNumber      | random 2 numerics          |Scenario:13872 Plan IRS field acceptance with less than 3 digits


When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario:166353 To verify the Pension Benefit Code field length acceptance  of above 2  characters in the Plan details page -Plan details
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value                   |
| planName           | random 10 alphabets     |
| rkPlanNumber       | random 10 alphabets     |
| pensionBenefitCode | random 3 alphabets      |
| welfareBenefitCode | random 3 alphabets      | Scenario:166364 To verify the  Welfare Benefit Code field length acceptance  of above 2  characters in the Plan details page -Plan details
| city               | random 25 alphanumerics | Scenario:  New city Creation with AlphaNumerics characters
| irsPlanNumber      | random 3 numerics          |Scenario:13874 Plan IRS field validation with numerics


When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario: To verify the  pension Benefit Code field with null Plan details page -Plan details
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value                                       |
| planName           | random 10 alphabets                         |
| rkPlanNumber       | random 10 alphabets                         |
| name               | random 5 alphanumerics                      | Scenario:13895 Plan administrator name field acceptance of alphanumerics
| pensionBenefitCode |                                             |
| welfareBenefitCode |                                             | Scenario: To verify the  Welfare Benefit Code field with null  Plan details page -Plan details
| city               | random 25 AlphaNumericWithSpecialCharacters | Scenario: New city Creation with AlphaNumericsSpecial characters
| address1           | random 50 AlphaNumericWithSpecialCharacters | Scenario: New address1 details with AlphaNumerics with special characters
| address2           | random 50 AlphaNumericWithSpecialCharacters | Scenario: New address2 details with AlphaNumerics with special characters

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario: Plan Administrator the taxEIN field with alpha numerics with special characters
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key          | value                   |
           | PlanName     | random 10 alphaNumerics |
           | RkPlanNumber | random 10 alphabets     |
           | taxEIN       | <tax>                   |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 6 following errors
 | error_code | error_message                                  |
 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |Scenario: Plan Administrator the taxEIN field with alpha numerics with special characters
 #Scenario: Plan Administrator the taxEIN field with numerics below 9 characters
 #Scenario: Plan Administrator the taxEIN field with numerics above 9 characters


Examples:
| tax        |
| abc123!@#  |
|     123412 |
| 1231232345 |

Scenario: New city details with null
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key                | value               |
| planName           | random 10 alphabets |
| rkPlanNumber       | random 10 alphabets |
| city               | random 0 alphabets  |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario: New city details with space
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key          | value               |
| planName     | random 10 alphabets |
| rkPlanNumber | random 10 alphabets |
| city         |                     |
| address1     |                     | Scenario: New address1 details with space
| address2     |                     | Scenario: New address2 details with space
| state        |                     | Scenario:  Validating state field as null


When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message

Scenario: New Zipcode Creation with Numerics of length above 9
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key           | value                       |
           | PlanName      | random 10 alphaNumerics     |
           | RkPlanNumber  | random 10 specialCharacters |
           | zipCode       | <ZipCode>                   |
           | irsPlanNumber | <IrsPlanNumber>             |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 6 following errors
 | error_code | error_message                                                      |
 | PL030      | ZIP Code should be either 5 or 9 characters.                       |
 | PL022      | IRS PlanNumber should be Numbers                                   |
 | PL008      | Record Keeping Plan Number must be alphanumeric (including hyphen) |

Examples:
| IrsPlanNumber                              | ZipCode      |
| random 3 specialcharacters                 | 12345-987689 |
| random 3 alphanumericwithSpecialCharacters |              | Scenario: Validating the Zipcode field with null
| random 3 alphanumerics                     | 12345-6      | Scenario: Validating the Zipcode field with length 6 characters
| random 3 specialcharacters                 |         1234 | Scenario: Validating the Zipcode field with length 4 characters
#Scenario:13875 Plan IRS field validation with special characters
#Scenario:13876 Plan IRS field validation with alphanumerics with special characters
#Scenario:108842 Plan IRS field validation with alphanumerics
#Scenario:13884 RK Plan number field acceptance special characters


#Scenario:13885 RK Plan number field acceptance alphanumerics
Scenario:13877 Plan IRS field already exist validation 
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
When Configuration has been made as per following
| key           | value               |
| planName      | random 10 alphaNumerics |
| irsPlanNumber |                 123 |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
When Configuration has been made as per following
| key           | value                   |
| planName      | random 10 alphaNumerics |
| irsPlanNumber |                     123 |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message


 Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value |
           | category           | 0     |
           | shortYearIndicator | true  |
  
When The date property "shortYearStartDate" is configured as "months" and should add "13" days to the current date
When The date property "shortYearEndDate" is configured as "months" and should add "14" days to the current date
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL031 : Start Year Begin Date cannot be greater than Current date + 1 Year."


Scenario:  PLan short year end date greater than start date field validate error message 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value                |
           | ShortYearIndicator | true                 |
           | ShortYearStartDate | 2023-06-01T00:00:00Z |
           | ShortYearEndDate   | 2023-05-01T00:00:00Z |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL023 : Short Year End Date should exceed Short Year Begin Date"
    

Scenario: PLan short year end date  field validate error message as required
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value                |
           | ShortYearIndicator | true                 |
           | ShortYearStartDate | 2023-06-01T00:00:00Z |
           | ShortYearEndDate   | null                 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL024 : Required"



Scenario: PLan short year start date  field validate error message as required
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value |
           | shortYearIndicator | true  |
           | shortYearStartDate | null  |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL371 : Required"

Scenario: PLan short year start and end date difference field validate error message 
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key                | value                |
           | shortYearStartDate | 2020-01-01T00:00:00Z |
           | shortYearEndDate   | 2021-05-03T00:00:00Z |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
 Then API should give response as "PL032 : Difference between Short year begin date and Short year end should be less than one year."



Scenario:Select a plan level field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | propertyName | value               |
 | PlanName     | random 10 alphabets |
 | Level        |                     |
 | RkPlanNumber | random 10 alphabets |
 
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL002 : Required"

Scenario: Select a plan type field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | PlanName     | random 10 alphabets |
 | PlanType     |                     |
 | RkPlanNumber | random 10 alphabets |
 | PlanName     | random 10 alphabets |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL003 : Required"


Scenario: Select a company name field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | Category     | 0                   |
 | Level        |                     |
 | CompanyId    |                     |
 | RkPlanNumber | random 10 alphabets |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL954 : Required"

 Scenario:Select a sponsoring organization field validate error message as required
  Given Model is selected for the endpoint "/api/Sponsor/SaveSponsor"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
 | PlanName     | random 10 alphabets |
 | Category     | 1                   |
 | Level        | 1                   |
 | CompanyId    |                     |
 | RkPlanNumber | random 10 alphabets |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanSponsor"
Then API should give response as "PL013 : Required"









