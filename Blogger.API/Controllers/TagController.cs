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
    public class TagController : ControllerBase
    {
        private readonly ITagService _tagService;
        private readonly IMapper _mapper;


        public TagController(ITagService tagService,
            IMapper mapper)
        {
            _tagService = tagService;
            _mapper = mapper;
        }


        // GET: api/<TagController>
        [HttpGet]
        public async Task<ActionResult<TagResponse>> GetAll()
        {
            try
            {
                var list = await _tagService.GetAllAsync();
                return Ok(new ListTagResponse
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

        // GET api/<TagController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<TagResponse>> Get(int id)
        {
            var result = await _tagService.GetByIdAsync(id);

            //Handle exceptions
            if (result == null)
            {
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Error = $"Not found item with id: {id}",
                });
            }

            return Ok(new TagResponse
            {
                IsSuccess = true,
                Data = result
            });
        }

        // POST api/<TagController>
        [HttpPost]
        public async Task<ActionResult<Response>> Tag([FromBody] TagRequest tagRequest)
        {
            try
            {
                await _tagService.Create(_mapper.Map<TagDto>(tagRequest));
                return Ok(new Response
                {
                    IsSuccess = true,
                    Message = "Added successfully"
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

        // PUT api/<TagController>/5
        [HttpPut]
        public async Task<ActionResult<Response>> Put([FromBody] TagRequest tagRequest)
        {
            try
            {
                await _tagService.Update(_mapper.Map<TagDto>(tagRequest));
                return Ok(new Response
                {
                    IsSuccess = true,
                    Message = "Updated successfully"
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

        // DELETE api/<TagController>/5
        [HttpDelete("{id}")]
        public ActionResult<Response> Delete(int id)
        {
            _tagService.Delete(id);
            return Ok(new Response
            {
                IsSuccess = true,
                Message = "Deleted successfully"
            });
        }
    }
}
