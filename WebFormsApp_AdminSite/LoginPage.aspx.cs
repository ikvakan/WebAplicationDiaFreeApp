using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            ResetControls();


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var userName = txtUserName.Text;
            var password = txtPassword.Text;


            if (Admin.IsAdmin(userName, password))
            {
                Response.Redirect("Index.aspx");
            }
            else
            {
                ResetControls();

            }


        }

        private void ResetControls()
        {
            txtUserName.Text = string.Empty;
            txtPassword.Text = string.Empty;
        }
    }
}