using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Hosting;
using System;
using System.IO;

namespace WebApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            CreateHostBuilder(args).Build().Run();
        }

        public static IHostBuilder CreateHostBuilder(string[] args) =>
            Host.CreateDefaultBuilder(args)
                .ConfigureWebHostDefaults(webBuilder =>
                {
                    webBuilder.UseStartup<Startup>();
                    var env = Environment.GetEnvironmentVariable("ASPNETCORE_ENVIRONMENT");
                    var configuration = new ConfigurationBuilder()
                        .SetBasePath(Directory.GetCurrentDirectory())
                        .AddJsonFile("appsettings.json")
                        .AddJsonFile($"appsettings.{env}.json")
                        .AddEnvironmentVariables()
                        .Build();

                    webBuilder.UseConfiguration(configuration);
                });
    }
}
