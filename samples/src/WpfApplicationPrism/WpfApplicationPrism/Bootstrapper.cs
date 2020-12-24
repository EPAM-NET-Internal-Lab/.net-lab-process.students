using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using Prism;
using Prism.Ioc;
using Prism.Unity;
using WpfApplicationPrism.Services;
using WpfApplicationPrism.Views;

namespace WpfApplicationPrism
{
    public class Bootstrapper : PrismBootstrapper
    {
        /// <summary>
        /// Used to register types with the container that will be used by your application.
        /// </summary>
        protected override void RegisterTypes(IContainerRegistry containerRegistry)
        {
            containerRegistry.RegisterSingleton<IPetService, PetService>();
        }

        /// <summary>Creates the shell or main window of the application.</summary>
        /// <returns>The shell of the application.</returns>
        protected override DependencyObject CreateShell() => Container.Resolve<SecondView>();
    }
}
