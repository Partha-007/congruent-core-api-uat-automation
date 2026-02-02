using System;
using Reqnroll;
using ClassLibrary.Shared.SharedFeatureFiles;
using RefitSandBox;

namespace RefitSandBoxEligibility
{
    [Binding]
    public class EligibilityModuleStepDefinitions
    {
        public Program _prmg;
        public EligibilityModuleStepDefinitions(Program prmg)
        {
            _prmg = prmg;
        }

        [When("New plan basic details filled and saved")]
        public async Task WhenNewPlanBasicDetailsFilledAndSaved()
        {
            await _prmg.LoadPlanBasicDetails();
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
                await _prmg.Configuration(ObjectName, Value);
            }
        }


    }
}
