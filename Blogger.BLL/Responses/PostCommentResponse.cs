using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class PostCommentResponse : Response
    {
        public PostCommentDto Data { get; set; }
    }
    public class ListPostCommentResponse : Response
    {
        public IEnumerable<PostCommentDto> Data { get; set; }
    }
}
