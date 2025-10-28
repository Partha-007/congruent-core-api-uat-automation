
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
| 1     | planName           | random 10 alphabets         |
| 1     | rkPlanNumber       | random 0 alphabets          |
| 2     | planName           | random 10 specialCharacters |
| 2     | rkPlanNumber       | random 10 alphabets         |
| 3     | planName           | random 251 alphabets        |
| 3     | rkPlanNumber       | random 10 alphabets         |
| 4     | planName           | random 10 alphabets         |
| 4     | rkPlanNumber       | random 10 alphabets         |
| 4     | effectiveDate      |                             |
| 5     | planName           | random 10 alphaNumerics     |
| 5     | rkPlanNumber       | random 10 alphabets         |
| 5     | pensionBenefitCode | random 2 SpecialCharacters  |
| 6     | planName           | random 10 alphaNumerics     |
| 6     | rkPlanNumber       | random 10 alphabets         |
| 6     | welfareBenefitCode | random 2 SpecialCharacters  |
| 7     | planName           | random 10 alphaNumerics     |
| 7     | rkPlanNumber       | random 10 alphabets         |
| 7     | city               | random 36 alphabets         |
| 8     | planName           | random 10 alphaNumerics     |
| 8     | rkPlanNumber       | random 10 alphabets         |
| 8     | address1           | random 101 alphabets        |
| 9     | planName           | random 10 alphaNumerics     |
| 9     | rkPlanNumber       | random 10 alphabets         |
| 9     | address2           | random 101 alphabets        |
| 10    | planName           | random 10 alphaNumerics     |
| 10    | rkPlanNumber       | random 10 alphabets         |
| 10    | zipCode            | random 5 alphabets          |
| 11    | planName           | random 10 alphaNumerics     |
| 11    | rkPlanNumber       | random 10 alphabets         |
| 11    | zipCode            | ab-12345                    |
| 12    | planName           | random 10 alphaNumerics     |
| 12    | rkPlanNumber       | random 10 alphabets         |
| 12    | zipCode            | abc12-3#@#                  |

And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then the API response should contain the 1 following errors
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

Scenario: save plan 
  Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
  When Configuration has been made as per following
| key       | value       |
| companyId | <CompanyId> |
 When Configuration has been made as per following
