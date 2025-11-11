
Feature: A_SavePlan
[BeforeTestRun]

Scenario: save plan (successful response)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
#And Collection in a model is configured with 15 blocks for the property "PlanAdministrator" with values to save model portfolio as given below
#| BlockNumber | Key  | Value |
#| 1           | Name | ABCD  |
When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message


 Scenario: validating the save plan page(error message)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
  And Configuration has been made as per following
| block | propertyName       | value                       |
| 1     | PlanName           | random 10 alphabets         |
| 1     | RkPlanNumber       | random 0 alphabets          |
| 2     | PlanName           | random 10 specialCharacters |
| 2     | RkPlanNumber       | random 10 alphabets         |
| 3     | PlanName           | random 251 alphabets        |
| 3     | RkPlanNumber       | random 10 alphabets         |
| 4     | PlanName           | random 10 alphabets         |
| 4     | RkPlanNumber       | random 10 alphabets         |
| 4     | EffectiveDate      |                             |
| 5     | PlanName           | random 10 alphaNumerics     |
| 5     | RkPlanNumber       | random 10 alphabets         |
| 5     | PensionBenefitCode | random 2 SpecialCharacters  |
| 6     | PlanName           | random 10 alphaNumerics     |
| 6     | RkPlanNumber       | random 10 alphabets         |
| 6     | WelfareBenefitCode | random 2 SpecialCharacters  |
| 7     | PlanName           | random 10 alphaNumerics     |
| 7     | RkPlanNumber       | random 10 alphabets         |
| 7     | City               | random 36 alphabets         |
| 8     | PlanName           | random 10 alphaNumerics     |
| 8     | RkPlanNumber       | random 10 alphabets         |
| 8     | Address1           | random 101 alphabets        |
| 9     | PlanName           | random 10 alphaNumerics     |
| 9     | RkPlanNumber       | random 10 alphabets         |
| 9     | Address2           | random 101 alphabets        |
| 10    | PlanName           | random 10 alphaNumerics     |
| 10    | RkPlanNumber       | random 10 alphabets         |
| 10    | Zipcode            | random 5 alphabets          |
| 11    | PlanName           | random 10 alphaNumerics     |
| 11    | RkPlanNumber       | random 10 alphabets         |
| 11    | Zipcode            | ab-12345                    |
| 12    | PlanName           | random 10 alphaNumerics     |
| 12    | RkPlanNumber       | random 10 alphabets         |
| 12    | Zipcode            | abc12-3#@#                  |
| 13    | PlanName           | random 10 alphaNumerics     |
| 13    | RkPlanNumber       | random 10 alphabets         |
| 13    | Zipcode            | 12345-987689                |
| 14    | PlanName           | random 10 alphaNumerics     |
| 14    | RkPlanNumber       | random 10 alphabets         |
| 14    | Zipcode            | 1234                        |
| 15    | PlanName           | random 10 alphaNumerics     |
| 15    | RkPlanNumber       | random 10 alphabets         |
| 15    | Zipcode            | 12345-6                     |
| 16    | PlanName           | random 10 alphaNumerics     |
| 16    | RkPlanNumber       | random 10 alphabets         |
| 16    | Zipcode            | null                        |

And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 16 following errors
| block | error_code | error_message                                       |
| 1     | PL001      | Required                                            |
| 2     | PL011      | Plan Name should be alpha numeric                   |
| 3     | PL012      | Plan Name length should not exceed 250 characters   |
| 4     | PL018      | Required                                            |
| 5     |            |                                                     |
| 6     |            |                                                     |
| 7     | PL904      | City length should not exceed 35 characters.        |
| 8     | PL902      | Address 1 length should not exceed 100 characters.  |
| 9     | PL903      | Address 2 length should not  exceed 100 Characters. |
| 10    | PL030      | ZIP Code should be either 5 or 9 characters.        |
| 11    | PL030      | ZIP Code should be either 5 or 9 characters.        |
| 12    | PL030      | ZIP Code should be either 5 or 9 characters.        |
| 13    | PL030      | ZIP Code should be either 5 or 9 characters.        |
| 14    | PL030      | ZIP Code should be either 5 or 9 characters.        |
| 15    | PL030      | ZIP Code should be either 5 or 9 characters.        |
| 16    | PL030      | ZIP Code should be either 5 or 9 characters.        |

Scenario: save plan 
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
 When Configuration has been made as per following
