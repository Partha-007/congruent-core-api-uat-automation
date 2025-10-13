using System;
using ClassLibrary.Shared.TestDataGenerator;
using MyNamespace;
using RefitSandBox;
using Reqnroll;

namespace SharedStepDefinitions
{
    [Binding]
    public class SampleStepDefinitions
    {
        public Program _program;
        public SampleStepDefinitions(Program program)
        {
            _program = program;
        }

        [Given("Model is selected for the endpoint {string}")]
        public async Task GivenModelIsSelectedForTheEndpoint(string endpoint)
        {
            await _program.EndpointToViewModel(endpoint);
        }

        [When("API request has been sent to the {string} with the method name {string}")]
        public async Task WhenAPIRequestHasBeenSentToTheWithTheMethodName(string interfaceName, string methodName)
        {
            await _program.APIRequestForRefit(interfaceName, methodName);
        }

        [When("Save Loan details in Plan")]
        public async Task GivenSaveLoanDetailsInPlan()
        {
            await _program.SaveLoan();
        }

        [When("the property {string} is configured with {string} with {int} characters")]
        public void WhenThePropertyIsConfiguredWithWithCharacters(string ControlName, Pattern patternType, int length)
        {
            _program.ConfigureWithTestDate(ControlName, length, patternType);
        }


        [Given("Vesting model is selected")]
        public void GivenVestingModelIsSelected()
        {
            throw new PendingStepException();
        }

        [When("the property {string} is configured as {string}")]
        public async Task WhenThePropertyIsConfiguredAs(string controlName, string Value)
        {
            await _program.Configuration(controlName, Value);
        }

        [Then("API should give response as {string}")]
        public void ThenAPIShouldGiveResponseAs(string expectedValue)
        {
            _program.AssertResponse(expectedValue);
        }


        [Then("the API response should contain the following errors")]
        public async Task ThenTheAPIResponseShouldContainTheFollowingErrors(DataTable dataTable, string expectedErrorMessage)
        {
            foreach (var row in dataTable.Rows) 
            {
                string expectedCode = row["error_code"]?.Trim();
                string expectedMsg = row["error_message"]?.Trim();

                if (expectedCode != null)
                {
                    {
                        await _program.VerifyErrorMessage(expectedErrorMessage);
                        _program.AssertResponse(expectedErrorMessage);
                    }

                }
            }
        }

        [Then("the API response should contain the {int} following errors")]
        public async Task ThenTheAPIResponseShouldContainTheFollowingErrors(int noOfErrors, DataTable dataTable)
        {
              await _program.VerifyMultipleErrors(noOfErrors, dataTable);
        }



        [When("Configuration has been made as per following")]
        public async Task WhenConfigurationHasBeenMadeAsPerFollowing(DataTable dataTable)
        {
            foreach (var row in dataTable.Rows)
            {

                var ObjectName = row[0];
                var Value = row[1];
                await _program.Configuration(ObjectName, Value);
            }
        }

        [Then("API should respond with successful message")]
        public void ThenAPIShouldRespondWithSuccessfulMessage()
        {
            _program.VerifyResponse();
        }

        [Then("Vesting API should respond as follows")]
        public void ThenVestingAPIShouldRespondAsFollows(DataTable dataTable)
        {
            throw new PendingStepException();
        }

        [Given("Payroll file {string} is selected")]
        public void GivenPayrollFileIsSelected(string p0)
        {
            throw new PendingStepException();
        }

        [Given("Edit payroll file as mentioned below")]
        public void GivenEditPayrollFileAsMentionedBelow(DataTable dataTable)
        {
            throw new PendingStepException();
        }

        [Given("Trade file {string} is selected")]
        public void GivenTradeFileIsSelected(string tradeOrder)
        {
            throw new PendingStepException();
        }

        [Given("Edit Trade file as mentioned below")]
        public void GivenEditTradeFileAsMentionedBelow(DataTable dataTable)
        {
            throw new PendingStepException();
        }

        [Given("Eligibility report has been generated for the plan {string}")]
        public void GivenEligibilityReportHasBeenGeneratedForThePlan(string p0)
        {
            throw new PendingStepException();
        }

        [Then("Report should be displayed as mentioned below")]
        public void ThenReportShouldBeDisplayedAsMentionedBelow(DataTable dataTable)
        {
            throw new PendingStepException();
        }

        [Given("Payroll file {string} is selected and Edit payroll file as mentioned below")]
        public async Task GivenPayrollFileIsSelectedAndEditPayrollFileAsMentionedBelow(string filename, DataTable dataTable)
        {
            await Program.FileConfiguration(filename, dataTable);
        }


        [When("File upload is executed for the file {string} and funding is done by {string}")]
        public async Task WhenFileUploadIsExecutedForTheFileAndFundingIsDoneBy(string filename, string fundingType)
        {
            await _program.SendAPIRequestForFileUpload(filename, fundingType);
        }

        [When("Generate consolidation API is triggered for {string} and Trade order number extracted from trade response file")]
        public async Task WhenGenerateConsolidationAPIIsTriggeredForAndTradeOrderNumberExtractedFromTradeResponseFile(string fileName)
        {
            await _program.SFTPConnect();
        }



        [When("Loan request has been approved and trade for loan is executed for {string}")]
        public async Task WhenLoanRequestHasBeenApprovedAndTradeForLoanIsExecutedFor(string requestType)
        {
            await _program.LoanApprove(requestType);
        }


        [Then("Employee Loan request API should respond with error message as {string}")]
        public async Task ThenEmployeeLoanRequestAPIShouldRespondWithErrorMessageAs(string expectedErrorMessage)
        {
            await _program.VerifyErrorMessage(expectedErrorMessage);
        }

