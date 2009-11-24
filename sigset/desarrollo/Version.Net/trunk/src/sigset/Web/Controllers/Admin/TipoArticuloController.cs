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

        public ActionResult Lista()
        {
            
            return View("Lista", _srvArt.GetTiposArticulos());
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
                return Lista();
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
                return Lista();
            }
            
        }

      }
}
