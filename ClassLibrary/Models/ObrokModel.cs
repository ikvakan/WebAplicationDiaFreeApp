﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.Models
{
   public class ObrokModel
    {
        public int IDObrok { get; set; } 
        public string NazivObroka { get; set; }
        //public List<Namirnice> ListaNamirnica{ get; set; }
        public DateTime? DatumIzrade { get; set; }

        public ObrokModel()
        {
            //ListaNamirnica = new List<Namirnice>();
            
        }
       
    }
}
