using ClassLibrary.DAL;
using ClassLibrary.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MVCApp_UserSite.Controllers
{
    public class AJAXController : Controller
    {
        // GET: AJAX

       
        public ActionResult CreateMeal(string datum)
        {

            IObrok repo = RepoFactory.GetObrokRepo();
            List<KreiraniObrok> createdMeal = repo.GetCreatedMealList(datum);

            return Json(createdMeal, JsonRequestBehavior.AllowGet);
        }
    }
}