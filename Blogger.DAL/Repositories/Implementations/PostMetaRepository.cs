using Blogger.DAL.Models;
using Blogger_BE.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories.Implementations
{
    public class PostMetaRepository : Repository<PostMeta>, IPostMetaRepository
    {
        public PostMetaRepository(AppDbContext context) : base(context)
        {
        }
    }
}
