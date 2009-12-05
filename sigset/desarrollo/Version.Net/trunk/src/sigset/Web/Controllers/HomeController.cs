using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.LogFilter;
using Web.Helpers;
using Microsoft.Reporting.WebForms;
using System.IO;
using System.Web.UI.WebControls;
using Web.DateSetInformes;

namespace Web.Controllers
{
    [Web.Seguridad.ManejadorErrores]
    [Log]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            Session["ModuloActual"] = null;

            ViewData["Message"] = "Bienvenido";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }

        public ActionResult pruebaReport()
        {

            string format = "XHTML";
            ReportViewer rview = new Microsoft.Reporting.WebForms.ReportViewer();
            var file = Path.Combine(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Reportes"), "OrdenesTecnicos.rdlc");
            StreamReader reader = new StreamReader(file);

            rview.LocalReport.LoadReportDefinition(reader);

            ObjectDataSource obje = new ObjectDataSource(
                "Web.DateSetInformes.OrdenesTecnicosTableAdapters.OrdenesSegunTecnicoTableAdapter", "GetData");
            //(global::System.Nullable<int> tipoEstado, global::System.Nullable<global::System.DateTime> fechaInicio, global::System.Nullable<global::System.DateTime> fechaFin) {
            obje.SelectParameters.Add("tipoEstado", "2");
            obje.SelectParameters.Add("fechaInicio", "2008-01-10");
            obje.SelectParameters.Add("fechaFin", "2010-01-01");


            rview.LocalReport.DataSources.Add(new ReportDataSource("OrdenesTecnicos_OrdenesSegunTecnico", obje));
            

            string devInfo = @"<DeviceInfo><Toolbar>False</Toolbar></DeviceInfo>";
            string mimeType, enconding, fileExt;
            string[] streams;
            Warning[] warnings;
            try
            {
                var result = rview.LocalReport.Render(format, devInfo, out mimeType, out enconding, out fileExt, out streams, out warnings);
                return File(result, mimeType);
            }
            catch (Exception ex)
            {
                reader.Close();
                reader.Dispose();
                throw ex;
            }

        
        }
    }
}
