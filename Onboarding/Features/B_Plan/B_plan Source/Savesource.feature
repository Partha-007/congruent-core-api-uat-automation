Feature: Savesource
[BeforeTestRun]

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









