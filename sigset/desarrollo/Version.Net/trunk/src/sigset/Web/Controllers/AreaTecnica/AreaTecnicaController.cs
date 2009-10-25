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

namespace Web.Controllers.AreaTecnica
{
    [Web.Seguridad.ManejadorErrores]
    [Authorize(Roles = "Técnico")]
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
            return View();
        }

        public ActionResult Lista()
        {
            if (HttpContext.User.Identity.IsAuthenticated)
            {
                Usuario  usuario = _srvUser.GetUsuariByNombre(HttpContext.User.Identity.Name);
                if (usuario != null)
                {
                    Tecnico tecnico =  _srvTec.GetTecnicoByRut(usuario.Rut);

                    if (tecnico != null)
                    {
                        var listaOrdenes = _srvOr.GetOrdenesTrabajoByTecnico(tecnico.Id);
                        return View(listaOrdenes);
                    }
                    
                }
            }
            return View("SinOrdenes");
        }

        public ActionResult Detalles(decimal id)
        {
            return new OrdenTrabajoController().Detalles(id, null);
        }

        public ActionResult AgregarDetalle(decimal id)
        {
            //Data.Modelo.OrdenTrabajo ot = _srvOr.GetOrdenTrabajo(id);
            Detalle nuevoDetalle = new Detalle();
            nuevoDetalle.IdOrden = id;
            ViewData["Estado"] = _srvOr.GetEstadosOrden().GetSelectCampos("Id_Estado","Descripcion");
            return View(nuevoDetalle);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult AgregarDetalle(Detalle detalle)
        {
            try
            {
                _srvOr.AgregarDetalle(detalle, HttpContext.User.Identity.Name);
                return RedirectToAction("Detalles", new { id = detalle.IdOrden });
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
                return View(detalle);
            }
            
            
        }

    }
}
