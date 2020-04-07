using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{

   

    public  class Korisnik
    {
        public int IDKorisnik { get; set; }
        public   string Ime { get; set; }
        public   string Prezime { get; set; }
        public  DateTime DatumRodenja { get; set; }
        public  string Email { get; set; }
        public   string KorisnickoIme { get; set; }
        public  string Zaporka { get; set; }
        public  decimal Tezina { get; set; }

        public  string FizickaAktivnost { get; set; }
        public  decimal Visina { get; set; }
        public  string TipDijabetesa { get; set; }
        public  string Spol { get; set; }



      
       



    }
}
