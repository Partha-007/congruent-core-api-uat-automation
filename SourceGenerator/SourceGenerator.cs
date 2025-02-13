using NSwag;
using NSwag.CodeGeneration.CSharp;
using System.IO;
using System.Threading.Tasks;

public class Programs
{
    public static async Task Main(string[] args)
    {
        // Load the OpenAPI document (adjust the file path as needed)
        var document = await OpenApiDocument.FromFileAsync("json1.json");

        // Create settings for the CSharpClientGenerator
        var settings = new CSharpClientGeneratorSettings
        {
            ClassName = "MyApiClient",        
            //Namespace = "MyNamespace"       
        };

        
        var generator = new CSharpClientGenerator(document, settings);

        // Generate the client code as a string
        var code = generator.GenerateFile();

        // Optionally, save the generated code to a .cs file
        File.WriteAllText("GeneratedApiClient.cs", code);
    }
}
