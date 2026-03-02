using Microsoft.Playwright;
using MyNamespace;
using Refit;
using RefitSandBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared
{
    public class TransactionsConfigurations
    {
        public RefitSandBox.Program _program;
        public TransactionsConfigurations(RefitSandBox.Program program)
        {
            _program = program;
        }
        public async Task<int> AdjustmentConfiguration(HttpClient httpClient, int planId, int employeeId, string planName, string parentTransactionId)
        {
            //Step 1
            var adjustmentBasicDetails = new BasicDetails
            {
                Id = 0,
                AdjustmentType = 1,
                PlanNameId = planId,
                PlanName = planName,
                EmployeeNameID = employeeId,
                Status = 1,
                Effectivedate = DateTime.Now.AddDays(-1).ToUniversalTime(),
                Description = "Test Adjustment",
                Step = 1,
                ParentTransactionId = parentTransactionId,
                TransactionType = 5,
                TransactionKey = "",
                TransactionDate = new DateTimeOffset(2021, 02, 01, 00, 00, 00, new TimeSpan()).ToUniversalTime(),
                AdjustmentClassification = new AdjustmentClassification
                {
                    Id = 1,
                    Name = "ADJ001 - Excess contribution deduction",
                    Code = "ADJ001 - Excess contribution deduction"
                },
            };

            var tradeInterface = RestService.For<IAdjustments>(httpClient);
            var adjustmentBasicDetailsResponse = await tradeInterface.SaveBasicAdjustmentDetailsAsync(adjustmentBasicDetails);

            var adjustmentId = adjustmentBasicDetailsResponse.BasicDetailsResult.Id;

            if(!(adjustmentId == 0))
            {
                var adjustmentDetails = new AdjustmentDetails
                {
                    Id = adjustmentId,
                    Step = 2,
                    Certainty = 1,
                    EntryType = 1,
                    UseParticipantCurrentHoldings = true,
                    ApplySameInvestmentToAllSources = false,
                    SendToTrade = true,
                    Sources = new List<SourceMapping>
                    {
                        new SourceMapping
                        {
                            Id = 0,
                            SourceId = int.Parse(RefitSandBox.Program.sourceId),
                            IsDeleted = false,
                            AdjustmentId = adjustmentId
                        }
                    },
                    SourceAllocation = new List<SourceAllocationMapping>
                    {
                        new SourceAllocationMapping
                        {
                            Id = 0,
                            SourceId = int.Parse(RefitSandBox.Program.sourceId),
                            AdjustmentId = adjustmentId,
                            Contribution = 100,
                            Earnings = 10,
                            IsDeleted = false,
                            InvestmentAllocation = new List<InvestmentAllocationMapping>
                            {
                                new InvestmentAllocationMapping
                                {
                                    Id = 0,
                                    InvestmentId = 92,
                                    SourceAllocationMappingId = 0,
                                    Contribution = null,
                                    Earnings = null,
                                    IsDeleted = false,
                                    IsModelPortfolio = false
                                },
                                new InvestmentAllocationMapping
                                {
                                    Id = 0,
                                    InvestmentId = 93,
                                    SourceAllocationMappingId = 0,
                                    Contribution = null,
                                    Earnings = null,
                                    IsDeleted = false,
                                    IsModelPortfolio = false
                                }
                            }
                        }
                    },
                };

                var adjustmentDetailsResponse = await tradeInterface.SaveAdjustmentDetailsAsync(adjustmentDetails);

                if(!adjustmentDetailsResponse.IsSuccessfull)
                    throw new Exception("Adjustment details saving failed");

                var submitAdjustmentResponse = await tradeInterface.SaveAdjustmentSummaryByIdAsync(adjustmentId);

                if (!submitAdjustmentResponse.IsSuccessfull)
                    throw new Exception("Adjustment submission failed");
            }
            

            if (adjustmentId == 0)
            {
                throw new Exception("Adjustment creation failed");
            }
            else
            {
                return adjustmentId;
            }
        }
    }
}
