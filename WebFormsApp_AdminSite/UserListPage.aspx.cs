using ClassLibrary.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{

    public partial class UserListPage : System.Web.UI.Page
    {
        private IRepo repo = RepoFactory.GetRepo();

        protected void Page_Load(object sender, EventArgs e)
        {
            
            
        }

        protected void lbUredi_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            var korisnikID =int.Parse(btn.CommandArgument);

            var korisnik = repo.GetUserById(korisnikID);


            HttpCookie httpCookie = new HttpCookie("podaci");

            httpCookie["korisnikID"] =korisnik.IDKorisnik.ToString();
            httpCookie["Ime"] =korisnik.Ime;
            httpCookie["Prezime"] =korisnik.Prezime;

            httpCookie.Expires = DateTime.Now.AddSeconds(10);
            Response.Cookies.Add(httpCookie);

            Response.Redirect("EditUserPage.aspx");
            
        }
    }
}