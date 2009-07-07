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

        public void CrearNuevoCliente(Cliente clienteNuevo, string digitoVerificador, Direccion direccion, Contacto email, Contacto telefono)
        {
                IClienteRepositorio r = new ClienteRepositorio();
                decimal tipo_direccionDefecto = 1;
                decimal tipo_EmailDefecto = 3;
                decimal tipo_TelefonoDefecto = 1;

                ClienteServicio s = new ClienteServicio(r);
                s.CrearCliente(clienteNuevo, digitoVerificador);
                s.CrearNuevaDireccion(clienteNuevo.Rut, direccion, tipo_direccionDefecto);
                s.CrearNuevoContacto(clienteNuevo.Rut, email, tipo_EmailDefecto);
                s.CrearNuevoContacto(clienteNuevo.Rut, telefono, tipo_TelefonoDefecto);
                r.SaveChanges();
        }

        public void CrearCliente(Cliente clienteNuevo, string digitoVerificador)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>() ;
            if (clienteNuevo.Rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }
            else if (string.IsNullOrEmpty(digitoVerificador))
            {   
                _errors.Add(new ErrorInfo("Rut", "Se debe ingresar digito verificador"));
            }
            else if (!ValidarRut.GetDigitoVerificador(clienteNuevo.Rut).Equals(digitoVerificador, StringComparison.InvariantCultureIgnoreCase))
            {
                _errors.Add(new ErrorInfo("Rut", "Rut invalido"));
            }

            DataValidation.GetErrors(clienteNuevo, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                if (_repo.GetClienteByRut(clienteNuevo.Rut) != null)
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
                _errors.Add(new ErrorInfo("Calle","Calle es necesario"));
            }

            if (string.IsNullOrEmpty(direccion.Numero))
            {
                _errors.Add(new ErrorInfo("Numero", "Numero es necesario"));
            }

            RegionProvinciaComunaEsValida(direccion.Region, direccion.Provincia, direccion.Comuna, _errors);

            DataValidation.GetErrors(direccion, _errors);
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

        private bool DireccionNoRepetida(decimal rut, Direccion direccion, decimal tipoDireccion)
        {
            var direcccionesCliente = from d in _repo.GetDireccionesByRutCliente(rut)
                                      where d.Tipo_Direccion == tipoDireccion &&
                                      d.Calle == direccion.Calle &&
                                      d.Comuna == direccion.Comuna &&
                                      d.Numero == direccion.Numero &&
                                      d.Provincia == direccion.Provincia &&
                                      d.Region == direccion.Region
                                      select d;
            if (direcccionesCliente != null && direcccionesCliente.Any())
            {
                return false;
            }
            return true;
        }

        public void CrearNuevoContacto(decimal rut, Contacto contacto, decimal tipoContacto)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }

            if (tipoContacto == 0)
            {
                _errors.Add(new ErrorInfo("Tipo_Contacto", "Tipo de Contacto es necesario"));
            }

            if (string.IsNullOrEmpty(contacto.Valor_Contacto))
            {
                _errors.Add(new ErrorInfo("Valor_Contacto", "El valor de este tipo de contacto es necesario"));
            }

            DataValidation.GetErrors(contacto, _errors);
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

        private bool ContactoNoRepetido(decimal rut, Contacto contacto, decimal tipoContacto)
        {
            var contactos = from c in _repo.GetContactosByIdCliente(rut)
                            where c.Tipo_Contacto == tipoContacto &&
                            c.Valor_Contacto == contacto.Valor_Contacto
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
            if (cliente == null)
            {
                throw new Exception("Cliente con rut:"+ rut +" no ha sido encontrado");
            }
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



        #region IClienteServicio Members


        public Cliente GetClienteCompletoPorRut(decimal Rut, string dv)
        {
            var clienteEncontrado = GetClientePorRut(Rut, dv);
            var direcciones = _repo.GetDireccionesByRutCliente(Rut);
            var contactos = _repo.GetContactosByIdCliente(Rut);
            foreach (var d in direcciones)
            {
                clienteEncontrado.Direccions.Add(d);
            }
            foreach (var c in contactos)
            {
                clienteEncontrado.Contactos.Add(c);
            }
            return clienteEncontrado;
        }

        #endregion
    }
}
