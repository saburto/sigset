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


namespace Web.Controllers //.Admin
{
    [Web.Seguridad.ManejadorErrores]
    public class EmpleadoController : Controller
    {
        IEmpleadoServicio _servicio;

        public EmpleadoController()
            :this(new EmpleadoServicio())
        {

        }

        public EmpleadoController(IEmpleadoServicio ser)
        {
            _servicio = ser;
        }

      
        public ActionResult Lista()
        {
          
            var empleados = _servicio.GetTodosLosEmpleados();
           
            return View(empleados);
        }

      
        
        public ActionResult Editar(int id)
        {
            var empleado = _servicio.BuscarEmpleadoPorRut(id);
            ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(id);
            ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion", empleado.Perfil.Id.ToString());
            return View("Editar", empleado);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(int id, Usuario empleado, string listaTipos)
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
            ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion", empleado.Perfil.Id.ToString());
            return PartialView("Detalles", empleado);
        }


              
        public ActionResult Crear()
        {

            ViewData["listaTipos"] = _servicio.GetTodosLosTipoCargo().GetSelectCampos("Id_Tipo_Cargo", "Descripcion");
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Usuario empleado, string dv, string listaTipos)
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
