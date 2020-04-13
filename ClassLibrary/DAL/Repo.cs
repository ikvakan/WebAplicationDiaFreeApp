

using ClassLibrary.Models;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public class Repo : IRepo
    {

        private IHelperMethods helperMethod = RepoFactory.GetHelperMethods();

        public DataSet ds { get; set; }
        private string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public Repo()
        {

        }

        public List<Korisnik> GetAllUsers()
        {
            ds = SqlHelper.ExecuteDataset(cs, "GetAllUsers");
            List<Korisnik> kolekcijaKorisnika = new List<Korisnik>();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Korisnik k = new Korisnik();
                k.IDKorisnik = (int)row["IDKorisnik"];
                k.Ime = row["Ime"].ToString();
                k.Prezime = row["Prezime"].ToString();
                k.Email = row["Email"].ToString();
                k.DatumRodenja = (DateTime)row["DatumRodenja"];
                k.KorisnickoIme = row["KorisnickoIme"].ToString();
                k.Spol = row["Spol"].ToString();
                k.Visina = (decimal)row["Visina"];
                k.Tezina = (decimal)row["Tezina"];
                k.TipDijabetesa = (string)row["TipDijabetesa"];
                k.FizickaAktivnost = (string)row["RazinaFizickeAktivnosti"];

                kolekcijaKorisnika.Add(k);
            }

            return kolekcijaKorisnika;

        }

        public Korisnik GetUserById(int idUser)
        {
            var korisnik = GetAllUsers().FirstOrDefault(k => k.IDKorisnik == idUser);
            return korisnik;
        }

        public void UpdateUser(Korisnik k)
        {
            int FizAktivnostId = helperMethod.SetUserFizAktivnostForUpdate(k.FizickaAktivnost.ToLower());

            int tipDijabetesaId = helperMethod.SetUserTipDiabetesaForUpdate(k.TipDijabetesa.ToLower());

            SqlHelper.ExecuteNonQuery(cs, "UpdateUser", k.IDKorisnik, k.Ime, k.Prezime, k.Email, k.DatumRodenja, k.KorisnickoIme, k.Tezina, FizAktivnostId, k.Visina, tipDijabetesaId, k.Spol);
        }

        public List<Namirnice> getIngredients(string tipNamirnice)
        {
            ds = SqlHelper.ExecuteDataset(cs, "GetIngredients", tipNamirnice);
            List<Namirnice> kolekcijaNamirnica = new List<Namirnice>();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Namirnice n = new Namirnice();
                n.IDNamirnice = (int)row["IDNamirnice"];
                n.NazivNamirnice = (string)row["Namirnica"];
                n.Energija_kJ = (int)row["Energija_kJ"];
                n.Energija_kcal = (int)row["Energija_kcal"];
                n.TipNamirnice = (string)row["TipNamirnice"];
                //n.Grami = (row["Grami"] != DBNull.Value) ? ((string)row["Grami"]) : "---";
                //n.Komad = (row["Komad"] != DBNull.Value) ? ((string)row["Komad"]) : "---";
                //n.Zlica = (row["Zlica"] != DBNull.Value) ? ((string)row["Zlica"]) : "---";
                //n.Salica = (row["Salica"] != DBNull.Value) ? ((string)row["Salica"]) : "---";
                n.Grami = (row["Grami"] != DBNull.Value) ? ((int)row["Grami"]) : 0;
                n.Komad = (row["Komad"] != DBNull.Value) ? ((int)row["Komad"]) : 0;
                n.Zlica = (row["Zlica"] != DBNull.Value) ? ((int)row["Zlica"]) : 0;
                n.Salica = (row["Salica"] != DBNull.Value) ? ((int)row["Salica"]) : 0;
                kolekcijaNamirnica.Add(n);
            }
                return kolekcijaNamirnica;
        }

        public void UpdateIngredients(Namirnice n)
        {
            SqlHelper.ExecuteNonQuery(cs, "UpdateIngredients", n.IDNamirnice, n.NazivNamirnice, n.Energija_kJ, n.Energija_kcal,n.TipNamirnice, n.Grami ,n.Komad,n.Zlica , n.Salica);
        }
    }
}
