using Blogger.BLL.DTOs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Blogger.BLL.Responses
{
    public class CategoryResponse : Response
    {
        public CategoryDto Data { get; set; }
    }
    public class ListCategoryResponse : Response
    {
        public IEnumerable<CategoryDto> Data { get; set; }
    }
}
