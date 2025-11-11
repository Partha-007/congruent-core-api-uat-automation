Feature: G_PayrollCalendar
[BeforeTestRun]


Scenario:To verify the "Daily" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | Daily                   |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | Daily                   |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | Daily                   |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | Daily                   |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | Daily                   |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | Daily                   |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "365" 
And The Paydates should be equal to

Scenario:To verify the "Weekly" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | Weekly                  |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | Weekly                  |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | Weekly                  |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | Weekly                  |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | Weekly                  |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | Weekly                  |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
| 7           | FrequencyName         | Weekly                  |
| 7           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 7           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 7           | EffectivePayDateCount | 0                       |
| 7           | Saturday              | 2                       |
| 8           | FrequencyName         | Weekly                  |
| 8           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 8           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 8           | EffectivePayDateCount | 0                       |
| 8           | Sunday                | 2                       |
| 9           | FrequencyName         | Weekly                  |
| 9           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 9           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 9           | EffectivePayDateCount | 0                       |
| 9           | Holiday               | 2                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "52" 
And The Paydates should be equal to

Scenario:To verify the "BiWeekly" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | BiWeekly                |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | BiWeekly                |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | BiWeekly                |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | BiWeekly                |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | BiWeekly                |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | BiWeekly                |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
| 7           | FrequencyName         | BiWeekly                |
| 7           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 7           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 7           | EffectivePayDateCount | 0                       |
| 7           | Saturday              | 2                       |
| 8           | FrequencyName         | BiWeekly                |
| 8           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 8           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 8           | EffectivePayDateCount | 0                       |
| 8           | Sunday                | 2                       |
| 9           | FrequencyName         | BiWeekly                |
| 9           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 9           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 9           | EffectivePayDateCount | 0                       |
| 9           | Holiday               | 2                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "26" 
And The Paydates should be equal to

Scenario:To verify the "Monthly" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | Monthly                 |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | Monthly                 |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | Monthly                 |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | Monthly                 |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | Monthly                 |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | Monthly                 |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
| 7           | FrequencyName         | Monthly                 |
| 7           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 7           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 7           | EffectivePayDateCount | 0                       |
| 7           | Saturday              | 2                       |
| 8           | FrequencyName         | Monthly                 |
| 8           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 8           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 8           | EffectivePayDateCount | 0                       |
| 8           | Sunday                | 2                       |
| 9           | FrequencyName         | Monthly                 |
| 9           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 9           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 9           | EffectivePayDateCount | 0                       |
| 9           | Holiday               | 2                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "12" 
And The Paydates should be
		| key        |
		| 01/31/2023 |
		| 02/28/2023 |
		| 03/31/2023 |
		| 04/30/2023 |
		| 05/31/2023 |
		| 06/30/2023 |
		| 07/31/2023 |
		| 08/31/2023 |
		| 09/30/2023 |
		| 10/31/2023 |
		| 11/30/2023 |
		| 12/31/2023 |

Scenario:To verify the "Quarterly" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | Quarterly               |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | Quarterly               |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | Quarterly               |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | Quarterly               |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | Quarterly               |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | Quarterly               |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
| 7           | FrequencyName         | Quarterly               |
| 7           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 7           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 7           | EffectivePayDateCount | 0                       |
| 7           | Saturday              | 2                       |
| 8           | FrequencyName         | Quarterly               |
| 8           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 8           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 8           | EffectivePayDateCount | 0                       |
| 8           | Sunday                | 2                       |
| 9           | FrequencyName         | Quarterly               |
| 9           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 9           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 9           | EffectivePayDateCount | 0                       |
| 9           | Holiday               | 2                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "4" 
And The Paydates should be
	| key        |
	| 03/31/2023 |
	| 06/30/2023 |
	| 09/30/2023 |
	| 12/31/2023 |

Scenario:To verify the "SemiAnnually" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | SemiAnnually            |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | SemiAnnually            |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | SemiAnnually            |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | SemiAnnually            |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | SemiAnnually            |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | SemiAnnually            |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
| 7           | FrequencyName         | SemiAnnually            |
| 7           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 7           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 7           | EffectivePayDateCount | 0                       |
| 7           | Saturday              | 2                       |
| 8           | FrequencyName         | SemiAnnually            |
| 8           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 8           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 8           | EffectivePayDateCount | 0                       |
| 8           | Sunday                | 2                       |
| 9           | FrequencyName         | SemiAnnually            |
| 9           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 9           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 9           | EffectivePayDateCount | 0                       |
| 9           | Holiday               | 2                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "2" 
And The Paydates should be
	| key        |
	| 06/30/2023 |
	| 12/31/2023 |


Scenario:To verify the "Annually" Frequency in Payroll Calendar by setting Effective pay date count value
Given Model is selected for the endpoint "/api/v1/Company"
When Collection in a model is configured with 1 blocks for the property "PayrollCalendars" with values to save model portfolio as given below
| BlockNumber | Key                   | Value                   |
| 1           | FrequencyName         | Annually                |
| 1           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 1           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | FrequencyName         | Annually                |
| 2           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 2           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 2           | EffectivePayDateCount | 1                       |
| 3           | FrequencyName         | Annually                |
| 3           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 3           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 3           | EffectivePayDateCount | 30                      |
| 4           | FrequencyName         | Annually                |
| 4           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 4           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 4           | EffectivePayDateCount | 0                       |
| 4           | Saturday              | 1                       |
| 5           | FrequencyName         | Annually                |
| 5           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 5           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 5           | EffectivePayDateCount | 0                       |
| 5           | Sunday                | 1                       |
| 6           | FrequencyName         | Annually                |
| 6           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 6           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 6           | EffectivePayDateCount | 0                       |
| 6           | Holiday               | 1                       |
| 7           | FrequencyName         | Annually                |
| 7           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 7           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 7           | EffectivePayDateCount | 0                       |
| 7           | Saturday              | 2                       |
| 8           | FrequencyName         | Annually                |
| 8           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 8           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 8           | EffectivePayDateCount | 0                       |
| 8           | Sunday                | 2                       |
| 9           | FrequencyName         | Annually                |
| 9           | ScheduleBeginDate     | 1/1/2023, 12:00:00 AM   |
| 9           | ScheduleEndDate       | 12/31/2023, 12:00:00 AM |
| 9           | EffectivePayDateCount | 0                       |
| 9           | Holiday               | 2                       |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then Then Number of paydates should be "1" 
And The Paydates should be
	| key        |
	| 12/31/2023 |