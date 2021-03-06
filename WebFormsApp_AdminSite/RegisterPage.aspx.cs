﻿using ClassLibrary.DAL;
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
    public partial class RegisterPage : System.Web.UI.Page
    {

        private IKorisnik repo = RepoFactory.GetKorisnikRepo();
        private IHelperMethods helper = RepoFactory.GetHelperMethods();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPotvrdi_Click(object sender, EventArgs e)
        {
            KorisnikModel k = new KorisnikModel();
            k.Ime = txtIme.Text;
            k.Prezime = txtPrezime.Text;
            k.Email = txtEmail.Text;
            k.DatumRodenja = DateTime.Parse(txtDatumRodenja.Text);
            k.KorisnickoIme = txtKorisnickoIme.Text;
            k.Tezina = decimal.Parse(txtTezina.Text);
            k.FizickaAktivnost = ddlRazinaFizAktiv.SelectedValue;
            k.Visina = decimal.Parse(txtVisina.Text);
            k.TipDijabetesa = ddlTipDijabetesa.SelectedValue;
            k.Spol = ddlSpol.SelectedValue;




            if (Page.IsValid)
            {
                repo.InsertUser(k);
                Response.Redirect("LoginPage.aspx");

            }

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

        protected void Unnamed1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var userName = args.Value;


            if (helper.ContainsUserName(userName))
            {
                args.IsValid = false;

            }
            else
                args.IsValid = true;
        }
    }
}