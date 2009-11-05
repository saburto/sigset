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

        public ActionResult Buscar(decimal? id)
        {
            if (id.HasValue)
            {
                TempData["rutOrden"] = id;
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Buscar(string Modelo, string Marca, string Rut)
        {
            string returnContent = "";
            returnContent = "<p><span class='" + HtmlHelper.ValidationMessageCssClassName + "'>";
            try
            {
                Articulo art = _srv.GetArticuloPorModeloMarca(Modelo, Marca);
                if (art != null)
                {
                    TempData["rutOrden"] = Rut;
                    return PartialView("Detalle", art);
                }
                returnContent += "Modelo No encontrado <a href='" + Url.Action("Crear", new {id=Rut }) + "'>Crear nuevo articulo</a>";
                
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

        public ActionResult Crear()
        {
            ViewData["PrecioGarantia"] = _srv.GetPrecios().GetSelectCampos("IdPrecioGarantia", "ValorRevision", null, "${0}");
            return View();
        }

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
