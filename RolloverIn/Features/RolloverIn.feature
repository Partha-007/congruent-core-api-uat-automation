Feature: RolloverIn

A short summary of the feature


Scenario: Rollover In

Given Model is selected for the endpoint "/api/Rollover/SaveRollover"

When Configuration has been made as per following
| key              | value |
| rollOversAllowed | true  |
| rollOversFee     |     1 |
| validate         | false |

And Collection in a model is configured with 1 blocks for the property "ApprovalHierarchy" with values as given below
| BlockNumber | Key       | Value |
|           1 | Id        |     0 |
|           1 | Order     |     1 |
|           1 | UserRole  |     1 |
|           1 | Approval  | true  |
|           1 | IsDeleted | false |

When API request has been sent to the "IPlanDetailsSave" with the method name "SaveRollOverAsync"

Given Payroll file "CombinedFile.csv" is selected and Edit payroll file as mentioned below
| Key                | Value      |
| HIRE DATE          | 01/01/2021 |
| HOURS              |       1000 |
| PAY DATE           | 02/01/2021 |
| BIRTH DATE         | 04/01/1996 |
| PAYROLL FREQUENCY  | Daily      |
| EEPreTax           |      10000 |
| PLAN COMPENSATION  |      10000 |
| GROSS COMPENSATION |      10000 |

When File upload is executed for the file "CombinedFile.csv" and funding is done by "Plan"

Given Model is selected for the endpoint "/api/RolloverIn/SaveRolloverInRequest"

When Configuration has been made as per following
| key                                     | value              |
| runValidations                          | true               |
| isSubmit                                | true               |
| employeeId                              | <EmployeeId>       |
| planId                                  | <PlanId>           |
| isInvestmentAllocationsSameToAllSources | true               |
| status                                  |                  1 |
| planDetails                             |                    |
| paymentMode                             |                  1 |
| routingNumber                           | random 9 numerics  |
| accountType                             |                    |
| accountNumber                           | random 10 numerics | 
| rolloverAmount                          |             100.00 |
| rolloverCategory                        |                    |
| isRestricted                            |                    |
| restrictedMessage                       |                    |
| investmentAllocation                    | true               |
| ssn                                     | <SSN>              |

And Collection in a model is configured with 2 blocks for the property "SourceLevelInvestments" with values as given below
| BlockNumber | Key                  | Value              |
|           1 | SourceId             | <PretaxRolloverId> |
|           1 | InvestmentId         | <SEAS001>          |
|           1 | InvestmentPercentage |              70.00 |
|           1 | SourceName           | Pretax Rollover    |
|           1 | InvestmentName       | SEAS001            |
|           1 | SourceInvestmentId   |                 92 |
|           2 | SourceId             | <PretaxRolloverId> |
|           2 | InvestmentId         | <SEAS002>          |
|           2 | InvestmentPercentage |              30.00 |
|           2 | SourceName           | Pretax Rollover    |
|           2 | InvestmentName       | SEAS002            |
|           2 | SourceInvestmentId   |                 93 |

And Collection in a model is configured with 1 blocks for the property "RollOverSourceLevelContributions" with values as given below
| BlockNumber | Key                | Value              |
|           1 | SourceId           | <PretaxRolloverId> |
|           1 | SourceName         | Pretax Rollover    |
|           1 | ContributionAmount |                100 |
|           1 | Earnings           |                  0 |
|           1 | SourceSubCategory  |                  7 |

When API request has been sent to the "IRolloverIn" with the method name "SaveRolloverInRequestAsync"

