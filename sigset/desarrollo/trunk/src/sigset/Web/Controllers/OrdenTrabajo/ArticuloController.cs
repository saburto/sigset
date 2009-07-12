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

namespace Web.Controllers.OrdenTrabajo
{
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

        public ActionResult Detalles(int id)
        {
           return View("Detalles",_srv.GetArticulo(id));
        }

        public ActionResult Crear()
        {
            ViewData["Lista_Precio_Garantia"] = _srv.GetPrecios().GetSelectCampos("Id_Precio_Garantia", "Valor_Revision",null,"${0}");
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear([Bind(Exclude = "Id,Marca,Linea,Precio_Garantia")]Articulo articulo, string Lista_Precio_Garantia, string Marca, string Linea)
        {
            try
            {
                Articulo art = _srv.CrearArticulo(articulo, Lista_Precio_Garantia, Marca, Linea);
                return RedirectToAction("Detalles", new { id=art.Id });
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
            }
            catch(Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
            }
            ViewData["Lista_Precio_Garantia"] = _srv.GetPrecios().GetSelectCampos("Id_Precio_Garantia", "Valor_Revision", null, "${0}");
            return View();
        }


        public ActionResult GetMarcas(string q)
        {
            var marcasJson = _srv.GetMarcas(q).ToAutoCompleteJson("Descripcion", "Descripcion");
            return Json(marcasJson);
        }

        public ActionResult GetTipoArticulo(string q)
        {
            var tipoArticuloJson = _srv.GetTipoArticulos(q).ToAutoCompleteJson("Id_Tipo_Articulo", "Descripcion");
            return Json(tipoArticuloJson);
        }

        public ActionResult GetCategorias(string q)
        {
            var categoriaJson = _srv.GetCategoria(q).ToAutoCompleteJson("Id_Categoria", "Descripcion");
            return Json(categoriaJson);
        }

        public ActionResult GetLineas(string q)
        {
            var lineasJson = _srv.GetLineas(q).ToAutoCompleteJson("Descripcion", "Descripcion");
            return Json(lineasJson);
        }



    }
}
