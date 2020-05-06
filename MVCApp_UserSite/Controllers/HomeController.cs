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
            if (Session["userName"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

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
                return RedirectToAction("Index");
            }

            var createdMeals = repo.GetCreatedMealListByDate(ddlDatumi);

            if (createdMeals.Count() == 0)
            {
                return RedirectToAction("CustomeError", "Error", new { message = "Greška: Nema jela za odabrani datum." });
            }

            Session["datum"] = ddlDatumi;
            Session["createdMeals"] = createdMeals;

            return View("MealsList", createdMeals);
        }

       [HttpGet]
        public ActionResult MealsListRemove(int id)
        {
           
          
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
                //Session.Remove("savedMealsCollection");
                return RedirectToAction("CreateMeal", "Home");
            }
        }



        [HttpGet]
        public ActionResult Menu()
        {
            if (Session["userName"] == null)
            {
                return RedirectToAction("Login", "Account");
            }

            IObrok repo = RepoFactory.GetObrokRepo();

            if (SavedMealsCollection.Count() > 0)
            {
                foreach (var item in SavedMealsCollection)
                {
                    var userId = (int)Session["userID"];
                    repo.InsertIntoUserMeals(userId,item.IDObrok);

                }
            }



            var datumi = repo.GetDateFromMealByUserId((int)Session["userID"]);
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

            return View();
        }

        [HttpPost]

        public ActionResult Menu(string ddlDatumi)
        {
            if (string.IsNullOrEmpty(ddlDatumi))
            {
                return RedirectToAction("Index");
            }

            IObrok repo = RepoFactory.GetObrokRepo();

            var meals= repo.GetMealsForUserById((int)Session["userID"]);

            if (meals.Count()== 0)
            {
                return RedirectToAction("Menu","Home");
            }

            var mealsByDate=meals.Where(o => o.DatumIzrade.Value.ToShortDateString() == ddlDatumi).ToList();

            Session["userDate"] = ddlDatumi;

            //ViewBag.datum = ddlDatumi;

            return View("UserMenus", mealsByDate);
        }

        
        public ActionResult DeleteMenu(int obrokId,string date)
        {
            IObrok repo = RepoFactory.GetObrokRepo();
            var userId=(int)Session["userID"];

            repo.DeleteMealForUser(userId, obrokId);
            var meals = repo.GetMealsForUserById(userId);

            var mealsByDate = meals.Where(o => o.DatumIzrade.Value.ToShortDateString() == date).ToList();




            if (mealsByDate.Count() > 0)
            {
                return View("UserMenus", mealsByDate);
            }
            else
            {
                Session.Remove("savedMealsCollection");
                return RedirectToAction("Menu");
            }

        }

    }
}