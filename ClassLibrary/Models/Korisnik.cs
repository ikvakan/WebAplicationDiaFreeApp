using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{

    public enum RazinaFizickeAktivnosti
    {
        Slaba,
        Umjerena,
        Intenzivna
    }

    public enum TipDijabetesa
    {
        Tip1,
        Tip2
    }

    public class Korisnik
    {
        public static Guid IDKorisnik { get; set; }
        public static string Ime { get; set; }
        public static string Prezime { get; set; }
        public  static DateTime DatumRodenja { get; set; }
        public static string Email { get; set; }
        public static string KorisnickoIme { get; set; }
        public static string Zaporka { get; set; }
        public static RazinaFizickeAktivnosti FizickaAktivnost { get; set; }
        public static int Visina { get; set; }
        public static TipDijabetesa TipDijabetesa { get; set; }
        public static string Spol { get; set; }

        public Korisnik()
        {
            IDKorisnik = new Guid();
        }
    }
}
