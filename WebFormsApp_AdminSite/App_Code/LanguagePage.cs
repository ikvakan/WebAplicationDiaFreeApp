using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;

namespace WebFormsApp_AdminSite.App_Code
{
    public class LanguagePage : System.Web.UI.Page
    {
        public int DDLIndexLanguage
        {
            get
            {
                if (Request.Cookies["languageOptions"] != null)
                {
                    if (Request.Cookies["languageOptions"]["index"] != null)
                    {
                        return int.Parse(Request.Cookies["languageOptions"]["index"]);
                    }
                }
                    return 0;
            }
            set
            {
                Request.Cookies["languageOptions"]["index"] = value.ToString();
            }
        }


        protected override void InitializeCulture()
        {
            if (Request.Cookies["languageOptions"] != null)
            {
                if (Request.Cookies["languageOptions"]["language"] != null)
                {
                    string kultura = Request.Cookies["languageOptions"]["language"];
                    Thread.CurrentThread.CurrentCulture = new CultureInfo(kultura);
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(kultura);
                }
            }
            base.InitializeCulture();
        }
    }
}