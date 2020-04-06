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
        public int IDKorisnik { get; set; }
        public   string Ime { get; set; }
        public   string Prezime { get; set; }
        public  DateTime DatumRodenja { get; set; }
        public  string Email { get; set; }
        public   string KorisnickoIme { get; set; }
        public  string Zaporka { get; set; }
        public  double Tezina { get; set; }

        public  string FizickaAktivnost { get; set; }
        public  double Visina { get; set; }
        public  string TipDijabetesa { get; set; }
        public  char Spol { get; set; }



      
       



    }
}
