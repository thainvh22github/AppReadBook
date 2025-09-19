using Microsoft.AspNetCore.Mvc;
using ReadBookRepo.IRepo.IRecommendedMangaRepo;
using System.Collections;

namespace ReadBookApi.Controllers.RecommendedManga
{
    [ApiController]

    [Route("[Controller]")]
    public class RecommendedMangaController  : Controller
    {
        private IRecommendedMangaRepo _repo;

        public RecommendedMangaController(IRecommendedMangaRepo repo)
        {
            _repo = repo;
        }

        [NonAction]
        public IRecommendedMangaRepo GetRepo()
        {
            return _repo;
        }

        [HttpGet("all")]
        public async Task<IEnumerable> GetAll(IRecommendedMangaRepo _repo)
        {
            return await _repo.GetAll();
        }
    }
}
