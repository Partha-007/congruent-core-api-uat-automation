Feature: A_ComputationPeriod
[BeforeTestRun]

#Required field changed to optional feild
#Scenario: Computation Period is Null
#  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
#  When Configuration has been made as per following
#           | key                       | value |
#           | computationPeriod         |       |
#           | responsibleForCalculation |     1 |
#  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
#  Then API should give response as "PL1092 : Required"

Scenario: Computation Period is configured with Plan year 
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "computationPeriod" is configured as "2"
And the property "responsibleForCalculation" is configured as "1"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
  Then API should respond with successful message

#C_equivalency
Scenario:Service Computation feilds is given  Null when apply all status as true
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
   When Configuration has been made as per following
           | key                     | value |
           | serviceComputation      |     3 |
           | activeEmployeesHours    |       |
           | applyToAllStatuses      | true  |
           | dailyHours              |       |
           | weeklyHours             |       |
           | biWeeklyHours           |       |
           | semiMonthlyHours        |       |
           | monthlyHours            |       |
           | quarterlyHours          |       |
           | semiAnnuallyHours       |       |
           | annuallyHours           |       |
           | computationPeriod       |       |
           | breakInServiceAvailable | true  |
           | breakInServiceHours     |   400 |
           | breakInServiceRules     |       |
           | consecutiveYearsForBIS  |       |
           And the property "responsibleForCalculation" is configured as "2"
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
 Then the API response should contain the 13 following errors 
	| error_code | error_message                    |
	| PL1092     | Required                         |
	| PL1095     | Required                         | Scenario: Service Computation Equivalency hours of service is Null when apply all status as true
	| PL1097     | Required                         | Scenario: Service Computation Equivalency daily hours frequency is null
	| PL1100     | Required                         | Scenario: Service Computation Equivalency weekly hours frequency is null
	| PL1103     | Required                         | Scenario: Service Computation Equivalency Biweekly hours frequency is null
	| PL1106     | Required                         | Scenario: Service Computation Equivalency Semimonthly  hours frequency is null
	| PL1109     | Required                         | Scenario: Service Computation Equivalency monthlyHoursfrequency is null
	| PL751      | Required                         | Scenario: Service Computation Equivalency quarterlyHours frequency is null
	| PL1126     | Required                         | Scenario: Service Computation Equivalency semiAnnuallyHours frequency is null
	| PL1151     | Required                         | Scenario: Service Computation Equivalency annuallyHours frequency is null
	| PL2029     | Minimum allowed BIS hour is 500. |
	| PL2031     | Required                         |
	| PL2032     | Required                         |
    Scenario:Service Computation feilds is given zero when apply all status as true
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
   When Configuration has been made as per following
           | key                        | value |
           | serviceComputation         |     3 |
           | activeEmployeesHours       |  1000 |
           | applyToAllStatuses         | true  |
           | computationPeriod          |     0 |
           | planYOSServiceCreditPeriod |       |
           | dailyHours                 |     0 |
           | weeklyHours                |     0 |
           | biWeeklyHours              |     0 |
           | semiMonthlyHours           |     0 |
           | monthlyHours               |     0 |
           | quarterlyHours             |     0 |
           | semiAnnuallyHours          |     0 |
           | annuallyHours              |     0 |
  And the property "responsibleForCalculation" is configured as "2"       
 And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
 Then the API response should contain the 10 following errors 
	| error_code | error_message |
	| PL1092     | Required      | Scenario: Service Computation Equivalency computationPeriod is null
	| PL1094     | Required      | Scenario: Service Computation Equivalency planYOSServiceCreditPeriod is null,#Service Credit Period  Scenario:  Service Credit Period is Null 
	| PL1100     | PL1098        | Scenario: Service Computation Equivalency daily hours frequency is 0
	| PL1101     | Required      | Scenario: Service Computation Equivalency weekly hours frequ
	| PL1104     | Required      | Scenario: Service Computation Equivalency Biweekly hours frequency is 0
	| PL1107     | Required      | Scenario: Service Computation Equivalency Semimonthly  hours frequency is 0
	| PL1110     | Required      | Scenario: Service Computation Equivalency monthlyHoursfrequency is 0
	| PL1127     | Required      | Scenario: Service Computation Equivalency quarterlyHours frequency is 0
	| PL755      | Required      | Scenario: Service Computation Equivalency semiAnnuallyHours frequency is 0
	| PL758      | Required      | Scenario: Service Computation Equivalency annuallyHours frequency is 0       
	


        Scenario:Service Computation Equivalency's values are assigned equal to the limits
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
   When Configuration has been made as per following
           | key                        | value |
           | serviceComputation         |     3 |
           | activeEmployeesHours       |     0 | Scenario: Service Computation Equivalency hours of service is 0 when apply all status as true
           | applyToAllStatuses         | true  |
           | dailyHours                 |    24 | Scenario: Service Computation Equivalency daily hours frequency is equal of 24
           | weeklyHours                |   168 | Scenario: Service Computation Equivalency weekly hours frequency is equal of 168
           | biWeeklyHours              |   336 | Scenario: Service Computation Equivalency Biweekly hours frequency is equal of 336
           | semiMonthlyHours           |   384 | Scenario: Service Computation Equivalency Semimonthly  hours frequency is equal of 384
           | monthlyHours               |   744 | Scenario: Service Computation Equivalency monthlyHoursfrequency is equal of 744
           | quarterlyHours             |  2208 | Scenario: Service Computation Equivalency quarterlyHours frequency is equal of 2208
           | semiAnnuallyHours          |  4392 | Scenario: Service Computation Equivalency semiAnnuallyHours frequency is equal of 4392
           | annuallyHours              |  8760 | Scenario: Service Computation Equivalency annuallyHours frequency is equal of 8760
           | planYOSServiceCreditPeriod |     2 |#Service Credit Period  Scenario:  Service Credit Period is Immediate                                                
            And the property "responsibleForCalculation" is configured as "2"
     Then API should respond with successful message



   Scenario:Service Computation Equivalency's values are assigned less than the limits
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
   When Configuration has been made as per following
           | key                        | value |
           | serviceComputation         |     3 |
           | activeEmployeesHours       |   100 | Scenario: Service Computation Equivalency hours of service is less than 1000
           | applyToAllStatuses         | true  |
           | dailyHours                 |    20 | Scenario: Service Computation Equivalency daily hours frequency is less than 24
           | weeklyHours                |   100 | Scenario: Service Computation Equivalency weekly hours frequency is less than 168
           | biWeeklyHours              |   300 | Scenario: Service Computation Equivalency Biweekly hours frequency is less than 336
           | semiMonthlyHours           |   350 | Scenario: Service Computation Equivalency Semimonthly  hours frequency is less than 384
           | monthlyHours               |   700 | Scenario: Service Computation Equivalency monthlyHoursfrequency is less than 744
           | quarterlyHours             |  2000 | Scenario: Service Computation Equivalency quarterlyHours frequency is less than 2208
           | semiAnnuallyHours          |  4000 | Scenario: Service Computation Equivalency semiAnnuallyHours frequency is less than 4392
           | annuallyHours              |  8000 | Scenario: Service Computation Equivalency annuallyHours frequency is less than 8760
           | computationPeriod          |     2 | Scenario: Service Computation Equivalency computationPeriod select plan year
           | planYOSServiceCreditPeriod |     1 | Scenario: Service Computation Equivalency planYOSServiceCreditPeriod as select At the end of Computation Period ,#Service Credit Period  Scenario:  Service Credit Period is At the end of Computation 
    And the property "responsibleForCalculation" is configured as "2"
    Then API should respond with successful message


