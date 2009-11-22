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


    [Authorize(Roles = "usuarios_crear, usuarios_listar, permisos_crear, permisos_listar, perfiles_listar, sistema_configuracio")]
    public class AdminController : Controller
    {
        //
        // GET: /Admin/

        public ActionResult Index()
        {
            Session["ModuloActual"] = "Admin";
            return View();
        }
      
       
    }
}
