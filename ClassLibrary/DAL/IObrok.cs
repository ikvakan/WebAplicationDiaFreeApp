using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
   public interface IObrok
    {
        decimal InsertMeal(Obrok o);

        void InsertIntoMealIngredients(int obrokId, int namirnicaID, int kolicinaID);

        int GetNumberOfMeals();


        List<Obrok> GetMealList();

       

        void DeleteMeal(int obrokId);

        void DelteFromMealIngredients(int obrokId);

        

        void DeleteMeasurement(int id);
    }
}
