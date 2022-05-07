using Blogger.BLL.Services;
using Blogger.BLL.ViewModels;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Blogger_BE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly IPostService _postService;
        public PostController(IPostService postService)
        {
            _postService = postService;
        }
        // GET: api/<PostController>
        [HttpGet]
        public IActionResult GetAll()
        {
            var result = _postService.GetAll();
            if(result == null)
                return NotFound();
            return Ok(result);
        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public IActionResult GetById(int id)
        {
            var result = _postService.GetById(id);
            if (result == null)
                return NotFound();
            return Ok(result);
        }

        // POST api/<PostController>
        [HttpPost]
        public IActionResult Post([FromBody] PostVM postVM)
        {
            if (postVM == null)
                return BadRequest();
            try
            {
                _postService.Create(postVM);
                return Ok(postVM);
            }
            catch(Exception ex)
            {
                return BadRequest(ex);
            }
        }

        // PUT api/<PostController>/5
        [HttpPut("{id}")]
        public void Put(int id, [FromBody] PostVM postVM)
        {
            _postService.Update(id, postVM);
        }

        // DELETE api/<PostController>/5
        [HttpDelete("{id}")]
        public IActionResult Delete(int id)
        {
            var post = _postService.GetById(id);
            if (post == null)
                return BadRequest();
            _postService.Delete(id);
            return Ok();
        }
    }
}
