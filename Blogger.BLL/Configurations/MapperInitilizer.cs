using AutoMapper;
using Blogger.BLL.ViewModels;
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
            CreateMap<Post, PostVM>().ReverseMap();
        }

    }
}
