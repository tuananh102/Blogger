using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger.DAL.Models;
using Blogger.DAL.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Services.Implementations
{
    public class PostCommentService : IPostCommentService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IPostCommentRepository _postCommentRepository;
        private readonly IMapper _mapper;
        public PostCommentService(IUnitOfWork unitOfWork, IMapper mapper,
            IPostCommentRepository postCommentRepository)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _postCommentRepository = postCommentRepository;
        }

        public async Task Create(PostCommentDto postcommentDto)
        {

            await _postCommentRepository.CreateAsync(_mapper.Map<PostComment>(postcommentDto));
            await _unitOfWork.CommitAsync();
        }

        public async Task Delete(int id)
        {
            var postComment = await _postCommentRepository.FindByCondition(c => c.Id == id).FirstOrDefaultAsync();
            _postCommentRepository.Remove(_mapper.Map<PostComment>(postComment));
            await _unitOfWork.CommitAsync();
        }

        /// <summary>
        /// Get all async
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<PostCommentDto>> GetAllAsync()
        {
            var postComments = await _postCommentRepository.GetAllAsync();
            return _mapper.Map<IList<PostCommentDto>>(postComments);
        }


        public async Task<PostCommentDto> GetByIdAsync(int id)
        {
            var postComment = await _postCommentRepository.GetByIdAsync(id);
            return _mapper.Map<PostCommentDto>(postComment);
        }

        public async Task Update(PostCommentDto postcommentDto)
        {
            var postComment = await _postCommentRepository.GetByIdAsync(postcommentDto.Id);
            if (postComment != null)
            {

                postComment = _mapper.Map<PostComment>(postcommentDto);
                _postCommentRepository.Update(postComment);
                await _unitOfWork.CommitAsync();
            }

        }

    }
}
