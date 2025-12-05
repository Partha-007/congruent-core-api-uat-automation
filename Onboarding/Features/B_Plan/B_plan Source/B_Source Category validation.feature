Feature: B_Source Category validation
[BeforeTestRun]

#Scenario: To Verify the Source Category Mandatory Validation for Employee Source with error message
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#
#  And Configuration has been made as per following
#| block | propertyName                       | value  |
#|     1 | sourceCategory                     |        |
#|     2 | sourceType                         |      2 |
#|     2 | sourceCategory                     |        |
#|     3 | sourceType                         |      1 |
#|     3 | sourceCategory                     |      1 |
#|     3 | SourceSubCategory                  |        |
#|     4 | sourceType                         |      1 |
#|     4 | sourceCategory                     |      1 |
#|     4 | RehireDeferralPercentage           |    102 |
#|     5 | sourceType                         |      2 |
#|     5 | sourceCategory                     |      6 |
#|     5 | isSafeHarbourMatch                 | true   |
#|     5 | safeHarbourType                    |      3 |
#|     5 | enhancedshMatchPercentage          |        |
#|     5 | uptoPercentageOfDeferral           |     10 |
#|     6 | sourceType                         |      2 |
#|     6 | sourceCategory                     |      5 |
#|     6 | isSafeHarbourMatch                 | false  |
#|     6 | employercontributionType           |      1 |
#|     6 | firstTierMatchPercent              |     76 |
#|     6 | firstTierCompensationMatchPercent  |    101 |
#|     6 | secondTierMatchPercent             |     76 |
#|     6 | secondTierCompensationMatchPercent |     78 |
#|     6 | thirdTierMatchPercent              |     76 |
#|     6 | thirdTierCompensationMatchPercent  |     78 |
#|     7 | sourceType                         |      2 |
#|     7 | sourceCategory                     |      5 |
#|     7 | isSafeHarbourMatch                 | false  |
#|     7 | employercontributionType           |      1 |
#|     7 | firstTierMatchPercent              |     76 |
#|     7 | firstTierCompensationMatchPercent  |     78 |
#|     7 | secondTierMatchPercent             |    101 |
#|     7 | secondTierCompensationMatchPercent |     78 |
#|     7 | thirdTierMatchPercent              |     76 |
#|     7 | thirdTierCompensationMatchPercent  |     78 |
#|     8 | sourceType                         |      2 |
#|     8 | sourceCategory                     |      5 |
#|     8 | isSafeHarbourMatch                 | false  |
#|     8 | employercontributionType           |      1 |
#|     8 | firstTierMatchPercent              |     76 |
#|     8 | firstTierCompensationMatchPercent  |     78 |
#|     8 | secondTierMatchPercent             |     76 |
#|     8 | secondTierCompensationMatchPercent |    101 |
#|     8 | thirdTierMatchPercent              |     76 |
#|     8 | thirdTierCompensationMatchPercent  |     78 |
#|     9 | sourceType                         |      2 |
#|     9 | sourceCategory                     |      5 |
#|     9 | isSafeHarbourMatch                 | false  |
#|     9 | employercontributionType           |      1 |
#|     9 | firstTierMatchPercent              |     76 |
#|     9 | firstTierCompensationMatchPercent  |     78 |
#|     9 | secondTierMatchPercent             |     76 |
#|     9 | secondTierCompensationMatchPercent |     78 |
#|     9 | thirdTierMatchPercent              |    101 |
#|     9 | thirdTierCompensationMatchPercent  |     78 |
#|    10 | sourceType                         |      2 |
#|    10 | sourceCategory                     |      5 |
#|    10 | isSafeHarbourMatch                 | false  |
#|    10 | employercontributionType           |      1 |
#|    10 | firstTierMatchPercent              |     76 |
#|    10 | firstTierCompensationMatchPercent  |     78 |
#|    10 | secondTierMatchPercent             |     76 |
#|    10 | secondTierCompensationMatchPercent |     78 |
#|    10 | thirdTierMatchPercent              |     76 |
#|    10 | thirdTierCompensationMatchPercent  |    101 |
#|    11 | sourceType                         |      2 |
#|    11 | sourceCategory                     |      5 |
#|    11 | percentageOfCompensation           | 111.00 |
#|    12 | sourceType                         |      2 |
#|    12 | sourceCategory                     |      6 |
#|    12 | isSafeHarbourMatch                 | true   |
#|    12 | safeHarbourType                    |      3 |
#|    12 | uptoPercentageOfDeferral           |      3 |
#|    12 | enhancedshMatchPercentage          |    101 |
#|    13 | sourceType                         |      2 |
#|    13 | sourceCategory                     |      6 |
#|    13 | employercontributionType           |      2 |
#|    13 | PercentageOfCalculation            |    101 |
#|    13 | percentageOfCompensation           |     10 |
#|    14 | sourceType                         |      2 |
#|    14 | sourceCategory                     |      6 |
#|    14 | employercontributionType           |      2 |
#|    14 | PercentageOfCalculation            |     10 |
#|    14 | percentageOfCompensation           |    101 |
#|    15 | sourceType                         |      2 |
#|    15 | sourceCategory                     |      5 |
#|    15 | percentageOfCompensation           |   0.00 |
#|    16 | sourceType                         |      2 |
#|    16 | sourceCategory                     |      6 |
#|    16 | isSafeHarbourMatch                 | true   |
#|    16 | safeHarbourType                    |      3 |
#|    16 | enhancedshMatchPercentage          |     10 |
#|    16 | uptoPercentageOfDeferral           |    101 |
#|    17 | sourceType                         |      2 |
#|    17 | sourceCategory                     |      6 |
#|    17 | isSafeHarbourMatch                 | true   |
#|    17 | safeHarbourType                    |      3 |
#|    17 | enhancedshMatchPercentage          |     10 |
#|    17 | uptoPercentageOfDeferral           |    0.0 |
#|    18 | sourceType                         |      2 |
#|    18 | sourceCategory                     |      6 |
#|    18 | isMaximumLimitApplicable           | true   |
#|    18 | maximumDollarLimit                 |        |
#|    19 | sourceType                         |      2 |
#|    19 | sourceCategory                     |      6 |
#|    19 | isNonPayPeriodApplicable           | true   |
#|    19 | IsLastDayRule                      | true   |
#|    19 | IsHoursRequirement                 | true   |
#|    19 | Hours                              |        |
#|    20 | sourceType                         |      2 |
#|    20 | sourceCategory                     |      6 |
#|    20 | isNonPayPeriodApplicable           | true   |
#|    20 | IsLastDayRule                      | true   |
#|    20 | IsHoursRequirement                 | true   |
#|    20 | Hours                              |   2000 |
#|    21 | sourceType                         |      2 |
#|    21 | sourceCategory                     |      6 |
#|    21 | IsLastDayRuleApplicable            | true   |
#
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then the API response should contain the 21 following errors
#| error_code | error_message                                                   |
#| PL175      | Required                                                        |
#| PL175      | Required                                                        |
#| PL176      | Required                                                        |
#| PL191      | Deferral percentage for rehire should not exceed 100 percentage |
#| PL251      | Required                                                        |
#|            | null                                                            |
#|            | null                                                            |
#|            | null                                                            |
#|            | null                                                            |
#|            | null                                                            |
#| PL244      | When percentage compensation is greater than 100                |
#| PL396      | Required                                                        |
#|            | null                                                            |
#| PL244      | When percentage compensation is greater than 100                |
#| PL395      | Required                                                        |
#|            | null                                                            |
#| PL255      | Required                                                        |
#| PL1118     | Required                                                        |
#| PL1190     | Required                                                        |
#| PL1174     | Hours should not be greater than 1000                           |
#| PL1008     | Required                                                        |


