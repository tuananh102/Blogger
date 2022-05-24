using Blogger.BLL.Services;
using Blogger.BLL.DTOs;
using Blogger.DAL.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Net;
using System.Net.Mail;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Blogger.BLL.Responses;
using Blogger_BE.Requests;

namespace Blogger_BE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AccountController : ControllerBase
    {
        private readonly UserManager<AppUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly IConfiguration _configuration;
        private readonly IEmailService _emailService;
        private readonly SignInManager<AppUser> _signInManager;
        public AccountController(UserManager<AppUser> userManager,
            IConfiguration configuration,
            RoleManager<IdentityRole> roleManager,
            IEmailService emailService,
            SignInManager<AppUser> signInManager)
        {
            _userManager = userManager;
            _configuration = configuration;
            _roleManager = roleManager;
            _emailService = emailService;
            _signInManager = signInManager;
        }
        /// <summary>
        /// Registration
        /// </summary>
        /// <param name="accountRequest"></param>
        /// <returns></returns>
        [HttpPost("Register")]
        public async Task<IActionResult> Register([FromBody] RegisterRequest registerRequest)
        {
            if (!ModelState.IsValid) return BadRequest(ModelState);
            try
            {
                //Add image
                //var image = _imageService.SaveImage(accountRequest.Image);
                //var imageUrl = String.Format("{0}://{1}{2}/images/{3}", Request.Scheme, Request.Host, Request.PathBase, image);
                var user = new AppUser
                {
                    Email = registerRequest.Email,
                    UserName = registerRequest.Email
                };
                var result = await _userManager.CreateAsync(user, registerRequest.Password);

                if (!result.Succeeded)
                    throw new Exception(result.Errors.ToString());
                //Create if not exist
                if (!await _roleManager.RoleExistsAsync(UserRoles.Admin))
                    await _roleManager.CreateAsync(new IdentityRole(UserRoles.Admin));
                if (!await _roleManager.RoleExistsAsync(UserRoles.Blogger))
                    await _roleManager.CreateAsync(new IdentityRole(UserRoles.Blogger));
                if (!await _roleManager.RoleExistsAsync(UserRoles.Guest))
                    await _roleManager.CreateAsync(new IdentityRole(UserRoles.Guest));

                if (await _roleManager.RoleExistsAsync(UserRoles.Guest))
                    await _userManager.AddToRoleAsync(user, UserRoles.Guest);

                var confirmationToken = await _userManager.GenerateEmailConfirmationTokenAsync(user);

                confirmationToken = HttpUtility.UrlEncode(confirmationToken);
                var confirmationLink = Url.Action(
                        "ConfirmEmail",
                        "Account",
                        new { userId = user.Id, token = confirmationToken },
                        protocol: HttpContext.Request.Scheme);
                await _emailService.SendEmailAsync(user.Email, confirmationLink);
                return Ok(new Response
                {
                    Message = "Please confirm email to login",
                    IsSuccess = true
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new Response
                {
                    IsSuccess = false,
                    Error = ex.Message
                });
            }
        }

       
        /// <summary>
        /// Login and generate access token
        /// </summary>
        /// <param name="accountRequest"></param>
        /// <returns></returns>
        [HttpPost("Login")]
        public async Task<IActionResult> Login([FromBody] AccountRequest accountRequest)
        {
            var user = await _userManager.FindByEmailAsync(accountRequest.Email);
            if (user == null)
            {
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Message = "Please check your email",
                    Error = "User is not exist"
                });
            }

            //Only allow email comfirmed
            if (!user.EmailConfirmed)
                return BadRequest(new Response
                {
                    IsSuccess = false,
                    Message = "Please confirm email first!",
                    Error = "Unconfirmed email"
                });

            //Check password
            var result = await _userManager.CheckPasswordAsync(user, accountRequest.Password);
            if (!result)
                return BadRequest(new Response
                {
                    IsSuccess = false,
                    Error = "Wrong password"
                });

            //Add claim
            var claims = new List<Claim>
            {
                new Claim(ClaimTypes.NameIdentifier, user.Id),
                new Claim(ClaimTypes.Email, accountRequest.Email),
            };
            //Get role from user
            var userRoles = await _userManager.GetRolesAsync(user);
            foreach (var role in userRoles)
            {
                claims.Add(new Claim(ClaimTypes.Role, role));
            }
            //Get key secret
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["AuthSettings:Key"]));

            //Generate a token
            var token = new JwtSecurityToken(
                issuer: _configuration["AuthSettings:Issuer"],
                audience: _configuration["AuthSettings:Audience"],
                claims: claims,
                expires: DateTime.Now.AddHours(24),
                signingCredentials: new SigningCredentials(key, SecurityAlgorithms.HmacSha256));
            string tokenAsString = new JwtSecurityTokenHandler().WriteToken(token);
            var resultSignIn = await _signInManager.PasswordSignInAsync(user, accountRequest.Password, false, false);
            if (!resultSignIn.Succeeded)
            {
                return BadRequest(new Response { IsSuccess = false, Error = resultSignIn.ToString() });
            }
            //To get user from another Controller use this: 
            //var userId = User.FindFirst(ClaimTypes.NameIdentifier).Value;
            return Ok(new AccountResponse<string>
            {
                IsSuccess = true,
                Data = tokenAsString
            });
        }

        /// <summary>
        /// Confirm Email
        /// </summary>
        /// <param name="token"></param>
        /// <param name="userId"></param>
        /// <returns></returns>
        [HttpGet("ConfirmEmail")]
        public async Task<IActionResult> ConfirmEmail(string token, string userId)
        {
            var user = await _userManager.FindByIdAsync(userId);
            if (user == null)
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Error = "Can not find this user"
                });
            string decodedToken = HttpUtility.UrlDecode(token);
            var result = await _userManager.ConfirmEmailAsync(user, decodedToken);
            if (result.Succeeded)
                return Ok();
            return BadRequest(new Response
            {
                IsSuccess = false,
                Error = result.Errors.ToString()
            });
        }
    }
}
