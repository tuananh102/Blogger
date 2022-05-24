using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class PostMetaResponse : Response
    {
        public PostMetaDto Data { get; set; }
    }
    public class ListPostMetaResponse : Response
    {
        public IEnumerable<PostMetaDto> Data { get; set; }
    }
}
