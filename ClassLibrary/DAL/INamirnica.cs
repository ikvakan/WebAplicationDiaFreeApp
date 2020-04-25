using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
   public interface INamirnica
    {
        void UpdateIngredients(Namirnice n);
        void DeleteIngredient(int n);

        void InsertIngredient(Namirnice n);
        List<Namirnice> getIngredients(string tipNamirnice);
        List<Namirnice> GetIngredientForMeal(int idMeal);

        decimal InsertMeasurementForIngredient(Namirnice n);
    }
}
