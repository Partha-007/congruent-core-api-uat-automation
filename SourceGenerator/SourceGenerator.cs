using NSwag;
using NSwag.CodeGeneration.CSharp;
using System.IO;
using System.Security.Cryptography.X509Certificates;
using System.Threading.Tasks;

namespace Generator.sourceGenerator
{
    public class Programs
    {
        
            public static async Task GenerateApiClientAsync() {
            try
            {
                // Load the OpenAPI document (adjust the file path as needed)
                var document = await OpenApiDocument.FromFileAsync("D:\\NewBackEndAutomation\\Congruent.Core.API.TestAutomation\\SourceGenerator\\json1.json");

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
            catch(Exception ex)
            {
                Console.WriteLine("Error generating API client: " + ex.Message);
            }
            
            
        }
    }
    }

