﻿using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
   public interface IObrok
    {
        decimal InsertMeal(ObrokModel o);
        void InsertIntoMealIngredients(int obrokId, int namirnicaID, int kolicinaID);
        int GetNumberOfMeals();
        List<ObrokModel> GetMealList();
       
        void DeleteMeal(int obrokId);

        void DelteFromMealIngredients(int obrokId);

        void DeleteMeasurement(int id);

        List<string> GetDateFromMeal();
        List<ObrokModel> FilterMealByDate(string datum);

        List<KreiraniObrok> GetCreatedMealListByDate(string datum);

        void InsertIntoUserMeals(int idKorisnik, int idObrok);

        List<KreiraniObrok> GetMealsForUserById(int idKorisnik);

        List<string> GetDateFromMealByUserId(int id);

        void DeleteMealForUser(int userId,int obrokId);

    }
}
