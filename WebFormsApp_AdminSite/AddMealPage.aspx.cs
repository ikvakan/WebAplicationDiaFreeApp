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
    public partial class AddMealPage : System.Web.UI.Page
    {

        private List<Namirnice> listNamirnice = new List<Namirnice>();

        private IRepo repo = RepoFactory.GetRepo();
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

        public List<Namirnice> ListaNamirnicaSession
        {
            get
            {
                if (Session["listaNamirnica"] == null)
                {
                    Session["listaNamirnica"] = new List<Namirnice>();
                }
                return (List<Namirnice>)Session["listaNamirnica"];
            }
            set
            {
                Session["listaNamirnica"] = value;
            }

        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Language == "hr")
            {

                Master.ShowLabel("Odaberi namirnice");
            }
            else
                Master.ShowLabel("Select ingredient");

            if (!IsPostBack)
            {
                if (Session["listaNamirnica"] != null)
                {
                    BindDataToGridView();

                }
                else
                {
                    Response.Redirect("Index.aspx");
                }


            }


        }





        private void BindDataToGridView()
        {
            
            gvPopisNamirnica.DataSource = ListaNamirnicaSession;
            gvPopisNamirnica.DataBind();
        }

        protected void gvPopisNamirnica_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {


            var idNamirnice = (int)gvPopisNamirnica.DataKeys[e.RowIndex].Value;


            try
            {

                var namirnica = ListaNamirnicaSession.SingleOrDefault(n => n.IDNamirnice == idNamirnice);
                ListaNamirnicaSession.Remove(namirnica);
            }
            catch (Exception ex)
            {

                lblInfo.Text = ex.Message;
                btnPonisti.Visible = true;
            }

            BindDataToGridView();
        }

        protected void btnPonisti_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("CreateMealPage.aspx");
        }

        protected void btnKreirajObrok_Click(object sender, EventArgs e)
        {
            List<Namirnice> kolekcija = new List<Namirnice>();

            Obrok o = new Obrok();
            o.NazivObroka= ddlObrok.SelectedValue;
            o.DatumIzrade= DateTime.Parse(txtDatum.Text); 

            foreach (GridViewRow row in gvPopisNamirnica.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("cbOdaberi");
                Label lblNaziv = (Label)row.FindControl("lblNaziv");
                Label lblEnergija_kJ = (Label)row.FindControl("lblEnergija_kJ");
                Label lblEnergija_kcal = (Label)row.FindControl("lblEnergija_kcal");
                TextBox txtGrami = (TextBox)row.FindControl("lblGrami");
                TextBox txtKomad = (TextBox)row.FindControl("lblKomad");
                TextBox txtZlica = (TextBox)row.FindControl("lblZlica");
                TextBox txtSalica = (TextBox)row.FindControl("lblSalica");
                Label lblTipNamirnice = (Label)row.FindControl("lblTipNamirnice");

                if (cb != null && cb.Checked)
                {

                    var id = (int)gvPopisNamirnica.DataKeys[row.RowIndex]["IDNamirnice"];



                    Namirnice n = new Namirnice();
                    n.IDNamirnice = id;
                    //n.NazivNamirnice = lblNaziv.Text;
                    //n.Energija_kJ = int.Parse(lblEnergija_kJ.Text);
                    //n.Energija_kcal = int.Parse(lblEnergija_kcal.Text);
                    n.Grami = int.Parse(txtGrami.Text);
                    n.Komad = int.Parse(txtKomad.Text);
                    n.Zlica = int.Parse(txtZlica.Text);
                    n.Salica = int.Parse(txtSalica.Text);
                    //n.TipNamirnice = lblTipNamirnice.Text;


                    kolekcija.Add(n);

                }

            }

                if (kolekcija!=null && kolekcija.Count>0)
                {
                    var idMeal =(int) repo.InsertMeal(o);

                    foreach (var item in kolekcija)
                    {
                        var KolicinaID = (int)repo.InsertMeasurementForIngredient(item);
                        repo.InsertIntoMealIngredients(idMeal, item.IDNamirnice,KolicinaID);
                    }

                    Session.Clear();
                }

                    Response.Redirect("CreateMealPage.aspx");

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