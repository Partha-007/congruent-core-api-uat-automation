Feature: A_ AdditionalVestedAt 
[BeforeTestRun]

Scenario: Additional VestedAt field configure with Death
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
  When Configuration has been made as per following
           | key                          | value               |
           | vestingName                  | random 10 alphabets | Scenario: Vesting Name field configure
           | immediateVestingIndicator    | false               |
           | vestedAt                     | 1,                  | #VestedAt Scenario: VestedAt field configure with Death
           | vestingMethod                |                   2 |
           | forfeitureTimings            |                   1 |Scenario: Vesting forfeiture timings field configure with after 5 Consecutive breaks in service
           | vestingPastPeriodComputation |                   1 | Scenario: VestingPastComputationPeriod is configured with full year
           | elapsedTime                  |                  11 |
           | firstYear                    |                   0 |
           | secondYear                   |                 100 |
           | thirdYear                    |                 100 |
           | fourthYear                   |                 100 |
           | fifthYear                    |                 100 |
           | sixthYear                    |                 100 |
 And Collection in a model is configured with 5 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
 | BlockNumber | Key                       | Value                       |
 |           1 | VestedAt                  | 1,                          | Scenario: Additional VestedAt field configure with Death
 |           1 | VestingDescription        | random 10 alphabets         | Scenario: Additional Vesting description field configure with alphabets
 |           1 | VestingName               | abcdef                      |
 |           1 | ImmediateVestingIndicator | false                       |
 |           1 | VestingMethod             |                           2 |
 |           1 | ElapsedTime               |                          11 |
 |           2 | VestedAt                  | 2,                          | Scenario: Additional VestedAt field configure with Disability
 |           2 | VestingDescription        | random 10 numerics          | Scenario: Additional Vesting description field configure with numerics
 |           2 | VestingName               | abcdef                      |
 |           2 | ImmediateVestingIndicator | false                       |
 |           2 | VestingMethod             |                           2 |
 |           2 | ElapsedTime               |                          11 |
 |           3 | VestedAt                  | 4,                          | Scenario: Additional VestedAt field configure with NRA
 |           3 | VestingDescription        | random 10 specialCharacters | Scenario: Additional Vesting description field configure with specialCharacters
 |           3 | VestingName               | abcdef                      |
 |           3 | ImmediateVestingIndicator | false                       |
 |           3 | VestingMethod             |                           2 |
 |           3 | ElapsedTime               |                          11 |
 |           4 | VestedAt                  | 8,                          | Scenario: Additional VestedAt field configure with ERA
 |           4 | VestingDescription        | random 10 alphaNumerics     | Scenario: Additional Vesting description field configure with alphaNumerics
 |           4 | VestingName               | abcdef                      |
 |           4 | ImmediateVestingIndicator | false                       |
 |           4 | VestingMethod             |                           2 |
 |           4 | ElapsedTime               |                          11 |
 |           5 | VestedAt                  |                     1,2,4,8 | Scenario: Additional VestedAt field configure with all options
 |           5 | VestingDescription        | random 150 alphaNumerics    | Scenario: Additional Vesting description field configure with 150 characters
 |           5 | VestingName               | abcdef                      |
 |           5 | ImmediateVestingIndicator | false                       |
 |           5 | VestingMethod             |                           2 |
 |           5 | ElapsedTime               |                          11 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
 Then API should respond with successful message

Scenario: Additional VestedAt field configure with null
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                          | value |
           | vestingName                  |       | Scenario: Vesting Name field Null
           | immediateVestingIndicator    | false |
           | vestedAt                     | 1,    |
           | vestingMethod                |     2 |
           | vestingPastPeriodComputation |     2 |Scenario: VestingPastComputationPeriod is configured with half year
           | breakInServiceApplicable     | true  |
           | disregardPrior               |       |
           | hours                        |   500 |
           | elapsedTime                  |       | Scenario: Vesting method field ElapsedTime configure with Null
           | hoursOfService               |       |
           | firstYear                    |     0 |
           | secondYear                   |   100 |
           | thirdYear                    |   100 |
           | fourthYear                   |   100 |
           | fifthYear                    |   100 |
           | sixthYear                    |   100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde | Scenario: Additional VestedAt field configure with null
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  | 1,    |
           |           1 | VestingMethod             |     2 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |       |Scenario: Additional Vesting method hours configure with null

           |           2 | VestingName               | abcde |
           |           2 | ImmediateVestingIndicator | false |
           |           2 | VestedAt                  | 1,2   |Scenario: Vesting BIS rule field configure with null of disregardPrior
           |           2 | VestingMethod             |     2 |
           |           2 | ElapsedTime               |    11 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
 	Then the API response should contain the 2 following errors 
	| error_code |   error_message |
    | PL616      |   Required      |
    | PL124      |   Required      |
    | PL682      |   Required      |
    | PL413      |   Required      |
    | PL143      |   Required      |


