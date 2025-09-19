
using ReadBookRepo.Entity.Home;
using ReadBookRepo.Entity.HotMangaStories.Dto;

namespace ReadBookService.IService.Home
{
    public interface IHomeService
    {
        Task<List<HotMangaStoriesDto>> GetAll();
    }
}
