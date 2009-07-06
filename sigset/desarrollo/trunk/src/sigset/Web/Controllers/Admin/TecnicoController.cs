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

        public ActionResult Crear()
        {
            ViewData["listaEmpleadosTecnicos"] = _servicio.GetTodosLosTecnicosEmpleados().GetSelectCampos("Rut", "Nombre"); 
            ViewData["niveles"] = _servicio.GetTodosLosNiveles().GetSelectCampos("Id_Nivel", "Descripcion");
            ViewData["tipoEspecialidad"] = _servicio.GetTodosLosTiposDeEspecialidad().GetSelectCampos("Id_Tipo_Especialidad", "Descripcion");
            return View();           
        }

    }
}
