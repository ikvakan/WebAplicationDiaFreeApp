using ClassLibrary.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{
    public partial class MealsListPage : System.Web.UI.Page
    {
        private IRepo repo = RepoFactory.GetRepo();

        protected void Page_Load(object sender, EventArgs e)
        {
            var numOfMeals=repo.GetNumberOfMeals();

            foreach (var item in repo.GetMealList())
            {

            }

           
        }
    }
}