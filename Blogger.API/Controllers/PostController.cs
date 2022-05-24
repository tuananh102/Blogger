using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger.BLL.Responses;
using Blogger.BLL.Services;
using Blogger.DAL.Models;
using Blogger_BE.Requests;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Blogger_BE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostController : ControllerBase
    {
        private readonly IPostService _postService;
        private readonly IMapper _mapper;


        public PostController(IPostService postService,
            IMapper mapper)
        {
            _postService = postService;
            _mapper = mapper;
        }


        // GET: api/<PostController>
        [HttpGet]
        public async Task<ActionResult<PostResponse>> GetAll()
        {
            try
            {
                var list = await _postService.GetAllAsync();
                return Ok(new ListPostResponse
                {
                    IsSuccess = true,
                    Data = list,
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new Response
                {
                    IsSuccess = false,
                    Error = ex.Message,
                });
            }

        }

        // GET api/<PostController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PostResponse>> Get(int id)
        {
            var result = await _postService.GetByIdAsync(id);

            //Handle exceptions
            if (result == null)
            {
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Error = $"Not found item with id: {id}",
                });
            }

            return Ok(new PostResponse
            {
                IsSuccess = true,
                Data = result
            });
        }

        // POST api/<PostController>
        [HttpPost]
        public async Task<ActionResult<Response>> Post([FromBody] PostRequest postRequest)
        {
            try
            {
                await _postService.Create(_mapper.Map<PostDto>(postRequest));
                return Ok(new Response
                {
                    IsSuccess = true,
                    Message = "Added successfully"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // PUT api/<PostController>/5
        [HttpPut]
        public async Task<ActionResult<Response>> Put([FromBody] PostRequest postRequest)
        {
            try
            {
                await _postService.Update(_mapper.Map<PostDto>(postRequest));
                return Ok(new Response
                {
                    IsSuccess = true,
                    Message = "Updated successfully",

                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<PostController>/5
        [HttpDelete("{id}")]
        public ActionResult<Response> Delete(int id)
        {
            _postService.Delete(id);
            return Ok(new Response
            {
                IsSuccess = true,
                Message = "Deleted successfully"
            });
        }
    }
}
