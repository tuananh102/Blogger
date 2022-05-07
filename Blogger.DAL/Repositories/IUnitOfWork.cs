using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories
{
    public interface IUnitOfWork 
    {
        IPostRepository Posts { get; }
        void Commit();
    }
}
