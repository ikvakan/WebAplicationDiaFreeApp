using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
   public interface IFileManager
    {
      
        string WriteUserTofile(List<KorisnikModel> k);

    }
}
