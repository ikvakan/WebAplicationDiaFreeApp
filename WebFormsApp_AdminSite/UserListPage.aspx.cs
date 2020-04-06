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

            if (!IsPostBack)
            {
                RepeaterDataBind();
            } 

        }

        private void RepeaterDataBind()
        {
            try
            {
                repeaterPopisKorisnika.DataSource = repo.GetAllUsers();
                repeaterPopisKorisnika.DataBind();
            }
            catch (Exception ex)
            {

              lb
            }
        }

        protected void lbUredi_Click(object sender, EventArgs e)
        {

        }
    }
}