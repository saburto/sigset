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

using System.IO;
using System.Net;
using System.Collections;

using System.Xml;
using Microsoft.Reporting.WebForms;
using System.Web.UI.WebControls;


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

        //[Authorize(Roles = "ordenes_crear")]
        public ActionResult Crear(int? id)
        {
            if (id.HasValue)
            {
                var orden = new Data.Modelo.OrdenTrabajo();
                orden.Cliente = _srvCliente.GetClientePorId(id.Value);

                ViewData["PrecioGarantia"] = _srvArticulo.GetPrecios().GetSelectCampos("IdPrecioGarantia", "ValorRevision", null, "${0}");

                return View(orden);                
            }
            return RedirectToRoute(new { action = "Crear", controller = "Cliente", id = "" });
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind(Exclude = "Id,Marca,Linea")]Articulo articulo,
             string Marca, string Marca_DISPLAY_TEXT, string Linea, string Linea_DISPLAY_TEXT, int IdCliente)
        {
            try
            {
                Marca = string.IsNullOrEmpty(Marca) ? Marca_DISPLAY_TEXT : Marca;
                Linea = string.IsNullOrEmpty(Linea) ? Linea_DISPLAY_TEXT : Linea;
                Articulo art = _srvArticulo.CrearArticulo(articulo, Marca, Linea);
                return RedirectToRoute(new { controller = "OrdenTrabajo", action = "CrearDetalle", id = art.Id, idCliente = IdCliente });
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
            }
            return Crear(IdCliente);
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="id">Id de articulo</param>
        /// <returns></returns>
        public ActionResult CrearDetalle(decimal id, int idCliente)
        {
            ViewData["TipoOrden"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("IdTipoOrden", "Descripcion");
            Cliente cliente = _srvCliente.GetClientePorId(idCliente);
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
                string usuario = null;
                if (Request.IsAuthenticated)
                {
                    if (HttpContext.User != null)
                    {
                        usuario = HttpContext.User.Identity.Name;

                    }
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
            
            ViewData["TipoOrden"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("IdTipoOrden", "Descripcion");
            return View(ordenTrabajo);
        }

        public ActionResult Detalles(decimal id, string format)
        {
            if (format != null)
            {
                return Export(id, format);
            }
            Data.Modelo.OrdenTrabajo orden = _srvOrdenTrabajo.GetOrdenTrabajo(id);
            return View(orden);
        }

        [Authorize(Roles="ordenes_consulta")]
        public ActionResult Consulta()
        {
            return View();
        }

        //[Authorize(Roles = "ordenes_consulta")]
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
            ViewData["ListaTipos"] = _srvOrdenTrabajo.GetTiposOrden().GetSelectCampos("IdTipoOrden", "Descripcion");
            ViewData["ListaEstados"] = _srvOrdenTrabajo.GetEstadosOrden().GetSelectCampos("IdEstado", "Descripcion");
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

        [NonAction]
        private ActionResult Export(decimal id, string exportFormat)
        {
            var exporType = Enum.Parse(typeof(ExportType),exportFormat.ToUpper());
            string format = exporType.ToString().ToUpper();
            ReportViewer rview = new Microsoft.Reporting.WebForms.ReportViewer();
            var file = Path.Combine(Path.Combine(AppDomain.CurrentDomain.BaseDirectory,"Reportes"),"OrdenTrabajo.rdlc");
            StreamReader reader = new StreamReader(file);

            rview.LocalReport.LoadReportDefinition(reader);
            
            List<ReportParameter> param = new List<ReportParameter>();
            param.Add(new ReportParameter("Id",id.ToString()));
            rview.LocalReport.SetParameters(param);
            

            ObjectDataSource obje = new ObjectDataSource(
                "Web.OrdenTrabajoDataSetTableAdapters.OrdenTrabajoVistaTableAdapter", "GetData");
            rview.LocalReport.DataSources.Add(new ReportDataSource("OrdenTrabajoDataSet_OrdenTrabajoVista", obje));

            
            string devInfo = @"<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType, enconding, fileExt;
            string[] streams;
            Warning[] warnings;
            try
            {
                var result = rview.LocalReport.Render(format, devInfo, out mimeType, out enconding, out fileExt, out streams, out warnings);
                return File(result, mimeType);
            }
            catch(Exception ex)
            {
                reader.Close();
                reader.Dispose();
                throw ex;
            }
            
        }
    }
}
