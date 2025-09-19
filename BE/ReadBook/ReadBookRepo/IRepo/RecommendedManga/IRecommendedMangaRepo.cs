using ReadBookRepo.Entity.RecommendedManga;

/// 2. Tạo Interface Repo
/// Giúp code phụ thuộc vào interface
namespace ReadBookRepo.IRepo.IRecommendedMangaRepo
{
    public interface IRecommendedMangaRepo
    {
        Task<List<RecommendedMangaDto>> GetAll();
    }
}
