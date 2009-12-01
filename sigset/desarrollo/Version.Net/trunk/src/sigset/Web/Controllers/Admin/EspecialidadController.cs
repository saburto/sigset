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

namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    [Authorize(Roles = "ad_tecnicos_especialidades")]
    public class EspecialidadController : Controller
    {
        ITecnicoServicio _srvTecnicos;

        public EspecialidadController()
            :this(null)
        {

        }

        public EspecialidadController(ITecnicoServicio srvTecnico)
        {
            _srvTecnicos = srvTecnico ?? new TecnicoServicio();
        }

        public ActionResult Lista(int? index)
        {
            List<Data.Modelo.TipoEspecialidad> modelo = null;
            if (!index.HasValue)
            {
                index = 0;
            }

            var tipo_cargo = _srvTecnicos.GetTodasEspecialidades();
            int total = tipo_cargo.Count;
            modelo = tipo_cargo.Skip(index.Value * 10).Take(10).ToList();

            ViewData["Paginado"] = new Paginador() { Total = total, IndexPaginaActual = index.Value };

            return View("Lista", modelo);
        }


        public ActionResult Eliminar(string IdTipoEspecialidad)
        {
            try
            {
                _srvTecnicos.EliminarTipoEspecialidad(IdTipoEspecialidad);
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
                string idTipoEspecialidad = collection[0];
                string descripcion = collection[1];
                _srvTecnicos.ModificarTipoEspecialidad(idTipoEspecialidad, descripcion);
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
