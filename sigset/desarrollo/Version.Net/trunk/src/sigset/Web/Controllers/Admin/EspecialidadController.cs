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

        //
        // GET: /Especialidad/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /Especialidad/Create

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

        //
        // GET: /Especialidad/Edit/5
 
        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Especialidad/Edit/5

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here
 
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
