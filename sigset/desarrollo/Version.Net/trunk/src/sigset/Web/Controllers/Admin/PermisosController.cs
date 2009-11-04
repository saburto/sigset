using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using System.Reflection;
using Web.Helpers;
using Helpers;
using Data.Modelo;

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
            Data.Repositorios.RepoGenerico<Data.Modelo.Modulo> repo = new Data.Repositorios.RepoGenerico<Data.Modelo.Modulo>();
            ViewData["Mod_Id"] = repo.GetAll().ToList().GetSelectCampos("Id", "DescripcionOpcion");
            return View();
        }

        public ActionResult Editar()
        {
            return View();
        }

        public ActionResult PerfilesPermisos(decimal id)
        {
            servAut.GetPermisosByPerfil(id);
            ViewData["idperfil"] = servUsuario.GetPerfilById(id).Id;
            ViewData["perfil"] = servUsuario.GetPerfilById(id).Descripcion;
            return View(servAut.GetPermisosByPerfil(id));
        }

        public ActionResult AgregarPermiso(decimal id)
        {
            ViewData["idperfil"] = servUsuario.GetPerfilById(id).Id;
            return View(servAut.GetPermisosDisponibles(id));
        }

        public ActionResult Agregar(decimal id, decimal perfil)
        {
            servAut.AgregarPermisoAPerfil(id, perfil);
            return RedirectToAction("PerfilesPermisos", new { id = perfil });
        }

        public ActionResult QuitarPerfilPermiso(decimal idPermiso, decimal idPerfil)
        {
            servAut.EliminarPerfilPermiso(idPermiso, idPerfil);
            return RedirectToAction("PerfilesPermisos", new { id = idPerfil });
        }

        public ActionResult DetallesPermisos(decimal idPermiso, decimal idPerfil)
        {
            var permiso = servAut.GetPermisoById(idPermiso);
            if (Request.IsAjaxRequest())
            {
                return PartialView("DetallesPermiso", permiso);
            }
            return View(permiso);
        }

        public ActionResult EstadoPermiso(decimal idPerfilPermiso, decimal idPerfil)
        {
            var perfilPermiso = servAut.GetPerfilPermisoById(idPerfilPermiso);
            servAut.ActualizarEstadoPerfilPermiso(perfilPermiso);
            return RedirectToAction("PerfilesPermisos", new { id = idPerfil });
        }
    }
}
