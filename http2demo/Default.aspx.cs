using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace http2demo
{
    public partial class _Default : Page
    {
        public Dictionary<string, List<string>> Images;
        public string MyQueryString = string.Empty;
        public string HTTPSBaseURL { get {
                return  "https://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
            } }

        public string HTTPBaseURL
        {
            get
            {
                return "http://" + Request.Url.Authority + Request.ApplicationPath.TrimEnd('/') + "/";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            string path = Server.MapPath("~/images");
            Images = new Dictionary<string, List<string>>();
            foreach (var item in System.IO.Directory.EnumerateFiles(path,"*.png"))
            {
                string[] names = item.Split('-');
                if(!Images.ContainsKey(names[1]))
                {
                    Images.Add(names[1], new List<string>() {names[2]});
                }
                else
                    Images[names[1]].Add(names[2]);
            }
            if (!string.IsNullOrEmpty(Request.QueryString["latency"]))
            {
                MyQueryString = "latency=" + Request.QueryString["latency"];
            }

        }
    }
}