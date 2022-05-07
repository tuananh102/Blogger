using Blogger.BLL.Services;
using Blogger.BLL.Services.Implementations;
using Blogger.DAL.Repositories;
using Blogger.DAL.Repositories.Implementations;
using Microsoft.Extensions.DependencyInjection;

namespace Blogger_BE.Configurations
{
    public class Dependencies
    {
        public static void AddDependencies(IServiceCollection services)
        {
            services.AddScoped(typeof(IRepository<>), typeof(Repository<>));
            services.AddScoped<IUnitOfWork, UnitOfWork>();
            services.AddScoped<IPostService, PostService>();
            services.AddScoped<IPostRepository, PostRepository>();
        }
    }
}
