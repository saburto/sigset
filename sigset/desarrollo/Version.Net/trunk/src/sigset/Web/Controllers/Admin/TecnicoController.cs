using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;
using Services.Tecnicos;
using Web.Helpers;
using Helpers;
using xVal.ServerSide;


namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    [Authorize(Roles="ad_tecnicos_lista")]
    public class TecnicoController : Controller
    {

        ITecnicoServicio _servicio;

           public TecnicoController()
            :this(new TecnicoServicio())
        {

        }

        public TecnicoController(ITecnicoServicio ser)
        {
            _servicio = ser;
        }

        public ActionResult Lista(int? index)
        {
            List<Data.Modelo.Tecnico> modelo = null;
            if (!index.HasValue)
            {
                index = 0;
            }

            var tecnicos = _servicio.GetTodosLosTecnicos();
            int total = tecnicos.Count;
            modelo = tecnicos.Skip(index.Value * 10).Take(10).ToList();

            ViewData["Paginado"] = new Paginador() { Total = total, IndexPaginaActual = index.Value };

            return View("Lista", modelo);
        }

        public ActionResult Detalles(int id)
        {
            return View(_servicio.GetTecnicoById(id));
        }


        public ActionResult AgregarEspecialidades(decimal id)
        {
            ViewData["tecnico"] = _servicio.GetTecnicoByRut(id);
            ViewData["rutTecnico"] = id; 
            var especialidades = _servicio.EspecialidadesByTecnico(id);                
            return View(especialidades);
        }
        public ActionResult EliminarEspecialidad(decimal id,decimal Id_Tecnico)
        {
          try
            {

                _servicio.EliminarEspecialidad(id);
                return RedirectToAction("AgregarEspecialidades", new { id = Id_Tecnico });
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                TempData["MensajeError"] = e.Errors.FirstOrDefault().ErrorMessage;
                return RedirectToAction("AgregarEspecialidades",new {id=id});
             }

         }

        public ActionResult AgregarNuevaEspecialidad(int id)
        {
            var tecnico = _servicio.GetTecnicoById(id);
            ViewData["tipoEspecialidades"] = _servicio.GetTodasEspecialidades();

            if (Request.IsAjaxRequest())
            {
                ViewData["ventana"] = true;
                return PartialView("AgregarNuevaEsp",tecnico);
            }

            return View(tecnico);
        }

        [AcceptVerbs (HttpVerbs.Post)]
        public ActionResult AgregarNuevaEspecialidad(int idTecnico,int[] especialidades)
        {
                                    
            _servicio.ModificarEspecialidades(idTecnico,especialidades);
            return AgregarNuevaEspecialidad(idTecnico);
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public string Nivel(int idTecnico, int idNivel)
        {
            _servicio.ModificarNivel(idTecnico, idNivel);

            return idNivel.ToString();
        }


    }
}
