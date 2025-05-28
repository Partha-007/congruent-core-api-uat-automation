using ClassLibrary.Shared.AppSettings;
using Microsoft.Extensions.Configuration;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using NUnit.Framework;
using System.IO;

public abstract class TestBase
{
    protected readonly AppSettings Settings;

    protected TestBase()
    {
        var config = new ConfigurationBuilder()
            .SetBasePath("D:\\API_AutomationSuite\\Congruent.Core.API.TestAutomation\\ClassLibrary.Shared\\AppSettings")
            .AddJsonFile("appsettings.json")
            .Build();

        Settings = config.GetSection(AppSettings.Name).Get<AppSettings>();
    }
}