        [Then("Employee plan loans should respond with loan count as {int} with loan type as {int} and Loan description should be {string}")]
        public async Task ThenEmployeePlanLoansShouldRespondWithLoanCountAsWithLoanTypeAsAndLoanDescriptionShouldBe(int loanCount, int loanType, string loanName)
        {
            await _program.VerifyMasterLoanTypesForEmployee(loanCount, loanType, loanName);
        }

        [Then("Available balance for the employee to avail loan should be {float}")]
        public async Task ThenAvailableBalanceForTheEmployeeToAvailLoanShouldBe(double expectedAmount)
        {
            await _program.VerifyAvailableBalance(expectedAmount);
        }

        [When("Loan repayment file {string} is selected and edit loan repayment date and loan repayment amount as mentioned below")]
        public async Task WhenLoanRepaymentFileIsSelectedAndEditLoanRepaymentDateAndLoanRepaymentAmountAsMentionedBelow(string filename, DataTable dataTable)
        {
            await _program.WriteMultipleLinesForLoanRepayment(filename, dataTable);
        }

        [Then("Available balance for the employee to avail loan when no loan has been taken already should be {float}")]
        public async Task ThenAvailableBalanceForTheEmployeeToAvailLoanWhenNoLoanHasBeenTakenAlreadyShouldBe(double expectedAmount)
        {
            await _program.VerifyAvailableBalanceForNewLoan(expectedAmount);
        }

        [When("The date property {string} is configured as {string} and should add {string} days to the current date")]
        public async Task WhenTheDatePropertyIsConfiguredAsAndShouldAddDaysToTheCurrentDate(string ControlName, string pattern, string incrementValue)
        {
            await _program.AssignValueToDateProperty(ControlName, pattern, incrementValue);
        }

        [Then("Employee loan amortization schedule should contain {int} installments and should look like this")]
        public async Task ThenEmployeeLoanAmortizationScheduleShouldContainInstallmentsAndShouldLookLikeThis(int NoOfInstallments, DataTable dataTable)
        {
            await _program.VerifyAmortizationScheduleForLoan(NoOfInstallments, dataTable);
        }

        [Then("Loan status should be updated as {string}")]
        public async Task ThenLoanStatusShouldBeUpdatedAs(string loanStatus)
        {
            await _program.VerifyLoanStatus(loanStatus);
        }

        [When("Employee has been edited as mentioned below")]
        public async Task WhenEmployeeHasBeenEditedAsMentionedBelow(DataTable dataTable)
        {
            await _program.UpdateEmployeeInformation(dataTable);
        }

        [When("Model portfolio investment configured with {int} investments with ids as {int} and {int} for the property {string}")]
        public async Task WhenModelPortfolioInvestmentConfiguredWithInvestmentsWithIdsAsAndForTheProperty(int noOfInvestments, int investmentId1, int investmentId2, string propertyName)
        {
            await _program.AddValuesToCollection(noOfInvestments, investmentId1, investmentId2, propertyName);
        }

        [When("Model portfolio investment configured with {int} investments with ids as {int} and {int} and {int} for the property {string}")]
        public async Task WhenModelPortfolioInvestmentConfiguredWithInvestmentsWithIdsAsAndForTheProperty1(int noOfInvestments, int investmentId1, int investmentId2, int investmentId3, string propertyName)
        {
            await _program.AddValuesToCollection1(noOfInvestments, investmentId1, investmentId2, investmentId3, propertyName);
        }

        [When("Model portfolio investment configured with the following investments for the property {string}")]
        public async Task WhenModelPortfolioInvestmentConfiguredWithInvestmentsWithIdsAndForTheProperty(string propertyName, Reqnroll.DataTable dataTable)
        {
            await _program.AddValuesToCollectionFromTable(propertyName, dataTable);
        }

        [When("Collection in a model is configured with {int} blocks for the property {string} with values as given below")]
        public async Task WhenCollectionInAModelIsConfiguredWithBlocksForThePropertyWithValuesAsGivenBelow(int noOfBlocks, string propertyName, DataTable dataTable)
        {
            await _program.EditCollection(noOfBlocks, propertyName, dataTable);

        }

        [When("Collection in a model is configured with {int} blocks for the property {string} with values to save model portfolio as given below")]
        public async Task WhenCollectionInAModelIsConfiguredWithBlocksForThePropertyWithValuesToSaveModelPortFolioAsGivenBelow(int noOfBlocks, string propertyName, DataTable dataTable)
        {
            await _program.EditCollection(noOfBlocks, propertyName, dataTable);
            if (noOfBlocks == 2)
            {
                await _program.SaveEnrollmentForModelPortfolio();
            }
            else
            {
                await _program.SaveEnrollmentForModelPortfolioWithDiffernentInvestionElectionToAllSources();
            }

        }

        [When("Model portfolio investment added to plan and enrollment configured with {int} blocks for the property {string} with values as given below")]
        public async Task WhenModelPortfolioInvestmentAddedToPlanAndEnrollmentConfiguredWithBlocksForThePropertyWithValuesAsGivenBelow(int noOfBlocks, string propertyName, DataTable dataTable)
        {
            await _program.ModelPortInvestmentAddAndEnrollment(noOfBlocks, propertyName, dataTable);
        }

        [Then("Employee account balance for the source {string} should be splitted as mentioned below")]
        public async Task ThenEmployeeAccountBalanceForTheSourceShouldBeSplittedAsMentionedBelow(string sourceName, DataTable dataTable)
        {
            await _program.VerifyAccountBalanceForAnEmployeeSourceWise(sourceName, dataTable);
        }



    }
}
