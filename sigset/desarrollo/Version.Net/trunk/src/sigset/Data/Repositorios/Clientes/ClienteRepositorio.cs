using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Modelo.Enums;

namespace Data.Repositorios.Clientes
{
    public class ClienteRepositorio :  IDisposable, Data.Repositorios.Clientes.IClienteRepositorio
    {
        sigsetEntities _ent;

        public Cliente GetCliente(int id)
        {
            return _ent.Clientes.Where(x => x.Id == id).FirstOrDefault();
        }

        public ClienteRepositorio()
        {
            _ent = new sigsetEntities();
        }

        public Cliente GetClienteByRut(decimal rut)
        {
            var cliente = (from c in _ent.Clientes
                           where c.ClienteParticular.Rut == rut || c.ClienteComercial.Rut == rut
                           select c).FirstOrDefault();
            return cliente;
        }

        public IQueryable<Cliente> GetClientesByApellidoPaterno(string appellido)
        {
            
            return from c in _ent.Clientes
                   where c.ClienteParticular.ApellidoPaterno.Contains(appellido)
                   select c;
            
        }

        public PagedList<Cliente> GetClientesByApellidoPaterno(string appellido, int indice, int pagina)
        {
            return GetClientesByApellidoPaterno(appellido).OrderBy(x => x.ClienteParticular.ApellidoPaterno).ToPagedList<Cliente>(indice, pagina);
        }

        public Cliente CrearCliente(Cliente cliente)
        {

            _ent.Contactos.InsertAllOnSubmit(cliente.Contactos);

           _ent.Clientes.InsertOnSubmit(cliente);

           _ent.SubmitChanges();
           return cliente;
        }


        #region "Direccion Cliente"

        /// <summary>
        /// No devuelve null, devuele una lista vacia
        /// </summary>
        /// <param name="rut"></param>
        /// <returns></returns>
        public Direccion GetDireccionesByRutCliente(decimal rut)
        {
            return GetClienteByRut(rut).Direccion;

        }

        
        public void EditarDireccionCliente(Direccion direccion)
        {
            var direccionOriginal = _ent.Direccions.Where(x => x.Id == direccion.Id).FirstOrDefault();
            direccionOriginal.Calle = direccion.Calle;
            direccionOriginal.Comuna = direccion.Comuna;
            direccionOriginal.Numero = direccion.Numero;
            direccionOriginal.Provincia = direccion.Provincia;
            direccionOriginal.Region = direccion.Region;
            

        }

        public IQueryable<TipoDireccion> GetTiposDireccion()
        {
            return _ent.TipoDireccions;
        }

        public TipoDireccion GetTipoDireccionById(decimal id)
        {
            return _ent.TipoDireccions.Where( x => x.IdTipoDireccion == id).FirstOrDefault();
        }

        #endregion

        #region "Contacto Cliente"
        

        public IQueryable<TipoContacto> GetTiposContacto()
        {
            return _ent.TipoContactos;
        }

        public TipoContacto GetTipoContactoById(decimal id)
        {
            return _ent.TipoContactos.Where(x => x.IdTipoContacto == id).FirstOrDefault();
        }

        public void CrearContactoCliente(decimal rut, Contacto contacto, decimal idTipoContacto)
        {
            contacto.IdCliente = GetClienteByRut(rut).Id;
            contacto.TipoContacto = idTipoContacto;

            _ent.Contactos.InsertOnSubmit(contacto);
            //_ent.SubmitChanges();
        }

        public IQueryable<Contacto> GetContactosByIdCliente(decimal rut)
        {
            return GetClienteByRut(rut).Contactos.AsQueryable<Contacto>();
            //return _ent.Contactos.Where(x => x.Rut == rut);
        }

        #endregion


        public IQueryable<Region> GetRegiones()
        {
            return _ent.Regions;
        }

        public IQueryable<Provincia> GetProvinciasByRegionId(decimal idRegion)
        {
            return from p in _ent.Provincias
                   where p.IdRegion == idRegion
                   select p;
        }

        public IQueryable<Comuna> GetComunasByProvinciaId(decimal idProvincia)
        {
            return from c in _ent.Comunas
                   where c.IdProvincia == idProvincia
                   select c;
        }

        public void SaveChanges()
        {
            _ent.SubmitChanges();
        }


        #region IDisposable Members

        public void Dispose()
        {
            if (_ent != null)
            {
                _ent.Dispose();   
            }
        }

        #endregion

        public void EditarCliente(Cliente cliente)
        {
            var clienteOriginal = _ent.Clientes.Where(x => x.Id == cliente.Id).FirstOrDefault();
            clienteOriginal.Observacion = cliente.Observacion;

            if (cliente.TipoCliente == (int) TipoClientes.ClienteParticular)
            {
                var clienteParticularOriginal = _ent.ClienteParticulars.Where(x => x.Id == cliente.Id).FirstOrDefault();
                clienteParticularOriginal.ApellidoMaterno = cliente.ClienteParticular.ApellidoMaterno;
                clienteParticularOriginal.ApellidoPaterno = cliente.ClienteParticular.ApellidoPaterno;
                clienteParticularOriginal.Nombre = cliente.ClienteParticular.Nombre;
                clienteOriginal.ClienteParticular = clienteParticularOriginal;
            }
            else if (cliente.TipoCliente == (int)TipoClientes.ClienteComercial)
            {
                var clienteComercialOriginal = _ent.ClienteComercials.Where(x => x.Id == cliente.Id).FirstOrDefault();
                clienteComercialOriginal.RazonSocial = cliente.ClienteComercial.RazonSocial;
                clienteComercialOriginal.Sucursal = cliente.ClienteComercial.Sucursal;
                clienteOriginal.ClienteComercial = clienteComercialOriginal;
            }

        }



 


        public IQueryable<Cliente> GetClientes()
        {
            return _ent.Clientes;
        }

    


        public void EditarContactoCliente(Contacto contactoNuevo)
        {
            var contactoOriginal = _ent.Contactos.Where(x => x.Id == contactoNuevo.Id).FirstOrDefault();
            contactoOriginal.ValorContacto = contactoNuevo.ValorContacto;
        }

    }
}
