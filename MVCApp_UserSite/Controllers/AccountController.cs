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
            IKorisnik repo = RepoFactory.GetKorisnikRepo();

            if (helper.UserLoginCheck(ulm.UserName, ulm.Password))
            {
                Session["userName"] = ulm.UserName;
                Session["userID"] = repo.GetUserId(ulm.UserName,ulm.Password);

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
            try
            {

                if (ModelState.IsValid)
                {
                    repo.InsertUser(k);
                    return RedirectToAction("Login", "Account");

                }
                else
                    return View(k);
            }
            catch (Exception)
            {

             return RedirectToAction("CustomeError","Error", new {message= "Greška: Korisnik nije dodan." });
                
            }
            
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