#Scenario: To Verify the Source Category Mandatory Validation for Employee Source
#Given Model is selected for the endpoint "/api/Source/SaveSource"
#When Configuration has been made as per following
#           | key       | value       |
#           | companyId | <CompanyId> |
#And Configuration has been made as per following
#| block | propertyName                       | value          |
#|     1 | sourceType                         |              1 |
#|     1 | sourceCategory                     |              1 |
#|     1 | RehireDeferralPercentage           |            100 |
#|     2 | sourceType                         |              1 |
#|     2 | sourceCategory                     |              1 |
#|     2 | RehireDeferralPercentage           |          99.00 |
#|     3 | sourceType                         |              2 |
#|     3 | sourceCategory                     |              5 |
#|     3 | percentageOfCompensation           |          99.00 |
#|     4 | sourceType                         |              2 |
#|     4 | sourceCategory                     |              6 |
#|     4 | isSafeHarbourMatch                 | true           |
#|     4 | safeHarbourType                    |              3 |
#|     4 | enhancedshMatchPercentage          |             88 |
#|     4 | uptoPercentageOfDeferral           |          99.00 |
#|     5 | sourceType                         |              1 |
#|     5 | sourceCategory                     |              1 |
#|     5 | contributionType                   |              2 |
#|     5 | limitMinimumDollar                 |       10000.00 |
#|     6 | sourceType                         |              1 |
#|     6 | sourceCategory                     |              1 |
#|     6 | contributionType                   |              2 |
#|     6 | limitMinimumDollar                 | 10000000000.00 |
#|     7 | sourceType                         |              1 |
#|     7 | sourceCategory                     |              1 |
#|     7 | contributionType                   |              1 |
#|     7 | limitMinimumPercentage             |             75 |
#|     8 | sourceType                         |              1 |
#|     8 | sourceCategory                     |              1 |
#|     8 | contributionType                   |              2 |
#|     8 | LimitMaximumDollar                 |       12350.00 |
#|     9 | sourceType                         |              1 |
#|     9 | sourceCategory                     |              1 |
#|     9 | contributionType                   |              2 |
#|     9 | LimitMaximumDollar                 | 10000000000.00 |
#|    10 | sourceType                         |              1 |
#|    10 | sourceCategory                     |              1 |
#|    10 | contributionType                   |              2 |
#|    10 | maximumDollarCompensation          |      342445.00 |
#|    11 | sourceType                         |              1 |
#|    11 | sourceCategory                     |              1 |
#|    11 | contributionType                   |              2 |
#|    11 | maximumDollarCompensation          | 10000000000.00 |
#|    12 | sourceType                         |              2 |
#|    12 | sourceCategory                     |              6 |
#|    12 | isSafeHarbourMatch                 | true           |
#|    12 | safeHarbourType                    |              3 |
#|    12 | enhancedshMatchPercentage          |            100 |
#|    12 | uptoPercentageOfDeferral           |          10.00 |
#|    13 | sourceType                         |              2 |
#|    13 | sourceCategory                     |              6 |
#|    13 | isSafeHarbourMatch                 | true           |
#|    13 | safeHarbourType                    |              3 |
#|    13 | enhancedshMatchPercentage          |            100 |
#|    13 | uptoPercentageOfDeferral           |         100.00 |
#|    14 | sourceType                         |              2 |
#|    14 | sourceCategory                     |              6 |
#|    14 | isSafeHarbourMatch                 | true           |
#|    14 | safeHarbourType                    |              3 |
#|    14 | enhancedshMatchPercentage          |            100 |
#|    14 | percentageOfCompensation           |            100 |
#|    14 | uptoPercentageOfDeferral           |          10.00 |
#|    15 | sourceType                         |              2 |
#|    15 | sourceCategory                     |              6 |
#|    15 | isSafeHarbourMatch                 | true           |
#|    15 | safeHarbourType                    |              3 |
#|    15 | enhancedshMatchPercentage          |            123 |
#|    15 | uptoPercentageOfDeferral           |          10.00 |
#|    16 | sourceType                         |              2 |
#|    16 | sourceCategory                     |              5 |
#|    16 | isSafeHarbourMatch                 | true           |
#|    16 | safeHarbourType                    |              3 |
#|    16 | percentageOfCompensation           |             17 |
#|    16 | enhancedshMatchPercentage          |             10 |
#|    16 | uptoPercentageOfDeferral           |             10 |
#|    17 | sourceType                         |              2 |
#|    17 | sourceCategory                     |              5 |
#|    17 | isSafeHarbourMatch                 | false          |
#|    17 | employercontributionType           |              2 |
#|    17 | PercentageOfCalculation            |            100 |
#|    17 | percentageOfCompensation           |             10 |
#|    18 | sourceType                         |              2 |
#|    18 | sourceCategory                     |              5 |
#|    18 | isSafeHarbourMatch                 | false          |
#|    18 | employercontributionType           |              2 |
#|    18 | PercentageOfCalculation            |             76 |
#|    18 | percentageOfCompensation           |             10 |
#|    19 | sourceType                         |              2 |
#|    19 | sourceCategory                     |              5 |
#|    19 | isSafeHarbourMatch                 | false          |
#|    19 | employercontributionType           |              2 |
#|    19 | PercentageOfCalculation            |             76 |
#|    19 | percentageOfCompensation           |             78 |
#|    20 | sourceType                         |              2 |
#|    20 | sourceCategory                     |              5 |
#|    20 | isSafeHarbourMatch                 | false          |
#|    20 | employercontributionType           |              1 |
#|    20 | firstTierMatchPercent              |            100 |
#|    20 | firstTierCompensationMatchPercent  |             78 |
#|    20 | secondTierMatchPercent             |             76 |
#|    20 | secondTierCompensationMatchPercent |             78 |
#|    20 | thirdTierMatchPercent              |             76 |
#|    20 | thirdTierCompensationMatchPercent  |             78 |
#|    21 | sourceType                         |              2 |
#|    21 | sourceCategory                     |              5 |
#|    21 | isSafeHarbourMatch                 | false          |
#|    21 | employercontributionType           |              1 |
#|    21 | firstTierMatchPercent              |             76 |
#|    21 | firstTierCompensationMatchPercent  |             78 |
#|    21 | secondTierMatchPercent             |             76 |
#|    21 | secondTierCompensationMatchPercent |             78 |
#|    21 | thirdTierMatchPercent              |             76 |
#|    21 | thirdTierCompensationMatchPercent  |             78 |
#|    22 | sourceType                         |              2 |
#|    22 | sourceCategory                     |              5 |
#|    22 | isSafeHarbourMatch                 | false          |
#|    22 | employercontributionType           |              1 |
#|    22 | firstTierMatchPercent              |             76 |
#|    22 | firstTierCompensationMatchPercent  |             78 |
#|    22 | secondTierMatchPercent             |            100 |
#|    22 | secondTierCompensationMatchPercent |             78 |
#|    22 | thirdTierMatchPercent              |             76 |
#|    22 | thirdTierCompensationMatchPercent  |             78 |
#|    23 | sourceType                         |              2 |
#|    23 | sourceCategory                     |              6 |
#|    23 | isSafeHarbourMatch                 | false          |
#|    23 | employercontributionType           |              3 |
#|    23 | firstTierMatchPercent              |            101 |
#|    23 | firstTierCompensationMatchPercent  |             78 |
#|    23 | secondTierMatchPercent             |             76 |
#|    23 | secondTierCompensationMatchPercent |             78 |
#|    23 | thirdTierMatchPercent              |             76 |
#|    23 | thirdTierCompensationMatchPercent  |             78 |
#|    24 | sourceType                         |              2 |
#|    24 | sourceCategory                     |              5 |
#|    24 | isSafeHarbourMatch                 | false          |
#|    24 | employercontributionType           |              1 |
#|    24 | firstTierMatchPercent              |             76 |
#|    24 | firstTierCompensationMatchPercent  |             78 |
#|    24 | secondTierMatchPercent             |             76 |
#|    24 | secondTierCompensationMatchPercent |             78 |
#|    24 | thirdTierMatchPercent              |             76 |
#|    24 | thirdTierCompensationMatchPercent  |             78 |
#|    25 | sourceType                         |              2 |
#|    25 | sourceCategory                     |              5 |
#|    25 | isSafeHarbourMatch                 | false          |
#|    25 | employercontributionType           |              1 |
#|    25 | firstTierMatchPercent              |             76 |
#|    25 | firstTierCompensationMatchPercent  |             78 |
#|    25 | secondTierMatchPercent             |            100 |
#|    25 | secondTierCompensationMatchPercent |             78 |
#|    25 | thirdTierMatchPercent              |             76 |
#|    25 | thirdTierCompensationMatchPercent  |             78 |
#|    26 | sourceType                         |              2 |
#|    26 | sourceCategory                     |              5 |
#|    26 | isSafeHarbourMatch                 | false          |
#|    26 | employercontributionType           |              1 |
#|    26 | firstTierMatchPercent              |             76 |
#|    26 | firstTierCompensationMatchPercent  |             78 |
#|    26 | secondTierMatchPercent             |             76 |
#|    26 | secondTierCompensationMatchPercent |            100 |
#|    26 | thirdTierMatchPercent              |             76 |
#|    26 | thirdTierCompensationMatchPercent  |             78 |
#|    27 | sourceType                         |              2 |
#|    27 | sourceCategory                     |              5 |
#|    27 | isSafeHarbourMatch                 | false          |
#|    27 | employercontributionType           |              1 |
#|    27 | firstTierMatchPercent              |             76 |
#|    27 | firstTierCompensationMatchPercent  |             78 |
#|    27 | secondTierMatchPercent             |             76 |
#|    27 | secondTierCompensationMatchPercent |             78 |
#|    27 | thirdTierMatchPercent              |            100 |
#|    27 | thirdTierCompensationMatchPercent  |             78 |
#|    28 | sourceType                         |              2 |
#|    28 | sourceCategory                     |              5 |
#|    28 | isSafeHarbourMatch                 | false          |
#|    28 | employercontributionType           |              1 |
#|    28 | firstTierMatchPercent              |             76 |
#|    28 | firstTierCompensationMatchPercent  |             78 |
#|    28 | secondTierMatchPercent             |             76 |
#|    28 | secondTierCompensationMatchPercent |             78 |
#|    28 | thirdTierMatchPercent              |             76 |
#|    28 | thirdTierCompensationMatchPercent  |            100 |
#|    29 | sourceType                         |              2 |
#|    29 | sourceCategory                     |              6 |
#|    29 | isSafeHarbourMatch                 | true           |
#|    29 | safeHarbourType                    |              3 |
#|    29 | enhancedshMatchPercentage          |             10 |
#|    29 | uptoPercentageOfDeferral           |            123 |
#|    30 | sourceType                         |              2 |
#|    30 | sourceCategory                     |              6 |
#|    30 | isMaximumLimitApplicable           | true           |
#|    30 | maximumDollarLimit                 |            100 |
#|    31 | sourceType                         |              2 |
#|    31 | sourceCategory                     |              6 |
#|    31 | isMaximumLimitApplicable           | true           |
#|    31 | maximumDollarLimit                 |     8738388.33 |
#|    32 | sourceType                         |              2 |
#|    32 | sourceCategory                     |              6 |
#|    32 | isMaximumLimitApplicable           | true           |
#|    32 | maximumDollarLimit                 |       87383.33 |
#|    33 | sourceType                         |              2 |
#|    33 | sourceCategory                     |              6 |
#|    33 | isMaximumLimitApplicable           | true           |
#|    33 | maximumDollarLimit                 |    87383333.33 |
#|    34 | sourceType                         |              2 |
#|    34 | sourceCategory                     |              6 |
#|    34 | isMaximumLimitApplicable           | true           |
#|    34 | maximumDollarLimit                 |    8738333.333 |
#|    35 | sourceType                         |              2 |
#|    35 | sourceCategory                     |              6 |
#|    35 | isNonPayPeriodApplicable           | true           |
#|    36 | sourceType                         |              2 |
#|    36 | sourceCategory                     |              6 |
#|    36 | isNonPayPeriodApplicable           | true           |
#|    36 | isIncludeDefferals                 | true           |
#|    37 | sourceType                         |              2 |
#|    37 | sourceCategory                     |              6 |
#|    37 | isNonPayPeriodApplicable           | true           |
#|    37 | IsIncludePlanCompensation          | true           |
#|    38 | sourceType                         |              2 |
#|    38 | sourceCategory                     |              6 |
#|    38 | isNonPayPeriodApplicable           | true           |
#|    38 | IsLastDayRule                      | true           |
#|    39 | sourceType                         |              2 |
#|    39 | sourceCategory                     |              6 |
#|    39 | isNonPayPeriodApplicable           | true           |
#|    39 | IsLastDayRule                      | true           |
#|    39 | IsHoursRequirement                 | true           |
#|    39 | Hours                              |            200 |
#|    40 | sourceType                         |              2 |
#|    40 | sourceCategory                     |              6 |
#|    40 | isNonPayPeriodApplicable           | true           |
#|    40 | IsLastDayRule                      | true           |
#|    40 | IsHoursRequirement                 | true           |
#|    40 | Hours                              |           1000 |
#|    41 | sourceType                         |              2 |
#|    41 | sourceCategory                     |              6 |
#|    41 | isNonPayPeriodApplicable           | true           |
#|    41 | IsHoursRequirement                 | true           |
#|    41 | Hours                              |            100 |
#|    41 | isNormalRetirement                 | true           |
#|    41 | IsEarlyRetirement                  | true           |
#|    41 | IsDeath                            | true           |
#|    41 | IsDisability                       | true           |
#
#
#And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
#Then API should respond with successful message



