using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public static class RepoFactory
    {
        public static IObrok GetObrokRepo()
        {
            return new ObrokRepo();
        }

        public static IKorisnik GetKorisnikRepo()
        {
            return new KorisnikRepo();
        }

        public static INamirnica GetNamirnicaRepo()
        {
            return new NamirnicaRepo();
        }

        public static IHelperMethods GetHelperMethods()
        {
            return new HelperMethods();
        }

        public static IFileManager GetFileManager()
        {
            return new FileManager();
        }
    }
}
