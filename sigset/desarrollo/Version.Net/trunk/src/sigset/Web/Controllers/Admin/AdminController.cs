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


    [Authorize(Roles = "usuarios_crear,usuarios_listar,usuarios_buscar,usuarios_perfiles,config_generales,config_permisos,config_categoria,config_tipo_articulo,config_precios")]
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
