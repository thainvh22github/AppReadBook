using ReadBookRepo.Entity.RankingStories;
using ReadBookRepo.IRepo.IRankingStoriesRepo;

/// Tạo Repo thực thi (Fake data)
/// Đây là nơi cung cấp dữ liệu. Hiện đang trả dữ liệu giả (hardcode) 
/// để API có thể trả JSON.
namespace ReadBookRepo.Repo.RankingStories

{
    public class MysqlRankingStoriesRepo : IRankingStoriesRepo
    {
        public async Task<List<RankingStoriesDto>> GetAll()
        {
            var result = new List<RankingStoriesDto>
            {
                new RankingStoriesDto {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "1",
                },

                new RankingStoriesDto
                {
                    
                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "2",
  
                },

                new RankingStoriesDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "3",
                },
                new RankingStoriesDto {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "4",
                },

                new RankingStoriesDto
                {

                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "5",

                },

                new RankingStoriesDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "6",
                }



            };
            return result;
        }
        
    };

}
