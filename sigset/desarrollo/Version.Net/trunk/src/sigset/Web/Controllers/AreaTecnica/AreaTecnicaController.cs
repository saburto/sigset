using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Services.OrdenTrabajo;
using Services.Tecnicos;
using Services.Usuarios;
using Data.Modelo;
using Helpers;
using Data.Modelo.Enums;

namespace Web.Controllers.AreaTecnica
{
    [Web.Seguridad.ManejadorErrores]
    [Authorize(Roles = "tec_ordenes_asignadas,tec_ordenes_reparadas")]
    public class AreaTecnicaController : Controller
    {
        

        IOrdenTrabajoServicio _srvOr;
        ITecnicoServicio _srvTec;
        IUsuarioServicio _srvUser;

        public AreaTecnicaController()
            : this(new OrdenTrabajoServicio(), new TecnicoServicio(), new UsuarioServicio())
        {

        }

        public AreaTecnicaController(IOrdenTrabajoServicio srvOr, ITecnicoServicio srvTec, IUsuarioServicio srvUsua)
        {
            _srvOr = srvOr;
            _srvTec = srvTec;
            _srvUser = srvUsua;
        }


        public ActionResult Index()
        {
            var usuario = this.GetUsuarioActual();
            if (usuario.PerfilUsuario == (int) PerfilUsuarios.Tecnico)
            {
                Session["ModuloActual"] = "AreaTecnica";
                
            }
            else
            {
                Session["ModuloActual"] = null;
                ViewData["MensajeAreaTecnica"] = "Usuario Actual no es técnico";

            }
            return View();
        }


        [Authorize(Roles = "tec_ordenes_asignadas")]
        public ActionResult Lista()
        {
            if (EstaAutenticado())
            {
                Usuario usuario = GetUsuarioActual();
                
                if (usuario != null)
                {
                    Tecnico tecnico =  _srvTec.GetTecnicoById(usuario.Id);

                    if (tecnico != null)
                    {
                        var listaOrdenes = _srvOr.GetOrdenesTrabajoByTecnico(tecnico.Id);
                        listaOrdenes = listaOrdenes.Where(x => x.AsignadoTecnico()).ToList();
                        return View("Lista",listaOrdenes);
                    }
                    
                }
            }
            return View("SinOrdenes");
        }

        [Authorize(Roles = "tec_ordenes_reparadas")]
        public ActionResult ListaReparadas() 
        {
            if (EstaAutenticado())
            {
                Usuario usuario = GetUsuarioActual();

                if (usuario != null)
                {
                    Tecnico tecnico = _srvTec.GetTecnicoById(usuario.Id);

                    if (tecnico != null)
                    {
                        var listaOrdenes = _srvOr.GetOrdenesTrabajoByTecnico(tecnico.Id).Where(x=> x.ReparadoTecnico());
                        return View("ListaReparadas", listaOrdenes);
                    }

                }
            }
            return View("ListaReparadas");
        
        }


        public ActionResult Detalles(decimal id)
        {
            return RedirectToAction("Detalles", "OrdenTrabajo", new { id = id });
        }

        public ActionResult AgregarDetalle(decimal id)
        {
            //Data.Modelo.OrdenTrabajo ot = _srvOr.GetOrdenTrabajo(id);
            Detalle nuevoDetalle = new Detalle();
            nuevoDetalle.IdOrden = id;
            ViewData["Estado"] = _srvOr.GetEstadosOrden().GetSelectCampos("IdEstado","Descripcion");
            return View(nuevoDetalle);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateAntiForgeryToken]
        public ActionResult AgregarDetalle(Detalle detalle)
        {
            try
            {
                if (this.EstaAutenticado())
                {
                    _srvOr.AgregarDetalle(detalle, this.GetUsuarioActual().User);    
                }

                return RedirectToAction("Lista");
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
                return Lista();
            }
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateAntiForgeryToken]
        public ActionResult Aceptar(decimal id)
        {
            if (EstaAutenticado())
            {
                _srvOr.AceptarOrden(id, GetUsuarioActual() );
            }

            return RedirectToAction("Lista");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [ValidateAntiForgeryToken]
        public ActionResult Rechazar(Detalle detalle)
        {
            if (EstaAutenticado())
            {
                detalle.Estado = (int)EstadoOrden.Anulado;
                _srvOr.AgregarDetalle(detalle, GetUsuarioActual().User);
            }

            return RedirectToAction("Lista");
        }

        private Usuario GetUsuarioActual()
        {
            Usuario usuario = null;
            //if (!string.IsNullOrEmpty(USUARIO_TEST))
            //{
            //    usuario = _srvUser.GetUsuariByNombre(USUARIO_TEST);
            //}
            //else
            //{
                usuario = _srvUser.GetUsuariByNombre(HttpContext.User.Identity.Name);
            //}
            return usuario;
        }

        private bool EstaAutenticado()
        {
            return HttpContext.User.Identity.IsAuthenticated;// || !string.IsNullOrEmpty(USUARIO_TEST);
        }


    }
}
