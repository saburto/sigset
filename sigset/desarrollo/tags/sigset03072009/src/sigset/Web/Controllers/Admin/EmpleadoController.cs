using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.Empleados;
using Data.Modelo;
using xVal.ServerSide;
using Web.Helpers;
using Helpers;

//AMor de controllers, okis??oki
namespace Web.Controllers //.Admin
{
    public class EmpleadoController : Controller
    {
        //jojoj, XD
        //amor la misma logica con las interfaces de servicio
        IEmpleadoServicio _servicio;

        public EmpleadoController()
            :this(new EmpleadoServicio())
        {

        }

        public EmpleadoController(IEmpleadoServicio ser)
        {
            _servicio = ser;
        }

        //amor voy a hacer una lista de empleados, okis??Doki
        public ActionResult Lista()//amor fijate como se crea la vistaspis
        {
            //aqui llamo al serivicio, que ha su vez llama al repositorio, okis??
            var empleados = _servicio.GetTodosLosEmpleados();
            //aqui le paso el modelo a la vista
            return View(empleados);
        }

      
        
        public ActionResult Editar(int id)
        {
            var empleado = _servicio.BuscarEmpleadoPorRut(id);
            ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(id);
            ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion", empleado.Tipo_Cargo.Id_Tipo_Cargo.ToString());
            return View("Editar", empleado);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(int id, Empleado empleado, string listaTipos)
        {
            try
            {
                _servicio.EditarEmpleado(id, listaTipos, empleado);
                return RedirectToAction("Lista");
            }
            catch
                (RulesException ex)
            {
                //Modificado por sebastian
                //Ocupar Helper para agregar errores
                ModelState.AddRuleErrors(ex.Errors);
                ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion");
                ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(id);
                //Crear es un View(aspx) No un PartialView(ascx)
                return View(empleado);
            }
        }

        public ActionResult Detalles(int id)
        {
            var empleado = _servicio.BuscarEmpleadoPorRut(id);
            ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(id);
            ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion");
            return PartialView("Detalles", empleado);
        }


              
        public ActionResult Crear()
        {

            ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion");
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Empleado empleado, string dv, string listaTipos)
        {
            try
            {
                              
                 _servicio.CrearNuevoEmpleado(empleado, dv, listaTipos);

                //Detalles es un View(aspx) No un PartialView(ascx)
                 //ViewData["listaTipos"] = CargarTipoCargo();

                //Despues que lo guarda sim ningun problema redirige hacia la lista
                return RedirectToAction ("Lista");
            }
            catch (RulesException ex)
            {
                //Modificado por sebastian
                //Ocupar Helper para agregar errores
                ModelState.AddRuleErrors(ex.Errors);


                ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion");
                //Crear es un View(aspx) No un PartialView(ascx)
                return View();
            }
        }

    }
}
