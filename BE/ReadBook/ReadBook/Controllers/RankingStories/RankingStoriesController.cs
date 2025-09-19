using Microsoft.AspNetCore.Mvc;
using ReadBookRepo.IRepo.IRankingStoriesRepo;
using System.Collections;

///5. Tạo Controller (API endpoint)
///Controller định nghĩa route/endpoint 
///(ví dụ GET /api/RankingStories) để FE gọi.
namespace ReadBookApi.Controllers.RankingStories
{
    [ApiController]

    /// Tự động lấy tên controller (bỏ chữ Controller) làm route gốc.
    [Route("[Controller]")]
    public class RankingStoriesController : Controller
    {
        private IRankingStoriesRepo _repo;


        public RankingStoriesController(IRankingStoriesRepo repo) {
            _repo = repo;
        }

        [NonAction]
        public IRankingStoriesRepo Get_repo()
        {
            return _repo;
        }

        /// GET /rankingstories/all
        [HttpGet("all")]
        public async Task<IEnumerable> GetAll(IRankingStoriesRepo _repo)
        {
            // Lấy service từ DI container
            var result = await _repo.GetAll();  // Gọi repo để lấy dữ liệu
            return result;                   // Trả về HTTP 200 + JSON

        }
    }
}
