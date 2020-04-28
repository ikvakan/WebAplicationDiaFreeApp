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
        void InsertUser(KorisnikModel k);
        List<KorisnikModel> GetAllUsers();
        KorisnikModel GetUserById(int idUser);
        void UpdateUser(KorisnikModel k);
       
        void DeleteUser(int id);
    }
}
