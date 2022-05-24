using AutoMapper;
using Blogger.BLL.DTOs;
using Blogger.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Configurations
{
    public class MapperInitilizer : Profile
    {
        public MapperInitilizer()
        {
            #region Map with models in Data
            CreateMap<Post, PostDto>().ReverseMap();
            CreateMap<Category, CategoryDto>().ReverseMap();
            CreateMap<Category, CategoryWithPostsDto>().ReverseMap();

            CreateMap<PostComment, PostCommentDto>().ReverseMap();
            CreateMap<PostMeta, PostMetaDto>().ReverseMap();
            CreateMap<Tag, TagDto>().ReverseMap();
            #endregion
        }

    }
}
