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
            List<Tipo_Cargo> listaCargo = new List<Tipo_Cargo>();
            listaCargo = _servicio.GetTodosLosTipoCargo().ToList();
            List<SelectListItem> lista = new List<SelectListItem>();
          
            foreach (Tipo_Cargo tipo_cargo in listaCargo)
            {

                lista.Add(new SelectListItem() { Text = tipo_cargo.Descripcion.ToString(), Value = tipo_cargo.Id_Tipo_Cargo.ToString() });

            }
          
            ViewData["listaTipos"] = lista;
            return View();
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Empleado empleado, string dv,string listaTipos)
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
