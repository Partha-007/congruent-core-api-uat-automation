Feature: E_EmployeeClassification

A short summary of the feature
 Scenario: Employee classification (successful response)
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 1 blocks for the property "Classifications" with values to save model portfolio as given below
| BlockNumber | Key                                     | Value                                       |
| 1           | ClassificationName                      | random 5 alphabets                          |
| 1           | EmployeeClassificationType              | 1                                           |

 And Collection in a model is configured with 1 blocks for the property "EmployeeClassificationCodes" with values as given below
| BlockNumber | Key  | Value |
| 1           | Code | 2     |

 
#| 1           | EmployeeClassificationCodes             | 2                                           |
#| 2           | ClassificationName                      | random 5 numerics                           |
#| 2           | EmployeeClassificationType              | 2                                           |
#| 2           | EmployeeClassificationCodes             | random 1 numerics                           |
#| 3           | ClassificationName                      | random 5 numerics                           |
#| 3           | EmployeeClassificationType              | 3                                           |
#| 3           | ClassificationTypeRequired              | false                                       |
#| 3           | AllowCreatingClassificationViaCodesFile | false                                       |
#| 3           | EmployeeClassificationCodes             | random 1 numerics                           |
#| 4           | ClassificationName                      | random 5 specialCharacters                  |
#| 4           | EmployeeClassificationType              | random 1 numerics                           |
#| 4           | EmployeeClassificationCodes             | random 1 numerics                           |
#| 5           | ClassificationName                      | random 5 alphaNumericWithSpecialCharacters  |
#| 5           | EmployeeClassificationType              | random 1 numerics                           |
#| 5           | EmployeeClassificationCodes             | random 1 numerics                           |
#| 6           | ClassificationName                      | random 45 alphabets                         |
#| 6           | EmployeeClassificationType              | random 1 numerics                           |
#| 6           | EmployeeClassificationCodes             | random 1 numerics                           |
#| 7           | ClassificationName                      | random 50 alphabets                         |
#| 7           | EmployeeClassificationType              | random 1 numerics                           |
#| 7           | EmployeeClassificationCodes             | random 1 numerics                           |
#| 8           | ClassificationName                      | random 5 alphabets                          |
#| 8           | EmployeeClassificationType              | 1                                           |
#| 8           | EmployeeClassificationCodes             | random 5 alphabets                          |
#| 9           | ClassificationName                      | random 5 alphabets                          |
#| 9           | EmployeeClassificationType              | 1                                           |
#| 9           | EmployeeClassificationCodes             | random 5 numerics                           |
#| 10          | ClassificationName                      | random 5 alphabets                          |
#| 10          | EmployeeClassificationType              | 1                                           |
#| 10          | EmployeeClassificationCodes             | random 5 specialCharacters                  |
#| 11          | ClassificationName                      | random 5 alphabets                          |
#| 11          | EmployeeClassificationType              | 1                                           |
#| 11          | EmployeeClassificationCodes             | random 5 alphaNumericWithSpecialCharacters  |
#| 12          | ClassificationName                      | random 5 alphabets                          |
#| 12          | EmployeeClassificationType              | 1                                           |
#| 12          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 13          | ClassificationName                      | random 5 alphabets                          |
#| 13          | EmployeeClassificationType              | 1                                           |
#| 13          | EmployeeClassificationCodes             | random 250 numerics                         |
#| 14          | ClassificationName                      | random 5 alphabets                          |
#| 14          | EmployeeClassificationType              | 1                                           |
#| 14          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 14          | Name                                    | random 10 alphabets                         |
#| 14          | Value                                   | random 9 alphabets                          |
#| 15          | ClassificationName                      | random 5 alphabets                          |
#| 15          | EmployeeClassificationType              | 1                                           |
#| 15          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 15          | Name                                    | random 10 alphabets                         |
#| 15          | Value                                   | random 10 alphabets                         |
#| 16          | ClassificationName                      | random 5 alphabets                          |
#| 16          | EmployeeClassificationType              | 1                                           |
#| 16          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 16          | Name                                    | random 10 alphabets                         |
#| 16          | Value                                   | random 10 numerics                          |
#| 17          | ClassificationName                      | random 5 alphabets                          |
#| 17          | EmployeeClassificationType              | 1                                           |
#| 17          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 17          | Name                                    | random 10 alphabets                         |
#| 17          | Value                                   | random 10 specialCharacters                 |
#| 18          | ClassificationName                      | random 5 alphabets                          |
#| 18          | EmployeeClassificationType              | 1                                           |
#| 18          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 18          | Name                                    | random 10 alphabets                         |
#| 18          | Value                                   | random 10 alphaNumericWithSpecialCharacters |
#| 19          | ClassificationName                      | random 5 alphabets                          |
#| 19          | EmployeeClassificationType              | 1                                           |
#| 19          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 19          | Name                                    | random 10 numerics                          |
#| 19          | Value                                   | random 9 alphabets                          |
#| 20          | ClassificationName                      | random 5 alphabets                          |
#| 20          | EmployeeClassificationType              | 1                                           |
#| 20          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 20          | Name                                    | random 10 specialCharacters                 |
#| 20          | Value                                   | random 9 alphabets                          |
#| 21          | ClassificationName                      | random 5 alphabets                          |
#| 21          | EmployeeClassificationType              | 1                                           |
#| 21          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 21          | Name                                    | random 10 alphaNumericWithSpecialCharacters |
#| 21          | Value                                   | random 9 alphabets                          |
#| 22          | ClassificationName                      | random 5 alphabets                          |
#| 22          | EmployeeClassificationType              | 1                                           |
#| 22          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 22          | Name                                    | random 49 alphabets                         |
#| 22          | Value                                   | random 9 alphabets                          |
#| 23          | ClassificationName                      | random 5 alphabets                          |
#| 23          | EmployeeClassificationType              | 1                                           |
#| 23          | EmployeeClassificationCodes             | random 100 numerics                         |
#| 23          | Name                                    | random 50 alphabets                         |
#| 23          | Value                                   | random 9 alphabets                          |
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message



 Scenario: Employee classification(error validation)
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 4 blocks for the property "Classifications" with values to save model portfolio as given below
| BlockNumber | Key                         | Value               |
| 1           | ClassificationName          | random 51 alphabets |
| 1           | EmployeeClassificationType  | random 1 numerics   |
| 1           | EmployeeClassificationCodes | random 1 numerics   |
| 2           | ClassificationName          | random 0 alphabets  |
| 2           | EmployeeClassificationCodes | random 1 numerics   |
| 3           | ClassificationName          | random 5 alphabets  |
| 3           | EmployeeClassificationType  | 1                   |
| 3           | EmployeeClassificationCodes | random 251 numerics |
| 4           | EmployeeClassificationType  | 1                   |
| 4           | EmployeeClassificationCodes | array               |

And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then the API response should contain the 4 following errors
| error_code | error_message                                                                                             |
| CM029      | Classification type  length should not exceed 50 characters"                                              |
| CM091      | Required                                                                                                  |
| CM060      | Classification code length should not exceed 250 characters                                               |
| CM074      | At least one Employee Classification should be available to save the Employee Classification Type details |





 Scenario: Employee classification(error validation) with double excecution
  Given Model is selected for the endpoint "/api/v1/Company"
  When Collection in a model is configured with 1 blocks for the property "Classifications" with values to save model portfolio as given below
| BlockNumber | Key                        | Value               |
| 1           | ClassificationName         | random 5 alphabets |
| 1           | EmployeeClassificationType | random 45 alphabets   |
| 1           | Code                       | random 5 numerics   |
#When addMasterClassificationType is executed

#And saveCompany is executed
And API request has been sent to the "ICompanyDetails" with the method name "CreateNewCompanyAsync"
Then API should respond with successful message