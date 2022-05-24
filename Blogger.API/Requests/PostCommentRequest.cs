using Blogger.DAL.Models;
using System;

namespace Blogger_BE.Requests
{
    public class PostCommentRequest : BaseEntity
    {
        public string Title { get; set; }
        public int PostId { get; set; }
        public int ParentId { get; set; }
        public string Content { get; set; }

    }
}
