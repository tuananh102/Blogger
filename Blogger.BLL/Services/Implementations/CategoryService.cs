using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger.DAL.Models;
using Blogger.DAL.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace Blogger.BLL.Services.Implementations
{
    public class CategoryService : ICategoryService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ICategoryRepository _categoryRepository;
        private readonly IMapper _mapper;
        public CategoryService(IUnitOfWork unitOfWork, IMapper mapper,
            ICategoryRepository categoryRepository)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _categoryRepository = categoryRepository;
        }

        public async Task Create(CategoryDto categoryDto)
        {

            await _categoryRepository.CreateAsync(_mapper.Map<Category>(categoryDto));
            await _unitOfWork.CommitAsync();
        }

        public async Task Delete(int id)
        {
            var category = await _categoryRepository.FindByCondition(c=>c.Id==id).FirstOrDefaultAsync();
            _categoryRepository.Remove(_mapper.Map<Category>(category));
            await _unitOfWork.CommitAsync();
        }

        /// <summary>
        /// Get all async
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<CategoryDto>> GetAllAsync()
        {
            var categories = await _categoryRepository.GetAllAsync();
            return _mapper.Map<IList<CategoryDto>>(categories);
        }


        public async Task<CategoryDto> GetByIdAsync(int id)
        {
            var category = await _categoryRepository.GetByIdAsync(id);
            return _mapper.Map<CategoryDto>(category);
        }

        public async Task Update(CategoryDto categoryDto)
        {
            var category = await _categoryRepository.GetByIdAsync(categoryDto.Id);
            if (category != null)
            {

                category = _mapper.Map<Category>(categoryDto);
                _categoryRepository.Update(category);
                await _unitOfWork.CommitAsync();
            }

        }

        /// <summary>
        /// Sort by field 
        /// </summary>
        /// <param name="source"></param>
        /// <param name="sortField"></param>
        /// <param name="asc"></param>
        /// <returns></returns>
        public Task<IQueryable<CategoryDto>> SortCategory(IQueryable<CategoryDto> source, string sortField, bool asc)
        {
            if (string.IsNullOrEmpty(sortField) || !IsFieldTable(sortField.Trim(), out PropertyInfo field))
            {
                return Task.FromResult(source);
            }
            if (asc)
            {
                source = source.OrderBy(x => field.GetValue(x, null));
                return Task.FromResult(source);
            }
            else
            {
                source = source.OrderByDescending(x => field.GetValue(x, null));
                return Task.FromResult(source);
            }

        }

        /// <summary>
        /// Check field is avaiable or not
        /// </summary>
        /// <param name="field"></param>
        /// <param name="sortfield"></param>
        /// <returns></returns>
        protected static bool IsFieldTable(string field, out PropertyInfo sortfield)
        {
            foreach (PropertyInfo prop in typeof(CategoryDto).GetProperties())
            {
                if (prop.Name.ToString().Equals(field, StringComparison.OrdinalIgnoreCase))
                {
                    sortfield = prop;
                    return true;
                }
            }
            sortfield = null;
            return false;
        }

    }
}
