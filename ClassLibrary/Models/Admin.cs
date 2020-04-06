using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Admin  
    {
        private static string UserName { get; } = "admin";
        private static string Password { get; } = "123";



        public static bool isAdmin(string korisnickoIme, string zaporka)
        {
            return korisnickoIme == UserName && Password == zaporka ? true : false;
        }


    }


}


