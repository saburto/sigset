﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace MvcSiteMap.Web.Controllers
{
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";
            
            return View();
        }

        public ActionResult Sitemap()
        {
            return View(SiteMap.RootNode);
        }

        [Authorize]
        public ActionResult About()
        {
            return View();
        }
    }
}
