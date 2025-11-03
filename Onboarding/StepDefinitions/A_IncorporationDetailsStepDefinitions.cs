using System;
using Reqnroll;

namespace Onboarding.StepDefinitions
{
    [Binding]
    public class A_IncorporationDetailsStepDefinitions
    {
        [Then("the property {string} is configured with {string} and {string} random generated {string}")]
        public void ThenThePropertyIsConfiguredWithAndRandomGenerated(string taxEIN, string p1, string p2, string numerics)
        {
            throw new PendingStepException();
        }
    }
}
