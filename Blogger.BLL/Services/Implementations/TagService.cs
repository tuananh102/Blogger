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
    public class TagService : ITagService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly ITagRepository _tagRepository;
        private readonly IMapper _mapper;
        public TagService(IUnitOfWork unitOfWork, IMapper mapper,
            ITagRepository tagRepository)
        {
            _unitOfWork = unitOfWork;
            _mapper = mapper;
            _tagRepository = tagRepository;
        }

        public async Task Create(TagDto tagDto)
        {

            await _tagRepository.CreateAsync(_mapper.Map<Tag>(tagDto));
            await _unitOfWork.CommitAsync();
        }

        public async Task Delete(int id)
        {
            var tag = await _tagRepository.FindByCondition(c => c.Id == id).FirstOrDefaultAsync();
            _tagRepository.Remove(_mapper.Map<Tag>(id));
            await _unitOfWork.CommitAsync();
        }

        /// <summary>
        /// Get all async
        /// </summary>
        /// <returns></returns>
        public async Task<IEnumerable<TagDto>> GetAllAsync()
        {
            var list = await _tagRepository.GetAllAsync();
            return _mapper.Map<IList<TagDto>>(list);
        }


        public async Task<TagDto> GetByIdAsync(int id)
        {
            var tag = await _tagRepository.GetByIdAsync(id);
            return _mapper.Map<TagDto>(tag);
        }

        public async Task Update(TagDto tagDto)
        {
            var tag = await _tagRepository.GetByIdAsync(tagDto.Id);
            if (tag != null)
            {

                tag = _mapper.Map<Tag>(tagDto);
                _tagRepository.Update(tag);
                await _unitOfWork.CommitAsync();
            }

        }
    }
}
