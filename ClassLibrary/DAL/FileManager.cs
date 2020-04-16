using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public class FileManager : IFileManager
    {
        public void AddMealToList(Obrok o)
        {
            List<Obrok> kolekcijaObroka = new List<Obrok>();
            kolekcijaObroka.Add(o);
        }
    }
}
