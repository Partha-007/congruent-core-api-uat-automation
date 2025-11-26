Feature: A_ReallocationLimit
[BeforeTestRun]


#Scenario: Transfer reallocationFrequency configure with Monthly
#Scenario: Transfer reallocationCountStartsFrom configure with BeginingofthePLanyear
#TransferAllowed Scenario: Transfer Types permitted configure with percentage
#TransferAllowed Scenario: Transfer Show prospectus notice with each transfer with false
#TransferAllowed Scenario: Transfer Show prospectus delivery notice with first transfer with false
#TransferAllowed Scenario: Scenario: Transfer Number of allowed transfers configured with 99
#TransferAllowed Scenario: Transfer frequency configure with Monthly
#TransferAllowed Scenario: Transfer transfersCountStartsFrom configure with Begining of the year
Scenario:  Transfer reallocationLimit configure with 1
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
       When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "1"  
 And the property "showProspectusWithEachTransfer" is configured as "false"  
 And the property "showProspectusWithFirstTransfer" is configured as "false"  
 And the property "numberOfTransfersAllowed" is configured as "99"  
 And the property "transferFrequency" is configured as "1"  
 And the property "transfersCountStartsFrom" is configured as "1"  

   When the property "reallocationLimit" is configured as "1"
   When the property "3typesPermitted" is configured as "1"  
     And the property "reallocationFrequency" is configured as "1"
     And the property "reAllocationOnCountStartsFrom" is configured as "1"
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

  Scenario:  Transfer isReallocationAllowed validations
   Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
     When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as ""  
 And the property "numberOfTransfersAllowed" is configured as ""  
 And the property "transferFrequency" is configured as ""  
 And the property "transfersCountStartsFrom" is configured as ""  

 And the property "rebalanceAllowed" is configured as "true"  
 And the property "periodicRebalancingRequired" is configured as "true"  
 And the property "2typesPermitted" is configured as "1,2"  
 And the property "rebalancingThreshold" is configured as ""  
 And the property "rebalanceFrequency" is configured as ""  
 And the property "firstRebalancingDate" is configured as ""  

   When the property "isReallocationAllowed" is configured as "true"
   And the property "reallocationLimit" is configured as ""
   And the property "reallocationFrequency" is configured as ""
   And the property "reAllocationOnCountStartsFrom" is configured as ""
When the property "3typesPermitted" is configured as "1"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
 	Then the API response should contain the 10 following errors 
	| error_code | error_message |
	| PL862      | Required      | Scenario:  Transfer reallocationLimit configure with null
	| PL863      | Required      | Scenario: Transfer reallocationFrequency configure with null
	| PL864      | Required      | Scenario: Transfer reallocationCountStartsFrom configure with null
	| PL119      | Required      | #TransferAllowed Scenario: Transfer Types permitted configure with null
	| PL852      | Required      | #TransferAllowed Scenario: Transfer Number of allowed transfers configured with null
	| PL853      | Required      | #TransferAllowed Scenario: Transfer frequency configure with null
	| PL854      | Required      | #TransferAllowed Scenario: Transfer transfersCountStartsFrom configure with null
	| PL855      | Required      | #TransferRebalancing Scenario: Transfer rebalancingThreshold configure with null
	| PL857      | Required      |
	| PL859      | Required      | #TransferRebalancing Scenario: Transfer rebalanceFrequency configure with null           
	

#Scenario: Transfer reallocationFrequency configure with Quarterly
#Scenario: Transfer reallocationCountStartsFrom configure with FirstRelocationDate
#TransferAllowed Scenario: Transfer Types permitted configure with dollar
Scenario: Transfer reallocationLimit configure with 99
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
    When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "2"  

   When the property "reallocationLimit" is configured as "99"
   And the property "3typesPermitted" is configured as "1"  
   And the property "reallocationFrequency" is configured as "2"  
   And the property "reAllocationOnCountStartsFrom" is configured as "2"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message



