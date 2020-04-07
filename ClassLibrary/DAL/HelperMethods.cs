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


    }
}