Scenario: To verify the  Allocation formula description data type acceptance
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Collection in a model is configured with 21 blocks for the property "AdditionalDeferralSource" with values to save model portfolio as given below
| BlockNumber | Key                          | Value                                                                                                                                                                          |
|           1 | AllocationFormulaDescription | ajhdkjfhsd346546546                                                                                                                                                            |
|           2 | AllocationFormulaDescription | alpjdghkjdgfjg                                                                                                                                                                 |
|           3 | AllocationFormulaDescription | qwertyuioplkjhgfdsazxcvbnmkgjreuehdjeiwn47564737dheruewhdyrhskrurhfjfudjeyudjerurjfurj                                                                                         |
|           4 | AllocationFormulaDescription | qwertyuioplkjhgfdsazxcvbnmkgjreuehdjeiwn47564737dheruewhdyrhskrurhfjfudjeyudjerurjfurjheydheydhdydheydhedheydheyeheyeheyeheyejeyeheyeyeyeyeyeueueuenenenenenenenenenehehyeyeye |
|           5 | AllocationFormulaDescription |                                                                                                                                                                    12344556667 |
|           6 | ContributionType             |                                                                                                                                                                              1 |
|           6 | LimitMinimumPercentage       |                                                                                                                                                                          99.00 |
|           7 | ContributionType             |                                                                                                                                                                              1 |
|           7 | LimitMaximumPercentage       |                                                                                                                                                                          99.00 |
|           8 | ContributionType             |                                                                                                                                                                              1 |
|           8 | MaximumDollarCompensation    |                                                                                                                                                                          99.00 |
|           9 | ContributionType             |                                                                                                                                                                              1 |
|           9 | RehireDeferralPercentage     |                                                                                                                                                                          99.00 |
|          10 | ContributionType             |                                                                                                                                                                              1 |
|          10 | LimitMinimumDollar           |                                                                                                                                                                    99999999.00 |
|          11 | ContributionType             |                                                                                                                                                                              1 |
|          11 | LimitMinimumDollar           |                                                                                                                                                                 10000000000.00 |
|          12 | ContributionType             |                                                                                                                                                                              1 |
|          12 | LimitMinimumPercentage       |                                                                                                                                                                         100.00 |
|          13 | ContributionType             |                                                                                                                                                                              2 |
|          13 | LimitMaximumDollar           |                                                                                                                                                                    99999999.00 |
|          14 | ContributionType             |                                                                                                                                                                              2 |
|          14 | LimitMaximumDollar           |                                                                                                                                                                 10000000000.00 |
|          15 | ContributionType             |                                                                                                                                                                              2 |
|          15 | LimitMaximumPercentage       |                                                                                                                                                                         100.00 |
|          16 | ContributionType             |                                                                                                                                                                              2 |
|          16 | LimitMaximumPercentage       |                                                                                                                                                                          99.00 |
|          17 | ContributionType             |                                                                                                                                                                              2 |
|          17 | MaximumDollarCompensation    |                                                                                                                                                                    99999999.00 |
|          18 | ContributionType             |                                                                                                                                                                              2 |
|          18 | MaximumDollarCompensation    |                                                                                                                                                                 10000000000.00 |
|          19 | ContributionType             |                                                                                                                                                                              2 |
|          19 | MaximumDollarCompensation    |                                                                                                                                                                         100.00 |
|          20 | ContributionType             |                                                                                                                                                                              2 |
|          20 | RehireDeferralPercentage     |                                                                                                                                                                         100.00 |
|          21 | AllocationEffectiveEndDate   | 2021-04-21T00:00:00Z                                                                                                                                                           |



