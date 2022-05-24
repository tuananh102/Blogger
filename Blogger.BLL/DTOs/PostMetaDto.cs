using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.DTOs
{
    public class PostMetaDto
    {
        public int Id { get; set; }
        public PostDto Post { get; set; }
        public string Key { get; set; }
        public string Content { get; set; }

    }
}
