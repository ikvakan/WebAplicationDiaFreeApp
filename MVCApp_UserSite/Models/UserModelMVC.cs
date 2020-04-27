using MVCApp_UserSite.Models.CustomeValidators;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCApp_UserSite.Models
{
    public class UserModelMVC
    {
        public int IDKorisnik { get; set; }

        [Required(ErrorMessage = "Ime obavezno.")]
        public string Ime { get; set; }

        [Required(ErrorMessage = "Prezime obavezno.")]
        public string Prezime { get; set; }
        [Display(Name ="Datum rođenja")]
        public DateTime DatumRodenja { get; set; }
        [Display(Name ="E-mail")]
        [EmailAddress]
        public string Email { get; set; }
        [Required(ErrorMessage ="Korisničko ime obavezno.")]
        [ContainsUserNameValidator]
        public  string KorisnickoIme { get; set; }
        [Required(ErrorMessage ="Zaporka obavezna")]
        [DataType(DataType.Password)]
        public string Zaporka { get; set; }
        [Required(ErrorMessage ="Obavezno polje.")]
        public decimal Tezina { get; set; }
        [Display(Name ="Fizička aktivnost")]
        public string FizickaAktivnost { get; set; }
        [Required(ErrorMessage ="Obavezno polje.")]
        public decimal Visina { get; set; }
        [Display(Name =("Tip dijabetesa"))]
        public string TipDijabetesa { get; set; }
        public string Spol { get; set; }

    }
}