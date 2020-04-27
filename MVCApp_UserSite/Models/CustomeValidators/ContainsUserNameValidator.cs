using ClassLibrary.DAL;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace MVCApp_UserSite.Models.CustomeValidators
{
    public class ContainsUserNameValidator : ValidationAttribute
    {
        IHelperMethods repo = RepoFactory.GetHelperMethods();

        protected override ValidationResult IsValid(object value, ValidationContext validationContext)
        {
            var user = validationContext.ObjectInstance as UserLoginModel;

            return !repo.ContainsUserName(user.UserName) ? ValidationResult.Success : new ValidationResult("Korisničko ime već postoji.");
        }
    }
}