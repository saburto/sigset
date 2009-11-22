using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;

using Services.TipoCargo;
using xVal.ServerSide;
using Web.Helpers;
using Web.Seguridad;

namespace Web.Controllers
{
    [ManejadorErrores]
    [Authorize]
    public class PerfilesController : Controller
    {

        ITipoCargoServicio _servicio;

        public PerfilesController()
            : this(new TipoCargoServicio())
        {

        }

        public PerfilesController(ITipoCargoServicio ser)
        {
            _servicio = ser;
        }


        public ActionResult Lista()
        {
            var tipo_cargo = _servicio.GetTodosLosTiposCargo();
            return View(tipo_cargo);
        }

        public ActionResult Editar(int id)
        {
            var tipo_cargo = _servicio.GetTipoCargoById(id);
            return View("Editar" ,tipo_cargo);
        }
        [AcceptVerbs (HttpVerbs.Post)]
        public ActionResult Editar(int id, Perfil tipo)
        {
            try
            {
                var tipo_cargo = _servicio.EditarTipoCargo(id, tipo);
                return RedirectToAction("Lista");
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                return View(tipo);
            
            }
        }
       
        public ActionResult Eliminar(int id)
        {
            try
            {
                _servicio.BorrarTipoCargo(id);
                return RedirectToAction("Lista");
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                TempData["MensajeError"] = e.Errors.FirstOrDefault().ErrorMessage;
                return RedirectToAction("Lista");
             }

        }
        public ActionResult Crear()
        {
            return View("Crear");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Perfil tipo)
        {
            try
            {
                _servicio.CrearTipoCargo(tipo);
                return RedirectToAction("Lista");
            }
            catch(RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                return View();

            }
              
             
      
         }
    }

}
