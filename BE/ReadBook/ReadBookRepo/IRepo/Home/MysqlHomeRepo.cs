

using ReadBookRepo.Entity.Home;

namespace ReadBookRepo.Repo
{
    public class MysqlHomeRepo : IHomeRepo
    {
        public MysqlHomeRepo()
        {

        }

        public async Task<List<HomeEntity>> GetAll()
        {
            throw new NotImplementedException();
        }
    }
}