# error message got updated from "PL412 : Required" to "PL616 : Required"

Scenario: Additional Vesting effective start date field configure with future date
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                          | value              |
           | vestingName                  | random 10 numerics | Scenario: Vesting Name field configure with numerics
           | immediateVestingIndicator    | false              |
           | vestedAt                     |                1,2 |
           | vestingMethod                |                  1 |
           | forfeitureTimings            |                  2 |Scenario: Vesting forfeiture timings field configure with distribution of the vested portion of participant
           | vestingPastPeriodComputation |                  3 | Scenario: VestingPastComputationPeriod is configured with do not compute
           | hoursOfService               |                200 |
           | elapsedTime                  |                  6 |
           | breakInServiceApplicable     | true               |
           | breakInServiceRules          |                  3 |
           | firstYear                    |                  0 |
           | secondYear                   |                100 |
           | thirdYear                    |                100 |
           | fourthYear                   |                100 |
           | fifthYear                    |                100 |
           | sixthYear                    |                100 |
And Collection in a model is configured with 3 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value      |
           |           1 | VestingName               | abcde      |
           |           1 | ImmediateVestingIndicator | false      |
           |           1 | VestedAt                  | 1,         |
           |           1 | VestingMethod             |          1 |
           |           1 | ElapsedTime               |         11 |
           |           1 | VestingEffectiveStartDate | 02-25-2021 |
           |           1 | HoursOfService            |        200 | Scenario: Additional Vesting method field configure with hours of service
           |           2 | VestingName               | abcde      |
           |           2 | ImmediateVestingIndicator | false      |
           |           2 | VestedAt                  | 2,         |
           |           2 | VestingMethod             |          1 |
           |           2 | ElapsedTime               |          6 | Scenario: Additional Vesting method field ElapsedTime configure
           |           3 | vestingMethod             |          3 |
           |           3 | activeEmployees           |          1 |
           |           3 | daily                     |          1 |
           |           3 | weekly                    |          1 |
           |           3 | biWeekly                  |          1 |
           |           3 | semiMonthly               |          1 |
           |           3 | monthly                   |          1 |
           |           3 | quarterly                 |          1 |
           |           3 | annually                  |          1 |
           |           3 | semiAnnually              |          1 | Scenario: Additional Vesting method field Equivalency configure
           |           4 | VestingName               | abcde      |
           |           4 | ImmediateVestingIndicator | false      |
           |           4 | VestedAt                  |        1,2 |Scenario: Vesting BIS rule field configure with Five year BIS
           |           4 | VestingMethod             |          1 |
           |           4 | ElapsedTime               |         11 |

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
 Then API should respond with successful message

 Scenario: Additional Vesting method hours of service configure with above 1000
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value                    |
           | vestingName               | abcde                    |
           | immediateVestingIndicator | false                    |
           | vestingDescription        | random 151 alphaNumerics |
           | vestedAt                  | 1,                       |
           | vestingMethod             |                        1 |
           | serviceCreditPeriod       |                          |
           | hoursOfService            |                     1001 | Scenario: Vesting method hours of service configure with above 1000
           | elapsedTime               |                       11 |
           | firstYear                 |                        0 |
           | secondYear                |                      100 |
           | thirdYear                 |                      100 |
           | fourthYear                |                      100 |
           | fifthYear                 |                      100 |
           | sixthYear                 |                      100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value      |
           |           1 | VestingName               | abcde      |
           |           1 | ImmediateVestingIndicator | false      |
           |           1 | VestedAt                  | 1,         |
           |           1 | VestingMethod             |          1 |
           |           1 | ElapsedTime               |         11 |
           |           1 | HoursOfService            |       1001 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
 	Then the API response should contain the 2 following errors 
	| error_code | error_message                                                |
	| PL126      | Number of hours of service should not be greater than 1000   |
	| PL416      | Vesting Description length should not exceed  150 characters | Scenario: Vesting description field configure with more than 150 characters
	| PL561      | Required                                                     | Scenario: VestingServiceCreditPeriod is configured with null when hours of service

 


 #SaveVesting

 
