using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;
using Services.Usuarios;
using xVal.ServerSide;
using Web.Helpers;
using Helpers;



namespace Web.Controllers.Admin
{
    public class UsuarioController : Controller
    {
        //
        // GET: /Usuario/
        IUsuarioServicio _servicio;
        public UsuarioController():this (new UsuarioServicio())
        {
        }
        public UsuarioController (IUsuarioServicio servicio)
	    {
            _servicio = servicio;
	    }   
           
   
        public ActionResult Lista()
        {
            var usuarios = _servicio.GetTodosLosUsuario();
            return View(usuarios);
        }
        public ActionResult Eliminar(decimal id)
        {
            try
            {
                _servicio.EliminarUsuario(id);
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
             ViewData["listaEmpleados"] = _servicio.TodosLosEmpleados().GetSelectCampos("Rut", "Nombre");
             ViewData["listaTipos"] = _servicio.TiposUsuarios().GetSelectCampos("Id_Tipo_Usuario", "Descripcion");
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind (Exclude="Id")]Usuario usuario,string listaTipos,string Pass,string listaEmpleados)
        {
            try
            {
                if (usuario != null)
                {
                    usuario.Empleado = decimal.Parse(listaEmpleados);
                    usuario.Contraseña = Pass;
                    usuario.Tipo_Usuario = decimal.Parse(listaTipos);
                }
                _servicio.CrearUsuario(usuario);
                return RedirectToAction("Lista");

            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                ViewData["listaEmpleados"] = _servicio.TodosLosEmpleados().GetSelectCampos("Rut", "Nombre");
                ViewData["listaTipos"] = _servicio.TiposUsuarios().GetSelectCampos("Id_Tipo_Usuario", "Descripcion");
                return View();
            }
        
        }
    }
}
