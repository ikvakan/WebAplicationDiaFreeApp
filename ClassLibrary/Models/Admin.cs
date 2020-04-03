using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary
{
    public class Admin
    {
        private static string UserName { get;  } = "Admin";
        private static string Password { get;  } = "123";


        public static bool IsAdmin(string userName,string password)
        {
            return userName == UserName && password == Password ? true : false;
        }
    }
}
