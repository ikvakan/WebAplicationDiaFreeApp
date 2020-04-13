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
        void UpdateUser(Korisnik k);
        List<Namirnice> getIngredients(string tipNamirnice);

        void UpdateIngredients(Namirnice n);
        void DeleteIngredient(int n);

        void InsertIngredient(Namirnice n);
    }
}
