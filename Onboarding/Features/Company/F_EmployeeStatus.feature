Feature: F_EmployeeStatus

A short summary of the feature
Scenario: Employee status (successful response) double execution
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 1 blocks for the property "EmploymentStatus" with values to save model portfolio as given below
| BlockNumber | Key                  | Value              |
| 1           | EmploymentStatusName | random 5 alphabets |
| 1           | EmploymentStatusCode | A                  |

| 1           | EmploymentStatusName | random 5 alphabets |
#When addMasterEmploymentStatus is executed
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message



Scenario: Employee status (successful response)
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 7 blocks for the property "EmploymentStatus" with values to save model portfolio as given below
| BlockNumber | Key                  | Value                  |
|           1 | EmploymentStatusName | Active                 |
|           1 | EmploymentStatus     |                      1 |
|           1 | EmploymentStatusCode | random 2 numerics      |
|           2 | EmploymentStatusName |                   1234 |
|           2 | EmploymentStatus     |                      1 |
|           2 | EmploymentStatusCode | random 2 numerics      |
|           3 | EmploymentStatusName | Active                 |
|           3 | EmploymentStatus     |                      1 |
|           3 | EmploymentStatusCode | random 1 alphabets     |
|           4 | EmploymentStatusName | Active                 |
|           4 | EmploymentStatus     |                      1 |
|           4 | EmploymentStatusCode | random 2 numerics      |
|           5 | EmploymentStatusName | Active                 |
|           5 | EmploymentStatus     |                      1 |
|           5 | EmploymentStatusCode | random 2 alphaNumerics |
|           6 | EmploymentStatusName | Active                 |
|           6 | EmploymentStatus     |                      1 |
|           6 | EmploymentStatusCode | random 8 alphabets     |
|           7 | EmploymentStatusName | Active                 |
|           7 | EmploymentStatus     |                      1 |
|           7 | EmploymentStatusCode | random 10 alphabets    |
  And Configuration has been done as mentioned below
| key                        | value    |
| frequencyName              | Daily    |
| frequencyType              | 1        |
| modeOfHours                | 1        |
| modeOfCompensation         | 1        |
| modeOfContribution         | 1        |
| employeeClassificationType | 1        |
| code                       | L1       |
| classificationName         | Location |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

 Scenario: Employee status error vlidation
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 5 blocks for the property "EmploymentStatus" with values to save model portfolio as given below
  | BlockNumber | Key                  | Value                      |
  |           1 | EmploymentStatusName | Active                     | 
  |           1 | EmploymentStatus     |                          1 |
  |           1 | EmploymentStatusCode | random 0 alphabets         |
  |           2 | EmploymentStatusName | Active                     | 
  |           2 | EmploymentStatus     |                          1 |
  |           2 | EmploymentStatusCode | random 2 specialCharacters |
  |           3 | EmploymentStatusName | Active                     | 
  |           3 | EmploymentStatus     |                          1 |
  |           3 | EmploymentStatusCode | @f1                        |
  |           4 | EmploymentStatusName | Active                     | 
  |           4 | EmploymentStatus     |                          1 |
  |           4 | EmploymentStatusCode | random 11 alphabets        |
  |           5 | EmploymentStatusName | random 0 alphabets         | 
  |           5 | EmploymentStatusCode | A                          |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then the API response should contain the 5 following errors
| error_code | error_message                                                  |
| CM035      | Required                                                       |
| CM036      | Employment status code should be alphanumeric.                 |
| CM036      | Employment status code should be alphanumeric.                 |
| CM039      | Employment status code length should not exceed 10 characters. |
| CM034      | Required                                                       |



