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

      
        public ActionResult Crear()
        {
            //Crear es un View(aspx) No un PartialView(ascx)
            return View("Crear");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Empleado empleado, string dv)
        {
            try
            {
                _servicio.CrearNuevoEmpleado(empleado, dv);

                //Detalles es un View(aspx) No un PartialView(ascx)
                return View("Detalles", empleado);
            }
            catch (RulesException ex)
            {
                //Modificado por sebastian
                //Ocupar Helper para agregar errores
                ModelState.AddRuleErrors(ex.Errors);

                //Crear es un View(aspx) No un PartialView(ascx)
                return View("Crear");
            }

        }

    }
}
