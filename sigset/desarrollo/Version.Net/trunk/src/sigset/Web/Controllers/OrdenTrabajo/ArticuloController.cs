using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Web.Helpers;
using Services.Articulos;
using Helpers;
using Data.Modelo;
using xVal.ServerSide;
using Web.Seguridad;

namespace Web.Controllers.OrdenTrabajo
{
    [ManejadorErrores]
    [Authorize]
    public class ArticuloController : Controller
    {
        IArticuloServicio _srv;
        public ArticuloController(IArticuloServicio ser)
        {
            _srv = ser;
        }

        public ArticuloController()
            :this(new ArticuloServicio())
        {

        }

        [Authorize(Roles = "articulo_consulta")]
        public ActionResult Buscar(decimal? id)
        {
            if (id.HasValue)
            {
                TempData["rutOrden"] = id;
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "articulo_consulta")]
        public ActionResult Buscar(string Modelo, string Marca_DISPLAY_TEXT, string idCliente)
        {
            ViewData["idCliente"] = idCliente;
            string returnContent = "";
            returnContent = "<p><span class='" + HtmlHelper.ValidationMessageCssClassName + "'>";
            try
            {
                Articulo art = _srv.GetArticuloPorModeloMarca(Modelo, Marca_DISPLAY_TEXT);
                return PartialView("Detalle", art);

            }
            catch (Exception ex)
            {
                returnContent += ex.Message;
            }
            returnContent += "</span></p>";
            return Content(returnContent);
        }

        public ActionResult Detalles(int id)
        {
           return View("Detalles",_srv.GetArticulo(id));
        }

        [Authorize(Roles="articulo_crear")]
        public ActionResult Crear()
        {
            ViewData["PrecioGarantia"] = _srv.GetPrecios().GetSelectCampos("IdPrecioGarantia", "ValorRevision", null, "${0}");
            return View();
        }

        [Authorize(Roles = "articulo_crear")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind(Exclude = "Id,Marca,Linea")]Articulo articulo,string Marca, string Marca_DISPLAY_TEXT, string Linea, string Linea_DISPLAY_TEXT)
        {
            try
            {
                Marca = string.IsNullOrEmpty(Marca) ? Marca_DISPLAY_TEXT : Marca;
                Linea = string.IsNullOrEmpty(Linea) ? Linea_DISPLAY_TEXT : Linea;
                Articulo art = _srv.CrearArticulo(articulo, Marca, Linea);
                return RedirectToAction("Lista");
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
            }
            catch(Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
            }
            return Crear();
        }


        [Authorize(Roles = "articulo_crear")]
        public ActionResult Editar(decimal id)
        {
            var articulo = _srv.GetArticulo(id);
            ViewData["PrecioGarantia"] = _srv.GetPrecios().GetSelectCampos("IdPrecioGarantia", "ValorRevision", articulo.PrecioGarantia.ToString() , "${0}");
            return View("Editar",articulo);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        [Authorize(Roles = "articulo_crear")]
        public ActionResult Editar([Bind(Exclude = "Marca,Linea")]Articulo articulo, string Marca, string Marca_DISPLAY_TEXT, string Linea, string Linea_DISPLAY_TEXT)
        {
            try
            {
                Marca = Marca_DISPLAY_TEXT;
                Linea = Linea_DISPLAY_TEXT;
                Articulo art = _srv.ModificarArticulo(articulo, Marca, Linea);
                return RedirectToAction("Lista");
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
            }
            return Editar(articulo.Id);
        }

        [Authorize(Roles = "articulo_listar")]
        public ActionResult Lista()
        {
            var articulos = _srv.GetArticulos();
            return View(articulos);
        }

        public ActionResult GetMarcas(string q)
        {
            var marcasJson = _srv.GetMarcas(q).ToAutoCompleteJson("Descripcion", "Descripcion");
            return Json(marcasJson);
        }

        public ActionResult GetTipoArticulo(string q)
        {
            var tipoArticuloJson = _srv.GetTipoArticulos(q).ToAutoCompleteJson("IdTipoArticulo", "Descripcion");
            return Json(tipoArticuloJson);
        }

        public ActionResult GetCategorias(string q)
        {
            var categoriaJson = _srv.GetCategoria(q).ToAutoCompleteJson("IdCategoria", "Descripcion");
            return Json(categoriaJson);
        }

        public ActionResult GetLineas(string q)
        {
            var lineasJson = _srv.GetLineas(q).ToAutoCompleteJson("Descripcion", "Descripcion");
            return Json(lineasJson);
        }



    }
}
