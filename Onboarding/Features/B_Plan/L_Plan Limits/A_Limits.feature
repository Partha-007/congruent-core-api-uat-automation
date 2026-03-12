Feature: A_Limits
[BeforeTestRun]
Scenario:To validate Combined Limit Name field is null
Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                  | value              |
         | name                 | random 0 alphabets |
         | sourceLimitsMappings |                  0 |
         | contributionType     |                    |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 3 following errors 
	| error_code | error_message                    |
	| PL940      | Required                         |
	| PL941      | Atleast two sources are required | Scenario: To validate Combined sources field as null
	| PL930      | Required                         | Scenario: To validate contribution type as null


    
Scenario: To validate contribution type as percentage when limitMinimumPercentage is null
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets | Scenario: To validate Combined Limit Name field is length below 100 characters
         | sourceLimitsMappings   |                   1 |
         | contributionType       |                   1 |
         | limitMinimumPercentage |                     |
         | limitMaximumPercentage |                     |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                    |
	| PL935      | Required                         |
	| PL931      | Required                         |Scenario: To validate contribution type as percentage when limitMaximumPercentage is null


Scenario: To validate contribution type as Dollar when limitMaximum is null
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                  | value                                       |
         | name                 | random 10 AlphaNumericWithSpecialCharacters | Scenario: To validate Combined Limit Name field is accept alpanumeric with special characters
         | sourceLimitsMappings |                                           1 |
         | contributionType     |                                           2 |
         | limitMinimum         |                                             |
         | limitMaximum         |                                             |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                    |
	| PL936      | Required                         |
	| PL932      | Required                         |Scenario: To validate contribution type as Dollar when limitMaximum is null


Scenario: To validate contribution type as both when limitMinimumPercentage is null
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | sourceLimitsMappings   |                   1 |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                     |
         | limitMaximumPercentage |                     |
         | limitMinimum           |                     |
         | limitMaximum           |                     |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                    |
	| PL935      | Required                         |
	| PL931      | Required                         |Scenario: To validate contribution type as both when limitMaximumPercentage is null
	| PL936      | Required                         |Scenario: To validate contribution type as both when limitMinimum is null
	| PL932      | Required                         |Scenario: To validate contribution type as both when limitMaximum is null



Scenario: To validate contribution type as percentage when limitMinimumPercentage is 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 100 alphabets |Scenario:  To validate Combined Limit Name field is length equal as 100 characters
         | sourceLimitsMappings   |                   1 |
         | contributionType       |                   1 |
         | limitMinimumPercentage |                 100 |
         | limitMaximumPercentage |                 100 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                         |
	| PL939      | Maximum limit amount should not be equal or lesser than minimum limit |


Scenario: To validate contribution type as percentage when limitMaximumPercentage is 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value              |
         | name                   | random 10 numerics | Scenario: To validate Combined Limit Name field is accept numerics
         | sourceLimitsMappings   |                  1 |
         | contributionType       |                  1 |
         | limitMaximumPercentage |                100 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message

#Scenario: To validate contribution type as Dollar when limitMinimum is less than 11 digits with 2 decimal points
#Scenario: To validate contribution type as Dollar when limitMaximum is less than 11 digits with 2 decimal points
Scenario: To validate contribution type as Dollar when limitMinimum is 11 digits with 2 decimal points
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                  | value                |
         | name                 | random 101 alphabets | Scenario:To validate Combined Limit Name field is length above 100 characters
         | sourceLimitsMappings |                    1 |
         | contributionType     |                    2 |
         | limitMinimum         |       82828288288.88 | Scenario: To validate contribution type as Dollar when limitMaximum is 11 digits with 2 decimal points
         | limitMaximum         |       92828288288.88 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message


Scenario: To validate contribution type as both when limitMinimumPercentage is 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                 100 |
         | limitMaximumPercentage |                 100 |
         | limitMinimum           |                1000 |
         | limitMaximum           |                1000 |Scenario: To validate contribution type as both when limitMinimumPercentage is greater than limitMaximumPercentage
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                         |
	| PL939      | Maximum limit amount should not be equal or lesser than minimum limit |



Scenario: To validate contribution type as both when limitMaximumPercentage is 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value                       |
         | name                   | random 10 SpecialCharacters | Scenario: To validate Combined Limit Name field is accept special characters
         | contributionType       |                           3 |
         | limitMinimumPercentage |                          49 | Scenario: To validate contribution type as both when limitMinimumPercentage is less than 100
         | limitMaximumPercentage |                         100 |
         | limitMinimum           |                        1000 |
         | limitMaximum           |                        1000 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                         |
	| PL1130     | Maximum limit amount should not be equal or lesser than minimum limit |

Scenario: To validate contribution type as both when limitMinimum is 11 digits with 2 decimal points
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                  24 |
         | limitMaximumPercentage |                  49 |Scenario: To validate contribution type as both when limitMaximumPercentage is less than 100
         | limitMinimum           |      71717177171.99 |
         | limitMaximum           |      81717177171.99 |Scenario: To validate contribution type as both when limitMaximum is 11 digits with 2 decimal points
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message

