using Blogger.DAL.Models;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Blogger_BE.Requests
{
    public class PostRequest : BaseEntity
    {
        public int AuthorId { get; set; }
        public int ParentId { get; set; }
        [Required]
        public string Title { get; set; }
        public string MetaTitle { get; set; }

        public string Slug { get; set; }
        public string Summary { get; set; }
        public string Content { get; set; }
        [Required]
        public List<int> CategoryIds { get; set; }
        public List<int> TagIds { get; set; }
    }
}
