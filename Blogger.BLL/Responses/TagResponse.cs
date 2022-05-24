using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class TagResponse : Response
    {
        public TagDto Data { get; set; }
    }
    public class ListTagResponse : Response
    {
        public IEnumerable<TagDto> Data { get; set; }
    }
}
