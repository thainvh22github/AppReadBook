using Microsoft.AspNetCore.Mvc;
using ReadBookRepo.IRepo.Localization;
using System.Collections;

namespace ReadBookApi.Controllers.Localization
{
    [ApiController]

    [Route("[Controller]")]
    public class LocalizationController : Controller
    {
        private ILocalizationRepo _repo;
        public LocalizationController(ILocalizationRepo repo) {
            _repo = repo;

        }
        [NonAction]
        public ILocalizationRepo Get_repo()
        {
            return _repo;
        }

        [HttpGet("all")]

        public async Task<IEnumerable> GetAll(ILocalizationRepo _repo)
        {
            var result = await _repo.GetAll();
            return result;
        }
    }
}
