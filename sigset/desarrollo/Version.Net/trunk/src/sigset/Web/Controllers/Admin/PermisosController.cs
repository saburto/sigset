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
using Web.ViewModel;

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
            return RedirectToAction("AgregarPermiso", new { id = perfil });
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

        public ActionResult AgregarPermisoUsuario(decimal idUsuario)
        {
            ViewData["idUsuario"] = idUsuario;
            var usuario  = servUsuario.GetUsuarioById(idUsuario);
            ViewData["idperfil"] = usuario.Perfil.Id;
            PermisosUsuariosView permisosUsuario = new PermisosUsuariosView();
            permisosUsuario.ListaUsuarioPermiso = servAut.GetUsuariosPermisos(idUsuario);
            permisosUsuario.ListaPerfilPermiso = servAut.GetPerfilPermisoByIdUsuario(idUsuario);
            return View(permisosUsuario);
        }

        public ActionResult AgregarUsuariosPermisos(decimal idUsuario)
        {
            ViewData["idUsuario"] = idUsuario;
            var usuario  = servUsuario.GetUsuarioById(idUsuario);
            IList<Permiso> permisos = servAut.GetPermisosDisponiblesUsuario(idUsuario, usuario.Perfil.Id);
            return View(permisos);
         }

        public ActionResult QuitarUsuarioPermiso(decimal idPermiso, decimal idPerfil,decimal idUsuario)
        {
            servAut.EliminarUsuarioPermiso(idPermiso, idPerfil,idUsuario);
            return RedirectToAction("AgregarPermisoUsuario", new { idUsuario = idUsuario });
        }

        public ActionResult EstadoUsuarioPermiso(decimal idPermiso, decimal idUsuario)
        {
            servAut.CambiarEstadoUsuarioPermiso(idPermiso,idUsuario);
            return RedirectToAction("AgregarPermisoUsuario", new { idUsuario = idUsuario });
        }
        public ActionResult CambiarEstadoPerfilUsuarioPermiso(decimal idPermiso, decimal idUsuario)
        {
            servAut.GuardarUsuarioPermisoBloqueado(idPermiso, idUsuario);
            return RedirectToAction("AgregarPermisoUsuario", new { idUsuario = idUsuario });
        }

        public ActionResult AgregarUsuarioPermiso(decimal idPermiso, decimal idUsuario)
        {
            servAut.GuardarNuevoUsuarioPermiso(idPermiso, idUsuario);
            return RedirectToAction("AgregarUsuariosPermisos", new { idUsuario = idUsuario });
        
        }
    }
}
