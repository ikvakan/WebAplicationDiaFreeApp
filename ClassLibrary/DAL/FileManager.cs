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
        public void AddMealToList(ObrokModel o)
        {
            List<ObrokModel> kolekcijaObroka = new List<ObrokModel>();
            kolekcijaObroka.Add(o);
        }
    }
}
