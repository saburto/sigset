using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.Tecnicos;
using xVal.ServerSide;
using Web.Helpers;
using Helpers;
using Services.Articulos;

namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    [Authorize(Roles="config_precios")]
    public class PrecioGarantiaController : Controller
    {
        IArticuloServicio _srvArt;

        public PrecioGarantiaController()
            :this(null)
        {

        }

        public PrecioGarantiaController(IArticuloServicio srvArt)
        {
            _srvArt = srvArt ?? new ArticuloServicio();
        }

        public ActionResult Lista(int? index)
        {
            List<Data.Modelo.PrecioGarantia> modelo = null;
            if (!index.HasValue)
            {
                index = 0;
            }

            var lista = _srvArt.GetPrecios();
            int total = lista.Count;
            modelo = lista.Skip(index.Value * 10).Take(10).ToList();

            ViewData["Paginado"] = new Paginador() { Total = total, IndexPaginaActual = index.Value };

            return View("Lista", modelo);
        }


        public ActionResult Eliminar(string IdPrecioGarantia)
        {
            try
            {
                _srvArt.EliminarPrecioGarantia(IdPrecioGarantia);
                return RedirectToAction("Lista");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
                return Lista(null);
            }
            
            
        }

  
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Guardar(FormCollection collection)
        {
            try
            {
                string IdPrecioGarantia = collection[0];
                string valorRevision = collection[1];
                string valorReparacion = collection[2];

                _srvArt.ModificarPrecioGarantia(IdPrecioGarantia, valorRevision, valorReparacion);
                return RedirectToAction("Lista");
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                return Lista(null);
            }
            
        }

      }
}
