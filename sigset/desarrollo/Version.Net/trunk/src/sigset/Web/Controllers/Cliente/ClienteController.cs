
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
    [Authorize]
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


        [Authorize(Roles = "clientes_listar")]
        public ActionResult Lista()
        {
            var clientes = _serv.GetClientes();
            return View(clientes);
        }

        
        [Authorize(Roles="clientes_buscar")]
        public ActionResult Buscar()
        {
            return View("Buscar");
        }


        [Authorize(Roles = "clientes_buscar")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Buscar(string RutDisplay)
        {
            try
            {
                if (string.IsNullOrEmpty(RutDisplay) && !RutDisplay.Contains('-'))
                {
                     return PartialView("Mensaje","Debe ingresar rut (12345678-0) sin puntos");
                }
                var dataRut = RutDisplay.Split('-');
                decimal numeroRut;
                

                if(!decimal.TryParse(dataRut[0],out numeroRut)){
                    return PartialView("Mensaje", "Debe ingresar rut (12345678-0) sin puntos");
                }

                Cliente cliente = _serv.GetClienteCompletoPorRut(numeroRut, dataRut[1]);
                if (cliente != null)
                {
                    return PartialView("Detalles", cliente);
                }
                else
                {
                    string clienteNoEncontrado = "Cliente no encontrado. " + "<a href='" + Url.Action("Crear") + ">Agregar nuevo cliente</a>";
                    return PartialView("Mensaje", clienteNoEncontrado);
                }
                
            }
            catch (RulesException ex)
            {
                string error = "<span class=" + HtmlHelper.ValidationMessageCssClassName + ">" + ex.Errors.FirstOrDefault().ErrorMessage + "</span>";
                return PartialView("Mensaje", error);
            }
            catch(Exception e)
            {
                string error = "<span class=" + HtmlHelper.ValidationMessageCssClassName + ">" + e.Message + "</span>";
                return PartialView("Mensaje", error);
            }
            
        }


        [Authorize(Roles = "clientes_crear")]
        public ActionResult Crear()
        {
            return View("Crear");
        }


        [Authorize(Roles = "clientes_crear")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Crear(Cliente cliente,string rut, string dv, Direccion direccion, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Email")] Contacto email, [Bind(Exclude = "Id,Rut,Tipo_Contacto", Prefix = "Fono")] Contacto fono)
        {
            try
            {
                var idCliente = _serv.CrearNuevoCliente(cliente, rut, dv, direccion, email, fono);
                return RedirectToAction("Detalles", new { id = idCliente });
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
                var cliente = _serv.GetClientePorId(id);
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

        [Authorize(Roles = "clientes_crear")]
        public ActionResult Editar(int id)
        {
            var cliente = _serv.GetClientePorId(id);
            return View("Editar",cliente);
        }

        [Authorize(Roles = "clientes_crear")]
        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Editar(Cliente cliente,[Bind(Prefix="Dire")] Direccion direccion, [Bind(Prefix = "Email")] Contacto email, [Bind( Prefix = "Fono")] Contacto fono)
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
            
            direccion.Region1 = _serv.GetRegiones().Where(x => x.Id == direccion.Region).FirstOrDefault();
            direccion.Provincia1 = _serv.GetProvinciasByRegion(direccion.Region).Where(x => x.Id == direccion.Provincia).FirstOrDefault();
            direccion.Comuna1 = _serv.GetComunasByProvincia(direccion.Provincia).Where(x => x.Id == direccion.Comuna).FirstOrDefault();

            cliente.Direccion = direccion;
            cliente.Contactos.Add(email);
            cliente.Contactos.Add(fono);
            return View(cliente);
        }

        public RemoteValidationResult RutExiste(string Rut)
        {
            var existe = _serv.GetClientePorRut(decimal.Parse(Rut));
            if (existe == null)
            {
                return RemoteValidationResult.Success;
            }
            else
            {
                return RemoteValidationResult.Failure("Cliente con rut ya existe");
            }
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
