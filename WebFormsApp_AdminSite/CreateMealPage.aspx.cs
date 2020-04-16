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
        private IFileManager manager = RepoFactory.GetFileManager();

        private string selectedType;
        public static decimal obrokID;
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


            TextBox tbNamirnica = (TextBox)updateRow.Cells[0].Controls[1];
            TextBox tbEnergija_kJ = (TextBox)updateRow.Cells[1].Controls[1];
            TextBox tbEnergija_kcal = (TextBox)updateRow.Cells[2].Controls[1];
            TextBox tbGrami = (TextBox)updateRow.Cells[3].Controls[1];
            TextBox tbKomad = (TextBox)updateRow.Cells[4].Controls[1];
            TextBox tbZlica = (TextBox)updateRow.Cells[5].Controls[1];
            TextBox tbSalica = (TextBox)updateRow.Cells[6].Controls[1];
            DropDownList tbTipNamirnice = (DropDownList)updateRow.Cells[7].Controls[1];

            Namirnice n = new Namirnice();
            n.IDNamirnice = (int)gvNamirnice.DataKeys[e.RowIndex].Value;
            n.NazivNamirnice = tbNamirnica.Text;
            n.Energija_kJ = int.Parse(tbEnergija_kJ.Text);
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

        protected void gvNamirnice_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            var idNamirnice = (int)gvNamirnice.DataKeys[e.RowIndex].Value;

            try
            {
                repo.DeleteIngredient(idNamirnice);
            }
            catch (Exception ex)
            {

                lblInfo.Text = $"Greška kod brisanja:{ex.Message} ";
            }

            BindDataToGridView(selectedType);
        }

        protected void btnGeneriraj_Click(object sender, EventArgs e)
        {
            var selectedMeal = ddlObrok.SelectedValue;

            List<Namirnice> kolekcija = new List<Namirnice>();

            Obrok o = new Obrok();
            o.NazivObroka = selectedMeal;
            o.DatumIzrade = DateTime.Now;

            foreach (GridViewRow row in gvNamirnice.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("cbOdaberi");
                Label lblNaziv = (Label)row.FindControl("lblNaziv");
                Label lblEnergija_kJ = (Label)row.FindControl("lblEnergija_kJ");
                Label lblEnergija_kcal = (Label)row.FindControl("lblEnergija_kcal");
                Label lblGrami = (Label)row.FindControl("lblGrami");
                Label lblKomad = (Label)row.FindControl("lblKomad");
                Label lblZlica = (Label)row.FindControl("lblZlica");
                Label lblSalica = (Label)row.FindControl("lblSalica");

                if (cb != null && cb.Checked)
                {

                    var id = gvNamirnice.DataKeys[row.DataItemIndex].Values["IDNamirnice"].ToString();

                    Namirnice n = new Namirnice();
                    n.IDNamirnice = int.Parse(id);
                    //n.NazivNamirnice = lblNaziv.Text;
                    //n.Energija_kJ = int.Parse(lblEnergija_kJ.Text);
                    //n.Energija_kcal= int.Parse(lblEnergija_kcal.Text);
                    //n.Grami = int.Parse(lblGrami.Text);
                    //n.Komad= int.Parse(lblKomad.Text);
                    //n.Zlica = int.Parse(lblZlica.Text);
                    //n.Salica = int.Parse(lblSalica.Text);

                    kolekcija.Add(n);

                }
            }


             obrokID= repo.InsertMeal(o);

            foreach (var item in kolekcija)
            {
                repo.InsertIntoMealIngredients((int)obrokID, item.IDNamirnice);
            }




           

        }
    }
}