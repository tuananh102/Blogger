using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Repositories
{
    public interface IRepository<T> where T : class
    {
        /// <summary>
        /// Get all
        /// </summary>
        /// <returns></returns>
        IEnumerable<T> GetAll();
        /// <summary>
        /// Get by Id
        /// </summary>
        /// <param name="Id"></param>
        /// <returns></returns>
        T GetById(int Id);
        /// <summary>
        /// Create new
        /// </summary>
        /// <param name="_object"></param>
        /// <returns></returns>
        void Create(T _object);
        /// <summary>
        /// Update record
        /// </summary>
        /// <param name="_object"></param>
        bool Update(T _object);
        /// <summary>
        /// Delete by Id
        /// </summary>
        /// <param name="_object"></param>
        void Delete(T _object);
    }
}