And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message









Scenario: 8351 To verify the Deferral percentage for re-hires? acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     1 |
           | sourceCategory           |     1 |
           | rehireDeferralPercentage |   100 |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8352 To verify the Deferral percentage for re-hires? acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value  |
           | sourceType               |      1 |
           | sourceCategory           |      1 |
           | rehireDeferralPercentage |  99.00 |
           | limitMaximumPercentage   |    100 |
           | limitMinimumPercentage   |     20 |
           | sourceName               | abc123 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8436 To verify the Percentage of compensation acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     5 |
           | percentageOfCompensation | 99.00 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario: 8454 To verify theEnhanced sh match percentage acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     6 |
           | isSafeHarbourMatch        | true  |
           | safeHarbourType           |     3 |
           | enhancedshMatchPercentage |    88 |
           | uptoPercentageOfDeferral  | 99.00 |
           | limitMaximumPercentage    |   100 |
           | limitMinimumPercentage    |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8357 To verify the Limit (minimum) acceptance criteria of values below 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value    |
           | sourceType             |        1 |
           | sourceCategory         |        1 |
           | contributionType       |        2 |
           | limitMinimumDollar     | 10000.00 |
           | limitMaximumPercentage |      100 |
           | limitMinimumPercentage |       20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8356 To verify the Limit (minimum) acceptance criteria of values equal 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value          |
           | sourceType             |              1 |
           | sourceCategory         |              1 |
           | contributionType       |              2 |
           | limitMinimumDollar     | 10000000000.00 |
           | limitMaximumPercentage |            100 |
           | limitMinimumPercentage |             20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8339 To verify the Limit (minimum) acceptance criteria of values below 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value |
           | sourceType             |     1 |
           | sourceCategory         |     1 |
           | contributionType       |     1 |
           | limitMinimumPercentage |    75 |
           | limitMaximumPercentage |   100 |
           | limitMinimumPercentage |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8362 To verify the Limit (maximum) acceptance criteria of values below 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value    |
           | sourceType             |        1 |
           | sourceCategory         |        1 |
           | contributionType       |        2 |
           | limitMaximumDollar     | 12350.00 |
           | limitMaximumPercentage |      100 |
           | limitMinimumPercentage |       20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8361 To verify the Limit (maximum) acceptance criteria of values equal 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                    | value          |
           | sourceType             |              1 |
           | sourceCategory         |              1 |
           | contributionType       |              2 |
           | limitMaximumDollar     | 10000000000.00 |
           | limitMaximumPercentage |            100 |
           | limitMinimumPercentage |             20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8366 To verify the Maximum compensation acceptance criteria of values below 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value     |
           | sourceType                |         1 |
           | sourceCategory            |         1 |
           | contributionType          |         2 |
           | maximumDollarCompensation | 342445.00 |
           | limitMaximumPercentage    |       100 |
           | limitMinimumPercentage    |        20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8365 To verify the Maximum compensation acceptance criteria of values equal 10000000000.00 dollar
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value          |
           | sourceType                |              1 |
           | sourceCategory            |              1 |
           | contributionType          |              2 |
           | maximumDollarCompensation | 10000000000.00 |
           | limitMaximumPercentage    |            100 |
           | limitMinimumPercentage    |             20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8453 To verify theEnhanced sh match percentage acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     6 |
           | isSafeHarbourMatch        | true  |
           | safeHarbourType           |     3 |
           | enhancedshMatchPercentage |   100 |
           | uptoPercentageOfDeferral  | 10.00 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8462 To verify the Up to percentage of deferral acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value  |
           | sourceType                |      2 |
           | sourceCategory            |      6 |
           | isSafeHarbourMatch        | true   |
           | safeHarbourType           |      3 |
           | enhancedshMatchPercentage |    100 |
           | uptoPercentageOfDeferral  | 100.00 |
           | limitMaximumPercentage    |    100 |
           | limitMinimumPercentage    |     20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8435 To verify the Percentage of compensation acceptance criteria of values equal 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     6 |
           | isSafeHarbourMatch        | true  |
           | safeHarbourType           |     3 |
           | enhancedshMatchPercentage |   100 |
           | percentageOfCompensation  |   100 |
           | uptoPercentageOfDeferral  | 10.00 |
           | limitMaximumPercentage    |   100 |
           | limitMinimumPercentage    |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8448 To verify the Enhanced sh match percentage data type acceptance of only numeric
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     6 |
           | isSafeHarbourMatch        | true  |
           | safeHarbourType           |     3 |
           | enhancedshMatchPercentage |   123 |
           | uptoPercentageOfDeferral  | 10.00 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8430 To verify the Percentage of compensation data type acceptance of only numeric
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     5 |
           | isSafeHarbourMatch        | true  |
           | safeHarbourType           |     3 |
           | percentageOfCompensation  |    17 |
           | enhancedshMatchPercentage |    10 |
           | uptoPercentageOfDeferral  |    10 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8476 To verify the Match Percent field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     5 |
           | isSafeHarbourMatch       | false |
           | employercontributionType |     2 |
           | percentageOfCalculation  |   100 |
           | percentageOfCompensation |    10 |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8673 To verify the Match Percent field acceptance criteria of value below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     5 |
           | isSafeHarbourMatch       | false |
           | employercontributionType |     2 |
           | percentageOfCalculation  |    76 |
           | percentageOfCompensation |    10 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8478 To verify the Match Percent field acceptance criteria of value below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     5 |
           | isSafeHarbourMatch       | false |
           | employercontributionType |     2 |
           | percentageOfCalculation  |    76 |
           | percentageOfCompensation |    100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8479 To verify the Percentage of compensation matched field acceptance criteria of value below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | isSafeHarbourMatch       | false |
           | employercontributionType |     2 |
           | percentageOfCalculation  |    76 |
           | percentageOfCompensation |    78 |
           | sourceType               |     2 |
           | sourceCategory           |     5 |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8482 To verify the Tier#1 Match Percent field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |   100 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |    76 |
           | secondTierCompensationMatchPercent |    78 |
           | thirdTierMatchPercent              |    76 |
           | thirdTierCompensationMatchPercent  |    78 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8483 To verify the Tier#1 Match Percent field acceptance criteria of value below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |    76 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |    76 |
           | secondTierCompensationMatchPercent |    78 |
           | thirdTierMatchPercent              |    76 |
           | thirdTierCompensationMatchPercent  |    78 |
           | limitMaximumPercentage             |   100 |
           | limitMinimumPercentage             |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8485 To verify the Tier#1 Percentage of compensation matched field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |    76 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |   100 |
           | secondTierCompensationMatchPercent |    78 |
           | thirdTierMatchPercent              |    76 |
           | thirdTierCompensationMatchPercent  |    78 |
           | limitMaximumPercentage             |   100 |
           | limitMinimumPercentage             |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message