Scenario: Service Computation Equivalency planYOSServiceCreditPeriod is selected as Immediately after the Hours condition is satisfied
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
   When Configuration has been made as per following
           | key                        | value |
           | serviceComputation         |     3 |#ServiceRequirement Scenario: Service Computation is Equivalency
           | activeEmployeesHours       |  1000 |Scenario: Service Computation Equivalency hours of service is equal of 1000 
           | applyToAllStatuses         | true  |
           | dailyHours                 |     2 |
           | weeklyHours                |    50 |
           | biWeeklyHours              |    50 |
           | semiMonthlyHours           |    50 |
           | monthlyHours               |    50 |
           | quarterlyHours             |    50 |
           | semiAnnuallyHours          |    50 |
           | annuallyHours              |  8000 |
           | computationPeriod          |     2 |
           | planYOSServiceCreditPeriod |     2 |
    And the property "responsibleForCalculation" is configured as "2"
    Then API should respond with successful message

#UI RESTRICTED 

  #   Scenario: Service Computation Equivalency's values are assigned more than the limits
  #Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
  # When Configuration has been made as per following
  #         | key                  | value |
  #         | serviceComputation   |     3 |
  #         | activeEmployeesHours |  2000 |
  #         | applyToAllStatuses   | true  |
  #         | dailyHours           |    25 |
  #         | weeklyHours          |   200 |
  #         | biWeeklyHours        |   500 |
  #         | semiMonthlyHours     |   500 |
  #         | monthlyHours         |   900 |
  #         | quarterlyHours       |  2500 |
  #         | semiAnnuallyHours    |  5000 |
  #         | annuallyHours        | 10000 |
  #   And the property "responsibleForCalculation" is configured as "2"
  #   Then the API response should contain the 9 following errors 
  #   | error_code | error_message                              |
  #   | PL1096     | Hours cannot be more than 1000             | Scenario: Service Computation Equivalency hours of service is more than 1000
  #   | PL1099     | Daily Hours should not exceed 24           | Scenario: Service Computation Equivalency daily hours frequency is more than 24
  #   | PL1102     | Weekly Hours should not exceed 168         | Scenario: Service Computation Equivalency weekly hours frequency is more than 168
  #   | PL1105     | BiWeekly Hours should not exceed 336       | Scenario: Service Computation Equivalency Biweekly hours frequency is more than 336
  #   | PL1108     | Semi-monthly Hours should not exceed 384   | Scenario: Service Computation Equivalency Semimonthly  hours frequency is more than 384
  #   | PL1111     | Monthly Hours should not exceed 744        | Scenario: Service Computation Equivalency monthlyHoursfrequency is more than 744
  #   | PL1153     | Quarterly Hours should not exceed 2208     | Scenario: Service Computation Equivalency quarterlyHours frequency is more than 2208
  #   | PL756      | Semi-Annually Hours should not exceed 4392 | Scenario: Service Computation Equivalency semiAnnuallyHours frequency is more than 4392
  #   | PL1152     | Annually Hours should not exceed 8760      | Scenario: Service Computation Equivalency annuallyHours frequency is more than 8760       

     #ElapsedTime in months
     #Required field changed to optional feild
