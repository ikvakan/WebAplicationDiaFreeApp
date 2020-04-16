using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClassLibrary.DAL
{
    public static class RepoFactory
    {
        public static IRepo GetRepo()
        {
            return new Repo();
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
