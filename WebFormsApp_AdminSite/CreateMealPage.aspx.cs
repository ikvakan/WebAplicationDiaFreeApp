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
    public partial class CreateMealPage : System.Web.UI.Page
    {

        private IRepo repo = RepoFactory.GetRepo();

        private string selectedType;

        protected override void OnPreRender(EventArgs e)
        {
            if (IsPostBack)
            {
                selectedType = (string)ViewState["selected"];
                BindDataToGridView(selectedType);
            }


            base.OnPreRender(e);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ShowLabel("Kreiraj obrok");

            // selectedType = ddlTipNamirnice.SelectedValue;

            ViewState["selected"] = ddlTipNamirnice.SelectedValue;

            selectedType = (string)ViewState["selected"];
          


            if (!IsPostBack)
            {
                BindDataToGridView(selectedType);
                
            }
              
           
            
        }

        private void BindDataToGridView(string selectedType)
        {
            gvNamirnice.DataSource = repo.getIngredients(selectedType);
            gvNamirnice.DataBind();
        }

        protected void gvNamirnice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {



            BindDataToGridView(selectedType);
            gvNamirnice.PageIndex = e.NewPageIndex;
            gvNamirnice.DataBind();
        }

        protected void gvNamirnice_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvNamirnice.EditIndex = -1;


            BindDataToGridView(selectedType);
        }

        protected void gvNamirnice_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvNamirnice.EditIndex = e.NewEditIndex;


            BindDataToGridView(selectedType);
        }

        protected void gvNamirnice_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            GridViewRow updateRow = gvNamirnice.Rows[e.RowIndex];
            

            TextBox tbNamirnica = (TextBox)updateRow.Cells[0].Controls[0];
            TextBox tbEnergija_kJ = (TextBox)updateRow.Cells[1].Controls[0];
            TextBox tbEnergija_kcal = (TextBox)updateRow.Cells[2].Controls[0];
            TextBox tbGrami = (TextBox)updateRow.Cells[3].Controls[0];
            TextBox tbKomad = (TextBox)updateRow.Cells[4].Controls[0];
            TextBox tbZlica = (TextBox)updateRow.Cells[5].Controls[0];
            TextBox tbSalica = (TextBox)updateRow.Cells[6].Controls[0];
            TextBox tbTipNamirnice = (TextBox)updateRow.Cells[7].Controls[0];

            Namirnice n = new Namirnice();
            n.IDNamirnice = (int)gvNamirnice.DataKeys[e.RowIndex].Value;
            n.NazivNamirnice = tbNamirnica.Text;
            n.Energija_kJ =int.Parse(tbEnergija_kJ.Text);
            n.Energija_kcal = int.Parse(tbEnergija_kcal.Text);
            n.Grami = int.Parse(tbGrami.Text);
            n.Komad = int.Parse(tbKomad.Text);
            n.Zlica = int.Parse(tbZlica.Text);
            n.Salica = int.Parse(tbSalica.Text);
            n.TipNamirnice = tbTipNamirnice.Text;

            try
            {
               
                repo.UpdateIngredients(n);

               
            }
            catch (Exception ex)
            {

                lblInfo.Text = ex.Message;
            }



           

            gvNamirnice.EditIndex = -1;



            BindDataToGridView(selectedType);


        }

       
    }
}