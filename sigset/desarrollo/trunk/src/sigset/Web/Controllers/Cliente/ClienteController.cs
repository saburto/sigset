
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using Data.Modelo;
using xVal.ServerSide;
using Services.Clientes;
using Web.ModelView;

namespace Web.Controllers
{
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
        public ActionResult Buscar(string rutCliente)
        {
            ActionResult result = null;
            if (rutCliente == "1")
            {
                result = PartialView("Detalles", new Data.Modelo.Cliente() { Rut = 1, Nombre = "Juan", Apellido_Paterno = "Perez" });
            }
            else
            {
                result = PartialView("Crear");
            }
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
            catch(RulesException ex)
            {
                foreach (var key in ModelState.Keys)
                {
                    ModelState[key].Errors.Clear();   
                }
                foreach (var erro in ex.Errors)
                {
                    ModelState.AddModelError(erro.PropertyName, erro.ErrorMessage);
                }
                //ex.AddModelStateErrors(ModelState, "");
                return PartialView("Crear");
            }
            
        }

        public ActionResult Detalles(decimal rut)
        {
            return PartialView("Detalles", new Cliente { Rut = rut, Nombre = "Detalles", Apellido_Materno = "ADetalles", Apellido_Paterno = "paternoEditar" });
        }

        public ActionResult Editar(decimal rut)
        {
            return PartialView("Editar", new Cliente { Rut=rut, Nombre="Editar",Apellido_Materno="Aeditar",Apellido_Paterno="paternoEditar" });
        }

    }
}
