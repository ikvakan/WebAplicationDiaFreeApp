﻿
using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public class HelperMethods : IHelperMethods
    {


        public int SetUserTipDiabetesaForUpdate(string tipDijabetesa)
        {
            int result = 0;

            switch (tipDijabetesa)
            {
                case "tip1":
                    result = 1;
                    break;
                case "tip2":
                    result = 2;
                    break;
            }

            return result;
        }

        public int SetUserFizAktivnostForUpdate(string fizickaAktivnost)
        {
            int result = 0;

            switch (fizickaAktivnost)
            {
                case "slaba":
                    result = 1;
                    break;
                case "umjerena":
                    result = 2;
                    break;
                case "intenzivna":
                    result = 3;
                    break;
            }

            return result;
        }

        public bool ContainsIngredient(string name)
        {
            INamirnica repo = RepoFactory.GetNamirnicaRepo();

            List<NamirniceModel> kolekcijaNamirnica = repo.getIngredients("sve");

            bool result = false;

            foreach (var item in kolekcijaNamirnica)
            {
                if (item.NazivNamirnice.ToLower()==name.ToLower())
                {
                    
                    result= true;
                    break;
                }
            }

            return result;
        }

        public bool ContainsUserName(string userName)
        {
            var result = true;

            IKorisnik repo = RepoFactory.GetKorisnikRepo();

            foreach (var item in repo.GetAllUsers())
            {
                if (item.KorisnickoIme == userName)
                {
                    result= false;
                    break;
                }
            }
            
                return result;
        }

    }
}
