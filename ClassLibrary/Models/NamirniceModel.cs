using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{
   public class NamirniceModel 
        
    {
        public int IDNamirnice  { get; set; }
        public string NazivNamirnice { get; set; }
        public int Energija_kJ  { get; set; }
        public int Energija_kcal { get; set; }
        public string TipNamirnice { get; set; }

        public int Grami  { get; set; }
        public int Komad { get; set; }
        public int Zlica{ get; set; }
        public int Salica { get; set; }

        
    }
}
