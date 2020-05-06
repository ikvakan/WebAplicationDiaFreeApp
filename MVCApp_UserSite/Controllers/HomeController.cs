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

        public List<KreiraniObrok> SavedMealsCollection
        {
            get 
            {
                if (Session["savedMealsCollection"]==null)
                {
                    Session["savedMealsCollection"] = new List<KreiraniObrok>();
                }
                return (List<KreiraniObrok>)Session["savedMealsCollection"];
            }
            set 
            {
                Session["savedMealsCollection"] = value;
            }
        }

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

            var createdMeals = repo.GetCreatedMealListByDate(ddlDatumi);


            if (createdMeals == null)
            {
                return RedirectToAction("CustomeError", "Error", new { message = "Greška: Nema jela za odabrani datum." });
            }


            Session["datum"] = ddlDatumi;
            Session["createdMeals"] = createdMeals;

            var mealIDist = createdMeals.Select(m => m.IDObrok).ToList();
            Session["mealIDList"] = mealIDist;

            return View("MealsList", createdMeals);
        }

       

        //[HttpGet]
        //public ActionResult MealsList()
        //{
        //    var obrok=(List<KreiraniObrok>)Session["createdMeals"];

        //    if (obrok != null)
        //    {
        //        return View(obrok);

        //    }
        //    else
        //        return RedirectToAction("CustomeError", "Error", new { message = "Greška: Nema jela za odabrani datum." });

        //}

        public ActionResult MealsListRemove(int id)
        {
           
           // List<KreiraniObrok> savedMealsCollection = new List<KreiraniObrok>();

            var meals = (List<KreiraniObrok>)Session["createdMeals"];
            var savedMeal = meals.Where(m => m.IDObrok == id).First();

            SavedMealsCollection.Add(savedMeal);


           
            meals.Remove(savedMeal);



            if (meals.Count() != 0)
            {
                return View("MealsList", meals);
            }
            else
            {
                //Session.Remove("savedMeals");
                return RedirectToAction("CreateMeal", "Home");
            }
        }



        [HttpGet]
        public ActionResult Menu()
        {
            //if (Session["userName"] == null)
            //{
            //    return RedirectToAction("Login", "Account");
            //}

            IObrok repo = RepoFactory.GetObrokRepo();

            foreach (var item in SavedMealsCollection)
            {
                var userId = (int)Session["userID"];
                repo.InsertIntoUserMeals(userId,item.IDObrok);

            }

            
          
            var obrok = repo.GetMealsForUserById((int)Session["userID"]);

          
            //List<SelectListItem> kolekcija = new List<SelectListItem>();

            //foreach (var item in datumi)
            //{
            //    SelectListItem listItem = new SelectListItem
            //    {
            //        Text = item,
            //        Value = item

            //    };

            //    kolekcija.Add(listItem);
            //}

            //ViewBag.datumi = kolekcija;


            return View();
        }
    }
}