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
        private string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public Repo()
        {

        }

        public List<Korisnik> GetAllUsers()
        {
            List<Korisnik> kolekcijaKorisnika = new List<Korisnik>();
            DataSet ds = SqlHelper.ExecuteDataset(cs, "GetAllUsers");

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                kolekcijaKorisnika.Add(new Korisnik
                {
                    IDKorisnik=(int)row["IDKorisnik"],
                    Ime=(string)row["Ime"],
                    Prezime=(string)row["Prezime"],
                    Email=(string)row["Email"],
                    DatumRodenja=(DateTime)row["DatumRodenja"],
                    KorisnickoIme=(string)row["KorisnickoIme"],
                    Zaporka=(string)row["Zaporka"],
                    Tezina=(double)row["Tezina"],
                    Visina=(double)row["Visina"],
                    Spol=(char)row["Spol"],
                    TipDijabetesa=(string)row["TipDijabetesa"],
                    FizickaAktivnost=(string)row["RazinaFizickeAktivnosti"]
                });
            }

            return kolekcijaKorisnika;

        }
    }
}
