using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger.BLL.Responses;
using Blogger.BLL.Services;
using Blogger_BE.Requests;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace Blogger_BE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PostCommentController : ControllerBase
    {
        private readonly IPostCommentService _postCommentService;
        private readonly IMapper _mapper;


        public PostCommentController(IPostCommentService postService,
            IMapper mapper)
        {
            _postCommentService = postService;
            _mapper = mapper;
        }


        // GET: api/<PostCommentController>
        [HttpGet]
        public async Task<ActionResult<PostCommentResponse>> GetAll()
        {
            try
            {
                var list = await _postCommentService.GetAllAsync();
                return Ok(new ListPostCommentResponse
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

        // GET api/<PostCommentController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PostCommentResponse>> Get(int id)
        {
            var result = await _postCommentService.GetByIdAsync(id);

            //Handle exceptions
            if (result == null)
            {
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Error = $"Not found item with id: {id}",
                });
            }

            return Ok(new PostCommentResponse
            {
                IsSuccess = true,
                Data = result
            });
        }

        // POST api/<PostCommentController>
        [HttpPost]
        public async Task<ActionResult<Response>> PostComment([FromBody] PostCommentRequest postRequest)
        {
            try
            {
                await _postCommentService.Create(_mapper.Map<PostCommentDto>(postRequest));
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

        // PUT api/<PostCommentController>/5
        [HttpPut]
        public async Task<ActionResult<Response>> Put([FromBody] PostCommentRequest postRequest)
        {
            try
            {
                await _postCommentService.Update(_mapper.Map<PostCommentDto>(postRequest));
                return Ok(new Response
                {
                    IsSuccess = true,
                    Message = "Updated successfully"
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        // DELETE api/<PostCommentController>/5
        [HttpDelete("{id}")]
        public ActionResult<Response> Delete(int id)
        {
            _postCommentService.Delete(id);
            return Ok(new Response
            {
                IsSuccess = true,
                Message = "Deleted successfully"
            });
        }
    }
}
