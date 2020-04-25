using ClassLibrary;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{
    public class Admin  
    {

        public static string UserName { get; } = "admin";
        private static string Password { get; } = "123";

        public Admin()
        {

        }

        public static bool isAdmin(string korisnickoIme, string zaporka)
        {
            return UserName == korisnickoIme && Password == zaporka ? true : false;
        }


    }


}


