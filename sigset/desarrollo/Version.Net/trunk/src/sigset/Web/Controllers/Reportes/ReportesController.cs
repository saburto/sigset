using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Helpers;
using Web.Helpers;

namespace Web.Controllers.Reportes
{
    public class ReportesController : Controller
    {
        //
        // GET: /Reportes/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult TecnicosOrdenes()
        {
            ViewData["tipoEstado"] = new Services.OrdenTrabajo.OrdenTrabajoServicio().GetEstadosOrden().GetSelectCampos("IdEstado", "Descripcion");
            return View();
        }

        public ActionResult ReporteTecnicosOrden(string tipoEstado, DateTime fechaInicio, DateTime fechaFin)
        {
            var inicio = String.Format("{0:MM/dd/yyyy}", fechaInicio);
            var fin = String.Format("{0:MM/dd/yyyy}", fechaFin);
            ViewData["qs"] = string.Format("?tipoEstado={0}&fechaInicio={1}&fechaFin={2}", tipoEstado, inicio, fin);
            return View();
        }

    }
}
