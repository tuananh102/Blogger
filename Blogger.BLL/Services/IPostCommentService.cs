using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services
{
    public interface IPostCommentService
    {
        Task<IEnumerable<PostCommentDto>> GetAllAsync();
        Task<PostCommentDto> GetByIdAsync(int id);
        Task Create(PostCommentDto postCommentdto);
        Task Update(PostCommentDto postCommentdto);
        Task Delete(int id);
    }

}
