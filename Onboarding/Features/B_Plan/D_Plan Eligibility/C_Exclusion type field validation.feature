Feature: C_Exclusion type field validation
[BeforeTestRun]

Scenario:  Exclusion type field validation when null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as ""
  And the property "dateOfHireType" is configured as ""
  And the property "hiredOnOrBeforeDate" is configured as ""
  And the property "hiredOnOrAfterDate" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 2 following errors 
	| error_code |   error_message |
    | PL179      |   Required      |
    | PL181      |   Required      |23273

Scenario: HiredOnOrBeforeDate field null validation  when Exclusion type field  equal to date of hire and date of hire is chosen as HiredOnOrBeforeDate
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "2"
  And the property "hiredOnOrBeforeDate" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code |   error_message |
    | PL172      |   Required      |


Scenario: HiredOnOrBeforeDate field acceptance  when Exclusion type field  equal to date of hire and date of hire is chosen as HiredOnOrBeforeDate
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "2"
  And the property "hiredOnOrBeforeDate" is configured as "2022-04-03T18:30:00.000Z"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
Then API should respond with successful message

Scenario: HiredOnOrAfterDate field acceptance  when Exclusion type field  equal to date of hire and date of hire is chosen as HiredOnOrAfterDate
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "1"
  And the property "hiredOnOrAfterDate" is configured as "2022-04-03T18:30:00.000Z"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
Then API should respond with successful message

Scenario: HiredOnOrAfterDate field null validation  when Exclusion type field  equal to date of hire and date of hire is chosen as HiredOnOrAfterDate  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "1"
  And the property "hiredOnOrAfterDate" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code |   error_message |
    | PL171      |   Required      |

Scenario: HiredBetween field acceptance when Exclusion type field  equal to date of hire and date of hire is chosen as HiredBetween
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "3"
  And the property "hiredOnOrAfterDate" is configured as "2022-03-03T18:30:00.000Z"
  And the property "hiredOnOrBeforeDate" is configured as "2022-04-03T18:30:00.000Z"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
Then API should respond with successful message

#Scenario: End date field validation when Exclusion type field  equal to date of hire and date of hire is chosen as HiredBetween and start date is given
Scenario: start date field validation when Exclusion type field  equal to date of hire and date of hire is chosen as HiredBetween and end date is given
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "3"
  And the property "hiredOnOrAfterDate" is configured as ""
  And the property "hiredOnOrBeforeDate" is configured as ""
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code |   error_message |
    | PL171      |   Required      |
    | PL172      |   Required      |


Scenario: End date field validation when Exclusion type field  equal to date of hire and date of hire is chosen as HiredBetween and start date is greater than end date
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
  When the property "name" is configured with "alphabets" with 10 characters
  And the property "exclusionType" is configured as "1"
  And the property "dateOfHireType" is configured as "3"
  And the property "hiredOnOrAfterDate" is configured as "2023-04-03T18:30:00.000Z"
  And the property "hiredOnOrBeforeDate" is configured as "2022-04-01T18:30:00.000Z"
  And the property "ltptHours" is configured as "500"
  And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                    |
	| PL192      | Exclusion from date should not be greater than exclusion to date |

Scenario:Excluded employee classification field acceptance when Exclusion type field  equal to employee classification and employee classification is entered
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
 When Configuration has been made as per following
         | key                          | value |
         | immediateEligibility         | true  |
         | exclusionType                |     2 |
         | employeeClassificationCodeId | L1    |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
Then API should respond with successful message

Scenario:Excluded employee classification field is null when Exclusion type employee classification is entered
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
 When Configuration has been made as per following
         | key                          | value |
         | immediateEligibility         | true  |
         | exclusionType                |     2 |
  And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL1038     | Required      |


Scenario:Excluded employee classification field is null when Exclusion type date of hire and empolyee classification is entered in dateOfHireType is null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"

 When Configuration has been made as per following
         | key                          | value |
         | immediateEligibility         | true  |
         | exclusionType                |     3 |
         | dateOfHireType                |      |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL181     | Required      |



Scenario:Excluded employee classification field is null when Exclusion type date of hire and empolyee classification is entered in employeeClassificationCodeId is null
  Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
 When Configuration has been made as per following
         | key                          | value |
         | immediateEligibility         | true  |
         | exclusionType                |     3 |
         | dateOfHireType                |     1 |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL1038     | Required      |


    
 Scenario:Both date of hire and empolyee classification field validation when Exclusion type field  equal to Both date of hire and empolyee classification
   Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"

   Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
 When Configuration has been made as per following
         | key                          | value      |
         | exclusionType                |          3 |
         | dateOfHireType               |          2 |
         | hiredOnOrBeforeDate          | 01-01-2021 |
         | employeeClassificationCodeId | L1         |
         | immediateEligibility         | true       |
         | ltptHours                    |        500 |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
Then API should respond with successful message

 Scenario:Hired on after selected on date of hire  when Exclusion type field  equal to Both date of hire and empolyee classification
   Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"

 When Configuration has been made as per following
         | key                          | value |
         | exclusionType                |     3 |
         | dateOfHireType               |     1 |
         | employeeClassificationCodeId | L1    |
         | immediateEligibility         | true  |
         | hiredOnOrAfterDate           |       |
         | ltptAgeInYears               |    17 |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code | error_message |
	| PL171      | Required      |


 Scenario:Hired on before selected on date of hire  when Exclusion type field  equal to Both date of hire and empolyee classification
   Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"

 When Configuration has been made as per following
         | key                          | value |
         | exclusionType                |     3 |
         | dateOfHireType               |     2 |
         | employeeClassificationCodeId | L1    |
         | immediateEligibility         | true  |
         | hiredOnOrBeforeDate          |       |
         | ltptAgeInYears               |    17 |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code  | error_message |
	| PL172 | Required      |

 Scenario:Hired between selected on date of hire  when Exclusion type field  equal to Both date of hire and empolyee classification
   Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"
 When Configuration has been made as per following
         | key                          | value      |
         | exclusionType                | 3          |
         | dateOfHireType               | 3          |
         | employeeClassificationCodeId | L1         |
         | immediateEligibility         | true       |
         | hiredOnOrBeforeDate         |        |
         | hiredOnOrAfterDate         |        |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 2 following errors 
	| error_code  | error_message |
	| PL171 | Required      |
	| PL172 | Required      |


 Scenario:Save Hired between selected on date of hire  when Exclusion type field  equal to Both date of hire and employee classificationfication
   Given Model is selected for the endpoint "/api/v1/EligibleRule/SavePlanAmendmentEligibleRule"

 When Configuration has been made as per following
         | key                          | value      |
         | exclusionType                |          3 |
         | dateOfHireType               |          3 |
         | hiredOnOrBeforeDate          | 01/01/2022 |
         | hiredOnOrAfterDate           | 01/01/2021 |
         | employeeClassificationCodeId | L1         |
         | immediateEligibility         | true       |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
Then API should respond with successful message

 When Configuration has been made as per following
         | key                          | value      |
         | exclusionType                | 3          |
         | dateOfHireType               | 3          |
         | hiredOnOrBeforeDate          | 01/01/2021 |
         | hiredOnOrAfterDate           | 01/01/2022 |
         | employeeClassificationCodeId | L1         |
         | immediateEligibility         | true       |
And the property "ltptHours" is configured as "500"
And API request has been sent to the "IPlanDetailsSave" with the method name "SavePlanAmendmentEligibleRule"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                    |
	| PL192      | Exclusion from date should not be greater than exclusion to date |