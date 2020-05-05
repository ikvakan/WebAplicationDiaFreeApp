using ClassLibrary.DAL;
using ClassLibrary.Models;
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
            //if (Session["userName"] == null)
            //{
            //    return RedirectToAction("Login", "Account");
            //}

            IObrok repo = RepoFactory.GetObrokRepo();

            var datumi = repo.GetDateFromMeal();

            List<SelectListItem> kolekcija = new List<SelectListItem>();

            foreach (var item in datumi)
            {
                SelectListItem listItem = new SelectListItem
                {
                    Text = item,
                    Value = item

                };

                kolekcija.Add(listItem);
            }

            ViewBag.datumi = kolekcija;


            return View("CreateMeal");

        }

        [HttpPost]
        public ActionResult CreateMeal(string ddlDatumi)
        {
            IObrok repo = RepoFactory.GetObrokRepo();

            if (string.IsNullOrEmpty(ddlDatumi))
            {
                return RedirectToAction("CreateMeal");
            }

            var createdMeals = repo.GetCreatedMealList(ddlDatumi);

            if (createdMeals == null)
            {
                return RedirectToAction("CustomeError", "Error", new { message = "Greška: Nema jela za odabrani datum." });
            }


            return View("MealsList", createdMeals);
        }


        public ActionResult MealsList(List<KreiraniObrok> obrok)
        {

            if (obrok != null)
            {
                return View(obrok);

            }
            else
                return RedirectToAction("CustomeError", "Error", new { message = "Greška: Nema jela za odabrani datum." });


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