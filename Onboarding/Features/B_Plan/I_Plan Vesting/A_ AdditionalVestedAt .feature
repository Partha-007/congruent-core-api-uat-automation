Feature: A_ AdditionalVestedAt 
[BeforeTestRun]

Scenario: Additional VestedAt field configure with Death
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
  When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  | 1,    | #VestedAt Scenario: VestedAt field configure with Death
           | vestingMethod             |     2 |
           | elapsedTime               |    11 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
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
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  | 1,    |
           | vestingMethod             |     2 |
           | breakInServiceApplicable  | true  |
           | disregardPrior            |       |
           | hours                     |   500 |
           | elapsedTime               |    11 |
           | hoursOfService            |       |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
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


# error message got updated from "PL412 : Required" to "PL616 : Required"

Scenario: Additional Vesting effective start date field configure with future date
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                       | value |
           | vestingName               | abcde |
           | immediateVestingIndicator | false |
           | vestedAt                  |   1,2 |
           | vestingMethod             |     1 |
           | hoursOfService            |   200 |
           | elapsedTime               |     6 |
           | breakInServiceApplicable  | true  |
           | breakInServiceRules       |     3 |
           | firstYear                 |     0 |
           | secondYear                |   100 |
           | thirdYear                 |   100 |
           | fourthYear                |   100 |
           | fifthYear                 |   100 |
           | sixthYear                 |   100 |
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
           | hoursOfService            |                     1001 |
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
 


 #SaveVesting

 
Scenario: Save vesting detail
  Given Model is selected for the endpoint "/api/Vesting/SaveVesting"
When Configuration has been made as per following
           | key                        | value               |
           | vestingName                | random 10 alphabets |
           | vestingDescription         | random 10 alphabets |
           | vestedAt                   |                 1,2 |
           | employerSourcesList        | 1,                  | #SaveVesting Scenario: To Validate Employer source Match is selected
           | vestingMethod              |                   1 |
           | hoursOfService             |                 100 |
           | vestingComputationalPeriod |                  1  |Scenario: Vesting ComputationPeriod  field configure with Anniversary
           | serviceCreditPeriod        |                   1 |
           | vestingSchedule            |                   1 |
           | forfeitureTimings          |                   1 |
           | forfeitureTreatment        |                 1,2 |
           | breakInServiceApplicable   | true                |
           | disregardPrior             |                   1 |
           | hours                      |                 500 |
           | firstYear                  |                   0 |
           | secondYear                 |                 100 |
           | thirdYear                  |                 100 |
           | fourthYear                 |                 100 |
           | fifthYear                  |                 100 |
           | sixthYear                  |                 100 |
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
           | key                        | value               |
           | vestingName                | random 10 alphabets |
           | vestingDescription         | random 10 alphabets |
           | vestedAt                   |                 1,2 |
           | employerSourcesList        |                     |
           | vestingMethod              |                   3 |
           | hoursOfService             |                 100 |
           | vestingComputationalPeriod |                     |Scenario: Vesting ComputationPeriod  field configure with Null when Equivalency
           | serviceCreditPeriod        |                   1 |
           | vestingSchedule            |                   1 |
           | forfeitureTimings          |                   1 |
           | forfeitureTreatment        |                 1,2 |
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
           |           1 | HoursOfService            |   500 |
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveVesting"
   	Then the API response should contain the 2 following errors 
	| error_code | error_message |
	| PL1033     | Required      |
	| PL564      | Required      |  


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
           | key                       | value                       |
           | vestingName               | abcde                       |
           | immediateVestingIndicator | false                       |
           | vestedAt                  |                             |
           | vestingMethod             |                           1 |
           | vestingDescription        | random 10 specialCharacters |
           | hoursOfService            |                         500 |
           | elapsedTime               |                          11 |
           | firstYear                 |                           0 |
           | secondYear                |                         100 |
           | thirdYear                 |                         100 |
           | fourthYear                |                         100 |
           | fifthYear                 |                         100 |
           | sixthYear                 |                         100 |
           | breakInServiceApplicable  | true                        |
           | disregardPrior            |                           1 |
           | hours                     |                         500 |
           | breakInServiceRules       |                             |
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
           | vestingName                | abcde               |
           | immediateVestingIndicator  | false               |
           | vestingDescription         | <Description>       |
           | vestedAt                   |                 1,2 |
           | vestingMethod              |                   1 |
           | hoursOfService             |                 200 |Scenario: Vesting method field configure with hours of service
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
           | elapsedTime               |       6 |
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




