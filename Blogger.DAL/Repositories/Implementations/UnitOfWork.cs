using Blogger_BE.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories.Implementations
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly AppDbContext _context;
        public IPostRepository Posts { get; }


        public UnitOfWork(AppDbContext context,
            IPostRepository postRepository)
        {
            _context = context;

            Posts = postRepository;
        }

        #region IUnitOfWork Members
        /// <summary>
        /// Save all changes
        /// </summary>
        public void Commit()
        {
            _context.SaveChanges();
        }

        /// <summary>
        /// Dispose
        /// </summary>
        public void Dispose()
        {
            _context.Dispose();
        }
        #endregion
    }
}
