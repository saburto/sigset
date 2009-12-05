using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Data.Modelo.Enums;

namespace Web.Reportes
{
    public partial class OrdenesPorTecnico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var para = new List<ReportParameter>();

            if (Request.Params["tipoEstado"] != null)
            {
                var tipoEstado = Request.Params["tipoEstado"];
                //Data.Modelo.Enums.EstadoOrden;
                EstadoOrden estado = (EstadoOrden) Enum.Parse(typeof(EstadoOrden), tipoEstado);
                string nombreEstado = estado.ToString();
                switch (estado)
                {   
                    case EstadoOrden.EnRevisión:
                        nombreEstado = "en Revisión";
                        break;
                    case EstadoOrden.EnReparación:
                        nombreEstado = "en Reparación";
                        break;
                    case EstadoOrden.SinGarantia:
                        nombreEstado = "sin Garantía";
                        break;
                }
                para.Add(new ReportParameter("estado", nombreEstado));
            }
            this.ReportViewer1.LocalReport.SetParameters(para);
        }
    }
}
