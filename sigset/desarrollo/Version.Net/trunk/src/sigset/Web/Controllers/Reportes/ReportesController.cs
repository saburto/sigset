using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Helpers;
using Web.Helpers;
using System.Globalization;

namespace Web.Controllers.Reportes
{
    [Authorize(Roles = "informes_tecnicos, informes_ordenes")]
    public class ReportesController : Controller
    {
        //
        // GET: /Reportes/

        public ActionResult Inicio()
        {
            Session["ModuloActual"] = "Reportes";
            return View("Index");
        }

        [Authorize(Roles = "informes_tecnicos")]
        public ActionResult TecnicosOrdenes()
        {
            ViewData["tipoEstado"] = new Services.OrdenTrabajo.OrdenTrabajoServicio().GetEstadosOrden().GetSelectCampos("IdEstado", "Descripcion");
            return View();
        }

        [Authorize(Roles = "informes_tecnicos")]
        public ActionResult ReporteTecnicosOrden(string tipoEstado, DateTime fechaInicio, DateTime fechaFin)
        {
            CultureInfo ci = new CultureInfo("en-US");

            var inicio = fechaInicio.ToString("yyyy/MM/dd", ci);
            var fin = fechaFin.ToString("yyyy/MM/dd", ci);
            ViewData["qs"] = string.Format("?tipoEstado={0}&fechaInicio={1}&fechaFin={2}", tipoEstado, inicio, fin);
            return View();
        }

    }
}
