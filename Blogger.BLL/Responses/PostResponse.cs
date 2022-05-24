using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class PostResponse : Response
    {
        public PostDto Data { get; set; }
    }
    public class ListPostResponse : Response
    {
        public IEnumerable<PostDto> Data { get; set; }
    }
}
