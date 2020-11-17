using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(LMS.UI.MVC.Startup))]
namespace LMS.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
