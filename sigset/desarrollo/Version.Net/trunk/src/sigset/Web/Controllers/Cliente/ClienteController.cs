
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;
using xVal.ServerSide;
using Services.Clientes;
using Web.Helpers;
using Web.Seguridad;


namespace Web.Controllers
{
    [ManejadorErrores]
    public class ClienteController : Controller
    {
        IClienteServicio _serv;

        public ClienteController()
            :this(new ClienteServicio())
        {

        }

        public ClienteController(IClienteServicio ser)
        {
            _serv = ser;
        }

        public ActionResult Lista()
        {
            var clientes = _serv.GetClientes();
            return View(clientes);
        }

        
        public ActionResult Buscar()
        {
            return View("Buscar");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Buscar(decimal? Rut, string dv)
        {
            try
            {
                if (Rut == null)
                {
                    throw new Exception("Debe ingresar rut (12345678-0) sin puntos");
                }

                decimal rut = Rut.Value;
                Cliente cliente = _serv.GetClienteCompletoPorRut(rut, dv);
                if (cliente != null)
                {
                    return PartialView("Detalles", cliente);
                }
                else
                {
                    string clienteNoEncontrado = "Cliente no encontrado. " + "<a href='" + Url.Action("Crear") + ">Agregar nuevo cliente</a>";
                    return Content(clienteNoEncontrado);
                }
                
            }
            catch (RulesException ex)
            {
                string error = "<span class=" + HtmlHelper.ValidationMessageCssClassName + ">" + ex.Errors.FirstOrDefault().ErrorMessage + "</span>";
                return Content(error);
            }
            catch(Exception e)
            {
                string error = "<span class=" + HtmlHelper.ValidationMessageCssClassName + ">" + e.Message + "</span>";
                return Content(error);
            }
            
        }


        public ActionResult Crear()
        {
            return View("Crear");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Cliente cliente,string rut, string dv, Direccion direccion, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Email")] Contacto email, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Fono")] Contacto fono)
        {
            try
            {
                //var idCliente = _serv.CrearNuevoCliente(cliente, dv,direccion,email, fono);
                return RedirectToAction("Detalles", new { id = cliente });
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
                return View();
            }
            catch
            {
                return View("Error");
            }
        }


        public ActionResult Detalles(int id)
        {
            try
            {
                var cliente = _serv.GetClientePorRut(id);
                if (Request.IsAjaxRequest())
                {
                    return PartialView(cliente);
                }
                else
                {
                    return View("Detalle", cliente);
                }
            }
            catch(Exception e)
            {
                throw e;
            }
            
        }


        public ActionResult Editar(int id)
        {
            var cliente = _serv.GetClientePorRut(id);
            ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(id);
            return View("Editar",cliente);
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(Cliente cliente, string rut, string dv,[Bind(Prefix="Dire")] Direccion direccion, [Bind(Exclude = "Rut", Prefix = "Email")] Contacto email, [Bind(Exclude = "Rut", Prefix = "Fono")] Contacto fono)
        {
            try
            {
                _serv.EditarCliente(cliente, direccion, email, fono);
                return RedirectToAction("Detalles", new {id = cliente.Id });
            }
            catch (RulesException e)
            {
                ModelState.AddRuleErrors(e.Errors);
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("_FORM", ex.Message);
            }
            ViewData["dv"] = dv;
            direccion.Region1 = _serv.GetRegiones().Where(x => x.Id == direccion.Region).FirstOrDefault();
            direccion.Provincia1 = _serv.GetProvinciasByRegion(direccion.Region).Where(x => x.Id == direccion.Provincia).FirstOrDefault();
            direccion.Comuna1 = _serv.GetComunasByProvincia(direccion.Provincia).Where(x => x.Id == direccion.Comuna).FirstOrDefault();

            cliente.Direccion = direccion;
            cliente.Contactos.Add(email);
            cliente.Contactos.Add(fono);
            return View(cliente);
        }


        
        public ActionResult EncontrarRegiones(string q)
        {
            var regiones = _serv.GetRegionesPorNombre(q).ToAutoCompleteJson("Id", "Nombre"); ;
            return Json(regiones);
        }

        public ActionResult EncontrarProvincias(string q, decimal? Region)
        {
            if (!Region.HasValue)
            {
                if (Request.Params["Dire_Region"] != null)
                {
                    Region = decimal.Parse(Request.Params["Dire_Region"]);
                }
                else
                {
                    Region = 0;
                }
                
            }

            var provincias = _serv.GetProvinciasByRegion(Region.Value, q).ToAutoCompleteJson("Id","nombre");
            return Json(provincias);
        }

        public ActionResult EncontrarComunas(string q, decimal? Provincia)
        {
            if (!Provincia.HasValue)
            {
                if (Request.Params["Dire_Provincia"] != null)
                {
                    Provincia = decimal.Parse(Request.Params["Dire_Provincia"]);
                }
                else
                {
                    Provincia = 0;
                }
            }
            var ciudades = _serv.GetComunasByProvincia(Provincia.Value, q).ToAutoCompleteJson("Id","Nombre");
            return Json(ciudades);
        }
    }
}
