using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services
{
    public interface IPostMetaService
    {
        Task<IEnumerable<PostMetaDto>> GetAllAsync();
        Task<PostMetaDto> GetByIdAsync(int id);
        Task Create(PostMetaDto postMetaDto);
        Task Update(PostMetaDto postMetaDto);
        Task Delete(int id);
    }
}
