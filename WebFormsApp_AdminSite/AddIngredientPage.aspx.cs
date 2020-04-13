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

    public partial class AddIngredientPage : System.Web.UI.Page
    {
        private IRepo repo = RepoFactory.GetRepo();
        private IHelperMethods helper = RepoFactory.GetHelperMethods();

        //private string selectedType;

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
            Master.ShowLabel("Unos namirnice");

            if (!IsPostBack)
            {
                ResetControls();
            }
        }

        protected void btUnos_Click(object sender, EventArgs e)
        {



            Namirnice n = new Namirnice();
            n.NazivNamirnice = txtNaziv.Text;
            n.Energija_kcal = (txtEnergija_kcal.Text != string.Empty) ? int.Parse(txtEnergija_kcal.Text) : 0;
            n.Energija_kJ = (txtEnergija_kJ.Text != string.Empty) ? int.Parse(txtEnergija_kJ.Text) : 0; 
            n.TipNamirnice = ddlTipNamirnice.SelectedValue;
            n.Grami = (txtGrami.Text != string.Empty) ? int.Parse(txtGrami.Text) : 0;
            n.Komad = (txtKomad.Text != string.Empty) ? int.Parse(txtKomad.Text) : 0;
            n.Zlica = (txtZlica.Text != string.Empty) ? int.Parse(txtZlica.Text) : 0;
            n.Salica = (txtSalica.Text != string.Empty) ? int.Parse(txtSalica.Text) : 0;


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
            txtGrami.Text = "";
            txtKomad.Text = "";
            txtZlica.Text = "";
            txtSalica.Text = "";

            
        }
    }
}