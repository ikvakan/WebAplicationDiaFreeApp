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
        private static  string UserName { get; } = "admin";
        private static string Password { get; } = "123";


       public static bool IsAdmin(string userName, string password)
        {
            return UserName == userName && Password == password ? true : false;
        }
    }


}


