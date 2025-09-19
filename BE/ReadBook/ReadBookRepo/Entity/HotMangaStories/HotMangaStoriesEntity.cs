using System.ComponentModel.DataAnnotations;

/// entity t
namespace ReadBookRepo.Entity.HotMangaStories
{
    public class HotMangaStoriesEntity
    {
        /// <summary>
        /// 
        /// </summary>
        [Key]
        public Guid pk_id { get; set; }


        public string title { get; set; }


        public List<string> categories { get; set; }


        public string image { get; set; }
    }
}
