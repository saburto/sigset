using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.Clientes;
using System.Web.Routing;

namespace Web.Controllers
{
    //[Authorize]
    [Web.Seguridad.ManejadorErrores]
    public class OrdenTrabajoController : Controller
    {

        IClienteServicio _srv;

        public OrdenTrabajoController(IClienteServicio serv)
        {
            _srv = serv;
        }

        public OrdenTrabajoController()
            :this(new ClienteServicio())
        {

        }


        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Crear(decimal? rut)
        {
            if (rut.HasValue)
            {
                var orden = new Data.Modelo.Orden_Trabajo();
                orden.Cliente = _srv.GetClientePorRut(rut.Value);
                return View(orden);                
            }
            return RedirectToRoute(new { action = "Buscar", controller = "Cliente", id = "" });
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
