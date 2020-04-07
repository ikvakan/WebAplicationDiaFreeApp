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

        private static IRepo repo = RepoFactory.GetRepo();
        protected void Page_Load(object sender, EventArgs e)
        {
            ConnectDataSource();
        }

        private void ConnectDataSource()
        {
            repeaterPopisKorisnika.DataSource = repo.GetAllUsers();
            repeaterPopisKorisnika.DataBind();
        }

        protected void lbUredi_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            var id=int.Parse(btn.CommandArgument);


            var user = repo.GetUserById(id);

            lblInfo.Text = user.Ime;

            
        }
    }
}