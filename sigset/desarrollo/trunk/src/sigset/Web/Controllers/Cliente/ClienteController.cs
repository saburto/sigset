
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
            return PartialView("Buscar");
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
                Orden_Trabajo ot = new Orden_Trabajo();
                ot.Cliente = cliente;
                return View("~/Views/OrdenTrabajo/Crear.aspx", ot);
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
            }
            catch(Exception e)
            {
                ModelState.AddModelError("_FORM", e.Message);
            }
            return View("~/Views/OrdenTrabajo/Crear.aspx");
        }


        public ActionResult Crear()
        {
            return View("Crear");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Cliente cliente, string dv, Direccion direccion, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Email")] Contacto email, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Fono")] Contacto fono)
        {
            try
            {
                _serv.CrearNuevoCliente(cliente, dv,direccion,email, fono);
                return RedirectToAction("Lista");
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
                return View("~/Views/OrdenTrabajo/Crear.aspx");
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
        public ActionResult Editar(Cliente cliente, string dv,[Bind(Prefix="Dire")] Direccion direccion, [Bind(Exclude = "Rut", Prefix = "Email")] Contacto email, [Bind(Exclude = "Rut", Prefix = "Fono")] Contacto fono)
        {
            try
            {
                _serv.EditarCliente(cliente, direccion, email, fono);
                return RedirectToAction("Detalles", new {id = cliente.Rut });
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

            cliente.Direccions.Add(direccion);
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
                Region = decimal.Parse(Request.Params["Dire_Region"]);
            }

            var provincias = _serv.GetProvinciasByRegion(Region.Value, q).ToAutoCompleteJson("Id","nombre");
            return Json(provincias);
        }

        public ActionResult EncontrarComunas(string q, decimal? Provincia)
        {
            if (!Provincia.HasValue)
            {
                Provincia = decimal.Parse(Request.Params["Dire_Provincia"]);
            }
            var ciudades = _serv.GetComunasByProvincia(Provincia.Value, q).ToAutoCompleteJson("Id","Nombre");
            return Json(ciudades);
        }
    }
}
