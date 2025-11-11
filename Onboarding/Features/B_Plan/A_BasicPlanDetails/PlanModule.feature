Feature: PlanModule

As an admin I need to create and validate a plan


Scenario: Login CORE and create a new plan and verify save
	
	When New plan basic details filled and saved
	And Configuration has been done as mentioned below
	   | Object    | Value |
	   | CompanyId | 593   |
	Then Verify New Plan is saved
