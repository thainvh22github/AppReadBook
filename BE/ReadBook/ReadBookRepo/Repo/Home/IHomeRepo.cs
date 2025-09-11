
using ReadBookRepo.Entity.Home;

namespace ReadBookRepo.Repo
{
    public interface IHomeRepo
    {
        Task<List<HomeEntity>> GetAll();
    }
}
