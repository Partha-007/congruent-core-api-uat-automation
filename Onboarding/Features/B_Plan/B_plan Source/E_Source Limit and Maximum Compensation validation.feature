Feature: E_Source Limit and Maximum Compensation validation
[BeforeTestRun]


Scenario:To verify when user leave the limit (minimum) field as Blank in the percentage option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                         |
           | limitMaximumPercentage |                      80 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL995 : Required"

Scenario:To veriy data Acceptance -Number in the percentage limit(minimum) field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      12 |
           | limitMaximumPercentage |                     120 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

# two backend validations
Scenario:To verify the validation message for Limit (minimum) acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                     101 |
           | limitMaximumPercentage |                     80|
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL185 : Minimum limit should not exceed 100 percentage"

Scenario:To verify the validation message for Limit (minimum) acceptance criteria of values more than 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |        1000000000000.00 |
           | limitMaximumPercentage |                      80 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL185 : Minimum limit should not exceed 100 percentage"

Scenario:To verify the Limit (minimum) acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                     100 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL398 : Maximum limit amount should not be equal or lesser than minimum limit"

Scenario:To verify the validation message for Limit (maximum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                         |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1001 : Required"

Scenario:To verify the validation message for Limit (maximum) acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                      101|
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

Scenario:To verify the validation message for Limit (maximum) acceptance criteria of values more than 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |        1000000000000.00 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00"

Scenario:To verify the Limit (maximum) acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:To verify the  Limit (maximum) acceptance criteria of values below 100 percentage

Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                      80 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the validation message for Limit (minimum) by entering values greater than maximum limit value
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       1 |
           | limitMinimumDollar |                    1500 |
           | limitMaximumDollar |                    1000 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1017 : Maximum limit amount should not be equal or lesser than minimum limit"

Scenario:Source Limit Maximum Field validatation when Limit Maximum field  equal to  Limit Minimum field when contribution type is percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       1 |
           | limitMinimumPercentage |                      50 |
           | limitMaximumPercentage |                      50 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL398 : Maximum limit amount should not be equal or lesser than minimum limit"

Scenario:Source maximumDollarCompensation acceptance when contribution type is percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       1 |
           | maximumDollarCompensation |                      80 |
          
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the Maximum compensation acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       1 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      30 |
           | maximumPercentageCompensation |                      90 |          
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Maximum compensation acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       1 |
           | maximumDollarCompensation |                     100 |
          
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the validation message for Maximum compensation acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       1 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      30 |
           | maximumPercentageCompensation |                     101 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL189 : Maximum limit compensation  should not exceed 100 percentage"


Scenario: To verify the validation message for Maximum compensation field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                      10 |
           | limitMaximumDollar        |                      30 |
           | maximumDollarCompensation |                         |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1020 : Required"


Scenario:Source Limit Minimum Field acceptance when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                     600 |
           | limitMaximumDollar        |                     800 |
           | maximumDollarCompensation |                     800 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the validation message for Limit (minimum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       2 |
           | limitMinimumDollar |                         |
           | limitMaximumDollar |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL998 : Required"

Scenario:Source Limit Maximum Field acceptance when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                     600 |
           | limitMaximumDollar        |                     800 |
           | maximumDollarCompensation |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: toverify the validation message for Limit (maximum) field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | contributionType       |                       2 |
           | limitMinimumDollar     |                     600 |
           | limitMaximumDollar     |                         |
           | limitMinimumPercentage |                      60 |
           | limitMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1004 : Required"

Scenario: Source Limit Maximum Field validatation when Limit Maximum field  equal to  Limit Minimum field when contribution type is dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                | value                   |
           | sourceName         | random 10 alphaNumerics |
           | contributionType   |                       2 |
           | limitMinimumDollar |                     600 |
           | limitMaximumDollar |                     600 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1017 : Maximum limit amount should not be equal or lesser than minimum limit"

Scenario: Toverify the validation message for Maximum compensation field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                     500 |
           | limitMaximumDollar        |                     600 |
When Collection in a model is configured with 1 blocks for the property "AdditionalDeferralSource" with values to save model portfolio as given below
| BlockNumber | Key                       | Value |
|           1 | MaximumDollarCompensation |       |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then the API response should contain the 1 following errors
| error_code | error_message |
| PL1020     | Required      |



Scenario: To verify the validation message for Maximum compensation acceptance criteria of values more than 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | limitMinimumDollar        |                     500 |
           | limitMaximumDollar        |                     600 |
           | maximumDollarCompensation |        1000000000000.00 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL190 : Maximum limit compensation amount should not exceed format of 100000000000.00"

Scenario: To verify when user enter a value greater than 100 in the percentage limit(minimum) field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                     120 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
	Then the API response should contain the 1 following errors 
	| error_code | error_message                                  |
	| PL185      | Minimum limit should not exceed 100 percentage |



Scenario: To verify the Limit (minimum) acceptance criteria of values equal 100 percentage - 2
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                     100 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL398 : Maximum limit amount should not be equal or lesser than minimum limit"


Scenario: To verify when user leave the limit (minimum) field as Blank in the percentage Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                         |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL995 : Required"



Scenario: TC 1 Source Limit Minimum Field acceptance when contribution type is percentage - positive flow
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:  To verify when user leave the limit (maximum) field as Blank in the percentage Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                         |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1001 : Required"


Scenario:  To verify when user enter a value greater than 100 in the percentage Both limit(maximum) field

Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      120|
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"


Scenario:  To verify the length of limit (maximum) field in the percentage Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                 1234.77 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL187 : Maximum limit should not exceed 100 percentage"

Scenario: To verify when user leave the limit (minimum) field as Blank in the dollar option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      20 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                         |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL998 : Required"

Scenario: To verify when user enter a value greater than 11 digits with 2 deciamal points in the limit(minimum) Dollar field-Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      20 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |       8787878887878.787 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |
           | hceMaximumAmount              |                      20 |
           | hceMinimumAmount              |                      10 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL186 : Minimum limit dollar amount should not exceed format of 100000000000.00"

Scenario:To verify the length of limit (minimum)field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |          12345678901.34 |
           | limitMaximumDollar            |          12345678901.35 |
           | maximumDollarCompensation     |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
 
 Scenario:To verify when user leave the limit (maximum) field as Blank in the dollar Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                         |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1004 : Required"


 Scenario:To verify when user enter a value greater than 11 didigits with 2 decimal points in the dollar limit(maximum) field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      20 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                      20 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |        1000000000000.00 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL190 : Maximum limit compensation amount should not exceed format of 100000000000.00"

Scenario:To verify the length of limit (maximum) field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      34 |
           | limitMaximumDollar            |          12345678901.34 |
           | maximumDollarCompensation     |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify when user leave the maximum compensation field as Blank in the percentage Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                         |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL399 : Required"

Scenario:To verify when user leave the maximum compensation field as Blank in the dollar Both option
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1020 : Required"

Scenario:To verify when user enter a value greater than 100 in the maximum compensation field-percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      20 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                     120 |
           | limitMinimumDollar            |                      20 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL189 : Maximum limit compensation  should not exceed 100 percentage"

Scenario:To verify when user enter a value greater than 11 digits and 2 decimal points in the maximum compensation field - Both field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      80 |
           | maximumPercentageCompensation |                      80 |
           | limitMinimumDollar            |                      10 |
           | limitMaximumDollar            |                      40 |
           | maximumDollarCompensation     |        100000000000.123 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL190 : Maximum limit compensation amount should not exceed format of 100000000000.00"

Scenario:To verify the length of limit (minimum)field in the percentage  Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                  100.00 |
           | limitMinimumDollar            |                      34 |
           | limitMaximumDollar            |                      60 |
           | maximumDollarCompensation     |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the length of maximum compensation field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                           | value                   |
           | sourceName                    | random 10 alphaNumerics |
           | contributionType              |                       3 |
           | limitMinimumPercentage        |                      10 |
           | limitMaximumPercentage        |                      70 |
           | maximumPercentageCompensation |                      90 |
           | limitMinimumDollar            |                      34 |
           | limitMaximumDollar            |                      60 |
           | maximumDollarCompensation     |          10000000000.12 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario:toverify the length of limit (maximum) field in the dollar Both option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       3 |
           | maximumDollarCompensation |                     100 |
           | limitMaximumDollar        |          12345678901.34 |
           | limitMinimumDollar        |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the length of limit (maximum) field in the dollar option - contribution type field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value                   |
           | sourceName                | random 10 alphaNumerics |
           | contributionType          |                       2 |
           | maximumDollarCompensation |                     100 |
           | limitMaximumDollar        |          12345678901.34 |
           | limitMinimumDollar        |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the HCE Deferral limts field as Yes 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       1 |
           | isHCEManatory    | true                    |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:To verify the HCE Deferral limts field as Yes and HCE minimum percentage field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL996 : Required"

  Scenario: To verify the HCE Deferral limts field as Yes and HCE Maximum percentage field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMaximumPercentage |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1002 : Required"

   Scenario: To verify the HCE Deferral limts field as Yes and HCE Minimum Amount field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL999 : Required"

 
   Scenario:To verify the HCE Deferral limts field as Yes and HCE Maximum Amount field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMaximumAmount |                         |
           | hceMinimumAmount |                      10 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1005 : Required"

    Scenario:To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field  equal to hce Maximum Percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      20 |
           | hceMaximumPercentage |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:To verify the HCE Deferral limts field as Yes when hce Minimum Amount field  equal to hce Maximum Amount
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       1 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |                      20 |
           | hceMaximumAmount |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:To verify the HCE Deferral limts field as Yes when  hce Minimum Amount field  equal to hce Maximum Amount in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       3 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      20 |
           | hceMaximumPercentage |                      20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

  Scenario:To verify the HCE Deferral limts field as Yes when hce  Percentage field  as length 3 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                     100 |
           | hceMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1015 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:To verify the HCE Deferral limts field as Yes when hce  Percentage field  as length 4 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                    1000 |
           | hceMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL986 : Minimum limit should not exceed 100 percentage"

  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field is greater than hce Maximum Percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                     100 |
           | hceMaximumPercentage |                      80 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL986 : Minimum limit should not exceed 100 percentage"


  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field and than hce Maximum Percentage is below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      80 |
           | hceMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Percentage field is above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                     101 |
           | hceMaximumPercentage |                      90 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL986 : Minimum limit should not exceed 100 percentage"

  Scenario: toverify the HCE Deferral limts field as Yes when hce Maximum Percentage field is above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       1 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      90 |
           | hceMaximumPercentage |                     101 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL990 : Maximum limit should not exceed 100 percentage"

   Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |          20909090909.99 |
           | hceMaximumAmount |          89898989898.98 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


   Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |           2090909090.99 |
           | hceMaximumAmount |          89898989898.98 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is above 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |        2090909090234.99 |
           | hceMaximumAmount |          89898989898.98 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL988 : Minimum limit dollar amount should not exceed format of 100000000000.00"


  Scenario: To verify the HCE Deferral limts field as Yes when hce Minimum Amount field is above 11 characters with 3 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |       2090909090234.993 |
           | hceMaximumAmount |          89898989898.98 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL988 : Minimum limit dollar amount should not exceed format of 100000000000.00"


 

  Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is above 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |          20909090901.99 |
           | hceMaximumAmount |        2090909090234.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL992 : Maximum limit dollar amount should not exceed format of 100000000000.00"

Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |            209090909.99 |
           | hceMaximumAmount |           2090909090.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should respond with successful message

 Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |            209090909.99 |
           | hceMaximumAmount |          20909090901.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should respond with successful message

 #bug

 Scenario: To verify the HCE Deferral limts field as Yes when hce Maximum Amount field is equal 11 characters with 3 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key              | value                   |
           | sourceName       | random 10 alphaNumerics |
           | contributionType |                       2 |
           | isHCEManatory    | true                    |
           | hceMinimumAmount |            209090909.99 |
           | hceMaximumAmount |         20909090901.992 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00"


 Scenario: To verify the HCE Deferral limts field as Yes and HCE minimum percentage field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       3 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                         |
           | hceMaximumPercentage |                      25 |
           | hceMinimumAmount     |            209090909.99 |
           | hceMaximumAmount     |          20909090901.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL996 : Required"


  Scenario:  To verify the HCE Deferral limts field as Yes and HCE Maximum percentage field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       3 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      25 |
           | hceMaximumPercentage |                         |
           | hceMinimumAmount     |            209090909.99 |
           | hceMaximumAmount     |          20909090901.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1002 : Required"

   Scenario:  To verify the HCE Deferral limts field as Yes and HCE Maximum Amount field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       3 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      25 |
           | hceMaximumPercentage |                      35 |
           | hceMinimumAmount     |            209090909.99 |
           | hceMaximumAmount     |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1005 : Required"


  Scenario:  To verify the HCE Deferral limts field as Yes and HCE minimum Amount field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | contributionType     |                       3 |
           | isHCEManatory        | true                    |
           | hceMinimumPercentage |                      25 |
           | hceMaximumPercentage |                      35 |
           | hceMinimumAmount     |                         |
           | hceMaximumAmount     |            209090909.99 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL999 : Required"


  Scenario:  To verify the isCatchUpManatory field as Yes and catchupMinimumPercentage field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | isCatchUpManatory        | true                    |
           | catchUpType              |                       1 |
           | catchupMinimumPercentage |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL997 : Required"

   Scenario:  To verify the isCatchUpManatory field as Yes and catchupMaximumPercentage field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMaximumPercentage |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1003 : Required"


    Scenario:  To verify the isCatchUpManatory field as Yes and catchupMinimumAmount  field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |                         |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1000 : Required"

  Scenario:  To verify the isCatchUpManatory field as Yes and catchupMaximumAmount  field is blank
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMaximumAmount |                         |   

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1006 : Required"


 Scenario:  To verify the isCatchUpManatory field as Yes and catchupMinimumPercentage field is equal to catchupMaximumPercentage field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      20 |
           | catchupMaximumPercentage |                      20 |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"

 Scenario:  To verify the isCatchUpManatory field as Yes  when hce catchupMinimumAmount is equal to catchupMaximumAmount  field
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |                      20 |
           | catchupMaximumAmount |                      20 |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1019 : Maximum limit amount should not be equal or lesser than minimum limit"


 Scenario:To verify the isCatchUpManatory field as Yes  when hce catchupMinimumAmount is equal to catchupMaximumAmount  field in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       3 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |                      20 |
           | catchupMaximumAmount |                      20 |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"


 Scenario:To verify the isCatchUpManatory field as Yes and catchupMinimumPercentage field is equal to catchupMaximumPercentage field in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      20 |
           | catchupMaximumPercentage |                      20 |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"



  Scenario:To verify the isCatchUpManatory field as Yes  when catchup  Percentage field  as length 3 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                     100 |
           | catchupMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"

 
  Scenario:To verify the CatchUpManatory field as Yes  when catchup  Percentage field as length 4 characters
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                    1020 |
           | catchupMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL987 : Minimum limit should not exceed 100 percentage"

 Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is greater than catchupMaximumPercentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                     100 |
           | catchupMaximumPercentage |                      70 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
 Then API should give response as "PL1016 : Maximum limit amount should not be equal or lesser than minimum limit"


  Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is smaller than catchupMaximumPercentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      40 |
           | catchupMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


  Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                     101 |
           | catchupMaximumPercentage |                     100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL987 : Minimum limit should not exceed 100 percentage"

  Scenario:To verify the CatchUpManatory field as Yes when catchupMaximumPercentage field is above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       1 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                     100 |
           | catchupMaximumPercentage |                     101 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL991 : Maximum limit should not exceed 100 percentage"   

  Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumAmount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value                   |
           | sourceName             | random 10 alphaNumerics |
           | catchUpType            |                       2 |
           | isCatchUpManatory      | true                    |
           | catchupMinimumAmount   |          20909090909.99 |
           | catchupMaximumAmount   |          89898989898.98 |
           | limitMinimumPercentage |                      80 |
           | limitMaximumPercentage |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message   

  Scenario:To verify the CatchUpManatory field field as Yes when catchupMinimumAmount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |           2090909099.99 |
           | catchupMaximumAmount |          89898989898.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message   

 Scenario:To verify the CatchUpManatory field field as Yes when catchupMinimumAmount field is above 11 characters with 2 decimal point
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |         209090229099.99 |
           | catchupMaximumAmount |          89898989898.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL989 :Minimum limit dollar amount should not exceed format of 100000000000.00" 

 Scenario:To verify the CatchUpManatory field field as Yes when catchupMinimumAmount field is above 11 characters with 3 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |       2090902229099.992 |
           | catchupMaximumAmount |          89898989898.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL989 : Minimum limit dollar amount should not exceed format of 100000000000.00" 

 Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is above 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |          20909022299.99 |
           | catchupMaximumAmount |         898989898982.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL993 : Maximum limit dollar amount should not exceed format of 100000000000.00" 

 Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is below 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |               209090.99 |
           | catchupMaximumAmount |              8989898.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is equal 11 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |            209090222.99 |
           | catchupMaximumAmount |          89898989821.98 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
#bug

 Scenario:To verify the CatchUpManatory field field as Yes when catchupMaximumAmount field is equal 11 characters with 3 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                  | value                   |
           | sourceName           | random 10 alphaNumerics |
           | catchUpType          |                       2 |
           | isCatchUpManatory    | true                    |
           | catchupMinimumAmount |         20909022288.998 |
           | catchupMaximumAmount |          20909090901.99 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL188 : Maximum limit dollar amount should not exceed format of 100000000000.00" 

 Scenario:To verify the CatchUpManatory field as Yes when catchupMinimumPercentage field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                         |
           | catchupMaximumPercentage |                      10 |
           | catchupMinimumAmount     |            209090222.99 |
           | catchupMaximumAmount     |           2090909090.99 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL997 : Required"

 Scenario:To verify the CatchUpManatory field as Yes when catchupMaximumPercentage field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      10 |
           | catchupMaximumPercentage |                         |
           | catchupMinimumAmount     |            209090222.99 |
           | catchupMaximumAmount     |           2090909090.99 |
           | limitMinimumPercentage   |                      80 |
           | limitMaximumPercentage   |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1003 : Required"

Scenario:To verify the CatchUpManatory field as Yes when catchupMaximumAmount field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      10 |
           | catchupMaximumPercentage |                      40 |
           | catchupMinimumAmount     |            209090222.99 |
           | catchupMaximumAmount     |                         |
           | limitMinimumPercentage   |                      80 |
           | limitMaximumPercentage   |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1006 : Required"

Scenario:To verify  the CatchUpManatory field as Yes when catchupMinimumAmount field is blank in both
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value                   |
           | sourceName               | random 10 alphaNumerics |
           | catchUpType              |                       3 |
           | isCatchUpManatory        | true                    |
           | catchupMinimumPercentage |                      10 |
           | catchupMaximumPercentage |                      40 |
           | catchupMinimumAmount     |                         |
           | catchupMaximumAmount     |            209090222.99 |
           | limitMinimumPercentage   |                      80 |
           | limitMaximumPercentage   |                     100 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1000 : Required"




