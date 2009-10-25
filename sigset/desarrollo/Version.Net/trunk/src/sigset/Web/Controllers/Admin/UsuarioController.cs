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
    [Seguridad.ManejadorErrores]
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
        public ActionResult Editar(int id)
        {
            var usuario = _servicio.GetUsuarioById(id);
            ViewData["listaTipos"] = _servicio.TiposUsuarios().GetSelectCampos("Id_Tipo_Usuario", "Descripcion", usuario.PerfilUsuario.ToString());
            ViewData["listaNombreEmpleado"] = usuario.Nombres.ToString() + " " + usuario.ApellidoPaterno.ToString() + " " + usuario.ApellidoMaterno.ToString();
            return View("Editar", usuario);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(Usuario usuario, string listaTipos,string Pass)
        {
            try
            {

                if (usuario != null)
                {
                    usuario.Password = Pass;
                    usuario.PerfilUsuario = int.Parse(listaTipos);                    
                    var user = _servicio.GetUsuarioById(usuario.Id);
                   
                }
                _servicio.ModificarUsuario(usuario);
                return RedirectToAction("Lista");
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                ViewData["listaTipos"] = _servicio.TiposUsuarios().GetSelectCampos("Id_Tipo_Usuario", "Descripcion", usuario.PerfilUsuario.ToString());
                ViewData["listaNombreEmpleado"] = usuario.Nombres.ToString() + " " + usuario.ApellidoPaterno.ToString() + " " + usuario.ApellidoMaterno.ToString();
                return View(usuario);
               
            }
        }
       
        public ActionResult Crear()
        {
             ViewData["PerfilUsuario"] = _servicio.TiposUsuarios().GetSelectCampos("Id", "Descripcion");
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind (Exclude="Id")]Usuario usuario)
        {
            try
            {
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
