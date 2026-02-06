using Microsoft.Playwright;
using Newtonsoft.Json.Linq;
using RefitSandBox;

namespace ClassLibrary.Shared.AppSettings
{
    public class AppSettings
    {
        public AppSettings()
        {
            ApplicationURL = string.Empty;
            UserName = string.Empty;
            Password = string.Empty;
            Args = new List<string>();
            
        id =string.Empty;
            
        }

       
        public class ClearingPartnerConfig
        {
            public int Id { get; set; }
            public string Name { get; set; }
        }

      

        public const string Name = "AppSettings";

        public string ApplicationURL { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }

        public string ftp_user { get; set; }
        public string ftp_username { get; set; }
        public string ftp_password { get; set; }
        public string ftp_host { get; set; }
        public bool Headless { get; set; }
        public int SlowMotion { get; set; }

        public List<string> Args { get; set; }
        public List<ClearingPartnerConfig> ClearingPartners { get; set; } = new List<ClearingPartnerConfig>();
        public string id {  get; set; }

        public static IPage Page { get; set; }

    }
}