#TransferAllowed Scenario: Transfer Types permitted configure with units
#TransferRebalancing Scenario: Transfer rebalanceFrequency configure with Monthly
Scenario: Transfer reallocationFrequency configure with SemiAnnually
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
      When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "4"  

 
 And the property "rebalanceAllowed" is configured as "true"  
 And the property "periodicRebalancingRequired" is configured as "true"  
 And the property "2typesPermitted" is configured as "1,2"  
 And the property "rebalanceFrequency" is configured as "1"  


   When the property "reallocationLimit" is configured as "99"
   When the property "3typesPermitted" is configured as "1"  
   When the property "reallocationFrequency" is configured as "3"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

  #TransferAllowed Scenario: Transfer Types permitted configure with all values
  #TransferRebalancing Scenario: Transfer rebalanceFrequency configure with Quarterly

  Scenario: Transfer reallocationFrequency configure with Annually
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
  When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "1,2,4"  

  And the property "rebalanceAllowed" is configured as "true"  
 And the property "periodicRebalancingRequired" is configured as "true"  
 And the property "2typesPermitted" is configured as "1,2"  
 And the property "rebalanceFrequency" is configured as "2"  


   When the property "reallocationLimit" is configured as "99"
   When the property "3typesPermitted" is configured as "1"  
   When the property "reallocationFrequency" is configured as "4"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

  #TransferAllowed
  #TransferAllowed Scenario: Transfer frequency configure with Quarterly
  #TransferAllowed Scenario: Transfer transfersCountStartsFrom configure with TransferEffectiveDate
  #TransferRebalancing Scenario: Transfer rebalanceFrequency configure with Annually


  Scenario: Transfer Number of allowed transfers configured with 1
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
  When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "1"  
 And the property "numberOfTransfersAllowed" is configured as "1"  
 And the property "transferFrequency" is configured as "2"  
 And the property "transfersCountStartsFrom" is configured as "2"  

   And the property "rebalanceAllowed" is configured as "true"  
 And the property "periodicRebalancingRequired" is configured as "true"  
 And the property "2typesPermitted" is configured as "1,2"  
 And the property "rebalanceFrequency" is configured as "4"  

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

  #TransferRebalancing Scenario: Transfer rebalanceFrequency configure with SemiAnnually
Scenario: Transfer frequency configure with SemiAnnually
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
  When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "1"  
 And the property "transferFrequency" is configured as "3"  

   And the property "rebalanceAllowed" is configured as "true"  
 And the property "periodicRebalancingRequired" is configured as "true"  
 And the property "2typesPermitted" is configured as "1,2"  
 And the property "rebalanceFrequency" is configured as "3"  

And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

  
Scenario: Transfer frequency configure with Annually
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
  When the property "isTransferAllowed" is configured as "true"
 And the property "1typesPermitted" is configured as "1"  
 And the property "transferFrequency" is configured as "3"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message


  #TransferRebalancing
  Scenario: Transfer rebalancingThreshold configure with 0
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
When the property "rebalanceAllowed" is configured as "true" 
 And the property "periodicRebalancingRequired" is configured as "true"  
 And the property "2typesPermitted" is configured as "1"  
 And the property "rebalancingThreshold" is configured as "0"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
 Then API should give response as "PL860 : Rebalancing threshold cannot be less than 0.01%"

# TransfersBooleavvalue

   #transfers Scenario: Transfers Save configuration 
Scenario: Transfers Save configuration
  Given Model is selected for the endpoint "/api/Transfer/SaveTransfer"
  When the property "isTransferAllowed" is configured as "false"
 And the property "rebalanceAllowed" is configured as "false"  
 And the property "isReallocationAllowed" is configured as "false"  
  And the property "typesPermitted" is configured as "1,2"  
And API request has been sent to the "IPlanDetailsSave" with the method name "SaveTransferAsync"
  Then API should respond with successful message

