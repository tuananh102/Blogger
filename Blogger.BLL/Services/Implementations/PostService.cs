using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger.DAL.Models;
using Blogger.DAL.Repositories;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Blogger.BLL.Services.Implementations
{
    public class PostService : IPostService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IPostRepository _postRepository;
        private readonly IMapper _mapper;
        public PostService(IUnitOfWork unitOfWork, 
            IMapper mapper,IPostRepository postRepository)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _postRepository = postRepository;
        }

        public async Task Create(PostDto postDto)
        {
            await _postRepository.CreateAsync(_mapper.Map<Post>(postDto));
            await _unitOfWork.CommitAsync();
        }

        public async Task Delete(int id)
        {
            var post = await _postRepository.FindByCondition(c => c.Id == id).FirstOrDefaultAsync();
            _postRepository.Remove(_mapper.Map<Post>(id));
            await _unitOfWork.CommitAsync();
        }

        /// <summary>
        /// Get all async
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<PostDto>> GetAllAsync()
        {
            var categories = await _postRepository.GetAllAsync();
            return _mapper.Map<IList<PostDto>>(categories);
        }


        public async Task<PostDto> GetByIdAsync(int id)
        {
            var post = await _postRepository.GetByIdAsync(id);
            return _mapper.Map<PostDto>(post);
        }

        public async Task Update(PostDto postDto)
        {
            var post = await _postRepository.GetByIdAsync(postDto.Id);
            if (post != null)
            {

                post = _mapper.Map<Post>(postDto);
                _postRepository.Update(post);
                await _unitOfWork.CommitAsync();
            }

        }
    }
}
