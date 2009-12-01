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
using Data.Modelo.Constantes;
using Services.Helpers;



namespace Web.Controllers.Admin
{
    [Seguridad.ManejadorErrores]
    [Authorize]
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

        [Authorize(Roles="usuarios_listar")]
        public ActionResult Lista(int? index)
        {
            IList<Usuario> modelo = null;
            if (!index.HasValue)
            {
                index = 0;
            }

            var usuarios = _servicio.GetTodosLosUsuario();
            int total = usuarios.Count;
            modelo = usuarios.Skip(index.Value * 10).Take(10).ToList();

            ViewData["Paginado"] = new Paginador() { Total = total, IndexPaginaActual = index.Value };

            return View("Lista", modelo);
        }

        [Authorize(Roles = "usuarios_listar")]
        public ActionResult ListaPerfil(int perfil)
        {
            var usuarios = _servicio.GetTodosLosUsuario().Where(x => x.PerfilUsuario == perfil);
            return View("Lista", usuarios);
        }

        [Authorize(Roles = "usuarios_crear")]
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

        [Authorize(Roles = "usuarios_crear")]
        public ActionResult Editar(int id)
        {
            var usuario = _servicio.GetUsuarioById(id);
            SetPerfilSelect(usuario.PerfilUsuario.ToString());

            ViewData["imagen"] = ImagenUsuarioExiste(usuario.User);

            return View("Editar", usuario);
        }

        private bool? ImagenUsuarioExiste(string id)
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
        [Authorize(Roles = "usuarios_crear")]
        public ActionResult Editar(Usuario usuario)
        {
            try
            {
                _servicio.ModificarUsuario(usuario);

                RenameImagen(usuario.User);

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

        [Authorize(Roles = "usuarios_crear")]
        public ActionResult Crear()
        {
            SetPerfilSelect();
            return View();
        }

        [Authorize(Roles = "usuarios_buscar")]
        public ActionResult Buscar()
        {
            SetPerfilSelect();
            return View();
        }


        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateInput(false)]
        [Authorize(Roles = "usuarios_buscar")]
        public ActionResult Buscar(Usuario usuario, string RutDisplay)
        {

            if (!string.IsNullOrEmpty(RutDisplay))
            {
                try
                {
                    if (RutDisplay.Contains('-'))
                    {
                        string[] data = RutDisplay.Split('-');
                        if (ValidarRut.RutEsValido(data[0], data[1]))
                        {
                            usuario.Rut = int.Parse(data[0]);
                        }
                        else
                        {
                            throw new Exception();
                        }
                    }
                    else
                    {
                        throw new Exception();
                    }
                }
                catch (Exception e)
                {
                    return Content("Rut no valido. Ej.: 12345678-9");
                }
            }


            var usuarios = _servicio.BuscarUsuario(usuario);


            return PartialView("ListaUsuario", usuarios);
        }



        [Authorize(Roles = "usuarios_crear")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind(Exclude = "Id")]Usuario usuario)
        {
            try
            {
                _servicio.CrearUsuario(usuario);
                RenameImagen(usuario.User);

                return RedirectToAction("Lista");

            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
                SetPerfilSelect();
                return View();
            }
        }

        private void RenameImagen(string usuario)
        {
            if (Session["imagen"] != null)
            {
                var carpeta = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Content\usuarios");
                string savedFileName = Path.Combine(
                    Path.Combine(AppDomain.CurrentDomain.BaseDirectory, @"Content\usuarios"),
                    Session["imagen"].ToString()
                    );
                FileInfo fileInfo = new FileInfo(savedFileName);
                var newPath = Path.Combine(carpeta, usuario + ".jpg" );
                FileInfo newFileInfo = new FileInfo(newPath);
                if (newFileInfo.Exists)
                {
                    newFileInfo.Delete();
                }
                fileInfo.MoveTo(newPath);
                Session["imagen"] = null;
            }
        }

        [Authorize(Roles = "usuarios_crear")]
        public ActionResult SubirFotoUsuario(string id)
        {
            if (id != null)
            {
                return View((object)id);    
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "usuarios_crear")]
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

            FileInfo fileInfo = new FileInfo(savedFileName);
            if (fileInfo.Exists)
            {
                fileInfo.Delete();
            }

            hpf.SaveAs(savedFileName);
            Session["imagen"] = filename;
            return View((object)filename);
        }

        public RemoteValidationResult UsuarioExiste(Usuario usuario)
        {
            var usuarioExiste = _servicio.GetUsuariByNombre(usuario.User);
            if (usuarioExiste == null)
            {
                return RemoteValidationResult.Success;
            }
            else
            {
                return RemoteValidationResult.Failure("Usuario ya existe");
            }
        }

        public RemoteValidationResult RutExiste(Usuario usuario)
        {
            var usuarioExiste = _servicio.BuscarEmpleadoByRut(usuario.Rut);
            if (usuarioExiste == null)
            {
                return RemoteValidationResult.Success;
            }
            else
            {
                return RemoteValidationResult.Failure("Rut ya existe");
            }
        }
    }
}
