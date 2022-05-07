using AutoMapper;
using Blogger.BLL.ViewModels;
using Blogger.DAL.Models;
using Blogger.DAL.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services.Implementations
{
    public class PostService : IPostService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IMapper _mapper;
        public PostService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
        }
        public void Create(PostVM postVM)
        {
            _unitOfWork.Posts.Create(_mapper.Map<Post>(postVM));
        }

        public Task Delete(PostVM postVM)
        {
            _unitOfWork.Posts.Delete(_mapper.Map<Post>(postVM));
            return Task.CompletedTask;
        }

        public IEnumerable<PostVM> GetAll()
        {
            List<PostVM> result = new();
            var posts = _unitOfWork.Posts.GetAll();
            foreach (var post in posts)
            {
                result.Add(_mapper.Map<PostVM>(post));
            }
            return result;
        }

        public PostVM GetById(int id)
        {
            var post = _unitOfWork.Posts.GetById(id);

            return _mapper.Map<PostVM>(post);

        }

        public void Update(int id, PostVM postVM)
        {
            var post = _unitOfWork.Posts.GetById(id);
            _unitOfWork.Posts.Update(post);
        }

        public Task Delete(int id)
        {
            var post = _unitOfWork.Posts.GetById(id);
            _unitOfWork.Posts.Delete(post);
            return Task.CompletedTask;
        }
    }
}