Scenario: 8486 To verify the Tier#1 Percentage of compensation matched field acceptance criteria of value below 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |    76 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |    76 |
           | secondTierCompensationMatchPercent |    78 |
           | thirdTierMatchPercent              |    76 |
           | thirdTierCompensationMatchPercent  |    78 |
           | limitMaximumPercentage             |   100 |
           | limitMinimumPercentage             |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message
#Restrict in UI but not restrict in API and its accept the firstTierCompensationMatchPercent as 101 and not throwing the error in back end

Scenario: 8488 To verify the Tier#2 Match Percent field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |    76 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |   100 |
           | secondTierCompensationMatchPercent |    78 |
           | thirdTierMatchPercent              |    76 |
           | thirdTierCompensationMatchPercent  |    78 |
           | limitMaximumPercentage             |   100 |
           | limitMinimumPercentage             |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8491 To verify the Tier#2 Percentage of compensation matched field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |    76 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |    76 |
           | secondTierCompensationMatchPercent |   100 |
           | thirdTierMatchPercent              |    76 |
           | thirdTierCompensationMatchPercent  |    78 |
           | limitMaximumPercentage             |   100 |
           | limitMinimumPercentage             |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8494 To verify the Tier#3 Match Percent field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value |
           | sourceType                         |     2 |
           | sourceCategory                     |     5 |
           | isSafeHarbourMatch                 | false |
           | employercontributionType           |     1 |
           | firstTierMatchPercent              |    76 |
           | firstTierCompensationMatchPercent  |    78 |
           | secondTierMatchPercent             |    76 |
           | secondTierCompensationMatchPercent |    78 |
           | thirdTierMatchPercent              |   100 |
           | thirdTierCompensationMatchPercent  |    78 |
           | limitMaximumPercentage             |   100 |
           | limitMinimumPercentage             |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8497 To verify the Tier#3 Percentage of compensation matched field acceptance criteria of value equal 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                                | value  |
           | sourceType                         |      2 |
           | sourceCategory                     |      5 |
           | isSafeHarbourMatch                 | false  |
           | employercontributionType           |      1 |
           | firstTierMatchPercent              |     76 |
           | firstTierCompensationMatchPercent  |     78 |
           | secondTierMatchPercent             |     76 |
           | secondTierCompensationMatchPercent |     78 |
           | thirdTierMatchPercent              |     76 |
           | thirdTierCompensationMatchPercent  |    100 |
           | limitMaximumPercentage             |    100 |
           | limitMinimumPercentage             |     20 |
           | sourceName                         | abc123 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: 8457 To verify theUp to percentage of deferral data type acceptance of only numeric
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     6 |
           | isSafeHarbourMatch        | true  |
           | safeHarbourType           |     3 |
           | enhancedshMatchPercentage |    10 |
           | uptoPercentageOfDeferral  |   123 |
           | limitMaximumPercentage    |   100 |
           | limitMinimumPercentage    |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Maximum limit applicable field as yes
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     6 |
           | isMaximumLimitApplicable | true  |
           | maximumDollarLimit       |   100 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Maximum limit applicable as yes when maximum dollar limit  field length as 7 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value      |
           | sourceType               |          2 |
           | sourceCategory           |          6 |
           | isMaximumLimitApplicable | true       |
           | maximumDollarLimit       | 8738388.33 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Maximum limit applicable as yes when maximum dollar limit  field length below 7 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value    |
           | sourceType               |        2 |
           | sourceCategory           |        6 |
           | isMaximumLimitApplicable | true     |
           | maximumDollarLimit       | 87383.33 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