Scenario: To validate contribution type as percentage when limitMinimumPercentage is less than 100  
Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   1 |
         | limitMinimumPercentage |                  99 |
         | limitMaximumPercentage |                 100 |

 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message


Scenario: To validate contribution type as percentage when limitMaximumPercentage is less than 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   1 |
         | limitMaximumPercentage |                  99 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message


Scenario: To validate contribution type as both when limitMinimum is less than 11 digits with 2 decimal points
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | limitMinimumPercentage |                  24 |
         | limitMaximumPercentage |                  49 |
         | limitMinimum           |       7171717717.99 |
         | limitMaximum           |      81717177171.99 |Scenario: To validate contribution type as both when limitMaximum is less than 11 digits with 2 decimal points
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message

Scenario: To validate contribution type as percentage when limitMinimumPercentage is greater than 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   1 |
         | limitMinimumPercentage |                 101 |
         | limitMaximumPercentage |                 100 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                  |
	| PL937      | Minimum limit should not exceed 100 percentage |

Scenario: To validate contribution type as percentage when limitMaximumPercentage is greater than 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   1 |
         | limitMaximumPercentage |                 101 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                  |
	| PL933      | Maximum limit should not exceed 100 percentage |

Scenario: To validate contribution type as Dollar when limitMinimum is greater than 11 digits with 2 decimal points
Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key              | value               |
         | name             | random 10 alphabets |
         | contributionType |                   2 |
         | limitMinimum     |     828282882899.88 |
         | limitMaximum     |      92828288288.88 |

 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                    |
	| PL938      | Minimum limit amount should not exceed format of 100000000000.00 |

Scenario: To validate contribution type as Dollar when limitMaximum is greater than 11 digits with 2 decimal points
Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key              | value               |
         | name             | random 10 alphabets |
         | contributionType |                   2 |
         | limitMaximum     |     828282882833.88 |

 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                    |
	| PL934      | Maximum limit amount should not exceed format of 100000000000.00 |

Scenario: To validate contribution type as both when limitMinimumPercentage is greater than 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                 101 |
         | limitMaximumPercentage |                 100 |
         | limitMinimum           |                1000 |
         | limitMaximum           |                1000 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                  |
	| PL937      | Minimum limit should not exceed 100 percentage |

Scenario: To validate contribution type as both when limitMaximumPercentage is greater than 100
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                  49 |
         | limitMaximumPercentage |                 101 |
         | limitMinimum           |                1000 |
         | limitMaximum           |                1000 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                  |
	| PL933      | Maximum limit should not exceed 100 percentage |

Scenario: To validate contribution type as both when limitMinimum is greater than 11 digits with 2 decimal points
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                  24 |
         | limitMaximumPercentage |                  49 |
         | limitMinimum           |     717171771788.99 |
         | limitMaximum           |      81717177171.99 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                  |
	| PL938      | Minimum limit amount should not exceed format of 100000000000.00 |

Scenario: To validate contribution type as both when limitMaximum is greater than 11 digits with 2 decimal points
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   3 |
         | limitMinimumPercentage |                  49 |
         | limitMaximumPercentage |                  57 |
         | limitMinimum           |                1000 |
         | limitMaximum           |     817179917717.99 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                    |
	| PL934      | Maximum limit amount should not exceed format of 100000000000.00 |


Scenario: To validate contribution type as percentage when limitMinimumPercentage is greater than limitMaximumPercentage
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value               |
         | name                   | random 10 alphabets |
         | contributionType       |                   1 |
         | limitMinimumPercentage |                  79 |
         | limitMaximumPercentage |                  44 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                         |
	| PL939      | Maximum limit amount should not be equal or lesser than minimum limit |

    
Scenario: To validate contribution type as Dollar when limitMinimum is greater than limitMaximum
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key              | value               |
         | name             | random 10 alphabets |
         | contributionType |                   2 |
         | limitMinimum     |       9982828899.88 |
         | limitMaximum     |       9282828828.88 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
 Then the API response should contain the 1 following errors 
	| error_code | error_message                                                         |
	| PL939      | Maximum limit amount should not be equal or lesser than minimum limit |


Scenario: To validate contribution type as both when limitMinimum is greater than limitMaximum
   Given Model is selected for the endpoint "/api/v1/Plan/SaveSourceLimits"
When Configuration has been made as per following
         | key                    | value                   |
         | name                   | random 10 AlphaNumerics | Scenario: To validate Combined Limit Name field is accept alphanumerics
         | contributionType       |                       3 |
         | limitMinimumPercentage |                      24 |
         | limitMaximumPercentage |                      49 |
         | limitMinimum           |          91717177178.99 |
         | limitMaximum           |          81717177171.99 |
 And API request has been sent to the "IPlanDetailsSave" with the method name "SaveSourceLimitsAsync"
Then API should respond with successful message
