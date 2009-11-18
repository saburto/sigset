using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using xVal.ServerSide;
using Services.Articulos;
using Services.Tecnicos;
using Helpers;
using Web.Helpers;

namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    public class CategoriaController : Controller
    {
         IArticuloServicio _srvArt;
         ITecnicoServicio _srvTecnico;

        public CategoriaController()
            :this(null, null)
        {

        }

        public CategoriaController(IArticuloServicio srvArt, ITecnicoServicio srvTecnico)
        {
            _srvArt = srvArt ?? new ArticuloServicio();
            _srvTecnico = srvTecnico ?? new TecnicoServicio();
        }

        public ActionResult Lista()
        {
            ViewData["TipoEspcialidad"] = _srvTecnico.GetTodosLosTiposDeEspecialidad().GetSelectCampos("IdTipoEspecialidad", "Descripcion");
            return View("Lista", _srvArt.GetCategorias());
        }


        public ActionResult Eliminar(string IdCategoria)
        {
            try
            {
                _srvArt.EliminarCategoria(IdCategoria);
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
                string idCategoria = collection[0];
                string descripcion = collection[1];
                string idTipoEspecialidad = collection[2];
                _srvArt.ModificarCategoria(idCategoria, descripcion, idTipoEspecialidad);
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