#bug
Scenario: To verify the Maximum limit applicable as yes when maximum dollar limit  field length above 7 characters with 2 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value       |
           | sourceType               |           2 |
           | sourceCategory           |           6 |
           | isMaximumLimitApplicable | true        |
           | maximumDollarLimit       | 87383333.33 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

#bug
Scenario: To verify the Maximum limit applicable as yes when maximum dollar limit  field length  7 characters with 3 decimal points
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value       |
           | sourceType               |           2 |
           | sourceCategory           |           6 |
           | isMaximumLimitApplicable | true        |
           | maximumDollarLimit       | 8738333.333 |
           | limitMaximumPercentage   |         100 |
           | limitMinimumPercentage   |          20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Non pay period allocation applicable? field as yes 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     6 |
           | isNonPayPeriodApplicable | true  |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Non pay period allocation applicable? field as yes and isIncludeDefferals as true
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value  |
           | sourceType               |      2 |
           | sourceCategory           |      6 |
           | isNonPayPeriodApplicable | true   |
           | isIncludeDefferals       | true   |
           | limitMaximumPercentage   |    100 |
           | limitMinimumPercentage   |     20 |
           | souceName                | abc123 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Non pay period allocation applicable? field as yes  and isIncludeDefferals and isIncludePlanCompensation as yes
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                       | value |
           | sourceType                |     2 |
           | sourceCategory            |     6 |
           | isNonPayPeriodApplicable  | true  |
           | IsIncludePlanCompensation | true  |
           | limitMaximumPercentage    |   100 |
           | limitMinimumPercentage    |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Ongoing allocation conditions in Last day rule field as yes  
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     6 |
           | isNonPayPeriodApplicable | true  |
           | IsLastDayRule            | true  |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Ongoing allocation conditions Hours requirement field as yes and enter the  hours less than 1000 hours
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     6 |
           | isNonPayPeriodApplicable | true  |
           | IsLastDayRule            | true  |
           | IsHoursRequirement       | true  |
           | Hours                    |   200 |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the Ongoing allocation conditions Hours requirement field as yes and enter the  hours equal 1000 hours
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     6 |
           | isNonPayPeriodApplicable | true  |
           | IsLastDayRule            | true  |
           | IsHoursRequirement       | true  |
           | Hours                    |  1000 |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message

