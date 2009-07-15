using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Web.Helpers;
using Helpers;
using xVal.ServerSide;
using Services.OrdenTrabajo;
using Services.Tecnicos;
using Data.Modelo;

namespace Web.Controllers.Administrativos
{
    [Seguridad.ManejadorErrores]
    public class AdministrativosController : Controller
    {
        IOrdenTrabajoServicio _srvOr;
        ITecnicoServicio _srvTecnicos;

        public AdministrativosController()
            :this(new OrdenTrabajoServicio(), new TecnicoServicio())
        {

        }

        public AdministrativosController(IOrdenTrabajoServicio srvOr, ITecnicoServicio srvTec)
        {
            _srvOr = srvOr;
            _srvTecnicos = srvTec;
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListaSinAsignar()
        {
            var lista = _srvOr.GetOrdenesTrabajoSinAsignar();
            return View(lista);
        }

        public ActionResult Asignar(decimal id)
        {
            TempData["IdOrden"] = id;
            return View(_srvTecnicos.GetTodosLosTecnicos());
        }

        public ActionResult AsignarTecnico(decimal rutTecnico, decimal id )
        {
            TempData["rutTecnico"] = rutTecnico;
            Detalle nuevoDetalle = new Detalle();
            nuevoDetalle.Id_Orden = id;
            return View(nuevoDetalle);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AsignarTecnico(Detalle detalle, decimal rutTecnico)
        {
            _srvOr.AsginarTecnicoOrden(detalle, rutTecnico, HttpContext.User.Identity.Name);
            var orden = _srvOr.GetOrdenTrabajo(detalle.Id_Orden);
            return View("Detalles",orden);
        }
    }
}