#Scenario: Elapsed time in month is Null 
#  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
#When the property "serviceComputation" is configured as "2"
#And the property "responsibleForCalculation" is configured as "1"
#And the property "elapsedTimeInMonths" is configured as ""
#  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
#Then API should give response as "PL1088 : Required"


Scenario: Elapsed time in month is 11 ,#ServiceRequirement Scenario: SService Computation is Elapsed Time
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "serviceComputation" is configured as "2"
And the property "responsibleForCalculation" is configured as "1"
And the property "elapsedTimeInMonths" is configured as "11"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
  Then API should respond with successful message   

 # HoursofService


Scenario: Service Computation is Hours of Service is Null when apply all status as true 
Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "serviceComputation" is configured as "1"
And the property "hoursOfService" is configured as ""
And the property "applyToAllStatuses" is configured as "true"
 And the property "responsibleForCalculation" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
Then API should give response as "PL728 : Required"

Scenario: Service Computation is Hours of Service is Zero when apply all status as true
  Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "serviceComputation" is configured as "1"
And the property "hoursOfService" is configured as "0"
And the property "applyToAllStatuses" is configured as "true"
 And the property "responsibleForCalculation" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
Then API should give response as "PL728 : Required"


Scenario: Service Computation is Hours of Service is 1000 when apply all status as true ,#ServiceRequirement Scenario: Service Computation is Hours of Service
Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "serviceComputation" is configured as "1"
And the property "hoursOfService" is configured as "1000"
And the property "applyToAllStatuses" is configured as "true"
 And the property "responsibleForCalculation" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
  Then API should respond with successful message  

Scenario: Service Computation is Hours of Service is above 1000 when apply all status as true
Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "serviceComputation" is configured as "1"
And the property "hoursOfService" is configured as "1001"
And the property "applyToAllStatuses" is configured as "true"
 And the property "responsibleForCalculation" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
Then API should give response as "PL729 : Number of Hours of Service should not be greater than 1000"

#SaveYOS
Scenario: Save YOS in plan level
Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "responsibleForCalculation" is configured as "2"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
Then API should respond with successful message  

# ServiceRequirement 

Scenario: Service Computation is Null 
Given Model is selected for the endpoint "/api/PlanYOS/SavePlanYOS"
When the property "serviceComputation" is configured as ""
 And the property "responsibleForCalculation" is configured as "2"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanYOSAsync"
Then API should give response as "PL727 : Required"

 

