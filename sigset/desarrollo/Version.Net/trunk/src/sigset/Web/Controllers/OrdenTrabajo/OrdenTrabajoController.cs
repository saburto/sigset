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
using xVal.ServerSide;

namespace Web.Controllers
{
    //[Authorize]
    [Web.Seguridad.ManejadorErrores]
    //[Authorize(Roles = "Técnico,Recepcionista,Administrativo,Sistema")]
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

        [Authorize(Roles = "ordenes_crear")]
        public ActionResult Crear(int? id)
        {
            if (id.HasValue)
            {
                var orden = new Data.Modelo.OrdenTrabajo();
                orden.Cliente = _srvCliente.GetClientePorId(id.Value);
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
            ViewData["TipoOrden"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("Id_TipoOrden", "Descripcion");
            Cliente cliente = _srvCliente.GetClientePorRut(rut);
            Data.Modelo.OrdenTrabajo ot = new Data.Modelo.OrdenTrabajo();
            ot.Cliente = cliente;
            

            Articulo articulo = _srvArticulo.GetArticulo(id);
            ot.Articulo = articulo;
            ot.IdArticulo = articulo.Id;

            ot.FechaEntrega = DateTime.Now.AddDays(5);

            return View(ot);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CrearDetalle(Data.Modelo.OrdenTrabajo ordenTrabajo)
        {
            try
            {
                string usuario = "rmorales";
                if(HttpContext.User != null)
                {
                    usuario = HttpContext.User.Identity.Name;

                }
                decimal idOrden = _srvOrdenTrabajo.CrearOrdenTrabajo(ordenTrabajo,usuario);
                return RedirectToAction("Detalles", new { id = idOrden });
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
            }
            catch(Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
            }
            
            ViewData["TipoOrden"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("Id_TipoOrden", "Descripcion");
            return View(ordenTrabajo);
        }

        public ActionResult Detalles(decimal id, string format)
        {
            Data.Modelo.OrdenTrabajo ot = _srvOrdenTrabajo.GetOrdenTrabajo(id);

            if (format != null)
            {
                if (format == "xls")
                {
                    List<Data.Modelo.OrdenTrabajo> or = new List<Data.Modelo.OrdenTrabajo>();
                    or.Add(ot);
                    return this.Excel(or.AsQueryable(), "OrdenTrabajo"+ id +".xls", new string[] {"Id","Serie","Cliente.ClienteParticular.Rut", "Falla","Condicion_Articulo","TipoOrden","FechaEntrega","Boleta","Poliza","Fecha_Compra","Lugar_Compra" });
                }
            }

            return View(ot);
        }

        [Authorize(Roles="ordenes_consulta")]
        public ActionResult Consulta()
        {
            return View();
        }

        [Authorize(Roles = "ordenes_consulta")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Consulta(decimal? Id, decimal? Rut, string dv)
        {
            if (!Id.HasValue)
            {
                if (!Rut.HasValue)
                {
                    return Content("<p><span class="+ HtmlHelper.ValidationMessageCssClassName +">Debe ingresar número de orden o rut para consulta.</span></p>");
                }
                else
                {
                    var ordenesTrabajo = _srvOrdenTrabajo.GetOrdenesTrabajoByRut(Rut.Value);
                    if (!ordenesTrabajo.Any())
                    {
                        return Content("<p><span class="+ HtmlHelper.ValidationMessageCssClassName +">Rut no posee orden de trabajo asociado.</span></p>");
                    }
                    else
                    {
                        return PartialView("ListaOrdenes", ordenesTrabajo);
                    }
                }
            }
            else
            {
                var ordenTrabajo = _srvOrdenTrabajo.GetOrdenTrabajo(Id.Value);
                if (ordenTrabajo == null)
                {
                    return Content("<p><span class="+ HtmlHelper.ValidationMessageCssClassName +">Orden de trabajo con ese número no se encuentra.</span></p>");
                }
                else
                {
                    var lista = new List<Data.Modelo.OrdenTrabajo>();
                    lista.Add(ordenTrabajo);
                    return PartialView("ListaOrdenes", lista);
                }
            }
        }

      //  [Authorize(Roles="ordenes_listar")]
        public ActionResult Listar()
        {
            ViewData["ListaTipos"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("Id_TipoOrden", "Descripcion");
            ViewData["ListaEstados"] = _srvOrdenTrabajo.GetEstadosOrden().GetSelectCampos("Id_Estado", "Descripcion");
            return View();
        }

        
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Listar(DateTime Fecha_Inicio, DateTime Fecha_Final, string ListaTipos,string ListaEstados)
        {
            try
            {
                var ordenes = _srvOrdenTrabajo.GetOrdenesTrabajo(Fecha_Inicio, Fecha_Final, ListaTipos, ListaEstados);
                 return PartialView("ListaOrdenes", ordenes);
            }
            catch (Exception ex)
            {
                return Content("<p><span class=" + HtmlHelper.ValidationMessageCssClassName + ">"+ ex.Message +"</span></p>");
            }
            
        }

        public ActionResult ListarExcel(string Fecha_Inicio, string Fecha_Final, string ListaTipos, string ListaEstados, string format)
        {

            if (!string.IsNullOrEmpty(format) && format == "xls" && !string.IsNullOrEmpty(Fecha_Inicio) && !string.IsNullOrEmpty(Fecha_Final))
            {
                DateTime date = Convert.ToDateTime(Fecha_Inicio);
                DateTime date2 = Convert.ToDateTime(Fecha_Final);
                var ordenes = _srvOrdenTrabajo.GetOrdenesTrabajo(date, date2, ListaTipos, ListaEstados);
                return this.Excel(ordenes.AsQueryable(), "OrdenesTrabajo.xls", new string[] { "Id", "Serie", "Cliente.ClienteParticular.Rut", "Falla", "Condicion_Articulo", "TipoOrden", "FechaEntrega", "Boleta", "Poliza", "Fecha_Compra", "Lugar_Compra" });
            }
            return Content("");
        }
    }
}
