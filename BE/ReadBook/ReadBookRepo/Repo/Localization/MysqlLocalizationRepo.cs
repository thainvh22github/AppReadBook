using ReadBookRepo.Entity.Localization.Dto;
using ReadBookRepo.IRepo.Localization;

namespace ReadBookRepo.Repo.Localization
{
    public class MysqlLocalizationRepo : ILocalizationRepo
    {
        public Task<List<LocalizationDto>> GetAll()
        {
            var list = new List<LocalizationDto>
            {
                new LocalizationDto{ Key = "home_cannot_miss", Value = "Không thể bỏ lỡ" },
                new LocalizationDto{ Key = "home_hot", Value = "Hot nhất" },
                new LocalizationDto{ Key = "menu_home", Value = "Trang chủ" },
                new LocalizationDto{ Key = "menu_category", Value = "Danh mục" },
                new LocalizationDto{ Key = "menu_follow", Value = "Theo dõi" },
                new LocalizationDto{ Key = "menu_book", Value = "Tủ sách" },
                new LocalizationDto{ Key = "menu_self", Value = "Tôi" },
                new LocalizationDto{ Key = "search_hint", Value = "Tìm kiếm..." },

                /// text trang ranking_list
                new LocalizationDto{ Key = "ranking_this_month", Value = "BXH tháng này" },
                new LocalizationDto{ Key = "ranking_full", Value = "BXH hoàn chỉnh" },
                
                ///text trang recomment_list
                new LocalizationDto{ Key = "you_can_like", Value = "Có thể bạn sẽ thích" },
                new LocalizationDto{ Key = "more", Value = "Thêm" },
                new LocalizationDto{ Key = "all_shown", Value = "Đã hiển thị hết" },


            };
            return Task.FromResult(list);
        }
    }
}
