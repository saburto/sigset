using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.LogFilter;

namespace Web.Controllers
{
    [HandleError]
    [Log]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Bienvenido";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
    }
}
