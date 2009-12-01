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
    [Authorize(Roles="config_tipo_articulo")]
    public class TipoArticuloController : Controller
    {
        IArticuloServicio _srvArt;

        public TipoArticuloController()
            :this(null)
        {

        }

        public TipoArticuloController(IArticuloServicio srvArt)
        {
            _srvArt = srvArt ?? new ArticuloServicio();
        }

        public ActionResult Lista(int? index)
        {
            List<Data.Modelo.TipoArticulo> modelo = null;
            if (!index.HasValue)
            {
                index = 0;
            }

            var articulos = _srvArt.GetTiposArticulos();
            int total = articulos.Count;
            modelo = articulos.Skip(index.Value * 10).Take(10).ToList();

            ViewData["Paginado"] = new Paginador() { Total = total, IndexPaginaActual = index.Value  };

            return View("Lista", modelo);
            
        }


        public ActionResult Eliminar(string IdTipoArticulo)
        {
            try
            {
                _srvArt.EliminarTipoArticulo(IdTipoArticulo);
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
                string IdTipoArticulo = collection[0];
                string descripcion = collection[1];
                _srvArt.ModificarTipoArticulo(IdTipoArticulo, descripcion);
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
