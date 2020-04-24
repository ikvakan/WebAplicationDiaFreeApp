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
        void InsertUser(Korisnik k);


        List<Korisnik> GetAllUsers();
        Korisnik GetUserById(int idUser);
        void UpdateUser(Korisnik k);

        void DeleteUser(int id);
        List<Namirnice> getIngredients(string tipNamirnice);

        void UpdateIngredients(Namirnice n);
        void DeleteIngredient(int n);

        void InsertIngredient(Namirnice n);

        decimal InsertMeal(Obrok o);

        void InsertIntoMealIngredients(int obrokId, int namirnicaID,int kolicinaID);

        int GetNumberOfMeals();
       

        List<Obrok> GetMealList();

        List<Namirnice> GetIngredientForMeal(int idMeal);

        void DeleteMeal(int obrokId);

        void DelteFromMealIngredients(int obrokId);

        decimal InsertMeasurementForIngredient(Namirnice n);

        void DeleteMeasurement(int id);

    }
}
