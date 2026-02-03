Feature: E_EmployeeClassification

A short summary of the feature
 Scenario: Employee classification (successful response)
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 13 blocks for the property "Classifications" with values as given below
| BlockNumber | Key                                     | Value                                      |
|           1 | ClassificationName                      | random 5 Alphabets                         |
|           1 | EmployeeClassificationType              |                                          1 |
|           2 | ClassificationName                      | random 5 Numerics                          |
|           2 | EmployeeClassificationType              |                                          2 |
|           3 | ClassificationName                      | random 5 Numerics                          |
|           3 | EmployeeClassificationType              |                                          3 |
|           3 | ClassificationTypeRequired              | false                                      |
|           3 | AllowCreatingClassificationViaCodesFile | false                                      |
|           4 | ClassificationName                      | random 5 SpecialCharacters                 |
|           4 | EmployeeClassificationType              | random 1 Numerics                          |
|           5 | ClassificationName                      | random 5 AlphaNumericWithSpecialCharacters |
|           5 | EmployeeClassificationType              | random 1 Numerics                          |
|           6 | ClassificationName                      | random 45 Alphabets                        |
|           6 | EmployeeClassificationType              | random 1 Numerics                          |
|           7 | ClassificationName                      | random 50 Alphabets                        |
|           7 | EmployeeClassificationType              | random 1 Numerics                          |
|           8 | ClassificationName                      | random 5 Alphabets                         |
|           8 | EmployeeClassificationType              |                                          1 |
|           9 | ClassificationName                      | random 5 Alphabets                         |
|           9 | EmployeeClassificationType              |                                          1 |
|          10 | ClassificationName                      | random 5 Alphabets                         |
|          10 | EmployeeClassificationType              |                                          1 |
|          11 | ClassificationName                      | random 5 Alphabets                         |
|          11 | EmployeeClassificationType              |                                          1 |
|          12 | ClassificationName                      | random 5 Alphabets                         |
|          12 | EmployeeClassificationType              |                                          1 |
|          13 | ClassificationName                      | random 5 Alphabets                         |
|          13 | EmployeeClassificationType              |                                          1 |

  When Collection in a model is configured with 13 blocks for the property "EmployeeClassificationCodes" with values as given below
 | BlockNumber | Key  | Value                                      |
 |           1 | Code |                                          2 |
 |           2 | Code | random 1 Numerics                          |
 |           3 | Code | random 1 Numerics                          |
 |           4 | Code | random 1 Numerics                          |
 |           5 | Code | random 1 Numerics                          |
 |           6 | Code | random 1 Numerics                          |
 |           7 | Code | random 1 Numerics                          |
 |           8 | Code | random 5 Alphabets                         |
 |           9 | Code | random 5 Numerics                          |
 |          10 | Code | random 5 SpecialCharacters                 |
 |          11 | Code | random 5 AlphaNumericWithSpecialCharacters |
 |          12 | Code | random 100 Numerics                        |
 |          13 | Code | random 250 Numerics                        |

 And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message

 
 

 Scenario: Employee classification (successful response 2)
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 10 blocks for the property "Classifications" with values as given below 
|  1 | ClassificationName         | random 5 Alphabets |
|  1 | EmployeeClassificationType |                  1 |
|  2 | ClassificationName         | random 5 Alphabets |
|  2 | EmployeeClassificationType |                  1 |
|  3 | ClassificationName         | random 5 Alphabets |
|  3 | EmployeeClassificationType |                  1 |
|  4 | ClassificationName         | random 5 Alphabets |
|  4 | EmployeeClassificationType |                  1 |
|  5 | ClassificationName         | random 5 Alphabets |
|  5 | EmployeeClassificationType |                  1 |
|  6 | ClassificationName         | random 5 Alphabets |
|  6 | EmployeeClassificationType |                  1 |
|  7 | ClassificationName         | random 5 Alphabets |
|  7 | EmployeeClassificationType |                  1 |
|  8 | ClassificationName         | random 5 Alphabets |
|  8 | EmployeeClassificationType |                  1 |
|  9 | ClassificationName         | random 5 Alphabets |
|  9 | EmployeeClassificationType |                  1 |
| 10 | ClassificationName         | random 5 Alphabets |
| 10 | EmployeeClassificationType |                  1 |
 When Collection in a model is configured with 10 blocks for the property "EmployeeClassificationCodes" with values as given below

 |  1 | Code | random 100 Numerics |
 |  2 | Code | random 100 Numerics |
 |  3 | Code | random 100 Numerics |
 |  4 | Code | random 100 Numerics |
 |  5 | Code | random 100 Numerics |
 |  6 | Code | random 100 Numerics |
 |  7 | Code | random 100 Numerics |
 |  8 | Code | random 100 Numerics |
 |  9 | Code | random 100 Numerics |
 | 10 | Code | random 100 Numerics |
 
  When Collection in a model is configured with 10 blocks for the property "Attributes" with values as given below
  |  1 | Name                        | random 10 Alphabets                         |
 |  1 | Value                       | random 9 Alphabets                          |
  |  2 | Name                        | random 10 Alphabets                         |
 |  2 | Value                       | random 10 Alphabets                         |
 |  3 | Name                        | random 10 Alphabets                         |
 |  3 | Value                       | random 10 Numerics                          |
 |  4 | Name                        | random 10 Alphabets                         |
 |  4 | Value                       | random 10 SpecialCharacters                 |
 |  5 | Name                        | random 10 Alphabets                         |
 |  5 | Value                       | random 10 AlphaNumericWithSpecialCharacters |
 |  6 | Name                        | random 10 Numerics                          |
 |  6 | Value                       | random 9 Alphabets                          |
 |  7 | Name                        | random 10 SpecialCharacters                 |
 |  7 | Value                       | random 9 Alphabets                          |
 |  8 | Name                        | random 10 AlphaNumericWithSpecialCharacters |
 |  8 | Value                       | random 9 Alphabets                          |
 |  9 | Name                        | random 49 Alphabets                         |
 |  9 | Value                       | random 9 Alphabets                          |
 | 10 | Name                        | random 50 Alphabets                         |
 | 10 | Value                       | random 9 Alphabets                          |

