using ClassLibrary.Shared.RefitHelper;
using MyNamespace;
using Refit;
using Reqnroll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared.Configurations
{
    public class SetupConfigurations
    {
        public async Task<object> SaveForfeitureSettings(HttpClient httpClient, int investmentId, string planId, Table table)
        {
            var forfeitureModel = new SaveForfeitureSettingViewModel();

            foreach (var row in table.Rows)
            {
                var propertyName = row["Key"]?.Trim();
                var value = row["Value"]?.Trim();

                var propertyInfo = typeof(SaveForfeitureSettingViewModel).GetProperty(propertyName) ?? throw new Exception($"Property '{propertyName}' does not exist in SaveForfeitureSettingViewModel.");

                if (string.IsNullOrWhiteSpace(value))
                    continue;

                var convertedValue = ConvertToPropertyType(value, propertyInfo.PropertyType);
                propertyInfo.SetValue(forfeitureModel, convertedValue);
            }

            forfeitureModel.Id = 0;
            forfeitureModel.PlanId = int.Parse(planId);
            forfeitureModel.DefaultInvestmentId = investmentId;
            var settings = new RefitSettings
            {
                ContentSerializer = new NewtonsoftJsonContentSerializer()
            };

            var planDetailsInterface = RestService.For<IPlanDetailsSave>(httpClient,settings);
            var forfeitureResponse = await planDetailsInterface.SaveForfeitureSettingAsync(forfeitureModel);

            return forfeitureResponse;
        }

        public async Task VestingConfiguration(HttpClient httpClient, string planId, string sourceId)
        {
            var vestingModel = new VestingViewModel()
            {
                Id = 0,
                PlanId = int.Parse(planId),
                VestingName = "Test Vesting",
                VestingDescription = "Test Vesting Description",
                UseImportedVestingData = false,
                YearsOfServiceExcludedIndicator = false,
                ExcludedYears = null,
                VestingAgeLimit = null,
                ImmediateVestingIndicator = false,
                UsePlanDefaultYOSIndicator = false,
                VestedAt = new List<int> { 1 },
                EmployerSourcesList = new List<EmployerSourceListViewModel>
                {
                    new EmployerSourceListViewModel
                    {
                        Id = 0,
                        SourceId = int.Parse(sourceId),
                        IsDeleted = false,
                    }
                },
                VestingMethod = 1,
                HoursOfService = 1000,
                ElapsedTime = null,
                VestingComputationalPeriod = 2,
                ServiceCreditPeriod = 1,
                VestingSchedule = 3,
                BreakInServiceApplicable = true,
                Hours = 500,
                Months = null,
                BreakInServiceRules = 3,
                DisregardPrior = 5,
                VestingScheduleTable = new ScheduleTableViewModel
                {
                    BaseYear = null,
                    FirstYear = 25,
                    SecondYear = 50,
                    ThirdYear = 75,
                    FourthYear = 100,
                    FifthYear = 100,
                    SixthYear = 100
                },
                AdditionalVestings = new List<AdditionalVestingViewModel>(),
                ActiveEmployees = null,
                Daily = null,
                Weekly = null,
                BiWeekly = null,
                SemiMonthly = null,
                Monthly = null,
                SemiAnnually = null,
                Annually = null,
                ApplyToAllStatuses = true,
                ExclusionType = 0,
                RehiredOneYearLookBack = false,
                StartDateIndicator = 1,
                Validate = null
            };

            var settings = new RefitSettings
            {
                ContentSerializer = new NewtonsoftJsonContentSerializer()
            };

            var planDetailsInterface = RestService.For<IPlanDetailsSave>(httpClient, settings);
            var vestingResponse = await planDetailsInterface.SaveVesting(vestingModel);
        }


        private static object ConvertToPropertyType(string value, System.Type propertyType)
        {
            var targetType = Nullable.GetUnderlyingType(propertyType) ?? propertyType;

            // Handle Enum
            if (targetType.IsEnum)
                return System.Enum.Parse(targetType, value, true);

            // Handle ICollection<int> or List<int>
            if (typeof(System.Collections.IEnumerable).IsAssignableFrom(targetType) && targetType != typeof(string))
            {
                var elementType = targetType.IsGenericType
                    ? targetType.GetGenericArguments()[0]
                    : typeof(string);

                var values = value.Split(',', StringSplitOptions.RemoveEmptyEntries)
                                  .Select(v => Convert.ChangeType(v.Trim(), elementType))
                                  .ToList();

                var list = Activator.CreateInstance(typeof(List<>).MakeGenericType(elementType));

                foreach (var item in values)
                    ((System.Collections.IList)list).Add(item);

                return list;
            }

            return Convert.ChangeType(value, targetType);
        }
    }
}
