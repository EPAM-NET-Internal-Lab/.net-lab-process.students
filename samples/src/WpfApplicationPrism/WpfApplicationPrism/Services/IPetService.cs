using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace WpfApplicationPrism.Services
{
    public interface IPetService
    {
        Task<List<DogImage>> DownloadRandomDogs();
    }

    public record DogImage (string Image);

    public class PetService : IPetService
    {
        private static readonly HttpClient RandomDogHttpClient;

        static PetService()
        {
            RandomDogHttpClient = new HttpClient();
        }
        
        public async Task<List<DogImage>> DownloadRandomDogs()
        {
            var randomDogs = await RandomDogHttpClient.GetFromJsonAsync<DogResponse>("https://dog.ceo/api/breeds/image/random/20");
            return randomDogs?.Message.Select(x => new DogImage(x)).ToList();
        }

        private record DogResponse(List<string> Message, string Status);
    }
}
