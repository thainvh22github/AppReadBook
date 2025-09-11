using System.Collections;
using Microsoft.AspNetCore.Mvc;
using ReadBookService.IService.Home;

namespace Weding.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class HomeController : ControllerBase
    {

        private readonly IServiceProvider _serviceProvider;

        public HomeController(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        [HttpGet("all")]
        public async Task<IEnumerable> GetAll()
        {
            var service = _serviceProvider.GetRequiredService<IHomeService>();
            var result = await service.GetAll();
            return result;
        }
    }
}
