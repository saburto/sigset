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

        public ActionResult Crear()
        {
             ViewData["listaTipos"] = _servicio.TiposUsuarios().GetSelectCampos("Id_Tipo_Usuario", "Descripcion");
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind (Exclude="Id")]Usuario usuario,string listaTipos,string Pass)
        {
            try
            {
                if (usuario != null)
                {
                    usuario.Contrase�a = Pass;
                    usuario.Tipo_Usuario = decimal.Parse(listaTipos);
                }
                _servicio.CrearUsuario(usuario);
                return RedirectToAction("Lista");

            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                ViewData["listaTipos"] = _servicio.TiposUsuarios().GetSelectCampos("Id_Tipo_Usuario", "Descripcion");
                return View();
            }
        
        }
    }
}
