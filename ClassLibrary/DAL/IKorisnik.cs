using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
   public interface IKorisnik
    {
        void InsertUser(Korisnik k);
        List<Korisnik> GetAllUsers();
        Korisnik GetUserById(int idUser);
        void UpdateUser(Korisnik k);
        void DeleteUser(int id);
    }
}
