using Blogger_BE.Data;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories.Implementations
{
    public class Repository<T> : IRepository<T> where T : class 
    {
        private readonly AppDbContext _context;
        public Repository(AppDbContext context)
        {   
            _context = context;
        }
        /// <summary>
        /// Implement Create method
        /// </summary>
        /// <param name="_object"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public void Create(T _object)
        {
           _context.Set<T>().Add(_object);
        }

        public void Delete(T _object)
        {
            _context.Set<T>().Remove(_object);
        }

        public IEnumerable<T> GetAll()
        {
            return _context.Set<T>().ToList();
        }

        public T GetById(int Id)
        {
            return _context.Set<T>().Find(Id);
        }

        public bool Update(T _object)
        {
            _context.Entry(_object).State = EntityState.Modified;
            return true;
        }

    }
}
