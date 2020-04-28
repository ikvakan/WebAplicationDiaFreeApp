
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCApp_UserSite.Models
{
    public class UserLoginModel
    {
        [Required(ErrorMessage ="Ime je obavezno.")]
        [Display(Name ="Korisničko ime")]
       
        public string UserName { get; set; }

        [Required(ErrorMessage ="Zaporka je obavezna.")]
        [Display(Name = "Zaporka")]
        [DataType(DataType.Password)]
        public string Password { get; set; }

    }
}