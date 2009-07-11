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

        public ActionResult Lista()
        {
            var tecnicos = _servicio.GetTodosLosTecnicos();
            return View(tecnicos);
        }

        public ActionResult Editar(int id)
        {
            var tecnico = _servicio.GetTecnicoByRut(id);
            ViewData["niveles"] = _servicio.GetTodosLosNiveles().GetSelectCampos("Id_Nivel", "Descripcion",tecnico.Nivel.ToString());
            return View(tecnico);   
        }
        [AcceptVerbs (HttpVerbs.Post)]
        public ActionResult Editar(int id, Tecnico tecnico,string niveles)
        {
            try
            {
                tecnico.Rut = id;
                tecnico.Nivel = decimal.Parse(niveles);
                _servicio.EditarTecnico(tecnico);
                return RedirectToAction("Lista");
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                var t = _servicio.GetTecnicoByRut(id);
                ViewData["niveles"] = _servicio.GetTodosLosNiveles().GetSelectCampos("Id_Nivel", "Descripcion");
                return View(t);  
            
            }
        }


        public ActionResult Crear()
        {
            ViewData["listaEmpleadosTecnicos"] = _servicio.GetTodosLosTecnicosEmpleados().GetSelectCampos("Rut", "Nombre"); 
            ViewData["niveles"] = _servicio.GetTodosLosNiveles().GetSelectCampos("Id_Nivel", "Descripcion");
            return View();           
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Tecnico tecnico, string niveles, string listaEmpleadosTecnicos)
        {
            try
            {
                tecnico.Rut = decimal.Parse(listaEmpleadosTecnicos);
                tecnico.Nivel = decimal.Parse(niveles);
                _servicio.CrearTecnico(tecnico);
                return RedirectToAction("Lista");

            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                ViewData["listaEmpleadosTecnicos"] = _servicio.GetTodosLosTecnicosEmpleados().GetSelectCampos("Rut", "Nombre");
                ViewData["niveles"] = _servicio.GetTodosLosNiveles().GetSelectCampos("Id_Nivel", "Descripcion");
                return View(tecnico);   

            
            }
           
        }
       


    }
}
