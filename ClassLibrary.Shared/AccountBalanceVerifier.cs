using Gherkin.CucumberMessages.Types;
using Microsoft.Playwright;
using MyNamespace;
using Refit;
using RefitSandBox;
using RefitSandBox.Hooks;
using Reqnroll;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Numerics;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Shared
{
    public class AccountBalanceVerifier : TestBase
    {
        public static AccountBalanceByPlanResponse? employeeAccountBalance;
        
        public async Task VerifySourceWiseBalance(string sourceName, Table table)
        {
            var httpClient = new HttpClient()
            {
                BaseAddress = new Uri(Settings.ApplicationURL)
            };
            httpClient.DefaultRequestHeaders.Authorization = new System.Net.Http.Headers.AuthenticationHeaderValue("Bearer", Hooks.bearer);
            var employeeId = await RefitSandBox.Program.GetEmployeeId();
            await Task.Delay(3000);
            var currentDate = DateTime.Today.ToString("yyyy-MM-dd");
            var tradeOrderClient = RestService.For<ITradeOrderFileUpload>(httpClient);
            employeeAccountBalance = await tradeOrderClient.GetParticipantAccountBalanceByPlan(RefitSandBox.Program.planId, employeeId, currentDate);


            var source = employeeAccountBalance.Sources
        .FirstOrDefault(s => s.SourceName.Equals(sourceName, StringComparison.OrdinalIgnoreCase));

            if (source == null)
                throw new Exception($"Source '{sourceName}' not found.");

            // Cache source properties once
            var sourceProperties = typeof(SourceWiseBalance)
                .GetProperties()
                .ToDictionary(p => p.Name, p => p, StringComparer.OrdinalIgnoreCase);

            // Cache investment properties once
            var investmentProperties = typeof(InvestmentwiseBalance)
                .GetProperties()
                .ToDictionary(p => p.Name, p => p, StringComparer.OrdinalIgnoreCase);

            var investmentLookup = source.InvestmentwiseBalances
                .ToDictionary(i => i.Name, StringComparer.OrdinalIgnoreCase);

            var investmentExpectedTotals = new Dictionary<string, decimal>(StringComparer.OrdinalIgnoreCase);

            foreach (var row in table.Rows)
            {
                var level = row["Level"];
                var name = row["Name"];

                var columns = row.Keys
                    .Where(c => c != "Level" && c != "Name");

                if (level.Equals("Source", StringComparison.OrdinalIgnoreCase))
                {
                    foreach (var column in columns)
                    {
                        if (!sourceProperties.TryGetValue(column, out var prop))
                            throw new Exception($"Property '{column}' not found on Source.");

                        var actualValue = Convert.ToDecimal(prop.GetValue(source));
                        var expectedValue = decimal.Parse(row[column]);

                        if (actualValue != expectedValue)
                            throw new Exception(
                                $"Source '{column}' mismatch. Expected: {expectedValue}, Actual: {actualValue}");
                    }
                }
                else if (level.Equals("Investment", StringComparison.OrdinalIgnoreCase))
                {
                    if (!investmentLookup.TryGetValue(name, out var investment))
                        throw new Exception($"Investment '{name}' not found.");

                    foreach (var column in columns)
                    {
                        if (!investmentProperties.TryGetValue(column, out var prop))
                            throw new Exception($"Property '{column}' not found on Investment.");

                        var actualValue = Convert.ToDecimal(prop.GetValue(investment));
                        var expectedValue = decimal.Parse(row[column]);

                        if (actualValue != expectedValue)
                            throw new Exception(
                                $"Investment '{name}' -> '{column}' mismatch. Expected: {expectedValue}, Actual: {actualValue}");

                        // Aggregate dynamically for totals
                        if (!investmentExpectedTotals.ContainsKey(column))
                            investmentExpectedTotals[column] = 0;

                        investmentExpectedTotals[column] += expectedValue;
                    }
                }
            }

            //  Automatic aggregation validation
            foreach (var kvp in investmentExpectedTotals)
            {
                if (!sourceProperties.TryGetValue(kvp.Key, out var prop))
                    continue;

                var sourceValue = Convert.ToDecimal(prop.GetValue(source));

                if (sourceValue != kvp.Value)
                    throw new Exception(
                        $"Aggregation mismatch for '{kvp.Key}'. " +
                        $"Sum of investments: {kvp.Value}, Source value: {sourceValue}");
            }
        }
    }
}