And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message






 Scenario: Employee classification(error validation)
 Given Model is selected for the endpoint "/api/v1/Company"
 When Collection in a model is configured with 1 blocks for the property "Classifications" with values to save model portfolio as given below
| BlockNumber | Key                        | Value               |
|           1 | ClassificationName         | random 51 Alphabets |
|           1 | EmployeeClassificationType | random 1 Numerics   |
 When Collection in a model is configured with 1 blocks for the property "EmployeeClassificationCodes" with values to save model portfolio as given below
| BlockNumber | Key  | Value             |
|           1 | Code | random 1 Numerics |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then the API response should contain the 1 following errors
| error_code | error_message                                               |
| CM029      | Classification type  length should not exceed 50 characters |






Scenario: Employee classification(error validation) with double excecution
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 1 blocks for the property "Classifications" with values to save model portfolio as given below
| BlockNumber | Key                        | Value               |
| 1           | ClassificationName         | random 5 Alphabets  |
| 1           | EmployeeClassificationType | random 45 Alphabets |
When Collection in a model is configured with 1 blocks for the property "EmployeeClassificationCodes" with values to save model portfolio as given below
| BlockNumber | Key  | Value             |
|           1 | Code | random 5 Numerics |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message
#When addMasterClassificationType is executed
#And saveCompany is executed



Scenario: Employee classification1
Given Model is selected for the endpoint "/api/v1/Company"
When Configuration has been made as per following
           | key                        | value               |
           | classificationName         | random 51 Alphabets |
           | employeeClassificationType | 2random 1 Numerics  |
           | code                       | random 1 Numerics   |
           | frequencyName              | abc123              |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message