using Bogus;
using Microsoft.Playwright;
using MyNamespace;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using Refit;
using RefitSandBox;
using RefitSandBox.Hooks;
using Reqnroll;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared
{
    public class TransactionsConfigurations : TestBase
    {
        public RefitSandBox.Program _program;
        public static SaveRolloverInRequestResult? rolloverInResponse;
        public static int feeId;
        public static string _url;
        public TransactionsConfigurations(RefitSandBox.Program program)
        {
            _program = program;
            _url = Settings.ApplicationURL;
        }

        Faker? faker = new Faker();
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


        public async Task<int> RolloverInRequestConfiguration(HttpClient httpClient,RolloverInTestConfig config)
        {
            if (config == null)
                throw new ArgumentNullException(nameof(config));

            if (config.Investments == null || !config.Investments.Any())
                throw new ArgumentException("At least one investment must be provided.");

            var rolloverInRequest = new RollOverInRequestDetails
            {
                RunValidations = true,
                IsSubmit = true,
                RollOverRequestInformation = new RollOverRequestInformation
                {
                    Id = 0,
                    EmployeeId = config.EmployeeId,
                    PlanId = config.PlanId,
                    IsInvestmentAllocationsSameToAllSources = true,
                    Status = 1,
                    PlanDetails = new RolloverPlanDetails
                    {
                        Id = 0,
                        Name = "Test Plan",
                        PlanType = "401(k)",
                        Sources = null,
                        PlanId = config.PlanId.ToString(),
                        HasRothRollOver = true
                    },
                    PreviousEmploymentDetails = new PreviousEmploymentDetails
                    {
                        PlanName = "Test Previous Plan",
                        PlanType = 1,
                        TrusteeOrCustodianName = faker.Person.FirstName,
                        CompanyName = faker.Company.CompanyName(),
                        CustodianBankName = faker.Company.CompanyName(),
                        CustodianAccountNumber = faker.Random.Number(10000000, 99999999).ToString(),
                    },
                    RollOverTransactionInfo = new RollOverTransactionInfo
                    {
                        PaymentMode = 1,
                        FinancialInstitutionName = faker.Company.CompanyName(),
                        ChequeNumber = faker.Random.Number(100000, 999999).ToString(),
                        RoutingNumber = faker.Random.Number(100000000, 999999999).ToString(),
                        AccountHolderName = faker.Person.FullName,
                        AccountType = null,
                        AccountNumber = null
                    },
                    RolloverAmount = config.RolloverAmount,
                    RothFirstContributionDate = null,
                    RolloverCategory = null,


                    SourceLevelInvestments = new List<ICollection<SourceLevelInvestments>>
                    {
                        new List<SourceLevelInvestments>
                        {
                            new SourceLevelInvestments
                            {
                                SourceId = config.SourceId,
                                InvestmentId = config.Investments.First().InvestmentId,
                                InvestmentPercentage = config.Investments.First().Percentage,
                                Id = 0,
                                SourceName = "Pretax Rollover",
                                InvestmentName = config.Investments.First().InvestmentName,
                                SourceInvestmentId = 0
                            },
                            new SourceLevelInvestments
                            {
                                SourceId = config.SourceId,
                                InvestmentId = config.Investments.Last().InvestmentId,
                                InvestmentPercentage = config.Investments.Last().Percentage,
                                Id = 0,
                                SourceName = "Pretax Rollover",
                                InvestmentName = config.Investments.Last().InvestmentName,
                                SourceInvestmentId = 0
                            }
                        }
                    },

                    RollOverSourceLevelContributions = new List<RollOverSourceLevelContributions>
                    {
                        new RollOverSourceLevelContributions
                        {
                            Id = 0,
                            SourceId = config.SourceId,
                            SourceName = "Pretax Rollover",
                            ContributionAmount = config.ContributionAmount,
                            Earnings = config.EarningsAmount,
                            SourceSubCategory = "EmployeePreTaxRollover"
                        }
                    },

                    DocumentDetails = null,
                    IsRestricted = false,
                    RestrictedMessage = null,
                    InvestmentAllocation = false,
                    TransactionId = null,
                    Ssn = null,
                    Notes = null
                }
            };

            var rolloverInRequestForSubmit = rolloverInRequest;

            //Creating the rollover in request
            var tradeInterface = RestService.For<IRolloverIn>(httpClient);
            //var data = new StringContent(rolloverInRequest.ToString(), Encoding.UTF8, "application/json");
            //var task = await httpClient.PostAsync($"{Settings.ApplicationURL}/api/RolloverIn/SaveRolloverInRequest", data);
            //var contentTask = await task.Content.ReadAsStringAsync();
            //var response = JObject.Parse(contentTask);
            //Console.Write(response.ToString());
            rolloverInResponse = await tradeInterface.SaveRolloverInRequestAsync(rolloverInRequest);

            var rolloverRequestId = rolloverInResponse.RollOverRequestInformation.Id;
            var sourceLevelInvestment1Id = rolloverInResponse.RollOverRequestInformation.SourceLevelInvestments.First().First().Id;
            var sourceLevelInvestment2Id = rolloverInResponse.RollOverRequestInformation.SourceLevelInvestments.First().Last().Id;

            if (rolloverRequestId == 0)
                throw new Exception("Rollover In Request creation failed");

            //Submitting the rollover in request
            else
            {
                rolloverInRequestForSubmit.RollOverRequestInformation.Id = rolloverRequestId;
                rolloverInRequestForSubmit.RollOverRequestInformation.SourceLevelInvestments.First().First().Id = sourceLevelInvestment1Id;
                rolloverInRequestForSubmit.RollOverRequestInformation.SourceLevelInvestments.First().Last().Id = sourceLevelInvestment2Id;
                rolloverInRequestForSubmit.RollOverRequestInformation.SourceLevelInvestments.First().First().SourceInvestmentId = rolloverRequestId;
                rolloverInRequestForSubmit.RollOverRequestInformation.SourceLevelInvestments.First().Last().SourceInvestmentId = rolloverRequestId;
                rolloverInRequestForSubmit.IsSubmit = true;
                rolloverInRequestForSubmit.RollOverRequestInformation.Status = 8;

                var submitRolloverInResponse = await tradeInterface.SaveRolloverInRequestAsync(rolloverInRequestForSubmit);
                if (!submitRolloverInResponse.IsSuccessfull)
                {
                    throw new Exception("Rollover In Request submission failed");
                }
            }
            return rolloverRequestId;
        }

        public async Task<bool> ApproveOrRejectRolloverRequest(HttpClient httpClient, string ApproveOrReject)
        {
            var approveOrRejectRequest = new ApproveOrRejectRolloverInRequest
            {
                Id = rolloverInResponse.RollOverRequestInformation.Id,
                Approval = ApproveOrReject.Equals("Reject", StringComparison.OrdinalIgnoreCase) ? false : true,
                ReasonForRejection = ApproveOrReject.Equals("Approve", StringComparison.OrdinalIgnoreCase) ? "" : "Test Rejection"
            };

            var parsedObject = JsonConvert.SerializeObject(approveOrRejectRequest);

            var data = new StringContent(parsedObject, Encoding.UTF8, "application/json");
            var task = await httpClient.PostAsync($"{Settings.ApplicationURL}/api/RolloverIn/ApproveOrRejectRolloverInRequest", data);
            var status = task.StatusCode;
            var contentTask = await task.Content.ReadAsStringAsync();
            var response = bool.Parse(contentTask);
            /*var rolloverInInterface = RestService.For<IRolloverIn>(Hooks.httpClient);
            var response = await rolloverInInterface.ApproveOrRejectRolloverInRequestAsync(approveOrRejectRequest);*/
            if (!response)
                throw new Exception($"Rollover In Request {(ApproveOrReject.Equals("Approve", StringComparison.OrdinalIgnoreCase) ? "approval" : "rejection")} failed");
            
            return response;
        }


        public async Task FeeBasicDetailsConfiguration(HttpClient httpClient, string FeeFor)
        {
            var feeBasicDetails = new BasicFeeDetails
            {
                Id = 0,
                Name = "Test fee" + " " + faker.Random.String2(5, "ABCDEFGHIJKLMNOPQRSTUVWXYZ"),
                Description = "Test fee description",
                Step = 1,
                FeeClassification = new FeeClassification
                {
                    Id = 1,
                    Name = "Admin fee"
                },
                FeeStatus = 3,
                FeeMode = 1,
                AssociateProfileId = 0,
                FeeFor = FeeFor == "Participant" ? 1 : 2,
                FeeType = null,
                FeeCode = faker.Random.Number(1000, 9999).ToString()
            };

            var feeInterface = RestService.For<IFee>(httpClient);
            var feeBasicDetailsResponse = await feeInterface.SaveFeeDetailsAsync(feeBasicDetails);

            if (!feeBasicDetailsResponse.IsSuccessful)
                throw new Exception("Fee basic details save failed");

            feeId = feeBasicDetailsResponse.Fee.Id;
        }

        public async Task SaveFullFee(CalculationDetails? calculationDetails, FeeApplicableTo? feeApplicableTo, FeeSchedule? feeSchedule, bool finalSubmit)
        {
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(_url)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer!);

            var feeInterface = RestService.For<IFee>(httpClient);

            if(calculationDetails != null)
            {
                var feeCalculationResponse = await feeInterface.SaveFeeCalculationDetailsAsync(calculationDetails);

                if (!feeCalculationResponse.IsSuccessful)
                    throw new Exception("Fee calculation save failed");
            }

            if(feeApplicableTo != null)
            {
                var feeApplicableToResponse = await feeInterface.AddFeeApplicableToAsync(feeApplicableTo);

                if (!feeApplicableToResponse.IsSuccessfull)
                    throw new Exception("Fee applicable to save failed");
            }

            if(feeSchedule != null)
            {
                var feeScheduleResponse = await feeInterface.AddFeeScheduleAsync(feeSchedule);

                if (!feeScheduleResponse.IsSuccessfull)
                    throw new Exception("Fee schedule save failed");
            }

            if(finalSubmit)
            {
                var finalSubmitResponse = await feeInterface.SaveSummaryDetailsAsync(feeId);

                if (!finalSubmitResponse.IsSuccessful)
                    throw new Exception("Final fee submission failed");
            }
            
        }


        public static FeeSpecificationDetails MapFromTable(Table table)
        {
            var model = new FeeSpecificationDetails();

            var setters = new Dictionary<string, Action<string>>(StringComparer.OrdinalIgnoreCase)
            {
                ["Id"] = v => model.Id = ParseNullableInt(v),
                ["FeeType"] = v => model.FeeType = ParseNullableInt(v),
                ["AllocationType"] = v => model.AllocationType = ParseNullableInt(v),
                ["FormulaType"] = v => model.FormulaType = ParseNullableInt(v),
                ["AllocationSubType"] = v => model.AllocationSubType = ParseNullableInt(v),
                ["ParticipantAllocation"] = v => model.ParticipantAllocation = ParseNullableInt(v),
                ["FeeAmount"] = v => model.FeeAmount = ParseNullableDouble(v),
                ["FeePercentageOrBasisPoints"] = v => model.FeePercentageOrBasisPoints = ParseNullableDouble(v),
                ["Name"] = v => model.Name = v,
                ["Description"] = v => model.Description = v,
                ["TierComputationType"] = v => model.TierComputationType = ParseNullableInt(v),
                ["TierComputationSubType"] = v => model.TierComputationSubType = ParseNullableInt(v),
                ["FeeFor"] = v => model.FeeFor = ParseNullableInt(v),
                ["FeeCalculation"] = v => model.FeeCalculation = ParseNullableInt(v)
            };

            foreach (var row in table.Rows)
            {
                var key = row["Key"];
                var value = row["Value"];

                if (setters.TryGetValue(key, out var setAction))
                {
                    setAction(value);
                }
                else
                {
                    throw new ArgumentException($"Property '{key}' is not supported.");
                }
            }

            return model;
        }

        public static async Task<CalculationDetails> MapFromTable(Table table,FeeSpecificationDetails feeSpecification = null)
        {
            var model = new CalculationDetails();

            var setters = new Dictionary<string, Action<string>>(StringComparer.OrdinalIgnoreCase)
            {
                ["Id"] = v => model.Id = ParseRequiredInt(v),

                ["FeeType"] = v => model.FeeType = ParseNullableInt(v),
                ["Step"] = v => model.Step = ParseNullableInt(v),
                ["InvestmentId"] = v => model.InvestmentId = ParseNullableInt(v),

                ["FeeToBeCollectedFromOnlySelectedInvestment"] =
                    v => model.FeeToBeCollectedFromOnlySelectedInvestment = ParseNullableBool(v),

                ["FeeTransactionTypeCategory"] =
                    v => model.FeeTransactionTypeCategory = ParseNullableInt(v),

                ["FeeTransactionCategoryStatus"] =
                    v => model.FeeTransactionCategoryStatus = ParseIntCollection(v),

                ["ProcessMinAmount"] =
                    v => model.ProcessMinAmount = ParseNullableBool(v),

                ["MinimumThresholdBalance"] =
                    v => model.MinimumThresholdBalance = ParseNullableDouble(v),

                ["PercentageOfAccountBalanceAvailable"] =
                    v => model.PercentageOfAccountBalanceAvailable = ParseNullableDouble(v),

                ["ExcludeFullyPaidOutParticipants"] =
                    v => model.ExcludeFullyPaidOutParticipants = ParseNullableBool(v),

                ["RunFeeFor"] = v => model.RunFeeFor = ParseNullableInt(v),

                ["IncludeLoanBalancesInAssetComputation"] =
                    v => model.IncludeLoanBalancesInAssetComputation = ParseNullableBool(v),

                ["FeeSpecificationId"] =
                    v => model.FeeSpecificationId = ParseNullableInt(v),

                ["InvestmentName"] = v => model.InvestmentName = v,
                ["Cusip"] = v => model.Cusip = v,

                ["FeeFor"] = v => model.FeeFor = ParseNullableInt(v),
                ["FeeCalculation"] = v => model.FeeCalculation = ParseNullableInt(v)
            };

            foreach (var row in table.Rows)
            {
                var key = row["Key"];
                var value = row["Value"];

                if (setters.TryGetValue(key, out var setAction))
                {
                    setAction(value);
                }
                else
                {
                    throw new ArgumentException($"Property '{key}' is not supported.");
                }
            }

            model.Id = feeId;

            // Handle nested object (required)
            if (feeSpecification != null)
            {
                model.FeeSpecification = feeSpecification;
            }

            if (model.FeeSpecification == null)
                throw new ArgumentException("FeeSpecification is required.");

            

            return model;
        }

        public static FeeApplicableTo MapFromTableFeeApplicable(Table table)
        {
            var model = new FeeApplicableTo();

            var setters = new Dictionary<string, Action<string>>(StringComparer.OrdinalIgnoreCase)
            {
                ["ApplicableTo"] = v => model.ApplicableTo = ParseNullableInt(v),

                ["FeeId"] = v => model.FeeId = ParseRequiredInt(v),
                ["PlanCount"] = v => model.PlanCount = ParseRequiredInt(v),

                ["CollectFeeFromOnlyThisInvestment"] =
                    v => model.CollectFeeFromOnlyThisInvestment = ParseNullableBool(v),

                ["AllocationMethod"] = v => model.AllocationMethod = ParseNullableInt(v),
                ["DeductFeeFrom"] = v => model.DeductFeeFrom = ParseNullableInt(v),

                ["DeductFeeFromForfeitureBalance"] =
                    v => model.DeductFeeFromForfeitureBalance = ParseNullableBool(v),

                ["ForfeitureFeePercentage"] =
                    v => model.ForfeitureFeePercentage = ParseNullableDouble(v),

                ["Step"] = v => model.Step = ParseRequiredInt(v),
                ["FeeFor"] = v => model.FeeFor = ParseRequiredInt(v),

                // Collections (simple support: null or empty only)
                ["PlanMappings"] =
                    v => model.PlanMappings = ParseEmptyCollection<PlanMappings>(v),

                ["PlanGroupMappings"] =
                    v => model.PlanGroupMappings = ParseEmptyCollection<PlanGroupMappings>(v),

                ["ExcludedPlanMappings"] =
                    v => model.ExcludedPlanMappings = ParseEmptyCollection<ExcludedPlanMappings>(v),

                ["ExcludedEmployeeClassifications"] =
                    v => model.ExcludedEmployeeClassifications = ParseEmptyCollection<ExcludedEmployeeClassifications>(v),

                ["ExcludedInvestments"] =
                    v => model.ExcludedInvestments = ParseEmptyCollection<ExcludedInvestments>(v),

                ["InvestmentHeirarchy"] =
                    v => model.InvestmentHeirarchy = ParseEmptyCollection<InvestmentHeirarchy>(v),

                ["SourceHeirarchy"] =
                    v => model.SourceHeirarchy = ParseEmptyCollection<SourceHeirarchy>(v)
            };

            foreach (var row in table.Rows)
            {
                var key = row["Key"];
                var value = row["Value"];

                if (setters.TryGetValue(key, out var setAction))
                {
                    setAction(value);
                }
                else
                {
                    throw new ArgumentException($"Property '{key}' is not supported.");
                }
            }

            model.FeeId = feeId;
            var planMappings = new List<PlanMappings>
            {
                new PlanMappings
                {
                    Id = 0,
                    PlanId = Convert.ToInt32(Hooks.planId),
                    FeeId = feeId,
                    IsDeleted = false
                }
            };
            model.PlanMappings = planMappings;
            model.PlanCount = 1;

            // Required field validation
            if (model.FeeId == 0)
                throw new ArgumentException("FeeId is required.");

            if (model.PlanCount == 0)
                throw new ArgumentException("PlanCount is required.");

            if (model.Step == 0)
                throw new ArgumentException("Step is required.");

            if (model.FeeFor == 0)
                throw new ArgumentException("FeeFor is required.");

            return model;
        }

        public static Schedule MapFromTableSchedule(Table table)
        {
            var model = new Schedule();

            var setters = new Dictionary<string, Action<string>>(StringComparer.OrdinalIgnoreCase)
            {
                ["ScheduleType"] = v => model.ScheduleType = ParseNullableInt(v),
                ["MonthAnnually"] = v => model.MonthAnnually = ParseNullableInt(v),
                ["DayAnnually"] = v => model.DayAnnually = ParseNullableInt(v),

                ["MonthSemiAnnually"] = v => model.MonthSemiAnnually = ParseNullableInt(v),
                ["DaySemiAnnually"] = v => model.DaySemiAnnually = ParseNullableInt(v),

                ["StartDay"] = v => model.StartDay = ParseNullableInt(v),
                ["FirstDate"] = v => model.FirstDate = ParseNullableInt(v),
                ["SecondDate"] = v => model.SecondDate = ParseNullableInt(v),

                ["MonthQuarterly"] = v => model.MonthQuarterly = ParseNullableInt(v),
                ["DayQuarterly"] = v => model.DayQuarterly = ParseNullableInt(v),

                ["StartDayWeekly"] = v => model.StartDayWeekly = ParseNullableInt(v),
            };

            foreach (var row in table.Rows)
            {
                var key = row["Key"];
                var value = row["Value"];

                if (setters.TryGetValue(key, out var setAction))
                {
                    setAction(value);
                }
                else
                {
                    throw new ArgumentException($"Property '{key}' is not supported in Schedule.");
                }
            }

            return model;
        }


        public static FeeSchedule MapFromTableFeeSchedule(Table table, Schedule schedule)   // required nested object
        {
            var model = new FeeSchedule();

            var setters = new Dictionary<string, Action<string>>(StringComparer.OrdinalIgnoreCase)
            {
                ["FeeId"] = v => model.FeeId = ParseRequiredInt(v),
                ["Step"] = v => model.Step = ParseRequiredInt(v),

                ["FeeRunType"] = v => model.FeeRunType = ParseNullableInt(v),

                ["EffectiveStartDate"] =
                    v => model.EffectiveStartDate = ParseNullableDateTimeOffset(v),

                ["EffectiveEndDate"] =
                    v => model.EffectiveEndDate = ParseNullableDateTimeOffset(v),

                ["FeeProcess"] = v => model.FeeProcess = ParseNullableInt(v),

                ["ProcessDate"] =
                    v => model.ProcessDate = ParseNullableDateTimeOffset(v),

                ["ProcessTimeMinutes"] =
                    v => model.ProcessTimeMinutes = ParseNullableInt(v),

                ["ProcessTimeHours"] =
                    v => model.ProcessTimeHours = ParseNullableInt(v),

                ["BasisDate"] = v => model.BasisDate = ParseNullableInt(v),
                ["BasisAsOfDate"] = v => model.BasisAsOfDate = ParseNullableInt(v),
                ["BasisAsOfFrequency"] = v => model.BasisAsOfFrequency = ParseNullableInt(v)
            };

            foreach (var row in table.Rows)
            {
                var key = row["Key"];
                var value = row["Value"];

                if (setters.TryGetValue(key, out var setAction))
                {
                    setAction(value);
                }
                else
                {
                    throw new ArgumentException($"Property '{key}' is not supported.");
                }
            }

            model.FeeId = feeId;
            model.Schedule = schedule;


            // Required validations
            if (model.FeeId == 0)
                throw new ArgumentException("FeeId is required.");

            if (model.Step == 0)
                throw new ArgumentException("Step is required.");

           

            return model;
        }

        // ---------- Parsing Helpers ----------

        private static int ParseRequiredInt(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                throw new ArgumentException("Required integer value missing.");

            return int.Parse(value, CultureInfo.InvariantCulture);
        }

        private static int? ParseNullableInt(string value)
            => string.IsNullOrWhiteSpace(value)
                ? null
                : int.Parse(value, CultureInfo.InvariantCulture);

        private static DateTimeOffset? ParseNullableDateTimeOffset(string value)
        {
            if (string.IsNullOrWhiteSpace(value) || value.Trim() == "[]")
                return null;

            return DateTimeOffset.Parse(value, CultureInfo.InvariantCulture);
        }

        private static double? ParseNullableDouble(string value)
            => string.IsNullOrWhiteSpace(value)
                ? null
                : double.Parse(value, CultureInfo.InvariantCulture);

        private static bool? ParseNullableBool(string value)
            => string.IsNullOrWhiteSpace(value)
                ? null
                : bool.Parse(value);

        private static ICollection<T> ParseEmptyCollection<T>(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                return null;

            if (value.Trim() == "[]")
                return new List<T>();

            throw new ArgumentException(
                $"Only '[]' or empty value supported for collection of {typeof(T).Name}.");
        }



        private static ICollection<int> ParseIntCollection(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
                return null;   // treat blank as null

            if (value.Trim() == "[]")
                return new List<int>();   // explicit empty array

            return value.Split(',')
                        .Select(v => int.Parse(v.Trim(), CultureInfo.InvariantCulture))
                        .ToList();
        }



        public class RolloverInTestConfig
        {
            // Basic rollover info
            public int EmployeeId { get; set; }
            public int PlanId { get; set; }
            public double RolloverAmount { get; set; }
            public int SourceId { get; set; }

            // Contribution details
            public double ContributionAmount { get; set; }
            public double EarningsAmount { get; set; }

            // Investments (from second step table)
            public List<InvestmentConfig> Investments { get; set; } = new();
        }


        public class InvestmentConfig
        {
            public int InvestmentId { get; set; }

            public string InvestmentName { get; set; }

            public int InvestmentPlanMappingId { get; set; }

            public double Percentage { get; set; }
        }
    }
}
