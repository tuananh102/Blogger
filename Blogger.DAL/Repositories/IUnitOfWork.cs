using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories
{
    public interface IUnitOfWork : IDisposable
    {
        //IPostRepository Posts { get; }
        //ICategoryRepository Categories { get; }
        void Commit();
        Task CommitAsync();
    }
}
