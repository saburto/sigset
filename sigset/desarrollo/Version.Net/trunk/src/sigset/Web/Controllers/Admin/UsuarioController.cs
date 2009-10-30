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
            SetPerfilSelect(usuario.PerfilUsuario.ToString());
            return View("Editar", usuario);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(Usuario usuario)
        {
            try
            {
                _servicio.ModificarUsuario(usuario);
                return RedirectToAction("Lista");
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                SetPerfilSelect();
                return View(usuario);
            }
        }

        private void SetPerfilSelect()
        {
            SetPerfilSelect(null);
        }
        private void SetPerfilSelect(string seleccionado)
        {
            ViewData["PerfilUsuario"] = _servicio.TiposUsuarios().GetSelectCampos("Id", "Descripcion",seleccionado);
        }
       
        public ActionResult Crear()
        {
            SetPerfilSelect();
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
                SetPerfilSelect();
                return View();
            }
        }
    }
}
