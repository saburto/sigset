using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Data.Modelo;

namespace Web.ViewModel
{
    public class OrdenesTecnicosView
    {
        public IList<Tecnico> Tecnicos { get; set; }
        public IList<OrdenTrabajo> Ordenes { get; set; }
    }
}
