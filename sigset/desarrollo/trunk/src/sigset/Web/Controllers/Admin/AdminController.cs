using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Web.Helpers;
using Helpers;
using xVal.ServerSide;


namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            return View();
        }
      
       
    }
}
