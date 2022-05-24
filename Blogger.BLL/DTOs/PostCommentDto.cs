using Blogger.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.DTOs
{
    public class PostCommentDto : BaseEntity
    {
        public string Title { get; set; }
        public PostDto Post { get; set; }
        public int ParentId { get; set; }
        public string Content { get; set; }
    }
}
