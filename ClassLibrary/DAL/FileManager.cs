using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace ClassLibrary.DAL
{
    public class FileManager : IFileManager
    {

        private string FILE_PATH =HttpContext.Current.Server.MapPath("~\\SpremljeniKorisnici.txt");

        

        public FileManager()
        {
           
        }

        

        public string WriteUserTofile(List<KorisnikModel> k)
        {
            string message = string.Empty;
            message = "Korisnici spremljeni.";


            try
            {

                using (StreamWriter w = new StreamWriter(FILE_PATH))
                {
                    foreach (var item in k)
                    {
                        w.WriteLine($"{item.Ime},{item.Prezime},{item.Email}");

                    }

                }
            }
            catch (Exception)
            {

                //throw new Exception($"Greška: {ex.Message}");
                message = $"Grška kod zapisivanja.";
            }
            return message;
        }
    }
}
