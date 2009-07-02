using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;
using Data.Repositorios.TipoCargo;
using Services.TipoCargo;

namespace Web.Controllers
{
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
            var tipo_cargo = _servicio.EditarTipoCargo(id, tipo);
            return RedirectToAction("Lista",tipo_cargo);
        }
        public ActionResult Crear()
        {
            return View("Crear");
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Tipo_Cargo tipo)
        {
             _servicio.CrearTipoCargo(tipo);
            return RedirectToAction("Lista");
        }
    }

}
