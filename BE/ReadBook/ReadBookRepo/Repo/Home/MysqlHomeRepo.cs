

using ReadBookRepo.Entity.Home;
using ReadBookRepo.Entity.HotMangaStories.Dto;

namespace ReadBookRepo.Repo
{
    public class MysqlHomeRepo : IHomeRepo
    {
        public MysqlHomeRepo()
        {

        }

        public async Task<List<HotMangaStoriesDto>> GetAll()
        {
            var result = new List<HotMangaStoriesDto>
            {
                new HotMangaStoriesDto
                {
                    title = "Hợp Đồng Hôn Nhân Với Tổng Tài Ác Ma",
                    categories = new List<string>
                    {
                        "Hôn Nhân", "Ngôn Tình"
                    },
                    image = "lib/imgs/onepiece.jpg",
                },
                new HotMangaStoriesDto
                {
                    title = "Hợp Đồng Hôn Nhân Với Tổng Tài Ác Ma 1",
                    categories = new List<string>
                    {
                        "Hôn Nhân", "Ngôn Tình"
                    },
                    image = "lib/imgs/onepiece.jpg",
                },
                new HotMangaStoriesDto
                {
                    title = "Hợp Đồng Hôn Nhân Với Tổng Tài Ác Ma 2",
                    categories = new List<string>
                    {
                        "Hôn Nhân", "Ngôn Tình"
                    },
                    image = "lib/imgs/onepiece.jpg",
                },
                new HotMangaStoriesDto
                {
                    title = "Hợp Đồng Hôn Nhân Với Tổng Tài Ác Ma 3",
                    categories = new List<string>
                    {
                        "Hôn Nhân", "Ngôn Tình"
                    },
                    image = "lib/imgs/onepiece.jpg",
                },
                new HotMangaStoriesDto
                {
                    title = "Hợp Đồng Hôn Nhân Với Tổng Tài Ác Ma 4",
                    categories = new List<string>
                    {
                        "Hôn Nhân", "Ngôn Tình"
                    },
                    image = "lib/imgs/onepiece.jpg",
                }
            };
            return result;
        }
    }
}
