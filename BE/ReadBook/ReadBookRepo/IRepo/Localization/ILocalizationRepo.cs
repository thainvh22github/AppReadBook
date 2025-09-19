using ReadBookRepo.Entity.Localization.Dto;

namespace ReadBookRepo.IRepo.Localization
{
    public interface ILocalizationRepo
    {
        Task<List<LocalizationDto>> GetAll();
    }
}
