
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
                Cliente cliente = _serv.GetClientePorRut(Rut, dv);
                return DetallesCliente(cliente);
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
        public ActionResult Crear(Cliente cliente, string dv )
        {
            try
            {
                _serv.CrearNuevoCliente(cliente, dv);
                return DetallesCliente(cliente);
            }
            catch (RulesException ex)
            {
                ModelState.AddRuleErrors(ex.Errors);
                return PartialView("Crear");
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
                return DetallesCliente(cliente);
            }
            catch(Exception e)
            {
                throw e;
            }
            
        }

        [NonAction]
        private ActionResult DetallesCliente(Cliente cliente)
        {
            ViewData["dv"] = Services.Helpers.ValidarRut.GetDigitoVerificador(cliente.Rut);
            return PartialView("Detalles",cliente);
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
    }
}
