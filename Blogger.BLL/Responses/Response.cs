using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class Response
    {
        public bool IsSuccess { get; set; }
        public string Error { get; set; }
        public string Message { get; set; }
        public Response()
        {

        }
        public Response(bool isSuccess, string error, string message)
        {
            IsSuccess = isSuccess;
            Error = error;
            Message = message;
        }
    }
}