Scenario: Save vesting detail
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                        | value                   |
           | vestingName                | random 10 alphaNumerics | Scenario: Vesting Name field configure with alphaNumerics
           | vestingDescription         | random 10 alphabets     |
           | vestedAt                   |                     1,2 |
           | employerSourcesList        | 1,                      | #SaveVesting Scenario: To Validate Employer source Match is selected
           | vestingMethod              |                       1 |
           | hoursOfService             |                     100 |
           | forfeitureTimings          |                       2 |Scenario: Vesting forfeiture timings field configure with earlier of 1 or 2
           | vestingComputationalPeriod |                       1 | Scenario: Vesting ComputationPeriod  field configure with Anniversary
           | serviceCreditPeriod        |                       1 |
           | vestingSchedule            |                       1 |
           | forfeitureTimings          |                       1 |
           | forfeitureTreatment        |                     1,2 |
           | breakInServiceApplicable   | true                    |
           | disregardPrior             |                       1 |
           | hours                      |                     500 |
           | firstYear                  |                       0 |
           | secondYear                 |                     100 |
           | thirdYear                  |                     100 |
           | fourthYear                 |                     100 |
           | fifthYear                  |                     100 |
           | sixthYear                  |                     100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value  |
           |           1 | VestingName               | abcdef |
           |           1 | ImmediateVestingIndicator | false  |
           |           1 | VestedAt                  |    1,2 | Scenario: Vesting BIS rule field configure with One year hold
           |           1 | VestingMethod             |      2 |
           |           1 | ElapsedTime               |     11 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
 Then API should respond with successful message

Scenario: To Validate employer source is null
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                        | value                       |
           | vestingName                | random 10 specialCharacters | Scenario: Vesting Name field configure with specialCharacters
           | vestingDescription         | random 10 alphabets         |
           | vestedAt                   |                         1,2 |
           | employerSourcesList        |                             |
           | vestingMethod              |                           3 |
           | hoursOfService             |                         100 |
           | vestingComputationalPeriod |                             | Scenario: Vesting ComputationPeriod  field configure with Null when Equivalency
           | serviceCreditPeriod        |                           1 |
           | vestingSchedule            |                           1 |
           | forfeitureTimings          |                           1 |
           | forfeitureTreatment        |                         1,2 |
           | firstYear                  |                           0 |
           | secondYear                 |                         100 |
           | thirdYear                  |                         100 |
           | fourthYear                 |                         100 |
           | fifthYear                  |                         100 |
           | sixthYear                  |                         100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
   	Then the API response should contain the 2 following errors 
	| error_code | error_message                                        |
	| PL1033     | Required                                             |
	| PL564      | Required                                             |
	| PL145      | Vesting Name should contain alphabets, numbers only. |


Scenario: VestedAt field configure with Disability
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  | 2,    |
           | vestingMethod             |     1 |
           | hoursOfService            |   500 |
           | elapsedTime               |    11 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message


Scenario: VestedAt field configure with NRA
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  | 4,    |
           | vestingMethod             |     1 |
           | hoursOfService            |   500 |
           | elapsedTime               |    11 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message

Scenario: VestedAt field configure with ERA
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  | 8,    |
           | vestingMethod             |     1 |
           | hoursOfService            |   500 |
           | elapsedTime               |    11 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message


Scenario: VestedAt field configure with all options
Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value   |
           | vestingName               | abcde   |
           | immediateVestingIndicator | false   |
           | vestedAt                  | 1,2,4,8 |
           | vestingMethod             |       1 |
           | hoursOfService            |     500 |
           | elapsedTime               |      11 |
           | firstYear                 |       0 |
           | secondYear                |     100 |
           | thirdYear                 |     100 |
           | fourthYear                |     100 |
           | fifthYear                 |     100 |
           | sixthYear                 |     100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message

