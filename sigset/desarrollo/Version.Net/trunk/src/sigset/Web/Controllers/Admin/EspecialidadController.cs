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

        public ActionResult Lista()
        {
            
            return View("Lista",_srvTecnicos.GetTodasEspecialidades());
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
                return Lista();
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
                return Lista();
            }
            
        }

      }
}
