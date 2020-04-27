using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
   public  interface IHelperMethods
    {
        int SetUserTipDiabetesaForUpdate(string tipDijabetesa);
        
        int SetUserFizAktivnostForUpdate(string fizickaAktivnost);

        bool ContainsIngredient(string name);

        bool ContainsUserName(string usernName);

    }
}
