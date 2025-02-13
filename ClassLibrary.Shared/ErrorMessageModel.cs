using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace RefitSandBox
{
    public class ErrorMessage
    {
        [JsonProperty("controlName")]
        public string ControlName { get; set; }

        [JsonProperty("message")]
        public string Message { get; set; }

        [JsonProperty("errorCode")]
        public string ErrorCode { get; set; }

        [JsonProperty("errorType")]
        public string ErrorType { get; set; }
    }

    public class ResponseBody
    {
        [JsonProperty("errorMessages")]
        public List<ErrorMessage> ErrorMessages { get; set; }
    }

}
