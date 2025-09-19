using Microsoft.AspNetCore.Mvc.ViewEngines;
using ReadBookRepo.Entity.RecommendedManga;
using ReadBookRepo.IRepo.IRecommendedMangaRepo;

namespace ReadBookRepo.Repo.RecommendedManga
{
    public class MysqlRecommendedMangaRepo : IRecommendedMangaRepo
    {
        public async Task<List<RecommendedMangaDto>> GetAll()
        {
            var result = new List<RecommendedMangaDto>
            {
                new RecommendedMangaDto
                {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "7",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "8",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "9",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "10",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "11",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "12",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "13",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "14",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "15",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "16",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "17",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "18",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/1.png",
                    title = "TÌNH YÊU MÀU NẮNG: CHÀ...",
                    views = "1.71M",
                    author = "Ngọt sủng / 419",
                    rank = "19",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/2.png",
                    title = "Bác Sĩ Hứa Tha Cho Tôi",
                    views = "1.42M",
                    author = "Yêu thầm / Ông Xã Thần Ph...",
                    rank = "20",
                },

                new RecommendedMangaDto
                {
                    img = "lib/imgs/3.png",
                    title = "Bất Cẩn Rung Động, Một Đời Nâng Niu",
                    views = "430.28K",
                    author = "Tình yêu / Tổng tài",
                    rank = "21",
                },

            };
            return result;
        }
    }
}
