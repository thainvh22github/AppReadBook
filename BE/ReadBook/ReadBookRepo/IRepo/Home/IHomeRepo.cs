
using ReadBookRepo.Entity.Home;
using ReadBookRepo.Entity.HotMangaStories.Dto;

namespace ReadBookRepo.Repo
{
    public interface IHomeRepo
    {
        Task<List<HotMangaStoriesDto>> GetAll();
    }
}