Scenario: VestedAt field configure with null
Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value                                |
           | vestingName               | random 10 alphawithspecialCharacters | Scenario: Vesting Name field configure with alphawithspecialCharacters
           | immediateVestingIndicator | false                                |
           | vestedAt                  |                                      |
           | vestingMethod             |                                    1 |
           | vestingDescription        | random 10 specialCharacters          |
           | hoursOfService            |                                  500 |
           | elapsedTime               |                                   11 |
           | firstYear                 |                                    0 |
           | secondYear                |                                  100 |
           | thirdYear                 |                                  100 |
           | fourthYear                |                                  100 |
           | fifthYear                 |                                  100 |
           | sixthYear                 |                                  100 |
           | breakInServiceApplicable  | true                                 |
           | disregardPrior            |                                    1 |
           | hours                     |                                  500 |
           | breakInServiceRules       |                                      |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
           
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
  	Then the API response should contain the 2 following errors 
	| error_code | error_message                                                                         |
	| PL412      | Required                                                                              |
	| PL129      | Required                                                                              | Scenario: Vesting BIS rule field configure with Null on tables
	| PL417      | Vesting Description should contain only Alphabets, Numbers, Space, Dot and Apostrophe | Scenario: Vesting description field configure with specialCharacters
	| PL145      | Vesting Name should contain alphabets, numbers only.                                  |


Scenario: Vesting BIS rule field configure with Rule of priority
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  | 2,    |
           | vestingMethod             |     1 |
           | hoursOfService            |   500 |
           | breakInServiceApplicable  | true  |
           | disregardPrior            |     6 |
           | hours                     |   500 |
           | elapsedTime               |    11 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message

#Scenario: Vesting forfeiture treatment field configure with allocate to participant
#Scenario: Vesting forfeiture treatment field configure with plan expenses
#Scenario: Vesting forfeiture treatment field configure with Reduce ER contributions
#Scenario: Vesting forfeiture treatment field configure with Reduce match contributions

Scenario: Vesting ComputationPeriod  field configure with PLanYear
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                        | value               |
           | vestingName                | random 30 alphabets | Scenario: Vesting Name field configure with 30 characters
           | immediateVestingIndicator  | false               |
           | vestingDescription         | <Description>       |
           | vestedAt                   |                 1,2 |
           | vestingMethod              |                   1 |
           | hoursOfService             |                 200 | Scenario: Vesting method field configure with hours of service
           | breakInServiceApplicable   | true                |
           | vestingComputationalPeriod |                   2 |
           | disregardPrior             |                   6 |
           | hours                      |                 500 |
           | elapsedTime                |                  11 |
           | firstYear                  |                   0 |
           | secondYear                 |                 100 |
           | thirdYear                  |                 100 |
           | fourthYear                 |                 100 |
           | fifthYear                  |                 100 |
           | sixthYear                  |                 100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   200 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message
Examples: 
| Description             |
| random 10 alphabets     | Scenario: Vesting description field configure with alphabets
| random 10 numerics      | Scenario: Vesting description field configure with numerics
| random 10 alphaNumerics |Scenario: Vesting description field configure with alphaNumerics
| random 150 alphaNumerics |Scenario: Vesting description field configure with 150 characters


Scenario: Vesting method field ElapsedTime configure
Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value    |
           | vestingName               | abcde    |
           | immediateVestingIndicator | false    |
           | vestedAt                  |      1,2 |
           | vestingMethod             | <method> |
           | hoursOfService            |      500 |
           | elapsedTime               |        6 |  Scenario: Vesting method field ElapsedTime configure
           | firstYear                 |        0 |
           | secondYear                |      100 |
           | thirdYear                 |      100 |
           | fourthYear                |      100 |
           | fifthYear                 |      100 |
           | sixthYear                 |      100 |
And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
           |           1 | VestingMethod             |     1 |
           |           1 | ElapsedTime               |    11 |
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message
Examples: 
| method |
|      2 |


Scenario: Vesting method field Equivalency configure
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  |   1,2 |
           | vestingMethod             |     3 |
           | activeEmployees           |     1 |
           | hoursOfService            |   500 |
           | breakInServiceApplicable  | true  |
           | daily                     |     1 |
           | weekly                    |     1 |
           | biWeekly                  |     1 |
           | semiMonthly               |     1 |
           | monthly                   |     1 |
           | quarterly                 |     1 |
           | annually                  |     1 |
           | semiAnnually              |     1 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
           And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
