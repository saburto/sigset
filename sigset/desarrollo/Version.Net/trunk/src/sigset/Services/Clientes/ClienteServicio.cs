using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Clientes;

namespace Services.Clientes
{
    public class ClienteServicio : Services.Clientes.IClienteServicio
    {
        IClienteRepositorio _repo;

        public ClienteServicio()
            : this(new ClienteRepositorio())
        {

        }

        public ClienteServicio(IClienteRepositorio repo)
        {
            _repo = repo;
        }

        public Cliente GetClientePorId(int id)
        {
            return _repo.GetCliente(id);
        }


        public int CrearNuevoCliente(
            Cliente cliente,
            string rut, string dv,
            Direccion direccion, Contacto email, Contacto fono)
        {

            IList<ErrorInfo> errores = new List<ErrorInfo>();
            ValidacionCliente validarCliente = new ValidacionCliente(cliente, rut, dv, errores);
            ValidarDireccion(direccion, errores);
            ValidarEmail(email, errores);

            if (validarCliente.esValido() && !errores.Any())
            {
                if (cliente.ClienteComercial != null)
                {
                    cliente.ClienteComercial.Rut = int.Parse(rut);
                }
                else if (cliente.ClienteParticular != null)
                {
                    cliente.ClienteParticular.Rut = int.Parse(rut);
                }

                return CrearNuevoCliente(cliente, direccion, email, fono);
            }
            else
            {
                throw new RulesException(errores);
            }
        }

        public void EditarCliente(Cliente cliente, Direccion direccion, Contacto email, Contacto fono)
        {
            IList<ErrorInfo> errores = new List<ErrorInfo>();
            ValidacionCliente validarCliente = new ValidacionCliente(cliente, cliente.Rut().ToString(), ValidarRut.GetDigitoVerificador(cliente.Rut()), errores);
            ValidarDireccion(direccion, errores);
            ValidarEmail(email, errores);

            if (validarCliente.esValido() && !errores.Any())
            {
                _repo.EditarDireccionCliente(direccion);
                _repo.EditarContactoCliente(email);
                _repo.EditarContactoCliente(fono);
                _repo.EditarCliente(cliente);
                _repo.SaveChanges();
            }
            else
            {
                throw new RulesException(errores);
            }


            //direccion.Rut = cliente.Rut;
            //List<ErrorInfo> _errors = new List<ErrorInfo>();
            //ValidarDireccion(direccion.Rut, direccion, direccion.Tipo_Direccion, _errors);
            //email.Rut = cliente.Rut;
            //fono.Rut = cliente.Rut;

            //ValidarEmail(email.Rut,email,email.Tipo_Contacto.Value,_errors);
            //ValidarContacto(fono.Rut, fono, fono.Tipo_Contacto.Value, _errors, "Fono");
            //ValidarCliente(cliente, _errors);
            //if (_errors.Any())
            //{
            //    throw new RulesException(_errors);
            //}

            //_repo.EditarDireccionCliente(direccion);
            //_repo.EditarContactoCliente(email);
            //_repo.EditarCliente(cliente);
            //_repo.SaveChanges();
        }

        private int CrearNuevoCliente(Cliente clienteNuevo, Direccion direccion, Contacto email, Contacto telefono)
        {
            IClienteRepositorio r = new ClienteRepositorio();
            decimal tipo_direccionDefecto = 1;
            decimal tipo_EmailDefecto = 3;
            decimal tipo_TelefonoDefecto = 1;

            ClienteServicio s = new ClienteServicio(r);

            clienteNuevo.Direccion = direccion;
            direccion.TipoDireccion = tipo_direccionDefecto;

            if (email != null)
            {
                email.TipoContacto = tipo_EmailDefecto;
                clienteNuevo.Contactos.Add(email);
            }

            if (telefono != null)
            {
                telefono.TipoContacto = tipo_TelefonoDefecto;
                clienteNuevo.Contactos.Add(telefono);    
            }
            
            var clienteIngresado = s.CrearCliente(clienteNuevo);
            
            //s.CrearNuevoContacto(rut, email, tipo_EmailDefecto, "Email");
            //s.CrearNuevoContacto(rut, telefono, tipo_TelefonoDefecto, "Fono");
            r.SaveChanges();

            return clienteIngresado.Id;
        }



        public Cliente CrearCliente(Cliente clienteNuevo)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            var rutCliente = clienteNuevo.ClienteParticular != null ? clienteNuevo.ClienteParticular.Rut : clienteNuevo.ClienteComercial.Rut;

            if (_repo.GetClienteByRut(rutCliente) != null)
            {
                throw new RulesException("Rut", "Rut ya registrado.");
            }
            else
            {
                return _repo.CrearCliente(clienteNuevo);
            }

        }


