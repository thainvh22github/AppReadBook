using ReadBookRepo.Entity.RankingStories;

/// 2. Tạo Interface Repo
/// Giúp code phụ thuộc vào interface
namespace ReadBookRepo.IRepo.IRankingStoriesRepo
{

    public interface IRankingStoriesRepo
    {
        Task<List<RankingStoriesDto>> GetAll();
    }
}
