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
    public class PostMetaController : ControllerBase
    {
        private readonly IPostMetaService _postMetaService;
        private readonly IMapper _mapper;


        public PostMetaController(IPostMetaService postMetaService,
            IMapper mapper)
        {
            _postMetaService = postMetaService;
            _mapper = mapper;
        }


        // GET: api/<PostMetaController>
        [HttpGet]
        public async Task<ActionResult<PostMetaResponse>> GetAll()
        {
            try
            {
                var list = await _postMetaService.GetAllAsync();
                return Ok(new ListPostMetaResponse
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

        // GET api/<PostMetaController>/5
        [HttpGet("{id}")]
        public async Task<ActionResult<PostMetaResponse>> Get(int id)
        {
            var result = await _postMetaService.GetByIdAsync(id);

            //Handle exceptions
            if (result == null)
            {
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Error = $"Not found item with id: {id}",
                });
            }

            return Ok(new PostMetaResponse
            {
                IsSuccess = true,
                Data = result
            });
        }

        // POST api/<PostMetaController>
        [HttpPost]
        public async Task<ActionResult<Response>> PostMeta([FromBody] PostMetaRequest postRequest)
        {
            try
            {
                await _postMetaService.Create(_mapper.Map<PostMetaDto>(postRequest));
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

        // PUT api/<PostMetaController>/5
        [HttpPut]
        public async Task<ActionResult<Response>> Put([FromBody] PostMetaRequest postRequest)
        {
            try
            {
                await _postMetaService.Update(_mapper.Map<PostMetaDto>(postRequest));
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

        // DELETE api/<PostMetaController>/5
        [HttpDelete("{id}")]
        public ActionResult<Response> Delete(int id)
        {
            _postMetaService.Delete(id);
            return Ok(new Response
            {
                IsSuccess = true,
                Message = "Deleted successfully"
            });
        }
    }
}
