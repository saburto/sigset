using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.Configuraciones;
using System.IO;

namespace Web.Controllers.Admin
{
    public class compare : IComparer<Data.Modelo.Configuracion>
    {

        #region IComparer<Configuracion> Members

        public int Compare(Data.Modelo.Configuracion x, Data.Modelo.Configuracion y)
        {
            if (x.Id == 10)
            {
                return 1;
            }

            if (y.Id == 10)
            {
                return -1;
            }

            return x.Id.ToString().CompareTo(y.Id.ToString());
        }

        #endregion
    }


    [Seguridad.ManejadorErrores]
    [Authorize(Roles = "config_generales")]
    public class ConfiguracionController : Controller
    {
        ConfiguracionServicio srv;

        public ConfiguracionController()
        {
            srv = new ConfiguracionServicio();
        }

        public ActionResult Lista()
        {
            var configs = srv.GetConfiguraciones();
            configs.Sort(new compare());
            

            return View("Lista",configs);
        }

        public ActionResult Editar(FormCollection collecion)
        {
            srv.ModificarConfiguracion(int.Parse(collecion[0]), collecion[1]);
            return RedirectToAction("Lista");
        }

        public ActionResult Logo()
        {

            HttpPostedFileBase file = Request.Files[0];
            if (file.ContentLength > 0)
            {
                string filePath = Path.Combine(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content/images"),"Logo.jpg");

                FileInfo fileInfo = new FileInfo(filePath);
                if (fileInfo.Exists)
                {
                    fileInfo.Delete();
                }

                file.SaveAs(filePath);
            }
            return RedirectToAction("Lista");
        }


    }
}
