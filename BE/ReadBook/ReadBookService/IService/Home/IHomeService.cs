
using ReadBookRepo.Entity.Home;

namespace ReadBookService.IService.Home
{
    public interface IHomeService
    {
        Task<List<HomeEntity>> GetAll();
    }
}
