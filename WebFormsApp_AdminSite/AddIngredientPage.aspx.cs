using ClassLibrary.DAL;
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

    public partial class AddIngredientPage : System.Web.UI.Page
    {
        private INamirnica repo = RepoFactory.GetNamirnicaRepo();
        private IHelperMethods helper = RepoFactory.GetHelperMethods();

       

        protected override void OnPreLoad(EventArgs e)
        {
            if (IsPostBack)
            {
                lblInfo.Text = "";
            }
            base.OnPreLoad(e);
        }


        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginPage.aspx");
            }

           


            if (!IsPostBack)
            {
                ResetControls();

            }
        }

        protected void btUnos_Click(object sender, EventArgs e)
        {



            NamirniceModel n = new NamirniceModel();
            n.NazivNamirnice = txtNaziv.Text;
            n.Energija_kcal = (txtEnergija_kcal.Text != string.Empty) ? int.Parse(txtEnergija_kcal.Text) : 0;
            n.Energija_kJ = (txtEnergija_kJ.Text != string.Empty) ? int.Parse(txtEnergija_kJ.Text) : 0;
            n.TipNamirnice = ddlTipNamirnice.SelectedValue;
            


            if (!helper.ContainsIngredient(n.NazivNamirnice))
            {

                repo.InsertIngredient(n);
                lblInfo.Text = $"Namirnica [{n.NazivNamirnice}] je dodana.";
                ResetControls();

            }
            else
            {

                lblInfo.Text = "Namirnica već postoji.";
            }

        }

        private void ResetControls()
        {
            txtNaziv.Text = "";
            txtEnergija_kJ.Text = "";
            txtEnergija_kcal.Text = "";
            


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