| block | propertyName       | value                                       |
| 1     | planName           | random 10 alphabets                         |
| 1     | rkPlanNumber       | random 10 alphabets                         |
| 2     | planName           | random 10 numerics                          |
| 2     | rkPlanNumber       | random 10 alphabets                         |
| 3     | planName           | random 250 alphabets                        |
| 3     | rkPlanNumber       | random 10 alphabets                         |
| 4     | planName           | random 49 alphabets                         |
| 4     | rkPlanNumber       | random 10 alphabets                         |
| 5     | planName           | random 10 alphaNumerics                     |
| 5     | rkPlanNumber       | random 10 alphabets                         |
| 6     | planName           | random 10 alphaNumerics                     |
| 6     | rkPlanNumber       | random 10 alphabets                         |
| 6     | pensionBenefitCode | random 2 alphabets                          |
| 7     | planName           | random 10 alphaNumerics                     |
| 7     | rkPlanNumber       | random 10 alphabets                         |
| 7     | pensionBenefitCode | random 2 alphaNumerics                      |
| 8     | planName           | random 10 alphaNumerics                     |
| 8     | rkPlanNumber       | random 10 alphabets                         |
| 8     | pensionBenefitCode | random 2 Numerics                           |
| 9     | planName           | random 10 alphaNumerics                     |
| 9     | rkPlanNumber       | random 10 alphabets                         |
| 9     | welfareBenefitCode | random 2 Numerics                           |
| 10    | planName           | random 10 alphaNumerics                     |
| 10    | rkPlanNumber       | random 10 alphabets                         |
| 10    | welfareBenefitCode | random 2 alphabets                          |
| 11    | planName           | random 10 alphaNumerics                     |
| 11    | rkPlanNumber       | random 10 alphabets                         |
| 11    | welfareBenefitCode | random 2 alphaNumerics                      |
| 12    | planName           | random 10 alphaNumerics                     |
| 12    | rkPlanNumber       | random 10 alphabets                         |
| 12    | pensionBenefitCode | random 1 alphabets                          |
| 13    | planName           | random 10 alphaNumerics                     |
| 13    | rkPlanNumber       | random 10 alphabets                         |
| 13    | pensionBenefitCode | random 3 alphabets                          |
| 14    | planName           | random 10 alphaNumerics                     |
| 14    | rkPlanNumber       | random 10 alphabets                         |
| 14    | welfareBenefitCode | random 1 alphabets                          |
| 15    | planName           | random 10 alphaNumerics                     |
| 15    | rkPlanNumber       | random 10 alphabets                         |
| 15    | welfareBenefitCode | random 3 alphabets                          |
| 16    | planName           | random 10 alphaNumerics                     |
| 16    | rkPlanNumber       | random 10 alphabets                         |
| 16    | pensionBenefitCode |                                             |
| 17    | planName           | random 10 alphaNumerics                     |
| 17    | rkPlanNumber       | random 10 alphabets                         |
| 17    | welfareBenefitCode |                                             |
| 18    | planName           | random 10 alphaNumerics                     |
| 18    | rkPlanNumber       | random 10 alphabets                         |
| 18    | city               | random 25 alphabets                         |
| 19    | planName           | random 10 alphaNumerics                     |
| 19    | rkPlanNumber       | random 10 alphabets                         |
| 19    | city               | random 25 Numerics                          |
| 20    | planName           | random 10 alphaNumerics                     |
| 20    | rkPlanNumber       | random 10 alphabets                         |
| 20    | city               | random 25 SpecialCharacters                 |
| 21    | planName           | random 10 alphaNumerics                     |
| 21    | rkPlanNumber       | random 10 alphabets                         |
| 21    | city               | random 25 AlphaNumerics                     |
| 22    | planName           | random 10 alphaNumerics                     |
| 22    | rkPlanNumber       | random 10 alphabets                         |
| 22    | city               | random 25 AlphaNumericWithSpecialCharacters |
| 23    | planName           | random 10 alphaNumerics                     |
| 23    | rkPlanNumber       | random 10 alphabets                         |
| 23    | city               | random 30 alphabets                         |
| 24    | planName           | random 10 alphaNumerics                     |
| 24    | rkPlanNumber       | random 10 alphabets                         |
| 24    | city               | random 0 alphabets                          |
| 25    | planName           | random 10 alphaNumerics                     |
| 25    | rkPlanNumber       | random 10 alphabets                         |
| 25    | city               |                                             |
| 26    | planName           | random 10 alphaNumerics                     |
| 26    | rkPlanNumber       | random 10 alphabets                         |
| 26    | address1           | random 50 alphabets                         |
| 27    | planName           | random 10 alphaNumerics                     |
| 27    | rkPlanNumber       | random 10 alphabets                         |
| 27    | address1           | random 50 numerics                          |
| 28    | planName           | random 10 alphaNumerics                     |
| 28    | rkPlanNumber       | random 10 alphabets                         |
| 28    | address1           | random 50 SpecialCharacters                 |
| 29    | planName           | random 10 alphaNumerics                     |
| 29    | rkPlanNumber       | random 10 alphabets                         |
| 29    | address1           | random 50 AlphaNumericWithSpecialCharacters |
| 30    | planName           | random 10 alphaNumerics                     |
| 30    | rkPlanNumber       | random 10 alphabets                         |
| 30    | address1           | random 100 alphabets                        |
| 31    | planName           | random 10 alphaNumerics                     |
| 31    | rkPlanNumber       | random 10 alphabets                         |
| 31    | address1           | random 0 alphabets                          |
| 32    | planName           | random 10 alphaNumerics                     |
| 32    | rkPlanNumber       | random 10 alphabets                         |
| 32    | address1           |                                             |
| 33    | planName           | random 10 alphaNumerics                     |
| 33    | rkPlanNumber       | random 10 alphabets                         |
| 33    | address2           | random 50 alphabets                         |
| 34    | planName           | random 10 alphaNumerics                     |
| 34    | rkPlanNumber       | random 10 alphabets                         |
| 34    | address2           | random 50 numerics                          |
| 35    | planName           | random 10 alphaNumerics                     |
| 35    | rkPlanNumber       | random 10 alphabets                         |
| 35    | address2           | random 50 SpecialCharacters                 |
| 36    | planName           | random 10 alphaNumerics                     |
| 36    | rkPlanNumber       | random 10 alphabets                         |
| 36    | address2           | random 50 AlphaNumericWithSpecialCharacters |
| 37    | planName           | random 10 alphaNumerics                     |
| 37    | rkPlanNumber       | random 10 alphabets                         |
| 37    | address2           | random 100 alphabets                        |
| 38    | planName           | random 10 alphaNumerics                     |
| 38    | rkPlanNumber       | random 10 alphabets                         |
| 38    | address2           | random 0 alphabets                          |
| 39    | planName           | random 10 alphaNumerics                     |
| 39    | rkPlanNumber       | random 10 alphabets                         |
| 39    | address2           |                                             |
| 40    | planName           | random 10 alphaNumerics                     |
| 40    | rkPlanNumber       | random 10 alphabets                         |
| 40    | state              | NM                                          |
| 41    | planName           | random 10 alphaNumerics                     |
| 41    | rkPlanNumber       | random 10 alphabets                         |
| 41    | state              | null                                        |
| 42    | planName           | random 10 alphaNumerics                     |
| 42    | rkPlanNumber       | random 10 alphabets                         |
| 42    | zipCode            | 75647-3478                                  |

When API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should respond with successful message


