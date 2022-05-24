using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services
{
    public interface IEmailService
    {
       /// <summary>
       /// Send a email using SendInBlue
       /// </summary>
       /// <param name="userEmail"></param>
       /// <param name="confirmationLink"></param>
       /// <returns></returns>
        Task SendEmailAsync(string userEmail, string confirmationLink);
    }
}
