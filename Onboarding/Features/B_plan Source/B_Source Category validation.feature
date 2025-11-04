Feature: B_Source Category validation
[BeforeTestRun]

Scenario: To Verify the Source Category Mandatory Validation for Employee Source with error message
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |

  When Collection in a model is configured with 6 blocks for the property "Sources" with values to save model portfolio as given below
| BlockNumber | Key                                | Value  |
|           1 | SourceCategory                     |        |
|           2 | SourceType                         |      2 |
|           2 | SourceCategory                     |        |
|           3 | SourceType                         |      1 |
|           3 | SourceCategory                     |      1 |
|           3 | SourceSubCategory                  |        |
|           4 | SourceType                         |      1 |
|           4 | SourceCategory                     |      1 |
|           4 | RehireDeferralPercentage           |    102 |
|           5 | SourceType                         |      2 |
|           5 | SourceCategory                     |      6 |
|           5 | IsSafeHarbourMatch                 | true   |
|           5 | SafeHarbourType                    |      3 |
|           5 | EnhancedshMatchPercentage          |        |
|           5 | UptoPercentageOfDeferral           |     10 |
|           6 | SourceType                         |      2 |
|           6 | SourceCategory                     |      5 |
|           6 | IsSafeHarbourMatch                 | false  |
|           6 | EmployerContributionType           |      1 |
|           6 | FirstTierMatchPercent              |     76 |
|           6 | FirstTierCompensationMatchPercent  |    101 |
|           6 | SecondTierMatchPercent             |     76 |
|           6 | SecondTierCompensationMatchPercent |     78 |
|           6 | ThirdTierMatchPercent              |     76 |
|           6 | ThirdTierCompensationMatchPercent  |     78 |
|           7 | SourceType                         |      2 |
|           7 | SourceCategory                     |      5 |
|           7 | IsSafeHarbourMatch                 | false  |
|           7 | EmployerContributionType           |      1 |
|           7 | FirstTierMatchPercent              |     76 |
|           7 | FirstTierCompensationMatchPercent  |     78 |
|           7 | SecondTierMatchPercent             |    101 |
|           7 | SecondTierCompensationMatchPercent |     78 |
|           7 | ThirdTierMatchPercent              |     76 |
|           7 | ThirdTierCompensationMatchPercent  |     78 |
|           8 | SourceType                         |      2 |
|           8 | SourceCategory                     |      5 |
|           8 | IsSafeHarbourMatch                 | false  |
|           8 | EmployerContributionType           |      1 |
|           8 | FirstTierMatchPercent              |     76 |
|           8 | FirstTierCompensationMatchPercent  |     78 |
|           8 | SecondTierMatchPercent             |     76 |
|           8 | SecondTierCompensationMatchPercent |    101 |
|           8 | ThirdTierMatchPercent              |     76 |
|           8 | ThirdTierCompensationMatchPercent  |     78 |
|           9 | SourceType                         |      2 |
|           9 | SourceCategory                     |      5 |
|           9 | IsSafeHarbourMatch                 | false  |
|           9 | EmployerContributionType           |      1 |
|           9 | FirstTierMatchPercent              |     76 |
|           9 | FirstTierCompensationMatchPercent  |     78 |
|           9 | SecondTierMatchPercent             |     76 |
|           9 | SecondTierCompensationMatchPercent |     78 |
|           9 | ThirdTierMatchPercent              |    101 |
|           9 | ThirdTierCompensationMatchPercent  |     78 |
|          10 | SourceType                         |      2 |
|          10 | SourceCategory                     |      5 |
|          10 | IsSafeHarbourMatch                 | false  |
|          10 | EmployerContributionType           |      1 |
|          10 | FirstTierMatchPercent              |     76 |
|          10 | FirstTierCompensationMatchPercent  |     78 |
|          10 | SecondTierMatchPercent             |     76 |
|          10 | SecondTierCompensationMatchPercent |     78 |
|          10 | ThirdTierMatchPercent              |     76 |
|          10 | ThirdTierCompensationMatchPercent  |    101 |
|          11 | SourceType                         |      2 |
|          11 | SourceCategory                     |      5 |
|          11 | PercentageOfCompensation           | 111.00 |
|          12 | SourceType                         |      2 |
|          12 | SourceCategory                     |      6 |
|          12 | IsSafeHarbourMatch                 | true   |
|          12 | SafeHarbourType                    |      3 |
|          12 | UptoPercentageOfDeferral           |      3 |
|          12 | EnhancedshMatchPercentage          |    101 |
|          13 | SourceType                         |      2 |
|          13 | SourceCategory                     |      6 |
|          13 | EmployerContributionType           |      2 |
|          13 | PercentageOfCalculation            |    101 |
|          13 | PercentageOfCompensation           |     10 |
|          14 | SourceType                         |      2 |
|          14 | SourceCategory                     |      6 |
|          14 | EmployerContributionType           |      2 |
|          14 | PercentageOfCalculation            |     10 |
|          14 | PercentageOfCompensation           |    101 |
|          15 | SourceType                         |      2 |
|          15 | SourceCategory                     |      5 |
|          15 | PercentageOfCompensation           |   0.00 |
|          16 | SourceType                         |      2 |
|          16 | SourceCategory                     |      6 |
|          16 | IsSafeHarbourMatch                 | true   |
|          16 | SafeHarbourType                    |      3 |
|          16 | EnhancedshMatchPercentage          |     10 |
|          16 | UptoPercentageOfDeferral           |    101 |
|          17 | SourceType                         |      2 |
|          17 | SourceCategory                     |      6 |
|          17 | IsSafeHarbourMatch                 | true   |
|          17 | SafeHarbourType                    |      3 |
|          17 | EnhancedshMatchPercentage          |     10 |
|          17 | UptoPercentageOfDeferral           |    0.0 |
|          18 | SourceType                         |      2 |
|          18 | SourceCategory                     |      6 |
|          18 | isMaximumLimitApplicable           | true   |
|          18 | maximumDollarLimit                 |        |
|          19 | SourceType                         |      2 |
|          19 | SourceCategory                     |      6 |
|          19 | IsNonPayPeriodApplicable           | true   |
|          19 | IsLastDayRule                      | true   |
|          19 | IsHoursRequirement                 | true   |
|          19 | Hours                              |        |
|          20 | SourceType                         |      2 |
|          20 | SourceCategory                     |      6 |
|          20 | IsNonPayPeriodApplicable           | true   |
|          20 | IsLastDayRule                      | true   |
|          20 | IsHoursRequirement                 | true   |
|          20 | Hours                              |   2000 |
|          21 | SourceType                         |      2 |
|          21 | SourceCategory                     |      6 |
|          21 | IsLastDayRuleApplicable            | true   |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then the API response should contain the 4 following errors
| error_code | error_message                                                   |
| PL175      | Required                                                        |
| PL175      | Required                                                        |
| PL176      | Required                                                        |
| PL191      | Deferral percentage for rehire should not exceed 100 percentage |
| PL251      | Required                                                        |
|            | null                                                            |
|            | null                                                            |
|            | null                                                            |
|            | null                                                            |
|            | null                                                            |
| PL244      | When percentage compensation is greater than 100                |
| PL396      | Required                                                        |
|            | null                                                            |
| PL244      | When percentage compensation is greater than 100                |
| PL395      | Required                                                        |
|            | null                                                            |
| PL255      | Required                                                        |
| PL1118     | Required                                                        |
| PL1190     | Required                                                        |
| PL1174     | Hours should not be greater than 1000                           |
| PL1008     | Required                                                        |
Scenario: To Verify the Source Category Mandatory Validation for Employee Source
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Collection in a model is configured with 6 blocks for the property "Sources" with values to save model portfolio as given below
| BlockNumber | Key                                | Value          |
|           1 | SourceType                         |              1 |
|           1 | SourceCategory                     |              1 |
|           1 | RehireDeferralPercentage           |            100 |
|           2 | SourceType                         |              1 |
|           2 | SourceCategory                     |              1 |
|           2 | RehireDeferralPercentage           |          99.00 |
|           3 | SourceType                         |              2 |
|           3 | SourceCategory                     |              5 |
|           3 | PercentageOfCompensation           |          99.00 |
|           4 | SourceType                         |              2 |
|           4 | SourceCategory                     |              6 |
|           4 | IsSafeHarbourMatch                 | true           |
|           4 | SafeHarbourType                    |              3 |
|           4 | EnhancedshMatchPercentage          |             88 |
|           4 | UptoPercentageOfDeferral           |          99.00 |
|           5 | SourceType                         |              1 |
|           5 | SourceCategory                     |              1 |
|           5 | ContributionType                   |              2 |
|           5 | LimitMinimumDollar                 |       10000.00 |
|           6 | SourceType                         |              1 |
|           6 | SourceCategory                     |              1 |
|           6 | ContributionType                   |              2 |
|           6 | LimitMinimumDollar                 | 10000000000.00 |
|           7 | SourceType                         |              1 |
|           7 | SourceCategory                     |              1 |
|           7 | ContributionType                   |              1 |
|           7 | LimitMinimumPercentage             |             75 |
|           8 | SourceType                         |              1 |
|           8 | SourceCategory                     |              1 |
|           8 | ContributionType                   |              2 |
|           8 | LimitMaximumDollar                 |       12350.00 |
|           9 | SourceType                         |              1 |
|           9 | SourceCategory                     |              1 |
|           9 | ContributionType                   |              2 |
|           9 | LimitMaximumDollar                 | 10000000000.00 |
|          10 | SourceType                         |              1 |
|          10 | SourceCategory                     |              1 |
|          10 | ContributionType                   |              2 |
|          10 | MaximumDollarCompensation          |      342445.00 |
|          11 | SourceType                         |              1 |
|          11 | SourceCategory                     |              1 |
|          11 | ContributionType                   |              2 |
|          11 | MaximumDollarCompensation          | 10000000000.00 |
|          12 | SourceType                         |              2 |
|          12 | SourceCategory                     |              6 |
|          12 | IsSafeHarbourMatch                 | true           |
|          12 | SafeHarbourType                    |              3 |
|          12 | EnhancedshMatchPercentage          |            100 |
|          12 | UptoPercentageOfDeferral           |          10.00 |
|          13 | SourceType                         |              2 |
|          13 | SourceCategory                     |              6 |
|          13 | IsSafeHarbourMatch                 | true           |
|          13 | SafeHarbourType                    |              3 |
|          13 | EnhancedshMatchPercentage          |            100 |
|          13 | UptoPercentageOfDeferral           |         100.00 |
|          14 | SourceType                         |              2 |
|          14 | SourceCategory                     |              6 |
|          14 | IsSafeHarbourMatch                 | true           |
|          14 | SafeHarbourType                    |              3 |
|          14 | EnhancedshMatchPercentage          |            100 |
|          14 | PercentageOfCompensation           |            100 |
|          14 | UptoPercentageOfDeferral           |          10.00 |
|          15 | SourceType                         |              2 |
|          15 | SourceCategory                     |              6 |
|          15 | IsSafeHarbourMatch                 | true           |
|          15 | SafeHarbourType                    |              3 |
|          15 | EnhancedshMatchPercentage          |            123 |
|          15 | UptoPercentageOfDeferral           |          10.00 |
|          16 | SourceType                         |              2 |
|          16 | SourceCategory                     |              5 |
|          16 | IsSafeHarbourMatch                 | true           |
|          16 | SafeHarbourType                    |              3 |
|          16 | PercentageOfCompensation           |             17 |
|          16 | EnhancedshMatchPercentage          |             10 |
|          16 | UptoPercentageOfDeferral           |             10 |
|          17 | SourceType                         |              2 |
|          17 | SourceCategory                     |              5 |
|          17 | IsSafeHarbourMatch                 | false          |
|          17 | EmployerContributionType           |              2 |
|          17 | PercentageOfCalculation            |            100 |
|          17 | PercentageOfCompensation           |             10 |
|          18 | SourceType                         |              2 |
|          18 | SourceCategory                     |              5 |
|          18 | IsSafeHarbourMatch                 | false          |
|          18 | EmployerContributionType           |              2 |
|          18 | PercentageOfCalculation            |             76 |
|          18 | PercentageOfCompensation           |             10 |
|          19 | SourceType                         |              2 |
|          19 | SourceCategory                     |              5 |
|          19 | IsSafeHarbourMatch                 | false          |
|          19 | EmployerContributionType           |              2 |
|          19 | PercentageOfCalculation            |             76 |
|          19 | PercentageOfCompensation           |             78 |
|          20 | SourceType                         |              2 |
|          20 | SourceCategory                     |              5 |
|          20 | IsSafeHarbourMatch                 | false          |
|          20 | EmployerContributionType           |              1 |
|          20 | FirstTierMatchPercent              |            100 |
|          20 | FirstTierCompensationMatchPercent  |             78 |
|          20 | SecondTierMatchPercent             |             76 |
|          20 | SecondTierCompensationMatchPercent |             78 |
|          20 | ThirdTierMatchPercent              |             76 |
|          20 | ThirdTierCompensationMatchPercent  |             78 |
|          21 | SourceType                         |              2 |
|          21 | SourceCategory                     |              5 |
|          21 | IsSafeHarbourMatch                 | false          |
|          21 | EmployerContributionType           |              1 |
|          21 | FirstTierMatchPercent              |             76 |
|          21 | FirstTierCompensationMatchPercent  |             78 |
|          21 | SecondTierMatchPercent             |             76 |
|          21 | SecondTierCompensationMatchPercent |             78 |
|          21 | ThirdTierMatchPercent              |             76 |
|          21 | ThirdTierCompensationMatchPercent  |             78 |
|          22 | SourceType                         |              2 |
|          22 | SourceCategory                     |              5 |
|          22 | IsSafeHarbourMatch                 | false          |
|          22 | EmployerContributionType           |              1 |
|          22 | FirstTierMatchPercent              |             76 |
|          22 | FirstTierCompensationMatchPercent  |             78 |
|          22 | SecondTierMatchPercent             |            100 |
|          22 | SecondTierCompensationMatchPercent |             78 |
|          22 | ThirdTierMatchPercent              |             76 |
|          22 | ThirdTierCompensationMatchPercent  |             78 |
|          23 | SourceType                         |              2 |
|          23 | SourceCategory                     |              6 |
|          23 | IsSafeHarbourMatch                 | false          |
|          23 | EmployerContributionType           |              3 |
|          23 | FirstTierMatchPercent              |            101 |
|          23 | FirstTierCompensationMatchPercent  |             78 |
|          23 | SecondTierMatchPercent             |             76 |
|          23 | SecondTierCompensationMatchPercent |             78 |
|          23 | ThirdTierMatchPercent              |             76 |
|          23 | ThirdTierCompensationMatchPercent  |             78 |
|          24 | SourceType                         |              2 |
|          24 | SourceCategory                     |              5 |
|          24 | IsSafeHarbourMatch                 | false          |
|          24 | EmployerContributionType           |              1 |
|          24 | FirstTierMatchPercent              |             76 |
|          24 | FirstTierCompensationMatchPercent  |             78 |
|          24 | SecondTierMatchPercent             |             76 |
|          24 | SecondTierCompensationMatchPercent |             78 |
|          24 | ThirdTierMatchPercent              |             76 |
|          24 | ThirdTierCompensationMatchPercent  |             78 |
|          25 | SourceType                         |              2 |
|          25 | SourceCategory                     |              5 |
|          25 | IsSafeHarbourMatch                 | false          |
|          25 | EmployerContributionType           |              1 |
|          25 | FirstTierMatchPercent              |             76 |
|          25 | FirstTierCompensationMatchPercent  |             78 |
|          25 | SecondTierMatchPercent             |            100 |
|          25 | SecondTierCompensationMatchPercent |             78 |
|          25 | ThirdTierMatchPercent              |             76 |
|          25 | ThirdTierCompensationMatchPercent  |             78 |
|          26 | SourceType                         |              2 |
|          26 | SourceCategory                     |              5 |
|          26 | IsSafeHarbourMatch                 | false          |
|          26 | EmployerContributionType           |              1 |
|          26 | FirstTierMatchPercent              |             76 |
|          26 | FirstTierCompensationMatchPercent  |             78 |
|          26 | SecondTierMatchPercent             |             76 |
|          26 | SecondTierCompensationMatchPercent |            100 |
|          26 | ThirdTierMatchPercent              |             76 |
|          26 | ThirdTierCompensationMatchPercent  |             78 |
|          27 | SourceType                         |              2 |
|          27 | SourceCategory                     |              5 |
|          27 | IsSafeHarbourMatch                 | false          |
|          27 | EmployerContributionType           |              1 |
|          27 | FirstTierMatchPercent              |             76 |
|          27 | FirstTierCompensationMatchPercent  |             78 |
|          27 | SecondTierMatchPercent             |             76 |
|          27 | SecondTierCompensationMatchPercent |             78 |
|          27 | ThirdTierMatchPercent              |            100 |
|          27 | ThirdTierCompensationMatchPercent  |             78 |
|          28 | SourceType                         |              2 |
|          28 | SourceCategory                     |              5 |
|          28 | IsSafeHarbourMatch                 | false          |
|          28 | EmployerContributionType           |              1 |
|          28 | FirstTierMatchPercent              |             76 |
|          28 | FirstTierCompensationMatchPercent  |             78 |
|          28 | SecondTierMatchPercent             |             76 |
|          28 | SecondTierCompensationMatchPercent |             78 |
|          28 | ThirdTierMatchPercent              |             76 |
|          28 | ThirdTierCompensationMatchPercent  |            100 |
|          29 | SourceType                         |              2 |
|          29 | SourceCategory                     |              6 |
|          29 | IsSafeHarbourMatch                 | true           |
|          29 | SafeHarbourType                    |              3 |
|          29 | EnhancedshMatchPercentage          |             10 |
|          29 | UptoPercentageOfDeferral           |            123 |
|          30 | SourceType                         |              2 |
|          30 | SourceCategory                     |              6 |
|          30 | IsMaximumLimitApplicable           | true           |
|          30 | MaximumDollarLimit                 |            100 |
|          31 | SourceType                         |              2 |
|          31 | SourceCategory                     |              6 |
|          31 | IsMaximumLimitApplicable           | true           |
|          31 | MaximumDollarLimit                 |     8738388.33 |
|          32 | SourceType                         |              2 |
|          32 | SourceCategory                     |              6 |
|          32 | IsMaximumLimitApplicable           | true           |
|          32 | MaximumDollarLimit                 |       87383.33 |
|          33 | SourceType                         |              2 |
|          33 | SourceCategory                     |              6 |
|          33 | IsMaximumLimitApplicable           | true           |
|          33 | MaximumDollarLimit                 |    87383333.33 |
|          34 | SourceType                         |              2 |
|          34 | SourceCategory                     |              6 |
|          34 | IsMaximumLimitApplicable           | true           |
|          34 | MaximumDollarLimit                 |    8738333.333 |
|          35 | SourceType                         |              2 |
|          35 | SourceCategory                     |              6 |
|          35 | IsNonPayPeriodApplicable           | true           |
|          36 | SourceType                         |              2 |
|          36 | SourceCategory                     |              6 |
|          36 | IsNonPayPeriodApplicable           | true           |
|          36 | IsIncludeDefferals                 | true           |
|          37 | SourceType                         |              2 |
|          37 | SourceCategory                     |              6 |
|          37 | IsNonPayPeriodApplicable           | true           |
|          37 | IsIncludePlanCompensation          | true           |
|          38 | SourceType                         |              2 |
|          38 | SourceCategory                     |              6 |
|          38 | IsNonPayPeriodApplicable           | true           |
|          38 | IsLastDayRule                      | true           |
|          39 | SourceType                         |              2 |
|          39 | SourceCategory                     |              6 |
|          39 | IsNonPayPeriodApplicable           | true           |
|          39 | IsLastDayRule                      | true           |
|          39 | IsHoursRequirement                 | true           |
|          39 | Hours                              |            200 |
|          40 | SourceType                         |              2 |
|          40 | SourceCategory                     |              6 |
|          40 | IsNonPayPeriodApplicable           | true           |
|          40 | IsLastDayRule                      | true           |
|          40 | IsHoursRequirement                 | true           |
|          40 | Hours                              |           1000 |
|          41 | SourceType                         |              2 |
|          41 | SourceCategory                     |              6 |
|          41 | IsNonPayPeriodApplicable           | true           |
|          41 | IsHoursRequirement                 | true           |
|          41 | Hours                              |            100 |
|          41 | IsNormalRetirement                 | true           |
|          41 | IsEarlyRetirement                  | true           |
|          41 | IsDeath                            | true           |
|          41 | IsDisability                       | true           |


And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message



Scenario: To verify the  Allocation formula description data type acceptance
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When Configuration has been made as per following
           | key       | value       |
           | companyId | <CompanyId> |
When Collection in a model is configured with 5 blocks for the property "AdditionalDeferralSource" with values to save model portfolio as given below
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



And API request has been sent to the "IPlanDetailsSave" with the method name "SaveBasicPlanDetailsAsync"
Then API should respond with successful message