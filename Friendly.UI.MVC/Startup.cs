using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Friendly.UI.MVC.Startup))]
namespace Friendly.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
