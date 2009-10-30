using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;

namespace Web.Controllers.Admin
{
    public class PermisosController : Controller
    {
        Services.Usuarios.UsuarioServicio servUsuario = new Services.Usuarios.UsuarioServicio();
        Services.Autorizacion.AutorizacionService servAut = new Services.Autorizacion.AutorizacionService();

        //
        // GET: /Permisos/

        public ActionResult Usuario(string id)
        {
            var usuario = servUsuario.GetUsuarioById((decimal.Parse(id)));
            return View(usuario);
        }

        public ActionResult Lista()
        {
            return View(servAut.GetPermisos());
        }

        public ActionResult Crear()
        {
            return View();
        }

        public ActionResult Editar()
        {
            return View();
        }

    }
}
