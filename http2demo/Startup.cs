using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(http2demo.Startup))]
namespace http2demo
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
