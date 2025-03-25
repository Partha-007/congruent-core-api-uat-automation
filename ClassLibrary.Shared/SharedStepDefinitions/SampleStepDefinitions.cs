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
            _program.EndpointToViewModel(endpoint);
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

        [When("File upload is executed for the file {string}")]
        public async Task WhenFileUploadIsExecutedForTheFile(string filename)
        {
            await _program.SendAPIRequestForFileUpload(filename);
        }

        [When("Generate consolidation API is triggered for {string} and Trade order number extracted from trade response file")]
        public async Task WhenGenerateConsolidationAPIIsTriggeredForAndTradeOrderNumberExtractedFromTradeResponseFile(string fileName)
        {
            await _program.SFTPConnect();
        }

        [When("Loan request has been approved and trade for loan is executed")]
        public async Task WhenLoanRequestHasBeenApprovedAndTradeForLoanIsExecuted()
        {
            await _program.LoanApprove();
        }

        [Then("Employee Loan request API should respond with error message as {string}")]
        public async Task ThenEmployeeLoanRequestAPIShouldRespondWithErrorMessageAs(string expectedErrorMessage)
        {
            await _program.VerifyErrorMessage(expectedErrorMessage);
        }


    }
}
