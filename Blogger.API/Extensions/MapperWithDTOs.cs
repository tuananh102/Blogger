using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger_BE.Requests;

namespace Blogger_BE.Extensions
{
    public class MapperWithDTOs : Profile
    {
        public MapperWithDTOs()
        {
            #region Map with DTOs in BLL
            CreateMap<PostRequest, PostDto>().ReverseMap();
            CreateMap<CategoryRequest, CategoryDto>().ReverseMap();
            CreateMap<PostCommentRequest, PostCommentDto>().ReverseMap();
            CreateMap<PostMetaRequest, PostMetaDto>().ReverseMap();
            CreateMap<TagRequest, TagDto>().ReverseMap();

            #endregion
        }
    }
}
