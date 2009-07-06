
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

        
        public ActionResult Buscar()
        {
            return PartialView("Buscar");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Buscar(decimal Rut, string dv)
        {
            try
            {
                Cliente cliente = _serv.GetClienteCompletoPorRut(Rut, dv);
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
                ModelState.AddModelError("Rut", e);
            }
            return View();
        }


        public ActionResult Crear()
        {
            return PartialView("Crear");
        }


        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Cliente cliente, string dv, Direccion direccion, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Email")] Contacto email, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Fono")] Contacto fono)
        {
            try
            {
                _serv.CrearNuevoCliente(cliente, dv,direccion,email, fono);
                cliente.Direccions.Add(direccion);
                cliente.Contactos.Add(email);
                cliente.Contactos.Add(fono);
                Orden_Trabajo ot = new Orden_Trabajo();
                ot.Cliente = cliente;
                return View("~/Views/OrdenTrabajo/Crear.aspx", ot);
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

        [AcceptVerbs(HttpVerbs.Get)]
        public ActionResult Detalles(string id)
        {
            return Detalles(Decimal.Parse(id));
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Detalles(decimal rut)
        {
            try
            {
                var cliente = _serv.GetClientePorRut(rut);
                return PartialView(cliente);
            }
            catch(Exception e)
            {
                throw e;
            }
            
        }


        public ActionResult Editar(decimal rut)
        {
            var cliente = _serv.GetClientePorRut(rut);
            ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(rut);
            return PartialView("Editar",cliente);
        }

        public ActionResult CrearDireccion(decimal rut)
        {
            ViewData["rutCliente"] = rut;
            return PartialView();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult CrearDireccion(decimal rut,[Bind(Exclude="Id")] Direccion direccion)
        {
            return PartialView();
        }

        public ActionResult EncontrarRegiones(string q)
        {
            var regiones = _serv.GetRegionesPorNombre(q).ToAutoCompleteJson("Id", "Nombre"); ;
            return Json(regiones);
        }

        public ActionResult EncontrarProvincias(string q, decimal Region)
        {
            var provincias = _serv.GetProvinciasByRegion(Region, q).ToAutoCompleteJson("Id","nombre");
            return Json(provincias);
        }

        public ActionResult EncontrarComunas(string q, decimal Provincia)
        {
            var ciudades = _serv.GetComunasByProvincia(Provincia, q).ToAutoCompleteJson("Id","Nombre");
            return Json(ciudades);
        }
    }
}
