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
            :this(new ClienteRepositorio())
        {

        }

        public ClienteServicio(IClienteRepositorio repo)
        {
            _repo = repo;
        }

        public void CrearNuevoCliente(Cliente clienteNuevo, string digitoVerificador, Direccion direccion, Contacto email, Contacto telefono, ClienteComercial clienteComercial, ClienteParticular clienteParticular)
        {
                IClienteRepositorio r = new ClienteRepositorio();
                decimal tipo_direccionDefecto = 1;
                decimal tipo_EmailDefecto = 3;
                decimal tipo_TelefonoDefecto = 1;

                ClienteServicio s = new ClienteServicio(r);

                decimal rut =0;
                if (clienteNuevo.TipoCliente == 1)
                {
                    rut = clienteParticular.Rut;
                }
                else
                {
                    rut = clienteComercial.Rut;
                }
                s.CrearCliente(clienteNuevo, clienteParticular ,digitoVerificador);
                s.CrearNuevaDireccion(rut, direccion, tipo_direccionDefecto);
                s.CrearNuevoContacto(rut, email, tipo_EmailDefecto, "Email");
                s.CrearNuevoContacto(rut, telefono, tipo_TelefonoDefecto, "Fono");
                r.SaveChanges();
        }

        public void ValidarCliente(ClienteParticular clienteNuevo, IList<ErrorInfo> _errors)
        {
            if (!clienteNuevo.Nombre.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Nombre", "Debe ingresar sólo texto en Nombre"));
            }
            if (!clienteNuevo.ApellidoPaterno.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Apellido_Paterno", "Debe ingresar sólo texto en Apellido Paterno"));
            }

            if (!clienteNuevo.ApellidoMaterno.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Apellido_Materno", "Debe ingresar sólo texto en Apellido Materno"));
            }
            DataValidation.GetErrors(clienteNuevo, _errors);
        }

        public void CrearCliente(Cliente clienteNuevo, ClienteParticular cliente, string digitoVerificador)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>() ;
            if (cliente.Rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }
            else if (string.IsNullOrEmpty(digitoVerificador))
            {   
                _errors.Add(new ErrorInfo("Rut", "Se debe ingresar digito verificador"));
            }
            else if (!ValidarRut.GetDigitoVerificador(cliente.Rut).Equals(digitoVerificador, StringComparison.InvariantCultureIgnoreCase))
            {
                _errors.Add(new ErrorInfo("Rut", "Rut invalido"));
            }
            ValidarCliente(cliente, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                if (_repo.GetClienteByRut(cliente.Rut) != null)
                {
                    throw new RulesException("Rut", "Rut ya registrado.");
                }
                else
                {
                    _repo.CrearCliente(clienteNuevo);
                }
            }
        }


        public void CrearNuevaDireccion(decimal rut,Direccion direccion, decimal tipoDireccion)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            ValidarDireccion(rut, direccion, tipoDireccion, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                    if (!DireccionNoRepetida(rut, direccion, tipoDireccion))
                    {
                        throw new RulesException("_FORM", "Direccion Repetida");
                    }
                    else
                    {
                        _repo.CrearDirecionCliente(rut, direccion, 1);
                    }
                    

            }
        }

        private void ValidarDireccion(decimal rut, Direccion direccion, decimal tipoDireccion, List<ErrorInfo> _errors)
        {
            if (rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }

            if (tipoDireccion == 0)
            {
                _errors.Add(new ErrorInfo("Tipo_Direccion", "Tipo de Direccion es necesario"));
            }

            if (string.IsNullOrEmpty(direccion.Calle))
            {
                _errors.Add(new ErrorInfo("Calle", "Calle es necesario"));
            }

            if (string.IsNullOrEmpty(direccion.Numero))
            {
                _errors.Add(new ErrorInfo("Numero", "Numero es necesario"));
            }

            RegionProvinciaComunaEsValida(direccion.Region, direccion.Provincia, direccion.Comuna, _errors);
            DataValidation.GetErrors(direccion, _errors);
        }

        private bool DireccionNoRepetida(decimal rut, Direccion direccion, decimal tipoDireccion)
        {
            var direcccionesCliente = _repo.GetDireccionesByRutCliente(rut);


                //from d in _repo.GetDireccionesByRutCliente(rut)
                //                      where d.Tipo_Direccion == tipoDireccion &&
                //                      d.Calle == direccion.Calle &&
                //                      d.Comuna == direccion.Comuna &&
                //                      d.Numero == direccion.Numero &&
                //                      d.Provincia == direccion.Provincia &&
                //                      d.Region == direccion.Region
                //                      select d;
            if (direcccionesCliente != null)
            {
                return false;
            }
            return true;
        }

        public void CrearNuevoContacto(decimal rut, Contacto contacto, decimal tipoContacto, string prefijo)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (prefijo == "Email")
            {
                ValidarEmail(rut, contacto, tipoContacto, _errors);
            }
            else
            {
                ValidarContacto(rut, contacto, tipoContacto, _errors, prefijo);

            }
            

            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                   if (!ContactoNoRepetido(rut, contacto, tipoContacto))
                    {
                        throw new RulesException("_FORM", "Contacto ya existe.");
                    }
                    else
                    {
                        _repo.CrearContactoCliente(rut, contacto, tipoContacto);
                    }    
   
            }
        }

        private static void ValidarContacto(decimal rut, Contacto contacto, decimal tipoContacto, List<ErrorInfo> _errors, string prefijo)
        {
            if (rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }

            if (tipoContacto == 0)
            {
                _errors.Add(new ErrorInfo(prefijo + ".Tipo_Contacto", "Tipo de Contacto es necesario"));
            }

            if (string.IsNullOrEmpty(contacto.ValorContacto))
            {
                _errors.Add(new ErrorInfo(prefijo + ".Valor_Contacto", "El valor de este tipo de contacto es necesario"));
            }
            DataValidation.GetErrors(contacto, _errors);
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
            if (_repo.GetClienteByRut(rut)== null)
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

        public IList<Provincia> GetProvinciasByRegion(decimal regionId, string nombreAlcance )
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
            var direcciones = _repo.GetDireccionesByRutCliente(Rut);
            var contactos = _repo.GetContactosByIdCliente(Rut);
             clienteEncontrado.Direccion = direcciones;
  
            foreach (var c in contactos)
            {
                clienteEncontrado.Contactos.Add(c);
            }
            return clienteEncontrado;
        }

        public void EditarCliente(Cliente cliente)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            DataValidation.GetErrors(cliente, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            _repo.EditarCliente(cliente);
        }

        #region IClienteServicio Members


        public IList<Cliente> GetClientes()
        {
            return _repo.GetClientes().ToList() ;
        }

        #endregion

        #region IClienteServicio Members


        public void EditarCliente(Cliente cliente, Direccion direccion, Contacto email, Contacto fono)
        {

            throw new NotImplementedException();
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

        private void ValidarEmail(decimal p, Contacto email, decimal p_3, List<ErrorInfo> _errors)
        {
            ValidarContacto(p, email, p_3, _errors, "Email");
            if (email.ValorContacto != null)
            {
                if (!email.ValorContacto.EsEmail())
                {
                    _errors.Add(new ErrorInfo("Email.Valor_Contacto", "Formato Email incorrecto"));
                }
            }
        }

        #endregion

        #region IClienteServicio Members


        public void CrearNuevoContacto(decimal rut, Contacto contacto, decimal tipoContacto)
        {
            CrearNuevoContacto(rut, contacto, tipoContacto, "");
        }

        #endregion
    }
}
