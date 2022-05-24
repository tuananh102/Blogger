using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class AccountResponse<T>: Response
    {
        public T Data { get; set; }
    }
}
