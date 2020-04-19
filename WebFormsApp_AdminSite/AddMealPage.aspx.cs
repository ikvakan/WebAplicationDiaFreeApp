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
    public partial class AddMealPage : System.Web.UI.Page
    {

        private List<Namirnice> listNamirnice = new List<Namirnice>();

        private IRepo repo = RepoFactory.GetRepo();

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
                Label lblGrami = (Label)row.FindControl("lblGrami");
                Label lblKomad = (Label)row.FindControl("lblKomad");
                Label lblZlica = (Label)row.FindControl("lblZlica");
                Label lblSalica = (Label)row.FindControl("lblSalica");
                Label lblTipNamirnice = (Label)row.FindControl("lblTipNamirnice");

                if (cb != null && cb.Checked)
                {

                    var id = (int)gvPopisNamirnica.DataKeys[row.RowIndex]["IDNamirnice"];



                    Namirnice n = new Namirnice();
                    n.IDNamirnice = id;
                    //n.NazivNamirnice = lblNaziv.Text;
                    //n.Energija_kJ = int.Parse(lblEnergija_kJ.Text);
                    //n.Energija_kcal = int.Parse(lblEnergija_kcal.Text);
                    //n.Grami = int.Parse(lblGrami.Text);
                    //n.Komad = int.Parse(lblKomad.Text);
                    //n.Zlica = int.Parse(lblZlica.Text);
                    //n.Salica = int.Parse(lblSalica.Text);
                    //n.TipNamirnice = lblTipNamirnice.Text;


                    kolekcija.Add(n);

                }

            }

                if (kolekcija!=null && kolekcija.Count>0)
                {
                    var idMeal =(int) repo.InsertMeal(o);

                    foreach (var item in kolekcija)
                    {
                        repo.InsertIntoMealIngredients(idMeal, item.IDNamirnice);
                    }

                    Session.Clear();
                }

                    Response.Redirect("CreateMealPage.aspx");

        }
    }
}