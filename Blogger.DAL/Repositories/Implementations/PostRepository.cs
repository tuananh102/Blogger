using Blogger.DAL.Models;
using Blogger_BE.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories.Implementations
{
    public class PostRepository : IPostRepository
    {
        private readonly AppDbContext _context;

        public PostRepository(AppDbContext context)
        {
            _context = context;
        }
        /// <summary>
        /// Create new Post
        /// </summary>
        public void Create(Post _object)
        {
            try
            {
                _context.Add<Post>(_object);
            }
            catch (Exception)
            {
                throw;
            }
        }

        /// <summary>
        /// Delete Post
        /// </summary>
        public void Delete(Post _object)
        {
            _context.Remove<Post>(_object);
        }

        /// <summary>
        /// Get all posts
        /// </summary>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public IEnumerable<Post> GetAll()
        {
            return _context.Posts.ToList();
        }

        /// <summary>
        /// Get Post by Id
        /// </summary>
        public Post GetById(int Id)
        {
            return _context.Posts.Find(Id); 
        }
        /// <summary>
        /// Update a Post
        public void Update(Post _object)
        {
            throw new NotImplementedException();
        }

        void IRepository<Post>.Create(Post _object)
        {
            throw new NotImplementedException();
        }

        bool IRepository<Post>.Update(Post _object)
        {
            throw new NotImplementedException();
        }
    }
}
