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
    public class PostMetaService : IPostMetaService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IPostMetaRepository _postMetaRepository;
        private readonly IMapper _mapper;
        public PostMetaService(IUnitOfWork unitOfWork, IMapper mapper,IPostMetaRepository postMetaRepository)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _postMetaRepository = postMetaRepository;
        }

        public async Task Create(PostMetaDto postMetaDto)
        {

            await _postMetaRepository.CreateAsync(_mapper.Map<PostMeta>(postMetaDto));
            await _unitOfWork.CommitAsync();
        }

        public async Task Delete(int id)
        {
            var postMeta = await _postMetaRepository.FindByCondition(c => c.Id == id).FirstOrDefaultAsync();
            _postMetaRepository.Remove(_mapper.Map<PostMeta>(postMeta));
            await _unitOfWork.CommitAsync();
        }

        /// <summary>
        /// Get all async
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<PostMetaDto>> GetAllAsync()
        {
            var categories = await _postMetaRepository.GetAllAsync();
            return _mapper.Map<IList<PostMetaDto>>(categories);
        }


        public async Task<PostMetaDto> GetByIdAsync(int id)
        {
            var postMeta = await _postMetaRepository.GetByIdAsync(id);
            return _mapper.Map<PostMetaDto>(postMeta);
        }

        public async Task Update(PostMetaDto postMetaDto)
        {
            var postMeta = await _postMetaRepository.GetByIdAsync(postMetaDto.Id);
            if (postMeta != null)
            {

                postMeta = _mapper.Map<PostMeta>(postMetaDto);
                _postMetaRepository.Update(postMeta);
                await _unitOfWork.CommitAsync();
            }

        }
    }
}
