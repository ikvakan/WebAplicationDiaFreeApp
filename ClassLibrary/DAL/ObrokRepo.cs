

using ClassLibrary.Models;
using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public class ObrokRepo : IObrok
    {

        //private IHelperMethods helperMethod = RepoFactory.GetHelperMethods();

        public DataSet ds { get; set; }
        private string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public ObrokRepo()
        {

        }

       

        public decimal InsertMeal(ObrokModel o)
        {
            
            return (decimal)SqlHelper.ExecuteScalar(cs, "InsertMeal", o.NazivObroka,o.DatumIzrade);
        }

        public void InsertIntoMealIngredients(int obrokId, int namirnicaID,int kolicinaID)
        {
            SqlHelper.ExecuteNonQuery(cs, "InsertIntoMelaIngredients", obrokId, namirnicaID,kolicinaID);
        }

        public int GetNumberOfMeals()
        {
            return (int) SqlHelper.ExecuteScalar(cs, "GetNumberOfMeals");
        }

        public List<ObrokModel> GetMealList()
        {
            ds = SqlHelper.ExecuteDataset(cs, "GetMeal");
            List<ObrokModel> kolekcija = new List<ObrokModel>();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                ObrokModel o = new ObrokModel();
                o.IDObrok = (int)row["IDObrok"];
                o.NazivObroka = (string)row["NazivObroka"];
                o.DatumIzrade = (DateTime)row["DatumIzrade"];

                kolekcija.Add(o);
            }

            return kolekcija;
        }

       

        public  void DeleteMeal(int obrokId)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeleteMeal", obrokId);
        }

        public void DelteFromMealIngredients(int obrokId)
        {
            SqlHelper.ExecuteNonQuery(cs, "DelteFromMealIngredients", obrokId);
        }

       

        public void DeleteMeasurement(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeleteMeasurement", id);
        }
    }
}
