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
      


        protected void Page_Load(object sender, EventArgs e)
        {
           
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