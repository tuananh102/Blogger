using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;

namespace Blogger.BLL.Services.Implementations
{
    public class EmailService : IEmailService
    {
        //private readonly UserManager _userManager;
        private readonly Configuration _configuration;

        public EmailService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        /// <summary>
        /// Send a confirm email
        /// <returns></returns>
        public async Task SendEmailAsync(string userEmail, string confirmationLink)
        {
            
            var message = new MailMessage(BusinessConstant.MailHTML.From,
                userEmail,
                BusinessConstant.MailHTML.ConfirmEmail.Subject
                ,
                string.Format(BusinessConstant.MailHTML.ConfirmEmail.Body, confirmationLink));
            using var emailClient = new SmtpClient(_configuration["SMTP:Host"], int.Parse(_configuration["SMTP:Port"]));
            emailClient.Credentials = new NetworkCredential(_configuration["SMTP:UserName"], _configuration["SMTP:Password"]);
            await emailClient.SendMailAsync(message);
        }
    }
}
