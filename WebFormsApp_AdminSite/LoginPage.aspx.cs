
using ClassLibrary;

using ClassLibrary.Models;
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
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //staviti admina u session zbog blokade pristupa 



            if (!IsPostBack)
            {
                ResetControls();

            }


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var userName = txtUserName.Text;
            var password = txtPassword.Text;
            
            

            if (AdminModel.isAdmin(userName, password))
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