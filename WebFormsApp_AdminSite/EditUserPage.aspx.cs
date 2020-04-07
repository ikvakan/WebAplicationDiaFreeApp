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
    public partial class EditUserPage : System.Web.UI.Page
    {

        private IRepo repo = RepoFactory.GetRepo();

      
        protected void Page_Load(object sender, EventArgs e)
        {
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

        private void FillTextFieldForEdit(Korisnik korisnik)
        {
            
            txtImeEdit.Text = korisnik.Ime;
            txtPrezimeEdit.Text = korisnik.Prezime;
            txtDatumRodenjaEdit.Text =korisnik.DatumRodenja.ToShortDateString();
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
            Korisnik k = new Korisnik();
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
    }
}