Then API should respond with successful message


Scenario: Vesting method field Equivalency configure with activeEmployee as Null
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value               |
           | vestingName               | random 31 alphabets |
           | immediateVestingIndicator | false               |
           | vestedAt                  |                 1,2 |
           | vestingMethod             |                   3 |
           | activeEmployees           |                     |
           | vestingSchedule           |                     |
           | hoursOfService            |                 500 |
           | breakInServiceApplicable  | true                |
           | daily                     |                     |
           | weekly                    |                     |
           | biWeekly                  |                     |
           | semiMonthly               |                     |
           | monthly                   |                     |
           | quarterly                 |                     |
           | annually                  |                     |
           | semiAnnually              |                     |
           | firstYear                 |                   0 |
           | secondYear                |                 100 |
           | thirdYear                 |                 100 |
           | fourthYear                |                 100 |
           | fifthYear                 |                 100 |
           | sixthYear                 |                 100 |
           And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
   	Then the API response should contain the 2 following errors 
	| error_code | error_message                                        |
	| PL635      | Required                                             |
	| PL637      | Required                                             | Scenario: Vesting method field Equivalency configure with daily as Null
	| PL639      | Required                                             | Scenario: Vesting method field Equivalency configure with weekly as Null
	| PL641      | Required                                             | Scenario: Vesting method field Equivalency configure with biweekly as Null
	| PL643      | Required                                             | Scenario: Vesting method field Equivalency configure with SemiMonthly as Null
	| PL645      | Required                                             | Scenario: Vesting method field Equivalency configure with Monthly as Null
	| PL647      | Required                                             | Scenario: Vesting method field Equivalency configure with quaterly as Null
	| PL649      | Required                                             | Scenario: Vesting method field Equivalency configure with SemiAnnually as Null
	| PL651      | Required                                             | Scenario: Vesting method field Equivalency configure with Annually as Null
	| PL144      | Vesting Name length should not exceed  30 Characters | Scenario: Vesting Name field configure with above 30 characters
	| PL415      | Required                                             | Scenario: Vesting Schedule field configure with Null

Scenario: Vesting method field Equivalency configure more than 1000 for activeEMployees
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  |   1,2 |
           | vestingMethod             |     3 |
           | activeEmployees           |  1001 |
           | hoursOfService            |   500 |
           | breakInServiceApplicable  | true  |
           | daily                     |    25 |
           | weekly                    |   169 |
           | biWeekly                  |   337 |
           | semiMonthly               |   385 |
           | monthly                   |   745 |
           | quarterly                 |  2209 |
           | annually                  |  8761 |
           | semiAnnually              |  4393 |
           | serviceCreditPeriod       |       |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
           And Collection in a model is configured with 1 blocks for the property "AdditionalVestings" with values to save model portfolio as given below
           | BlockNumber | Key                       | Value |
           |           1 | VestingName               | abcde |
           |           1 | ImmediateVestingIndicator | false |
           |           1 | VestedAt                  |   1,2 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
   	Then the API response should contain the 2 following errors 
	| error_code | error_message                  |
	| PL636      | Hours cannot be more than 1000 |Scenario: Vesting method field Equivalency configure more than 1000 for activeEMployees
	| PL638      | Hours cannot be more than 24   |Scenario: Vesting method field Equivalency configure more than 24 for daily
	| PL640      | Hours cannot be more than 168  |Scenario: Vesting method field Equivalency configure more than 168 for weekly
	| PL642      | Hours cannot be more than 336  |Scenario: Vesting method field Equivalency configure more than 336 for biweekly
	| PL644      | Hours cannot be more than 384  |Scenario: Vesting method field Equivalency configure more than 384 for SemiMonthly
	| PL646      | Hours cannot be more than 744  |Scenario: Vesting method field Equivalency configure more than 744 for Monthly
	| PL648      | Hours cannot be more than 2208 |Scenario: Vesting method field Equivalency configure more than 2208 for quaterly
	| PL650      | Hours cannot be more than 4392 |Scenario: Vesting method field Equivalency configure more than 4392 for semiannually
	| PL652      | Hours cannot be more than 8760 |Scenario: Vesting method field Equivalency configure more than 8760 for annually
	| PL563      | Required |Scenario: VestingServiceCreditPeriod is configured with null when set as equivalency




