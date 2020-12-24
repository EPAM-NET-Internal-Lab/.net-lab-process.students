using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Prism.Commands;
using Prism.Mvvm;

namespace WpfApplicationPrism.ViewModels
{
    public abstract class ViewModelBase : BindableBase
    {
        public DelegateCommand LoadDataCommand => new DelegateCommand(async () => await LoadData());

        public virtual Task LoadData() => Task.CompletedTask;
    }
}
