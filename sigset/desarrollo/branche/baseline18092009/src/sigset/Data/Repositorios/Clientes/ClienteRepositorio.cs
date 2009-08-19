using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Clientes
{
    public class ClienteRepositorio : Data.Repositorios.Clientes.IClienteRepositorio, IDisposable
    {
        sigsetEntities _ent;
        public ClienteRepositorio()
        {
            _ent = new sigsetEntities();
        }

        public Cliente GetClienteByRut(decimal rut)
        {
            var cliente = (from c in _ent.Clientes
                           where c.Rut == rut
                           select c).FirstOrDefault();
            return cliente;
        }

        public IQueryable<Cliente> GetClientesByApellidoPaterno(string appellido)
        {
            
            return from c in _ent.Clientes
                   where c.Apellido_Paterno.Contains(appellido)
                   select c;
            
        }

        public PagedList<Cliente> GetClientesByApellidoPaterno(string appellido, int indice, int pagina)
        {
            return GetClientesByApellidoPaterno(appellido).OrderBy(x => x.Apellido_Paterno).ToPagedList<Cliente>(indice, pagina);
        }

        public void CrearCliente(Cliente cliente)
        {
            _ent.Clientes.InsertOnSubmit(cliente);
//            _ent.SubmitChanges();
        }


        #region "Direccion Cliente"

        /// <summary>
        /// No devuelve null, devuele una lista vacia
        /// </summary>
        /// <param name="rut"></param>
        /// <returns></returns>
        public IQueryable<Direccion> GetDireccionesByRutCliente(decimal rut)
        {
            var direcciones = from dires in _ent.Direccions
                              where dires.Cliente.Rut == rut
                              select dires;
            return direcciones;
        }

        public void CrearDirecionCliente(decimal rut, Direccion direccion, decimal idTipo)
        {
            direccion.Rut = rut;
            direccion.Tipo_Direccion = idTipo;
            _ent.Direccions.InsertOnSubmit(direccion);
            // _ent.SubmitChanges();
        }

        public void EditarDireccionCliente(Direccion direccion)
        {
            _ent.Direccions.Attach(direccion, true);
            //_ent.SubmitChanges();
        }

        public IQueryable<Tipo_Direccion> GetTiposDireccion()
        {
            return _ent.Tipo_Direccions;
        }

        public Tipo_Direccion GetTipoDireccionById(decimal id)
        {
            return _ent.Tipo_Direccions.Where( x => x.Id_Tipo_Direccion == id).FirstOrDefault();
        }

        #endregion

        #region "Contacto Cliente"
        

        public IQueryable<Tipo_Contacto> GetTiposContacto()
        {
            return _ent.Tipo_Contactos;
        }

        public Tipo_Contacto GetTipoContactoById(decimal id)
        {
            return _ent.Tipo_Contactos.Where(x => x.Id_Tipo_Contacto == id).FirstOrDefault();
        }

        public void CrearContactoCliente(decimal rut, Contacto contacto, decimal idTipoContacto)
        {
            contacto.Rut = rut;
            contacto.Tipo_Contacto = idTipoContacto;

            _ent.Contactos.InsertOnSubmit(contacto);
            //_ent.SubmitChanges();
        }

        public IQueryable<Contacto> GetContactosByIdCliente(decimal rut)
        {
            return _ent.Contactos.Where(x => x.Rut == rut);
        }

        #endregion


        public IQueryable<Region> GetRegiones()
        {
            return _ent.Regions;
        }

        public IQueryable<Provincia> GetProvinciasByRegionId(decimal idRegion)
        {
            return from p in _ent.Provincias
                   where p.Id_Region == idRegion
                   select p;
        }

        public IQueryable<Comuna> GetComunasByProvinciaId(decimal idProvincia)
        {
            return from c in _ent.Comunas
                   where c.Id_Provincia == idProvincia
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
            _ent.Clientes.Attach(cliente, true);
        }



        #region IClienteRepositorio Members


        public IQueryable<Cliente> GetClientes()
        {
            return _ent.Clientes;
        }

        #endregion

        #region IClienteRepositorio Members


        public void EditarContactoCliente(Contacto contactoNuevo)
        {
            _ent.Contactos.Attach(contactoNuevo,true);
        }

        #endregion
    }
}
