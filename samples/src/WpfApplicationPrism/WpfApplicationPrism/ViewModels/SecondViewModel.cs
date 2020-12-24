using System.Collections.Generic;
using System.Threading.Tasks;
using Prism.Commands;
using WpfApplicationPrism.Services;

namespace WpfApplicationPrism.ViewModels
{
    public class SecondViewModel : ViewModelBase
    {
        private readonly IPetService _petService;
        private List<DogImage> _randomDogsDogImages;

        public SecondViewModel(IPetService petService)
        {
            _petService = petService;
            LoadingCommand = new DelegateCommand(async () => await DownloadData());
        }

        public DelegateCommand LoadingCommand { get; private set; }

        public List<DogImage> RandomDogs
        {
            get => _randomDogsDogImages;
            set => SetProperty(ref _randomDogsDogImages, value);
        }
        
        private async Task DownloadData()
        {
            RandomDogs = await _petService.DownloadRandomDogs();
        }

        public override async Task LoadData()
        {
            await base.LoadData();
            await DownloadData();
        }
    }
}
