Feature: Sample

A short summary of the feature


Scenario: Validation messages for a field
Given Model is selected for the endpoint "/api/BasicPlanDetails/SaveBasicPlanDetails"
When the property "planType" is configured as "1"
And API request has been sent to the "IPlanDetailsSave" with the method name "CreateNewPlanAsync"
Then API should give response as "PL143 : Required"


Scenario: When multiple properties needs to be changed
Given Vesting model is selected
When Configuration has been made as per following
| propertyName           | value        |
| VestingName            | 2 year cliff |
| 100% immediate vesting | No           |
| VestingSchedule        | 2 Year Cliff |
Then API should respond with successful message



Scenario: Calculation based scenario
Given Vesting model is selected
When Configuration has been made as per following
| propertyName           | value        |
| VestingName            | 2 year cliff |
| 100% immediate vesting | No           |
| VestingSchedule        | 2 Year Cliff |
Given Edit payroll file as mentioned below
| Key               | Value         |
| HIRE DATE         | 01/01/2021    |
| HOURS             | 1000          |
| PAY DATE          | 12/01/2021    |
| BIRTH DATE        | 04/01/1996    |
| PAYROLL FREQUENCY | DemoFrequency |
Then Vesting API should respond as follows
| creditedThisYear | computationPeriod     | comments                  | vestingYOS | vestingPercentage | bisType |
| True             | 04-01-2021-03-31-2022 | Participant data changed  | 1          | 0                 |         |
| True             | 06-01-2021-05-31-2022 | Participant data changed  | 2          | 0                 |         |
| False            | 06-01-2022-05-31-2023 | Participant data changed  | 2          | 0                 |         |
| False            | 06-01-2023-05-31-2024 | Participant data changed  | 2          | 0                 |         |


Scenario: Payroll file
Given Payroll file "Combined.csv" is selected
And Edit payroll file as mentioned below
| Key               | Value         |
| HIRE DATE         | 01/01/2021    |
| HOURS             | 1000          |
| PAY DATE          | 12/01/2021    |
| BIRTH DATE        | 04/01/1996    |
| PAYROLL FREQUENCY | DemoFrequency |


Scenario: Trade order file
Given Trade file "TradeOrder" is selected
And Edit Trade file as mentioned below
| Key                | value        |
| CUSIP              | 123456789    |
| NAV                | 2            |
| Trade order number | E12345643452 |



Scenario: Reports verification
Given Eligibility report has been generated for the plan "Test Plan"
Then Report should be displayed as mentioned below
| ColumnName         | value                 |
| PlanId             | TP001                 |
| SSN                | 123456789             |
| FirstName          | John                  |
| Eligibility Status | Eligible              |
| Eligibility Date   | 01/01/2025            |
| Reason             | Immediate Eligibility |



Scenario: Creating a new employee with payroll file upload
Given 