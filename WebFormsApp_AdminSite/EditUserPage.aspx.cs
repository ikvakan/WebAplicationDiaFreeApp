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
    public partial class EditUserPage : System.Web.UI.Page
    {

        private IKorisnik repo = RepoFactory.GetKorisnikRepo();
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("~/LoginPage.aspx");
            }


            if (Language == "hr" )
            {

                Master.ShowLabel("Kreiraj obrok");
            }
            else if (Language=="en")
            {
                Master.ShowLabel("Create meal");

            }

           // Master.ShowLabel("Uređivanje korisnika");

            if (Request.Cookies["podaci"]!=null)
            {
                if (!IsPostBack)
                {
                    FillControlsForEdit();

                }
            }
            else
            {
                Response.Redirect("Index.aspx");
            }

        }

        private void FillControlsForEdit()
        {
            HttpCookie cookie = Request.Cookies["podaci"];
            var korisnikID = int.Parse(Server.UrlDecode(cookie["IDKorisnik"]));
            hfkorisnikID.Value = korisnikID.ToString();

            var korisnik = repo.GetUserById(korisnikID);

            FillTextFieldForEdit(korisnik);


        }

        private void FillTextFieldForEdit(KorisnikModel korisnik)
        {
            
            txtImeEdit.Text = korisnik.Ime;
            txtPrezimeEdit.Text = korisnik.Prezime;
            txtDatumRodenjaEdit.Text =korisnik.DatumRodenja.Value.ToShortDateString();
            txtEmailEdit.Text = korisnik.Email;
            txtKorisnickoImeEdit.Text = korisnik.KorisnickoIme;
            txtTezinaEdit.Text =korisnik.Tezina.ToString();
            txtVisinaEdit.Text = korisnik.Visina.ToString();
            ddlRazinaFizAktivEdit.SelectedValue = korisnik.FizickaAktivnost;
            ddlTipDijabetesaEdit.SelectedValue = korisnik.TipDijabetesa;
            ddlSpolEdit.SelectedValue =korisnik.Spol;
        }

      

        protected void btnUredi_Click(object sender, EventArgs e)
        {
           
                EditKorisnik();


            Response.Redirect("UserListPage.aspx");
        }

        private void EditKorisnik()
        {
            KorisnikModel k = new KorisnikModel();
            k.IDKorisnik = int.Parse(hfkorisnikID.Value);
            k.Ime = txtImeEdit.Text;
            k.Prezime = txtPrezimeEdit.Text;
            k.Email = txtEmailEdit.Text;
            k.DatumRodenja = DateTime.Parse(txtDatumRodenjaEdit.Text);
            k.KorisnickoIme = txtKorisnickoImeEdit.Text;
            k.Tezina = decimal.Parse(txtTezinaEdit.Text);
            k.FizickaAktivnost = ddlRazinaFizAktivEdit.SelectedValue;
            k.Visina = decimal.Parse(txtVisinaEdit.Text);
            k.TipDijabetesa = ddlTipDijabetesaEdit.SelectedValue;
            k.Spol = ddlSpolEdit.SelectedValue;

            repo.UpdateUser(k);
        }

        protected void lbPovratak_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserListPage.aspx");
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