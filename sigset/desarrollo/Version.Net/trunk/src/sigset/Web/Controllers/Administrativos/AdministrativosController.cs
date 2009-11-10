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
using Web.ViewModel;

namespace Web.Controllers.Administrativos
{
    [Seguridad.ManejadorErrores]
    //[Authorize(Roles = "Administrativo,Sistema")]
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
            var tecnicos = _srvTecnicos.GetTodosLosTecnicos();
            OrdenesTecnicosView model = new OrdenesTecnicosView()
            {
                Ordenes = lista,
                Tecnicos = tecnicos
            };
            return View(model);
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
            nuevoDetalle.IdOrden = id;
            return View(nuevoDetalle);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AsignarTecnico(Detalle detalle, int rutTecnico)
        {
            _srvOr.AsginarTecnicoOrden(detalle, rutTecnico, HttpContext.User.Identity.Name);
            var orden = _srvOr.GetOrdenTrabajo((int)detalle.IdOrden);
            return View("Detalles",orden);
        }

        public ActionResult OrdenesTecnico(decimal id)
        {
            var ordenes =  _srvOr.GetOrdenesTrabajoByTecnico(id);
            return View(ordenes);
        }

        public ActionResult ConsultaOrdenes()
        {
            return new OrdenTrabajoController().Listar();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult ConsultaOrdenes(DateTime Fecha_Inicio, DateTime Fecha_Final, string ListaTipos, string ListaEstados)
        {
            return new OrdenTrabajoController().Listar(Fecha_Inicio, Fecha_Final, ListaTipos, ListaEstados);
        }
    }
}
