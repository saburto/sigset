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
using System.IO;
using System.Text.RegularExpressions;



namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    public class UsuarioController : Controller
    {
        //
        // GET: /Usuario/
        IUsuarioServicio _servicio;
        public UsuarioController()
            : this(new UsuarioServicio())
        {
        }
        public UsuarioController(IUsuarioServicio servicio)
        {
            _servicio = servicio;
        }


        public ActionResult Lista()
        {
            var usuarios = _servicio.GetTodosLosUsuario();
            return View(usuarios);
        }

        public ActionResult ListaPerfil(int perfil)
        {
            var usuarios = _servicio.GetTodosLosUsuario().Where(x => x.PerfilUsuario == perfil);
            return View("Lista", usuarios);
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

            ViewData["imagen"] = ImagenUsuarioExiste(usuario.Id);

            return View("Editar", usuario);
        }

        private bool? ImagenUsuarioExiste(int id)
        {
            var carpeta = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content/usuarios");
            var newPath = Path.Combine(carpeta, id + ".jpg");
            FileInfo fileInfo = new FileInfo(newPath);
            if (fileInfo.Exists)
            {
                return true;
            }
            else
            {
                return null;
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(Usuario usuario)
        {
            try
            {
                _servicio.ModificarUsuario(usuario);

                RenameImagen(usuario);

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
            ViewData["PerfilUsuario"] = _servicio.TiposUsuarios().GetSelectCampos("Id", "Descripcion", seleccionado);
        }

        public ActionResult Crear()
        {
            SetPerfilSelect();
            return View();
        }
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind(Exclude = "Id")]Usuario usuario)
        {
            try
            {
                _servicio.CrearUsuario(usuario);
                RenameImagen(usuario);

                return RedirectToAction("Lista");

            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                SetPerfilSelect();
                return View();
            }
        }

        private void RenameImagen(Usuario usuario)
        {
            if (TempData["imagen"] != null)
            {
                var carpeta = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content/usuarios");
                string savedFileName = Path.Combine(
                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content/usuarios"),
                    TempData["imagen"].ToString()
                    );
                FileInfo fileInfo = new FileInfo(savedFileName);
                var newPath = Path.Combine(carpeta, usuario.Id + Path.GetExtension(TempData["imagen"].ToString()));
                FileInfo newFileInfo = new FileInfo(newPath);
                if (newFileInfo.Exists)
                {
                    newFileInfo.Delete();
                }
                fileInfo.MoveTo(newPath);
            }
        }

        public ActionResult SubirFotoUsuario(string id)
        {
            if (id != null)
            {
                return View((object)id);    
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult SubirFotoUsuario()
        {
            var hpf = Request.Files[0];
            var filename = Path.GetFileName(hpf.FileName);

            string ext = Path.GetExtension(filename);
            Regex reg = new Regex(@"\.(jpg)$");
            if (!reg.IsMatch(ext.ToLower()))
            {
                ViewData["error"] = "Solo archivos de imagenes .jpg";
                return View();
            }

            if (hpf.ContentLength == 0)
            {
                return View();
            }
            string savedFileName = Path.Combine(
                                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content/usuarios"),
                                    Path.GetFileName(hpf.FileName)
                                    );
            hpf.SaveAs(savedFileName);
            TempData["imagen"] = filename;
            return View((object)filename);
        }
    }
}
