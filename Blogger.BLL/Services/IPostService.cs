using Blogger.BLL.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services
{
    public interface IPostService
    {
        IEnumerable<PostVM> GetAll();
        PostVM GetById(int id);
        void Create(PostVM postVM);
        void Update(int id, PostVM postVM);
        Task Delete(int id);
    }
}
