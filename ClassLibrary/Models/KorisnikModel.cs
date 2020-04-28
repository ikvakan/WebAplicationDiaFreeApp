using ClassLibrary.CustomeValidator;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{



    public class KorisnikModel
    {

        //public int IDKorisnik { get; set; }
        //public string Ime { get; set; }
        //public string Prezime { get; set; }
        //public DateTime DatumRodenja { get; set; }
        //public string Email { get; set; }
        //public string KorisnickoIme { get; set; }
        //public string Zaporka { get; set; }
        //public decimal Tezina { get; set; }

        //public string FizickaAktivnost { get; set; }
        //public decimal Visina { get; set; }
        //public string TipDijabetesa { get; set; }
        //public string Spol { get; set; }


        public int IDKorisnik { get; set; }

        [Required(ErrorMessage = "Ime obavezno.")]
        public string Ime { get; set; }

        [Required(ErrorMessage = "Prezime obavezno.")]
        public string Prezime { get; set; }
        [Display(Name = "Datum rođenja")]
        [DataType(DataType.Date)]
        public DateTime? DatumRodenja { get; set; }
        [Display(Name = "E-mail")]
        [Required(ErrorMessage ="Email obavezan.")]
        [EmailAddress]
        public string Email { get; set; }
        [Required(ErrorMessage = "Korisničko ime obavezno.")]
        [Display(Name = "Korisničko ime")]
        [ContainsUserNameValidator]
        public string KorisnickoIme { get; set; }
        [Required(ErrorMessage = "Zaporka obavezna")]
        [DataType(DataType.Password)]
        public string Zaporka { get; set; }

        [NotMapped]
        [Required(ErrorMessage = "Potvrda obavezna.")]
        [Display(Name = "Potvrdi zaporku")]
        [DataType(DataType.Password)]
        [Compare("Zaporka")]
        public string PotvrdiZaporku { get; set; }
        [Required(ErrorMessage = "Obavezno polje.")]

        public decimal? Tezina { get; set; }
        [Display(Name = "Fizička aktivnost")]
        public string FizickaAktivnost { get; set; }
        [Required(ErrorMessage = "Obavezno polje.")]
        public decimal? Visina { get; set; }
        [Display(Name = ("Tip dijabetesa"))]
        [Required(ErrorMessage ="Obavezno polje.")]
        public string TipDijabetesa { get; set; }
        [Required(ErrorMessage = "Obavezno polje.")]
        public string Spol { get; set; }






    }
}
