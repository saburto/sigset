using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.Clientes;
using System.Web.Routing;
using Data.Modelo;
using Services.Articulos;
using Services.OrdenTrabajo;
using Web.Helpers;
using Helpers;

namespace Web.Controllers
{
    //[Authorize]
    [Web.Seguridad.ManejadorErrores]
    public class OrdenTrabajoController : Controller
    {

        IClienteServicio _srvCliente;
        IArticuloServicio _srvArticulo;
        IOrdenTrabajoServicio _srvOrdenTrabajo;
        

        public OrdenTrabajoController(IClienteServicio serv, IArticuloServicio servArt, IOrdenTrabajoServicio serOrd)
        {
            _srvCliente = serv;
            _srvArticulo = servArt;
            _srvOrdenTrabajo = serOrd;
        }

        public OrdenTrabajoController()
            :this(new ClienteServicio(), new ArticuloServicio(), new OrdenTrabajoServicio())
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
                orden.Cliente = _srvCliente.GetClientePorRut(rut.Value);
                return View(orden);                
            }
            return RedirectToRoute(new { action = "Buscar", controller = "Cliente", id = "" });
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Id de articulo</param>
        /// <returns></returns>
        public ActionResult CrearDetalle(decimal id, decimal rut)
        {
            ViewData["Tipo_Orden"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("Id_Tipo_Orden", "Descripcion");


            Cliente cliente = _srvCliente.GetClientePorRut(rut);
            Orden_Trabajo ot = new Orden_Trabajo();
            ot.Cliente = cliente;
            ot.Id_Cliente =cliente.Rut;

            Articulo articulo = _srvArticulo.GetArticulo(id);
            ot.Articulo = articulo;
            ot.Id_Articulo = articulo.Id;

            ot.Fecha_Entrega = DateTime.Now.AddDays(5);

            return View(ot);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CrearDetalle(Orden_Trabajo ordenTrabajo)
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
