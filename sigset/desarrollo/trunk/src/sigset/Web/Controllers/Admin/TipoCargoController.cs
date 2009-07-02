using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;
using Data.Repositorios.TipoCargo;
using Services.TipoCargo;
using xVal.ServerSide;
using Web.Helpers;
using Web.Seguridad;

namespace Web.Controllers
{
    [ManejadorErrores]
    public class TipoCargoController : Controller
    {

        ITipoCargoServicio _servicio;

        public TipoCargoController()
            : this(new TipoCargoServicio())
        {

        }

        public TipoCargoController(ITipoCargoServicio ser)
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
        public ActionResult Editar(int id, Tipo_Cargo tipo)
        {
            try
            {
                var tipo_cargo = _servicio.EditarTipoCargo(id, tipo);
                return RedirectToAction("Lista", tipo_cargo);
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                return View();
            
            }
        }
        public ActionResult Crear()
        {
            return View("Crear");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Tipo_Cargo tipo)
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
