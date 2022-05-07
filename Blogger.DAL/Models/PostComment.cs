using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.DAL.Models
{
    public class PostComment
    {
        public int Id { get; set; }

        public string Title { get; set; }
        public Post Post { get; set; }
        public int ParentId { get; set; }
        public bool Published { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime PublishedAt { get; set; }
        public string Content { get; set; }

    }
}