Scenario: To verify the waivers normal retirement , early retirement, Death, Disability  field as yes
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Configuration has been made as per following
           | key                      | value |
           | sourceType               |     2 |
           | sourceCategory           |     6 |
           | isNonPayPeriodApplicable | true  |
           | isHoursRequirement       | true  |
           | hours                    |   100 |
           | isNormalRetirement       | true  |
           | isEarlyRetirement        | true  |
           | isDeath                  | true  |
           | isDisability             | true  |
           | limitMaximumPercentage   |   100 |
           | limitMinimumPercentage   |    20 |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should respond with successful message




Scenario: To Verify the Source Category Mandatory Validation for Employee Source  108910
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
| key                    | value  |
| sourceCategory         |        |
| limitMaximumPercentage |    100 |
| limitMinimumPercentage |     20 |
| SourceName             | abc123 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL175 : Required"

Scenario:To Verify the Source Category Mandatory Validation for Employer Source  108911
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                    | value |
  | sourceType             |     2 |
  | sourceCategory         |       |
  | limitMaximumPercentage |   100 |
  | limitMinimumPercentage |    20 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL175 :Required"

Scenario: 8301 To verify the validation message for Source sub category by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                    | value |
  | sourceType             |     1 |
  | sourceCategory         |     1 |
  | SourceSubCategory      |       |
  | limitMaximumPercentage |   100 |
  | limitMinimumPercentage |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL176 :Required"

Scenario: 8350 To verify the validation message for Deferral percentage for re-hires? acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     1 |
  | sourceCategory           |     1 |
  | rehireDeferralPercentage |   102 |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL191 :Deferral percentage for rehire should not exceed 100 percentage"

Scenario: 8455 To verify theEnhanced sh match percentage Field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                       | value |
  | sourceType                |     2 |
  | sourceCategory            |     6 |
  | isSafeHarbourMatch        | true  |
  | safeHarbourType           |     3 |
  | enhancedshMatchPercentage |       |
  | uptoPercentageOfDeferral  |    10 |
  | limitMaximumPercentage    |   100 |
  | limitMinimumPercentage    |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL251 :Required"
#Restrict in UI but not restrict in API and its accept the firstTierMatchPercent as 101 and not throwing the error in back end

Scenario: 8481 To verify the Tier#1 Match Percent field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                                | value |
  | sourceType                         |     2 |
  | sourceCategory                     |     5 |
  | isSafeHarbourMatch                 | false |
  | employercontributionType           |     3 |
  | firstTierMatchPercent              |   101 |
  | firstTierCompensationMatchPercent  |    78 |
  | secondTierMatchPercent             |    76 |
  | secondTierCompensationMatchPercent |    78 |
  | thirdTierMatchPercent              |    76 |
  | thirdTierCompensationMatchPercent  |    78 |
  | limitMaximumPercentage             |   100 |
  | limitMinimumPercentage             |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8484 To verify the Tier#1 Percentage of compensation matched field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                                | value |
  | sourceType                         |     2 |
  | sourceCategory                     |     5 |
  | isSafeHarbourMatch                 | false |
  | employercontributionType           |     1 |
  | firstTierMatchPercent              |    76 |
  | firstTierCompensationMatchPercent  |   101 |
  | secondTierMatchPercent             |    76 |
  | secondTierCompensationMatchPercent |    78 |
  | thirdTierMatchPercent              |    76 |
  | thirdTierCompensationMatchPercent  |    78 |
  | limitMaximumPercentage             |   100 |
  | limitMinimumPercentage             |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8487 To verify the Tier#2 Match Percent field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                                | value |
  | sourceType                         |     2 |
  | sourceCategory                     |     5 |
  | isSafeHarbourMatch                 | false |
  | employercontributionType           |     1 |
  | firstTierMatchPercent              |    76 |
  | firstTierCompensationMatchPercent  |    78 |
  | secondTierMatchPercent             |   101 |
  | secondTierCompensationMatchPercent |    78 |
  | thirdTierMatchPercent              |    76 |
  | thirdTierCompensationMatchPercent  |    78 |
  | limitMaximumPercentage             |   100 |
  | limitMinimumPercentage             |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8490 To verify the Tier#2 Percentage of compensation matched field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                                | value |
  | sourceType                         |     2 |
  | sourceCategory                     |     5 |
  | isSafeHarbourMatch                 | false |
  | employercontributionType           |     1 |
  | firstTierMatchPercent              |    76 |
  | firstTierCompensationMatchPercent  |    78 |
  | secondTierMatchPercent             |    76 |
  | secondTierCompensationMatchPercent |   101 |
  | thirdTierMatchPercent              |    76 |
  | thirdTierCompensationMatchPercent  |    78 |
  | limitMaximumPercentage             |   100 |
  | limitMinimumPercentage             |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8493 To verify the Tier#3 Match Percent field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                                | value |
  | sourceType                         |     2 |
  | sourceCategory                     |     5 |
  | isSafeHarbourMatch                 | false |
  | employercontributionType           |     1 |
  | firstTierMatchPercent              |    76 |
  | firstTierCompensationMatchPercent  |    78 |
  | secondTierMatchPercent             |    76 |
  | secondTierCompensationMatchPercent |    78 |
  | thirdTierMatchPercent              |   101 |
  | thirdTierCompensationMatchPercent  |    78 |
  | limitMaximumPercentage             |   100 |
  | limitMinimumPercentage             |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8496 To verify the Tier#3 Percentage of compensation matched field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                                | value |
  | sourceType                         |     2 |
  | sourceCategory                     |     5 |
  | isSafeHarbourMatch                 | false |
  | employercontributionType           |     1 |
  | firstTierMatchPercent              |    76 |
  | firstTierCompensationMatchPercent  |    78 |
  | secondTierMatchPercent             |    76 |
  | secondTierCompensationMatchPercent |    78 |
  | thirdTierMatchPercent              |    76 |
  | thirdTierCompensationMatchPercent  |   101 |
  | limitMaximumPercentage             |   100 |
  | limitMinimumPercentage             |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8434 To verify the validation message for Percentage of compensation acceptance criteria of values more than 100 percentage 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value  |
  | sourceType               |      2 |
  | sourceCategory           |      5 |
  | percentageOfCompensation | 111.00 |
  | limitMaximumPercentage   |    100 |
  | limitMinimumPercentage   |     20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL244 :When percentage compensation is greater than 100"

