using ClassLibrary.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{
    public partial class EditUserPage : System.Web.UI.Page
    {
        private IRepo repo = RepoFactory.GetRepo();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Cookies["podaci"] != null)
            {
                FillEditForm();
            }
            else
            {

                Response.Redirect("UserListPage.aspx");
            }

        }

       
        private void FillEditForm()
        {
            HttpCookie httpCookie = Request.Cookies["podaci"];

            txtImeEdit.Text = Server.UrlDecode(httpCookie["Ime"]);
            txtPrezimeEdit.Text = Server.UrlDecode(httpCookie["Prezime"]);

        }

        protected void btnUredi_Click(object sender, EventArgs e)
        {
            //update
        }

        protected void lbPovratak_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserListPage.aspx");
        }
    }
}