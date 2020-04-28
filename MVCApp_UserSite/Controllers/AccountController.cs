using ClassLibrary.DAL;
using ClassLibrary.Models;
using MVCApp_UserSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCApp_UserSite.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        [HttpGet]
        public ActionResult Login()
        {

            return View(new UserLoginModel());
        }


        [HttpGet]
        public ActionResult Register()
        {
            KorisnikModel k = new KorisnikModel();

            return View(k);
        }

        [HttpPost]
        public ActionResult Register(KorisnikModel k)
        {

            IKorisnik repo = RepoFactory.GetKorisnikRepo();

            if (ModelState.IsValid)
            {
                repo.InsertUser(k);
                return RedirectToAction("Index", "Home");

            }
            else
                return RedirectToAction("Greška: Korisnik nije dodan.");
        }

    }
}