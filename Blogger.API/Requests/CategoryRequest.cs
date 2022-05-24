using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Blogger_BE.Requests
{
    public class CategoryRequest
    {
        public int Id { get; set; }
        public int? ParentId { get; set; }
        [Required]
        public string Title { get; set; }
        [Required]
        public string MetaTitle { get; set; }
        public string Slug { get; set; }
        public string Content { get; set; }
        public List<int> PostIds { get; set; }
    }
}
