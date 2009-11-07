using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.Configuraciones;

namespace Web.Controllers.Admin
{
    public class ConfiguracionController : Controller
    {
        ConfiguracionServicio srv;

        public ConfiguracionController()
        {
            srv = new ConfiguracionServicio();
        }

        public ActionResult Lista()
        {
            return View("Lista",srv.GetConfiguraciones());
        }

        public ActionResult Editar(FormCollection collecion)
        {
            srv.ModificarConfiguracion(int.Parse(collecion[0]), collecion[1]);
            return Lista();
        }


    }
}
