using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.DependencyInjection;
using ReadBookRepo.Entity.Home;
using ReadBookRepo.Repo;
using ReadBookService.IService.Home;

namespace WedingModel.Service
{
    public class HomeService : IHomeService
    {
        private readonly IHomeRepo _repo;
        public HomeService(IHomeRepo repo)
        {
            _repo = repo;
        }

        /// <summary>
        /// Lấy toàn bộ giá trị comment
        /// </summary>
        /// <returns></returns>
        public async Task<List<HomeEntity>> GetAll()
        {
            var result = await _repo.GetAll();

            return result;
        }
    }
}
