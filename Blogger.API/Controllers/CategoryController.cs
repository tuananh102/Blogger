using Blogger.BLL.Services;
using Blogger.BLL.DTOs;
using Microsoft.AspNetCore.Mvc;
using System;
using Microsoft.AspNetCore.Authorization;
using Blogger.DAL.Models;
using Blogger.BLL.Responses;
using Blogger_BE.Requests;
using AutoMapper;
using System.Threading.Tasks;
using System.Linq;

namespace Blogger_BE.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize(AuthenticationSchemes = JwtBearerDefaults.AuthenticationScheme)]

    //[Authorize(Roles = UserRoles.Admin)]
    //[Authorize(Roles = UserRoles.Blogger)]
    //[Authorize]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService _categoryService;
        private readonly IMapper _mapper;


        public CategoryController(ICategoryService categoryService,
            IMapper mapper)
        {
            _categoryService = categoryService;
            _mapper = mapper;
        }


        // GET: api/<CategoryController>
        [HttpGet]
        //[AllowAnonymous]
        public async Task<ActionResult<CategoryResponse>> GetAll()
        {
            try
            {
                var list = await _categoryService.GetAllAsync();
                return Ok(new ListCategoryResponse
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

        // GET api/<CategoryController>/5
        [HttpGet("{id}")]
        //[Authorize(Roles = UserRoles.Blogger)]
        public async Task<ActionResult<CategoryResponse>> Get(int id)
        {
            var result = await _categoryService.GetByIdAsync(id);

            //Handle exceptions
            if (result == null)
            {
                return NotFound(new Response
                {
                    IsSuccess = false,
                    Error = $"Not found item with id: {id}",
                });
            }

            return Ok(new CategoryResponse
            {
                IsSuccess = true,
                Data = result
            });
        }


        // POST api/<CategoryController>
        [HttpPost]
        public async Task<ActionResult<Response>> Category([FromBody] CategoryRequest categoryRequest)
        {
            try
            {
                await _categoryService.Create(_mapper.Map<CategoryDto>(categoryRequest));
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

        // PUT api/<CategoryController>/5
        [HttpPut]
        public async Task<ActionResult<Response>> Put([FromBody] CategoryRequest categoryRequest)
        {
            try
            {
                await _categoryService.Update(_mapper.Map<CategoryDto>(categoryRequest));
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

        // DELETE api/<CategoryController>/5
        [HttpDelete("{id}")]
        public ActionResult<Response> Delete(int id)
        {
            _categoryService.Delete(id);
            return Ok(new Response
            {
                IsSuccess = true,
                Message = "Deleted successfully"
            });
        }

        [HttpGet("Sort")]
        public async Task<ActionResult<CategoryRequest>> SortCategory(string sortField, bool asc = true)
        {
            try
            {
                var source = await _categoryService.GetAllAsync();
                var data = await _categoryService.SortCategory(source.AsQueryable(), sortField, asc);
                return Ok(new ListCategoryResponse()
                {
                    IsSuccess = true,
                    Data = data,
                });
            }
            catch (Exception ex)
            {
                return BadRequest(new CategoryResponse
                {
                    IsSuccess = false,
                    Error = ex.Message,
                });
            }
        }
        [HttpGet]
        [Route("[controller]/get-page")]
        public async Task<ActionResult<ListCategoryResponse>> GetAll(int? page, int? size)
        {
            try
            {
                var output = new ListCategoryResponse();
                var categories = await _categoryService.GetAllAsync();
                //output. = categories.Count();
                if (page.HasValue && size.HasValue)
                {
                    var entities = categories.Skip((page.Value - 1) * size.Value).Take(size.Value);
                    output.Data = entities;
                }
                else
                {
                    output.Data = categories;
                }
                output.IsSuccess = true;
                output.Message = "Success";
                return Ok(output);
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
    }
}
