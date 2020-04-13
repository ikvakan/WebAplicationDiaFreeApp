﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{
    public partial class Master : System.Web.UI.MasterPage 
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOdajvi_Click(object sender, EventArgs e)
        {
            //odjavi korisnika iz sesije
            Response.Redirect("LoginPage.aspx");
        }

        public void ShowLabel(string message)
        {
            lblHeaderInfo.Text = message;
        }
    }
}