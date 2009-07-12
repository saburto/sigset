using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Web.Helpers;
using Helpers;
using xVal.ServerSide;


namespace Web.Controllers.Administrativos
{
    [Seguridad.ManejadorErrores]
    public class AdministrativosController : Controller
    {
        //
        // GET: /Administrativos/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Lista()
        {
            return View();
        }
    }
}
