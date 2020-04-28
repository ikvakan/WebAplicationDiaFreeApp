using ClassLibrary.DAL;
using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.CustomeValidator
{
    public class ContainsUserNameValidator : ValidationAttribute
    {
        IHelperMethods repo = RepoFactory.GetHelperMethods();

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var user = validationContext.ObjectInstance as KorisnikModel;

            return !repo.ContainsUserName(user.KorisnickoIme) ? ValidationResult.Success : new ValidationResult("Korisničko ime već postoji.");
        }
    }
}
