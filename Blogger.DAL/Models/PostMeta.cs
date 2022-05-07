namespace Blogger.DAL.Models
{
    public class PostMeta
    {
        public int Id { get; set; } 
        public Post Post { get; set; }
        public string Key { get; set; }
        public string Content { get; set; }
    }
}