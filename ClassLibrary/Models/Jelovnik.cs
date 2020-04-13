using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{
   public class Jelovnik
    {
        public int IDJelovnik { get; set; }
        public DateTime DatumIzradde { get; set; }
        public Korisnik Korisnik { get; set; }


    }
}