        private void ValidarDireccion(Direccion direccion, IList<ErrorInfo> _errors)
        {
            RegionProvinciaComunaEsValida(direccion.Region, direccion.Provincia, direccion.Comuna, _errors);
            DataValidation.GetErrors(direccion, _errors);
        }


        private bool ContactoNoRepetido(decimal rut, Contacto contacto, decimal tipoContacto)
        {
            var contactos = from c in _repo.GetContactosByIdCliente(rut)
                            where c.TipoContacto == tipoContacto &&
                            c.ValorContacto == contacto.ValorContacto
                            select c;
            if (contactos != null && contactos.Any())
            {
                return false;
            }
            return true;
        }


        private bool RegionProvinciaComunaEsValida(decimal region, decimal provincia, decimal comuna, IList<ErrorInfo> errores)
        {
            var regiones = (from r in _repo.GetRegiones()
                            where r.Id == region
                            select r).FirstOrDefault();
            if (regiones == null)
            {
                errores.Add(new ErrorInfo("Region", "Region invalidad"));
                return false;
            }

            var provincias = (from pro in _repo.GetProvinciasByRegionId(regiones.Id)
                              where pro.Id == provincia
                              select pro).FirstOrDefault();

            if (provincias == null)
            {
                errores.Add(new ErrorInfo("Provincia", "Provincia invalidad o no pertenece a región seleccionada"));
                return false;
            }

            var comunas = (from c in _repo.GetComunasByProvinciaId(provincias.Id)
                           where c.Id == comuna
                           select c).FirstOrDefault();
            if (comunas == null)
            {
                errores.Add(new ErrorInfo("Comuna", "Comuna invalidad o no pertenece a provincia seleccionada"));
                return false;
            }
            return true;
        }

        private bool ClienteExiste(decimal rut)
        {
            if (_repo.GetClienteByRut(rut) == null)
            {
                throw new RulesException("_FORM", "Cliente no existe");

            }
            return true;
        }


        public Cliente GetClientePorRut(decimal rut)
        {
            var cliente = _repo.GetClienteByRut(rut);
            return cliente;
        }

        public Cliente GetClientePorRut(decimal rut, string dv)
        {
            if (ValidarRut.GetDigitoVerificador(rut) != dv)
            {
                throw new RulesException("Rut", "Rut Invalido");
            }
            else
            {
                return GetClientePorRut(rut);
            }
        }

        public Cliente GetClientePorRut(string rut, string dv)
        {
            decimal rutDe;
            if (!decimal.TryParse(rut, out rutDe))
            {
                throw new RulesException("Rut", "Rut Invalido");
            }
            else
            {
                return GetClientePorRut(rutDe, dv);
            }
        }

        public IQueryable<Cliente> BuscarClientesPorApellido(string apellido)
        {
            return null;
        }


        public IList<Region> GetRegiones()
        {
            return _repo.GetRegiones().ToList();
        }


        public IList<Region> GetRegionesPorNombre(string regionNombre)
        {
            return (from c in _repo.GetRegiones()
                    where c.Nombre.Contains(regionNombre)
                    select c).ToList();
        }

        public IList<Provincia> GetProvinciasByRegion(decimal regionId)
        {
            return _repo.GetProvinciasByRegionId(regionId).OrderBy(x => x.nombre).ToList();
        }

        public IList<Provincia> GetProvinciasByRegion(decimal regionId, string nombreAlcance)
        {
            return (from provin in _repo.GetProvinciasByRegionId(regionId)
                    where provin.nombre.StartsWith(nombreAlcance)
                    orderby provin.nombre
                    select provin).ToList();
        }

        public IList<Comuna> GetComunasByProvincia(decimal p)
        {
            return _repo.GetComunasByProvinciaId(p).ToList();
        }

        public IList<Comuna> GetComunasByProvincia(decimal p, string nombreAlcance)
        {
            return (from c in _repo.GetComunasByProvinciaId(p)
                    where c.Nombre.StartsWith(nombreAlcance)
                    orderby c.Nombre
                    select c).ToList();
        }



        public Cliente GetClienteCompletoPorRut(decimal Rut, string dv)
        {
            var clienteEncontrado = GetClientePorRut(Rut, dv);
 
            return clienteEncontrado;
        }





        public IList<Cliente> GetClientes()
        {
            return _repo.GetClientes().ToList();
        }



     

 

        private void ValidarEmail(Contacto email, IList<ErrorInfo> _errors)
        {
            if (email.ValorContacto != null)
            {
                if (!email.ValorContacto.EsEmail())
                {
                    _errors.Add(new ErrorInfo("Email.ValorContacto", "Formato Email incorrecto"));
                }
            }
        }






        
        

        
    }
}
