using System;
using System.Web;

namespace http2demo
{
    public class LatencyModule : IHttpModule
    {
        /// <summary>
        /// You will need to configure this module in the Web.config file of your
        /// web and register it with IIS before being able to use it. For more information
        /// see the following link: http://go.microsoft.com/?linkid=8101007
        /// </summary>
        #region IHttpModule Members

        public void Dispose()
        {
            //clean-up code here.
        }

        public void Init(HttpApplication context)
        {
            // Below is an example of how you can handle LogRequest event and provide 
            // custom logging implementation for it
            //context.LogRequest += new EventHandler(OnLogRequest);
            context.PreRequestHandlerExecute += InduceLatency;
        }

        private void InduceLatency(object sender, EventArgs e)
        {
            int latency = 0;
            HttpRequest request = ((HttpApplication)sender).Request;
            
            if (request.RawUrl.Contains("images")&&request.QueryString.Count > 0 && !string.IsNullOrEmpty(request.QueryString["latency"]))
            {
                Int32.TryParse(request.QueryString["latency"], out latency);
                System.Threading.Thread.Sleep(latency);
            }
            if (request.RawUrl.ToLower().Contains("assets/js/ie-10-view-port.js")||(request.RawUrl.ToLower().Contains("designer2") && request.RawUrl.ToLower().Contains("portfolio") && request.RawUrl.ToLower().Contains("jpg")))
            {
                System.Threading.Thread.Sleep(20000);
            }
            
        }

        #endregion

        public void OnLogRequest(Object source, EventArgs e)
        {
            //custom logging logic can go here
        }
    }
}
