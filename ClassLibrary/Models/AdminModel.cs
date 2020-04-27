using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{
    public class AdminModel  : KorisnikModel
    {

        public static string UserName { get; } = "admin";
        private static string Password { get; } = "123";



        public AdminModel()
        {
           
        }

        public static bool isAdmin(string usernName, string password)
        {
            return UserName == usernName && Password == password ? true : false;
        }


    }


}


