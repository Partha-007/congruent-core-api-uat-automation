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

        // Get the base output directory (e.g., bin\Debug\net6.0)
        var currentDirectory = Directory.GetCurrentDirectory();

        // Navigate 3 levels up to the solution root: Congruent.Core.API.TestAutomation
        var solutionRoot = Directory.GetParent(currentDirectory)?.Parent?.Parent?.Parent?.FullName;

        if (solutionRoot == null)
        {
            throw new DirectoryNotFoundException("Could not resolve the solution root path.");
        }

        // Now append ClassLibrary.Shared\AppSettings to get the correct config path
        var configPath = Path.Combine(solutionRoot, "ClassLibrary.Shared", "AppSettings");

        if (!Directory.Exists(configPath))
        {
            throw new DirectoryNotFoundException($"Configuration folder not found: {configPath}");
        }

        // Build configuration
        var config = new ConfigurationBuilder()
            .SetBasePath(configPath)
            .AddJsonFile("appsettings.json", optional: false, reloadOnChange: true)
            .Build();




        Settings = config.GetSection(AppSettings.Name).Get<AppSettings>();
    }
}
