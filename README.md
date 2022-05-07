# Blogger
Data Flow: Presentation → Business Logic → Data Access
Lets consider data flow through controllers, services and repositories for GetPostById from REST endpoint to database:


Controllers (Presentation Layer) → Services (Business Logic Layer)

   // PostController
   
   [HttpGet("{id}")]
   
   public IActionResult GetById(int id) =>
      _postService.GetById(id);
      
   Services (Business Logic Layer) → Repositories (Data Access Layer)
   
   // PostService
   
   public PostVM GetById(int id) =>
      _unitOfWork.Posts.GetById(id); //Posts = IPostRepository
      
      
   Repositories (Data Access Layer) → Database Context (Database)
   
   // PostRepository
   public Post GetById(int id) =>_context.Set<Post>().Find(Id);
