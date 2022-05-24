
using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services
{
    public interface ICategoryService
    {
        Task<IEnumerable<CategoryDto>> GetAllAsync();
        Task<CategoryDto> GetByIdAsync(int id);
        Task Create(CategoryDto categoryDto);
        Task Update(CategoryDto categoryDto);
        Task Delete(int id);
        public Task<IQueryable<CategoryDto>> SortCategory(IQueryable<CategoryDto> source, string sortField, bool asc);
    }
}
