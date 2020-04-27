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
        void UpdateIngredients(NamirniceModel n);
        void DeleteIngredient(int n);

        void InsertIngredient(NamirniceModel n);
        List<NamirniceModel> getIngredients(string tipNamirnice);
        List<NamirniceModel> GetIngredientForMeal(int idMeal);

        decimal InsertMeasurementForIngredient(NamirniceModel n);


    }
}
