using System;
using Reqnroll;
using ClassLibrary.Shared.SharedFeatureFiles;

namespace RefitSandBox
{
    [Binding]
    public class PlanModuleStepDefinitions
    {
        public Program _prg;
        public PlanModuleStepDefinitions(Program prg)
        {
            _prg = prg;
        }

        [When("New plan basic details filled and saved")]
        public async Task WhenNewPlanBasicDetailsFilledAndSaved()
        {
            await _prg.LoadPlanBasicDetails();
        }

        [Then("Verify New Plan is saved")]
        public async Task ThenVerifyNewPlanIsSaved()
        {
            
        }

        [When("Configuration has been done as mentioned below")]
        public async Task WhenConfigurationHasBeenDoneAsMentionedBelow(Reqnroll.DataTable dataTable)
        {
            foreach(var row in dataTable.Rows)
            {
                var ObjectName = row[0];
                var Value = row[1];
                await _prg.Configuration(ObjectName, Value);
            }
        }

    }
}
