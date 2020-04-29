using ClassLibrary.DAL;
using ClassLibrary.Models;
using MVCApp_UserSite.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

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

        [HttpPost]
        public ActionResult Login(UserLoginModel ulm)
        {
            
            IHelperMethods helper = RepoFactory.GetHelperMethods();


            if (helper.UserLoginCheck(ulm.UserName, ulm.Password))
            {
                Session["userName"] = ulm.UserName;
                return RedirectToAction("Index", "Home");
            }
            else
            {
                return View(ulm);
            }

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
                return RedirectToAction("AddUserError","Error", new {message= "Greška: Korisnik nije dodan." });
        }


        public ActionResult LogOut()
        {
            if (Session["userName"] == null)
            {
                return RedirectToAction("Login");
            }

            var message = Session["userName"];
            FormsAuthentication.SignOut();
            Session.Abandon(); 
            return View(message);
        }

    }
}