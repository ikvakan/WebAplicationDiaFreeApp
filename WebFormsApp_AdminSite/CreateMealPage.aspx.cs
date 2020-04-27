using ClassLibrary.DAL;
using ClassLibrary.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebFormsApp_AdminSite
{
    public partial class CreateMealPage : System.Web.UI.Page
    {

        private INamirnica repo = RepoFactory.GetNamirnicaRepo();

        private string selectedType;
        public static decimal obrokID;

        public List<NamirniceModel> KolekcijaNamirnica
        {
            get
            {
                if (Session["listaNamirnica"] == null)
                {
                    Session["listaNamirnica"] = new List<NamirniceModel>();
                }
                return (List<NamirniceModel>)Session["listaNamirnica"];
            }
            set
            {
                Session["listaNamirnica"] = value;
            }
        }


        public string Language
        {
            get
            {
                if (Request.Cookies["languageOptions"] != null)
                {
                    if (Request.Cookies["languageOptions"]["language"] != null)
                    {
                        return Request.Cookies["languageOptions"]["language"];
                    }
                }
                return "";
            }
        }
        protected override void OnPreRender(EventArgs e)
        {

            List<NamirniceModel> namirnice = new List<NamirniceModel>();



            if (IsPostBack)
            {
                selectedType = (string)ViewState["selected"];
                //namirnice = (List<Namirnice>)ViewState["namirnice"];
                BindDataToGridView(selectedType);



            }


            base.OnPreRender(e);
        }



        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginPage.aspx");
            }

            if (Language == "hr")
            {

                Master.ShowLabel("Kreiraj obrok");
            }
            else
                Master.ShowLabel("Create meal");
           



            ViewState["selected"] = ddlTipNamirnice.SelectedValue;

            selectedType = (string)ViewState["selected"];



            if (!IsPostBack)
            {
                BindDataToGridView(selectedType);
                
            }

            lblInfo.Text = "";

           
        }

        



        private void BindDataToGridView(string selectedType)
        {
            gvNamirnice.DataSource = repo.getIngredients(selectedType);
            gvNamirnice.DataBind();
        }

        protected void gvNamirnice_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {


            gvNamirnice.PageIndex = e.NewPageIndex;
            BindDataToGridView(selectedType);


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
            //TextBox tbGrami = (TextBox)updateRow.Cells[3].Controls[1];
            //TextBox tbKomad = (TextBox)updateRow.Cells[4].Controls[1];
            //TextBox tbZlica = (TextBox)updateRow.Cells[5].Controls[1];
            //TextBox tbSalica = (TextBox)updateRow.Cells[6].Controls[1];
            DropDownList tbTipNamirnice = (DropDownList)updateRow.Cells[3].Controls[1];

            NamirniceModel n = new NamirniceModel();
            n.IDNamirnice = (int)gvNamirnice.DataKeys[e.RowIndex].Value;
            n.NazivNamirnice = tbNamirnica.Text;
            n.Energija_kJ = int.Parse(tbEnergija_kJ.Text);
            n.Energija_kcal = int.Parse(tbEnergija_kcal.Text);
            //n.Grami = int.Parse(tbGrami.Text);
            //n.Komad = int.Parse(tbKomad.Text);
            //n.Zlica = int.Parse(tbZlica.Text);
            //n.Salica = int.Parse(tbSalica.Text);
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

            List<NamirniceModel> kolekcija = new List<NamirniceModel>();


            foreach (GridViewRow row in gvNamirnice.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("cbOdaberi");
                Label lblNaziv = (Label)row.FindControl("lblNaziv");
                Label lblEnergija_kJ = (Label)row.FindControl("lblEnergija_kJ");
                Label lblEnergija_kcal = (Label)row.FindControl("lblEnergija_kcal");
               
                Label lblTipNamirnice = (Label)row.FindControl("lblTipNamirnice");

                if (cb != null && cb.Checked)
                {

                    var id = (int)gvNamirnice.DataKeys[row.RowIndex]["IDNamirnice"];



                    NamirniceModel n = new NamirniceModel();
                    n.IDNamirnice = id;
                    n.NazivNamirnice = lblNaziv.Text;
                    n.Energija_kJ = int.Parse(lblEnergija_kJ.Text);
                    n.Energija_kcal = int.Parse(lblEnergija_kcal.Text);
                    n.TipNamirnice = lblTipNamirnice.Text;



                        
                  
                        KolekcijaNamirnica.Add(n);

                   


                }
            }


            if (KolekcijaNamirnica.Count > 0)
            {
                Response.Redirect("AddMealPage.aspx");
            }
            else
                lblInfo.Text = "Niste odabrali namirnice";

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