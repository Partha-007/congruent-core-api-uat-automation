using ClassLibrary.Shared;
using ClassLibrary.Shared.TestDataGenerator;
using CucumberExpressions.Ast;
using MyNamespace;
using Newtonsoft.Json.Linq;
using RefitSandBox;
using Reqnroll;
using System;
using System.Reflection.Emit;
using System.Text.RegularExpressions;
using Xunit;
using static ClassLibrary.Shared.TransactionsConfigurations;

namespace SharedStepDefinitions
{
    [Binding]
    public class SampleStepDefinitions
    {
        public Program _program;
        public AccountBalanceVerifier _accountBalanceVerifier;
        private readonly ScenarioContext _scenarioContext;
        private FeeSpecificationDetails _feeSpecification;
        private CalculationDetails _calculationDetails;
        private Schedule _schedule;
        private FeeApplicableTo? _feeApplicableTo;
        private FeeSchedule? _feeSchedule;
        private TransactionsConfigurations _transactionsConfigurations;

        public SampleStepDefinitions(Program program, AccountBalanceVerifier accountBalanceVerifier, ScenarioContext scenarioContext, TransactionsConfigurations transactionsConfigurations)
        {
            _program = program;
            _accountBalanceVerifier = accountBalanceVerifier;
            _scenarioContext = scenarioContext;
            _transactionsConfigurations = transactionsConfigurations;
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

        [When("Trade procedures completed for the transaction {string}")]
        public async Task WhenTradeProceduresCompletedForTheTransaction(string transfer)
        {
            await _program.TransferTransaction();
        }


        [Then("The source {string} should match the following balances")]
        public async Task ThenTheSourceShouldMatchTheFollowingBalances(string sourceName, DataTable dataTable)
        {
            await _accountBalanceVerifier.VerifySourceWiseBalance(sourceName, dataTable);
        }


        [When("Save Loan details in Plan")]
        public async Task GivenSaveLoanDetailsInPlan()
        {
            await _program.SaveLoan();
        }

        [When("Generate Outbound File")]
        public async Task GenerateOutboundFile()
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
            _program.Configuration(controlName, Value);
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
                //var modelType = modelAfterConvention.GetType();
                //var property = modelType.GetProperty(propertyName);
                //object targetObject = modelAfterConvention;
                var ObjectName = row[0];
                var Value = row[1];
                if (Value.Contains("<"))
                {
                    Value = await _program.IdentifyValue(Value);
                }
                if (Value.Contains("random"))
                {
                    var splitted = Value.Split(" ");

                    Pattern patternValue = (Pattern)Enum.Parse(typeof(Pattern), splitted[2], ignoreCase: true);
                    Value = Regex.Replace(Regex.Replace(GenerateTestData.RandomString(Convert.ToInt32(splitted[1]), patternValue), @"[^\w\s]", " "), @"\s+", " ").Trim();
                }
                if (Value.Contains(","))
                {
                    var parts = Value.Split(',', StringSplitOptions.RemoveEmptyEntries);
                    var newArray = new JArray();

                    foreach (var part in parts)
                    {
                        var trimmed = part.Trim();

                        // Try to parse into number (int/float), fallback to string
                        if (int.TryParse(trimmed, out int intVal))
                        {
                            newArray.Add(intVal);
                        }
                        else if (double.TryParse(trimmed, out double doubleVal))
                        {
                            newArray.Add(doubleVal);
                        }
                        else
                        {
                            newArray.Add(trimmed);
                        }
                    }
                }
                if(string.IsNullOrEmpty(Value))
                    Value = null;
                //if (property.PropertyType == typeof(DateTimeOffset?))
                //{
                //    var convertedValue = DateTimeOffset.Parse(Value.ToString()); // Parsing the string to DateTimeOffset
                //    if (propertyName == "effectiveStartDate" || propertyName == "effectiveEndDate")
                //    {
                //        string formattedValue = convertedValue.ToString("M/d/yyyy, hh:mm:ss tt");
                //        property.SetValue(targetObject, convertedValue);
                //    }
                //    else
                //    {
                //        property.SetValue(targetObject, convertedValue);
                //    }
                //}
                _program.Configuration(ObjectName, Value);
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

        [When("File upload is executed for the file {string} to the test endpoint")]
        public async Task WhenFileUploadIsExecutedForTheFileToTheTestEndpoint(string filename)
        {
            await _program.SendAPIRequestForFileUploadToTestEndpoint(filename);
        }

        [When("File upload is executed for the file {string}")]
        public async Task WhenFileUploadIsExecutedForTheFileAndFundingIsDoneBy(string filename)
        {
            await _program.SendAPIRequestForFileUploadTest(filename);
        }

        [When("Adjustment is created for the employee with Adjustment type as {string} and Incident code as {string}")]
        public async Task WhenAdjustmentIsCreatedForTheEmployeeWithAdjustmentTypeAsAndIncidentCodeAs(string AdjustmentType, string IncidentCode)
        {
            await _program.AdjustmentConfigurations(AdjustmentType, IncidentCode);
        }

        [When("Create a rollover request with the following details")]
        public async Task WhenCreateARolloverRequestWithTheFollowingDetails(DataTable dataTable)
        {
            if (dataTable.RowCount != 1)
                throw new ArgumentException("Rollover request table must contain exactly one row.");

            var row = dataTable.Rows[0];

            var employeeIdStr = row["EmployeeId"];
            var planIdStr = row["PlanId"];
            var sourceIdStr = row["SourceId"];

            var config = new RolloverInTestConfig
            {
                EmployeeId = int.Parse(await _program.IdentifyValue(employeeIdStr)),
                PlanId = int.Parse(await _program.IdentifyValue(planIdStr)),
                SourceId = int.Parse(await _program.IdentifyValue(sourceIdStr)),
                RolloverAmount = double.Parse(row["RolloverAmount"]),
                ContributionAmount = double.Parse(row["ContributionAmount"]),
                EarningsAmount = double.Parse(row["EarningsAmount"])
            };

            _scenarioContext.Set(config);
        }

        [When("the rollover has the following investments")]
        public async Task WhenTheRolloverHasTheFollowingInvestments(DataTable dataTable)
        {
            var investments = dataTable.CreateSet<InvestmentConfig>().ToList();

            foreach (var inv in investments)
            {
                if (!string.IsNullOrEmpty(inv.InvestmentPlanMappingId.ToString()) && inv.InvestmentPlanMappingId.ToString().StartsWith("<"))
                    inv.InvestmentPlanMappingId = int.Parse(await _program.IdentifyValue(inv.InvestmentPlanMappingId.ToString()));   
            }

            var config = _scenarioContext.Get<RolloverInTestConfig>();
            config.Investments = investments;

            _scenarioContext.Set(config);
        }

        [When("Submit the {string} request")]
        public async Task WhenSubmitTheRequest(string transactionType)
        {
            if(transactionType == "Rollover")
            {
                var config = _scenarioContext.Get<RolloverInTestConfig>();
                await _program.RolloverInConfiguration(config);
            }
            else if(transactionType == "Fee")
            {
                await _transactionsConfigurations.SaveFullFee(null, null, null, true);
            }
        }

        [When("Create a basic details fee for {string}")]
        public async Task WhenCreateABasicDetailsFeeFor(string FeeFor)
        {
            await _program.FeeConfiguration(FeeFor);
        }

        [When("Create specification for the fee as mentioned below")]
        public async Task WhenCreateSpecificationForTheFeeAsMentionedBelow(DataTable dataTable)
        {
            _feeSpecification = MapFromTable(dataTable);
        }

        [When("Create calculation for the fee as mentioned below")]
        public async Task WhenCreateCalculationForTheFeeAsMentionedBelow(DataTable dataTable)
        {
            _calculationDetails = await MapFromTable(dataTable, _feeSpecification);
            await _transactionsConfigurations.SaveFullFee(_calculationDetails, null, null, false);
        }

        [When("Create applicable to for the fee as mentioned below")]
        public async Task WhenCreateApplicableToForTheFeeAsMentionedBelow(DataTable dataTable)
        {
            _feeApplicableTo = MapFromTableFeeApplicable(dataTable);
            await _transactionsConfigurations.SaveFullFee(null, _feeApplicableTo, null, false);
        }

        [When("Configure schedule for the fee schedule as mentioned below")]
        public async Task WhenConfigureScheduleForTheFeeScheduleAsMentionedBelow(DataTable dataTable)
        {
            _schedule = MapFromTableSchedule(dataTable);
        }

        [When("Create schedule for the fee as mentioned below")]
        public async Task WhenCreateScheduleForTheFeeAsMentionedBelow(DataTable dataTable)
        {
             _feeSchedule = MapFromTableFeeSchedule(dataTable, _schedule);
            await _transactionsConfigurations.SaveFullFee(null, null, _feeSchedule, false);
        }



        [Then("API should respond Match Calculated values as")]
        public void ThenAPIShouldRespondWithMatchValue(Table table)
        {
            _program.VerifyMatchvalue(table);
        }

        [Then("Payroll API should respond for {string} with Error report message as {string} and ECR page message as {string}")]
        public async Task ThenPayrollAPIShouldRespondForWithErrorReportMessageAsAndECRPageMessageAs_(string controlName, string expectedErrorReportMessage, string expectedECRMessage)
        {
            await _program.ValidateResponseFromTestEndpoint(controlName, expectedErrorReportMessage, expectedECRMessage);
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

        [When("The transaction request for the transaction {string} is {string}")]
        public async Task WhenTheTransactionRequestForTheTransactionIs(string transactionType, string approveOrReject)
        {
            await _program.ApproveOrRejectTransactionRequestAsAdmin(transactionType, approveOrReject);
        }



        [When("Loan submission is done for the mentioned applicable sources {string}")]
        public async Task WhenLoanSubmissionIsDoneForTheMentionedApplicableSources(string sourceNames)
        {
            var sourceNamesList = new List<string>();
            if (sourceNames.Contains(","))
            {
                var splitted = sourceNames.Split(',', StringSplitOptions.RemoveEmptyEntries);
                foreach (var source in splitted)
                {
                    sourceNamesList.Add(source.Trim());
                }
            }
            else
            {
                sourceNamesList.Add(sourceNames.Trim());
            }
            await _program.SubmitLoanRequest(sourceNamesList);

        }

        [When("Disbursement is done for the transaction {string}")]
        public async Task WhenDisbursementIsDoneForTheTransaction(string transactionType)
        {
            if(transactionType == "Loan")
                await _program.ProcessLoanDisbursement();
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
            /*if (noOfBlocks == 2)
            {
                await _program.SaveEnrollmentForModelPortfolio();
            }
            else
            {
                await _program.SaveEnrollmentForModelPortfolioWithDiffernentInvestionElectionToAllSources();
            }*/

        }

        //[When("Collection in a model is configured with {int} blocks for the property {string} and {string} with values to save model portfolio as given below")]
        //public void WhenCollectionInAModelIsConfiguredWithBlocksForThePropertyAndWithValuesToSaveModelPortfolioAsGivenBelow(int noOfBlocks, string collection1, string collection2)
        //{
        //    await _program.Collection(noOfBlocks, collection1,collection2);
        //}



        //[When("the property {string} is configured with {string} and {string} random generated {string}")]
        //public async Task ThenThePropertyIsConfiguredWithAndRandomGenerated(string control_name, int length1, int length2, Pattern pattern)
        //{

        //    await _program.doubleLength(control_name, length1, length2, pattern);
        //}


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

        [Given("Investment {string} has been mapped to the plan")]
        public async Task GivenInvestmentHasBeenMappedToThePlan(string investmentName)
        {
            await _program.AddInvestmentToPlan(investmentName);
        }

        [Given("Enrollment configuration")]
        public async Task GivenEnrollmentConfiguration()
        {
            await _program.EnrollmentSetup();
        }



    }
}
