using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Web.Controllers
{
    //[Authorize]
    public class OrdenTrabajoController : Controller
    {
        //
        // GET: /OrdenTrabajo/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Crear()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(string rut)
        {
            return View();
        }

        
 

        public ActionResult Consulta()
        {
            return View();
        }

        public ActionResult Listar()
        {
            return View();
        }
    }
}
