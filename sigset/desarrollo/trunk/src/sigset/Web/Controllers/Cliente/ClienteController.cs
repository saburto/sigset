
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
        public ActionResult Buscar(string Rut, string Apellido_Paterno)
        {
            
            ActionResult result = null;
            return result;
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
                return PartialView("Detalles", cliente);
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
                return PartialView("Detalles", cliente);
            }
            catch(Exception e)
            {
                throw e;
            }
            
        }

        public ActionResult Editar(decimal rut)
        {
            return PartialView("Editar", new Cliente { Rut=rut, Nombre="Editar",Apellido_Materno="Aeditar",Apellido_Paterno="paternoEditar" });
        }

    }
}
