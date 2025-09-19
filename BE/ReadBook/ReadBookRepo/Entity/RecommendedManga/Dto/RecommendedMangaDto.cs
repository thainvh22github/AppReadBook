using System.ComponentModel.DataAnnotations;

/// 1.Tạo DTO
///DTO là lớp mô tả cấu trúc dữ liệu mà API sẽ trả
///hoặc nhận (ở đây: img, title, views, author, rank).

namespace ReadBookRepo.Entity.RecommendedManga
{
    public class RecommendedMangaDto
    {
        [Key]

        public Guid pk_id { get; set; }

        public string img { get; set; }

        public String title { get; set; }

        public String views { get; set; }

        public String author { get; set; }

        public String rank { get; set; }


    }
}