## Need to write Backend Validation

#Restrict in UI but not restrict in API and its accept the enhancedshMatchPercentage as 101 and not throwing the error in back end


Scenario: 8452 To verify the validation message forEnhanced sh match percentage acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                       | value |
  | sourceType                |     2 |
  | sourceCategory            |     6 |
  | isSafeHarbourMatch        | true  |
  | safeHarbourType           |     3 |
  | uptoPercentageOfDeferral  |     3 |
  | enhancedshMatchPercentage |   101 |
  | limitMaximumPercentage    |   100 |
  | limitMinimumPercentage    |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
##ignore Then enhancedshMatchPercentage accept 101

Then API should give response as "PL396 :Required"
#Restrict in UI but not restrict in API and its accept the percentageOfCalculation as 101 and not throwing the error in back end


Scenario: 8475 To verify the Match Percent field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
##ignore Then percentageOfCalculation accept 101

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     2 |
  | sourceCategory           |     6 |
  | employercontributionType |     2 |
  | PercentageOfCalculation  |   101 |
  | percentageOfCompensation |    10 |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8674 To verify the Percentage of compensation matched field acceptance criteria of value above 100
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     2 |
  | sourceCategory           |     6 |
  | employercontributionType |     2 |
  | percentageOfCalculation  |    10 |
  | percentageOfCompensation |   101 |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL244 :When percentage compensation is greater than 100  "
#Error code changed

Scenario: 8437 To verify the Percentage of compensation Field as empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     2 |
  | sourceCategory           |     5 |
  | percentageOfCompensation |  0.00 |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL395 :Required"
#Restrict in UI but not restrict in API and its accept the uptoPercentageOfDeferral as 101 and not throwing the error in back end

Scenario: 8461 To verify the validation message for Up to percentage of deferral acceptance criteria of values more than 100 percentage
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                       | value |
  | sourceType                |     2 |
  | sourceCategory            |     6 |
  | isSafeHarbourMatch        | true  |
  | safeHarbourType           |     3 |
  | enhancedshMatchPercentage |    10 |
  | uptoPercentageOfDeferral  |   101 |
  | limitMaximumPercentage    |   100 |
  | limitMinimumPercentage    |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as ""

Scenario: 8464 To verify the Up to percentage of deferral percentage Field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                       | value |
  | sourceType                |     2 |
  | sourceCategory            |     6 |
  | isSafeHarbourMatch        | true  |
  | safeHarbourType           |     3 |
  | enhancedshMatchPercentage |    10 |
  | uptoPercentageOfDeferral  |   0.0 |
  | limitMaximumPercentage    |   100 |
  | limitMinimumPercentage    |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL255 :Required"

Scenario: To verify the Maximum limit applicable as yes when maximum dollar limit  field by leaving empty
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     2 |
  | sourceCategory           |     6 |
  | isMaximumLimitApplicable | true  |
  | maximumDollarLimit       |       |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1118 :Required"

Scenario: To verify the Ongoing allocation conditions in Last day rule and Hours requirement field as yes  
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     2 |
  | sourceCategory           |     6 |
  | isNonPayPeriodApplicable | true  |
  | isLastDayRule            | true  |
  | isHoursRequirement       | true  |
  | hours                    |       |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1190 :Required"

Scenario: To verify the Ongoing allocation conditions Hours requirement field as yes and enter the  hours more than 1000 hours
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                      | value |
  | sourceType               |     2 |
  | sourceCategory           |     6 |
  | isNonPayPeriodApplicable | true  |
  | isLastDayRule            | true  |
  | isHoursRequirement       | true  |
  | hours                    |  2000 |
  | limitMaximumPercentage   |   100 |
  | limitMinimumPercentage   |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1174 :Hours should not be greater than 1000"

Scenario: To verify the Last day rule applicable field as yes 
Given Model is selected for the endpoint "/api/Source/SaveSource"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  And Configuration has been made as per following
  | key                     | value |
  | sourceType              |     2 |
  | sourceCategory          |     6 |
  | isLastDayRuleApplicable | true  |
  | limitMaximumPercentage  |   100 |
  | limitMinimumPercentage  |    20 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSource"
Then API should give response as "PL1008 :Required"









