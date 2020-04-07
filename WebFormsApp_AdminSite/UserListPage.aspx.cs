using ClassLibrary.DAL;
using ClassLibrary.Models;
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
         IRepo repo = RepoFactory.GetRepo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 FillRepeaterWithData();

            }
        }

        private void FillRepeaterWithData()
        {
          
                repeaterPopisKorisnika.DataSource = repo.GetAllUsers();
                repeaterPopisKorisnika.DataBind();
           
        }

        protected void lbUredi_Click(object sender, EventArgs e)
        {
            
            
        }
    }
}