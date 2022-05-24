using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL
{
    public static class BusinessConstant
    {
        public static class MailHTML
        {
            public const string From = "tuananhthanhthu2806@gmail.com";
            public static class ConfirmEmail
            {
                public const string Subject = "Please confirm your email to get started";
                public const string Body = "Hello ,<br> Your account just logged " +
                    "in using a(n) Windows device we don't recognize from a region we haven't seen you in recently. Click the link below to verify this was you and continue to Blogger <br><a href='{0}' style='background: #76B900; color: white;'>" +
                    "VERIFY EMAIL ADDRESS</a>";
            }
           

        }
    }
}