| block | propertyName       | value                                       |
| 1     | PlanName           | random 10 alphabets                         |
| 1     | RkPlanNumber       | random 10 alphabets                         |
| 2     | PlanName           | random 10 numerics                          |
| 2     | RkPlanNumber       | random 10 alphabets                         |
| 3     | PlanName           | random 250 alphabets                        |
| 3     | RkPlanNumber       | random 10 alphabets                         |
| 4     | PlanName           | random 49 alphabets                         |
| 4     | RkPlanNumber       | random 10 alphabets                         |
| 5     | PlanName           | random 10 alphaNumerics                     |
| 5     | RkPlanNumber       | random 10 alphabets                         |
| 6     | PlanName           | random 10 alphaNumerics                     |
| 6     | RkPlanNumber       | random 10 alphabets                         |
| 6     | PensionBenefitCode | random 2 alphabets                          |
| 7     | PlanName           | random 10 alphaNumerics                     |
| 7     | RkPlanNumber       | random 10 alphabets                         |
| 7     | PensionBenefitCode | random 2 alphaNumerics                      |
| 8     | PlanName           | random 10 alphaNumerics                     |
| 8     | RkPlanNumber       | random 10 alphabets                         |
| 8     | PensionBenefitCode | random 2 Numerics                           |
| 9     | PlanName           | random 10 alphaNumerics                     |
| 9     | RkPlanNumber       | random 10 alphabets                         |
| 9     | WelfareBenefitCode | random 2 Numerics                           |
| 10    | PlanName           | random 10 alphaNumerics                     |
| 10    | RkPlanNumber       | random 10 alphabets                         |
| 10    | WelfareBenefitCode | random 2 alphabets                          |
| 11    | PlanName           | random 10 alphaNumerics                     |
| 11    | RkPlanNumber       | random 10 alphabets                         |
| 11    | WelfareBenefitCode | random 2 alphaNumerics                      |
| 12    | PlanName           | random 10 alphaNumerics                     |
| 12    | RkPlanNumber       | random 10 alphabets                         |
| 12    | PensionBenefitCode | random 1 alphabets                          |
| 13    | PlanName           | random 10 alphaNumerics                     |
| 13    | RkPlanNumber       | random 10 alphabets                         |
| 13    | PensionBenefitCode | random 3 alphabets                          |
| 14    | PlanName           | random 10 alphaNumerics                     |
| 14    | RkPlanNumber       | random 10 alphabets                         |
| 14    | WelfareBenefitCode | random 1 alphabets                          |
| 15    | PlanName           | random 10 alphaNumerics                     |
| 15    | RkPlanNumber       | random 10 alphabets                         |
| 15    | WelfareBenefitCode | random 3 alphabets                          |
| 16    | PlanName           | random 10 alphaNumerics                     |
| 16    | RkPlanNumber       | random 10 alphabets                         |
| 16    | PensionBenefitCode |                                             |
| 17    | PlanName           | random 10 alphaNumerics                     |
| 17    | RkPlanNumber       | random 10 alphabets                         |
| 17    | WelfareBenefitCode |                                             |
| 18    | PlanName           | random 10 alphaNumerics                     |
| 18    | RkPlanNumber       | random 10 alphabets                         |
| 18    | City               | random 25 alphabets                         |
| 19    | PlanName           | random 10 alphaNumerics                     |
| 19    | RkPlanNumber       | random 10 alphabets                         |
| 19    | City               | random 25 Numerics                          |
| 20    | PlanName           | random 10 alphaNumerics                     |
| 20    | RkPlanNumber       | random 10 alphabets                         |
| 20    | City               | random 25 SpecialCharacters                 |
| 21    | PlanName           | random 10 alphaNumerics                     |
| 21    | RkPlanNumber       | random 10 alphabets                         |
| 21    | City               | random 25 AlphaNumerics                     |
| 22    | PlanName           | random 10 alphaNumerics                     |
| 22    | RkPlanNumber       | random 10 alphabets                         |
| 22    | City               | random 25 AlphaNumericWithSpecialCharacters |
| 23    | PlanName           | random 10 alphaNumerics                     |
| 23    | RkPlanNumber       | random 10 alphabets                         |
| 23    | City               | random 30 alphabets                         |
| 24    | PlanName           | random 10 alphaNumerics                     |
| 24    | RkPlanNumber       | random 10 alphabets                         |
| 24    | City               | random 0 alphabets                          |
| 25    | PlanName           | random 10 alphaNumerics                     |
| 25    | RkPlanNumber       | random 10 alphabets                         |
| 25    | City               |                                             |
| 26    | PlanName           | random 10 alphaNumerics                     |
| 26    | RkPlanNumber       | random 10 alphabets                         |
| 26    | Address1           | random 50 alphabets                         |
| 27    | PlanName           | random 10 alphaNumerics                     |
| 27    | RkPlanNumber       | random 10 alphabets                         |
| 27    | Address1           | random 50 numerics                          |
| 28    | PlanName           | random 10 alphaNumerics                     |
| 28    | RkPlanNumber       | random 10 alphabets                         |
| 28    | Address1           | random 50 SpecialCharacters                 |
| 29    | PlanName           | random 10 alphaNumerics                     |
| 29    | RkPlanNumber       | random 10 alphabets                         |
| 29    | Address1           | random 50 AlphaNumericWithSpecialCharacters |
| 30    | PlanName           | random 10 alphaNumerics                     |
| 30    | RkPlanNumber       | random 10 alphabets                         |
| 30    | Address1           | random 100 alphabets                        |
| 31    | PlanName           | random 10 alphaNumerics                     |
| 31    | RkPlanNumber       | random 10 alphabets                         |
| 31    | Address1           | random 0 alphabets                          |
| 32    | PlanName           | random 10 alphaNumerics                     |
| 32    | RkPlanNumber       | random 10 alphabets                         |
| 32    | Address1           |                                             |
| 33    | PlanName           | random 10 alphaNumerics                     |
| 33    | RkPlanNumber       | random 10 alphabets                         |
| 33    | Address2           | random 50 alphabets                         |
| 34    | PlanName           | random 10 alphaNumerics                     |
| 34    | RkPlanNumber       | random 10 alphabets                         |
| 34    | Address2           | random 50 numerics                          |
| 35    | PlanName           | random 10 alphaNumerics                     |
| 35    | RkPlanNumber       | random 10 alphabets                         |
| 35    | Address2           | random 50 SpecialCharacters                 |
| 36    | PlanName           | random 10 alphaNumerics                     |
| 36    | RkPlanNumber       | random 10 alphabets                         |
| 36    | Address2           | random 50 AlphaNumericWithSpecialCharacters |
| 37    | PlanName           | random 10 alphaNumerics                     |
| 37    | RkPlanNumber       | random 10 alphabets                         |
| 37    | Address2           | random 100 alphabets                        |
| 38    | PlanName           | random 10 alphaNumerics                     |
| 38    | RkPlanNumber       | random 10 alphabets                         |
| 38    | Address2           | random 0 alphabets                          |
| 39    | PlanName           | random 10 alphaNumerics                     |
| 39    | RkPlanNumber       | random 10 alphabets                         |
| 39    | Address2           |                                             |
| 40    | PlanName           | random 10 alphaNumerics                     |
| 40    | RkPlanNumber       | random 10 alphabets                         |
| 40    | State              | NM                                          |
| 41    | PlanName           | random 10 alphaNumerics                     |
| 41    | RkPlanNumber       | random 10 alphabets                         |
| 41    | State              | null                                        |
| 42    | PlanName           | random 10 alphaNumerics                     |
| 42    | RkPlanNumber       | random 10 alphabets                         |
| 42    | Zipcode            | 75647-3478                                  |
| 43    | PlanName           | random 10 alphaNumerics                     |
| 43    | RkPlanNumber       | random 10 alphabets                         |
| 43    | Zipcode            | 12345                                       |
| 44    | PlanName           | random 10 alphaNumerics                     |
| 44    | RkPlanNumber       | random 10 alphabets                         |
| 44    | Country            | USA                                         |
| 45    | PlanName           | random 10 alphaNumerics                     |
| 45    | RkPlanNumber       | random 10 alphabets                         |
| 45    | Country            | null                                        |
| 46    | PlanName           | random 10 alphaNumerics                     |
| 46    | RkPlanNumber       | random 10 alphabets                         |
| 46    | Country            | other                                       |
| 47    | PlanName           | random 10 alphaNumerics                     |
| 47    | RkPlanNumber       | random 10 alphabets                         |
| 47    | PostalCode         | 12345-62345                                 |
| 48    | PlanName           | random 10 alphaNumerics                     |
| 48    | RkPlanNumber       | random 10 alphabets                         |
| 48    | PostalCode         | null                                        |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message



 Scenario: Save Taxein number field acceptance
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key          | value                   |
           | PlanName     | random 10 alphaNumerics |
           | RkPlanNumber | random 10 alphabets     |
And the property "taxEIN" is configured with "2" and "7" random generated "Numerics"
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message


 Scenario: Save Taxein number field acceptance(errormessage)
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
 When Configuration has been made as per following
           | key          | value                   |
           | PlanName     | random 10 alphaNumerics |
           | RkPlanNumber | random 10 alphabets     |
And the property "taxEIN" is configured with "<length1>" and "<length2>" random generated "<pattern>"
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 6 following errors
| block | error_code | error_message                                  |
|     1 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |
|     2 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |
|     3 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |
|     4 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |
|     5 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |
|     6 | PL901      | Tax EIN should be of valid format (xx-xxxxxxx) |


Examples:
| length1 | length2 | pattern                           |
|       2 |       7 | SpecialCharacters                 |
|       2 |       7 | AlphaNumerics                     |
|       2 |       7 | Alphabets                         |
|       2 |       7 | AlphaNumericWithSpecialCharacters |
|       2 |       6 | Numerics                          |
|       2 |       8 | Numerics                          |


