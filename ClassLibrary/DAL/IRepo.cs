using ClassLibrary;
using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public interface IRepo
    {
        List<Korisnik> GetAllUsers();
        Korisnik GetUserById(int idUser);
    }
}
