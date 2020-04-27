
using ClassLibrary.DAL;

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

    public partial class UserListPage : System.Web.UI.Page  
    {

        private static IKorisnik repo = RepoFactory.GetKorisnikRepo();

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
            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginPage.aspx");
            }


            if (Language == "hr")
            {

                Master.ShowLabel("Popis korisnika");
            }
            else
                Master.ShowLabel("Users");

            if (!IsPostBack)
            {
                ConnectDataSource();

            }
        }

        private void ConnectDataSource()
        {
            repeaterPopisKorisnika.DataSource = repo.GetAllUsers();
            repeaterPopisKorisnika.DataBind();
        }

        protected void lbUredi_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            var idKorisnik = btn.CommandArgument;

            HttpCookie cookie = new HttpCookie("podaci");
            cookie["IDKorisnik"] = idKorisnik;
            cookie.Expires = DateTime.Now.AddSeconds(30);
            Response.Cookies.Add(cookie);

            Response.Redirect("EditUserPage.aspx");

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

        protected void lbObrisi_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            var id = int.Parse(btn.CommandArgument);
            repo.DeleteUser(id);

            Response.Redirect(Request.Url.LocalPath);
            
        }
    }
}