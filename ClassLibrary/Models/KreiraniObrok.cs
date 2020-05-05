using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{
   public class KreiraniObrok
    {
        public int IDObrok { get; set; }
        public string NazivObroka { get; set; }
        public List<NamirniceModel> ListaNamirnica{ get; set; }
        public DateTime? DatumIzrade { get; set; }

        public bool isSelected { get; set; }
        public KreiraniObrok()
        {
            ListaNamirnica = new List<NamirniceModel>();

        }
    }
}
