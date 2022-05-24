using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Blogger_BE.Requests
{
    public class AccountRequest
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [StringLength(15, ErrorMessage = "Your Password is limited to {2} to {1} characters", MinimumLength = 3)]
        public string Password { get; set; }
    }
    public class RegisterRequest : AccountRequest
    {
        //public string Role { get; set; }
    }
}
