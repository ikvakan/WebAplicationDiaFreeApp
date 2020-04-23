using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{
    public partial class SetupPage : System.Web.UI.Page
    {

        public string Language
        {
            get
            {
                if (Request.Cookies["languageOptions"] != null)
                {
                    if (Request.Cookies["languageOptions"]["language"] != null)
                    {
                        return Request.Cookies["languageOptions"]["language"];
                    }
                }
                return "";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Language == "hr")
            {
                Master.ShowLabel("Postavke");

            }
            else
                Master.ShowLabel("Settings");

            if (!IsPostBack)
            {
                if (Request.Cookies["languageOptions"] != null)
                {
                    ddlJezik.SelectedIndex = int.Parse(Request.Cookies["languageOptions"]["index"]);
                }
                else
                    ddlJezik.SelectedIndex = 0;
            }
        }

        protected void ddlJezik_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlJezik.SelectedValue!="0")
            {
                //var language = ddlJezik.SelectedValue;
                HttpCookie cookieLanguage = new HttpCookie("languageOptions");
                cookieLanguage.Expires.AddDays(10);
                cookieLanguage["language"] = ddlJezik.SelectedValue;
                cookieLanguage["index"] = ((DropDownList)sender).SelectedIndex.ToString();
                Response.Cookies.Add(cookieLanguage);
                Response.Redirect(Request.Url.LocalPath);

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