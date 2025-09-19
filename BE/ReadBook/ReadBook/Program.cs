///4. Đăng ký DI trong Program.cs
///Đăng ký để ASP.NET Core tự inject repo khi cần 
///(ví dụ vào controller).

using ReadBookRepo.IRepo.IRankingStoriesRepo;
using ReadBookRepo.IRepo.IRecommendedMangaRepo;
using ReadBookRepo.IRepo.Localization;
using ReadBookRepo.Repo;
using ReadBookRepo.Repo.Localization;
using ReadBookRepo.Repo.RankingStories;
using ReadBookRepo.Repo.RecommendedManga;
using ReadBookService.IService.Home;
using WedingModel.Service;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

// Đăng ký service với scope ở đây
builder.Services.AddScoped<IHomeService, HomeService>();
builder.Services.AddScoped<IHomeRepo, MysqlHomeRepo>();
builder.Services.AddScoped<IRankingStoriesRepo, MysqlRankingStoriesRepo>();
builder.Services.AddScoped<IRecommendedMangaRepo, MysqlRecommendedMangaRepo>();
builder.Services.AddScoped<ILocalizationRepo, MysqlLocalizationRepo>(); 

builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll",
        policy => policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader());
});

var app = builder.Build();

app.UseCors("AllowAll");

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
