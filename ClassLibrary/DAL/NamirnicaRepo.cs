﻿using ClassLibrary.Models;
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
   public class NamirnicaRepo :INamirnica
    {
       // private IHelperMethods helperMethod = RepoFactory.GetHelperMethods();

        public DataSet ds { get; set; }
        private string cs = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;

        public List<Namirnice> getIngredients(string tipNamirnice)
        {
            ds = SqlHelper.ExecuteDataset(cs, "GetIngredients", tipNamirnice);
            List<Namirnice> kolekcijaNamirnica = new List<Namirnice>();

            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Namirnice n = new Namirnice();
                n.IDNamirnice = (int)row["IDNamirnice"];
                n.NazivNamirnice = (string)row["Namirnica"];
                n.Energija_kJ = (int)row["Energija_kJ"];
                n.Energija_kcal = (int)row["Energija_kcal"];
                n.TipNamirnice = (string)row["TipNamirnice"];


                kolekcijaNamirnica.Add(n);
            }
            return kolekcijaNamirnica;
        }

        public void UpdateIngredients(Namirnice n)
        {
            SqlHelper.ExecuteNonQuery(cs, "UpdateIngredients", n.IDNamirnice, n.NazivNamirnice, n.Energija_kJ, n.Energija_kcal, n.TipNamirnice);
        }

        public void DeleteIngredient(int id)
        {
            SqlHelper.ExecuteNonQuery(cs, "DeleteIngredient", id);
        }

        public void InsertIngredient(Namirnice n)
        {
            SqlHelper.ExecuteNonQuery(cs, "InsertIngredient", n.NazivNamirnice, n.Energija_kJ, n.Energija_kcal, n.TipNamirnice);
        }

        public decimal InsertMeasurementForIngredient(Namirnice n)
        {
            return (decimal)SqlHelper.ExecuteScalar(cs, "InsertMeasurementForIngredient", n.Grami, n.Komad, n.Zlica, n.Salica);
        }

        public List<Namirnice> GetIngredientForMeal(int idMeal)
        {
            ds = SqlHelper.ExecuteDataset(cs, "GetIngredientForMeal", idMeal);
            List<Namirnice> kolekcija = new List<Namirnice>();
            foreach (DataRow row in ds.Tables[0].Rows)
            {
                Namirnice n = new Namirnice();
                n.IDNamirnice = (int)row["IDNamirnice"];
                n.NazivNamirnice = (string)row["Namirnica"];
                n.Energija_kJ = (int)row["Energija_kJ"];
                n.Energija_kcal = (int)row["Energija_kcal"];
                n.TipNamirnice = (string)row["TipNamirnice"];

                n.Grami = (row["Gram"] != DBNull.Value) ? ((int)row["Gram"]) : 0;
                n.Komad = (row["Komad"] != DBNull.Value) ? ((int)row["Komad"]) : 0;
                n.Zlica = (row["Zlica"] != DBNull.Value) ? ((int)row["Zlica"]) : 0;
                n.Salica = (row["Salica"] != DBNull.Value) ? ((int)row["Salica"]) : 0;

                kolekcija.Add(n);
            }

            return kolekcija;
        }
    }
}
