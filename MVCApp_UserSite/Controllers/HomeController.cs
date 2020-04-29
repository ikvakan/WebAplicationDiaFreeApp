using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCApp_UserSite.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home

         [HttpGet]
        public ActionResult Index()
        {
            if (Session["userName"] == null)
            {
                return RedirectToAction("Login", "Account");
            }


            return View();
        }

        [HttpGet]
        public ActionResult CreateMeal()
        {
            if (Session["userName"]==null)
            {
                return RedirectToAction("Login", "Account");
            }
           
                return View();

        }

        [HttpGet]
        public ActionResult Menu()
        {
            if (Session["userName"] == null)
            {
                return RedirectToAction("Login", "Account");
            }
            return View();
        }
    }
}