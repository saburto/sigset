using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Clientes
{
    public class ClienteRepositorio : Data.Repositorios.Clientes.IClienteRepositorio
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
            _ent.SubmitChanges();
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

        public void CrearDirecionCliente(Cliente cliente, Direccion direccion, Tipo_Direccion tipo)
        {
            direccion.Cliente = cliente;
            direccion.Tipo_Direccion = tipo.Id_Tipo_Direccion;
            _ent.Direccions.InsertOnSubmit(direccion);
            _ent.SubmitChanges();
        }

        public void CrearDirecionCliente(decimal rut, Direccion direccion, Tipo_Direccion tipo)
        {
            CrearDirecionCliente(GetClienteByRut(rut), direccion, tipo);
        }

        public void CrearDirecionCliente(decimal rut, Direccion direccion, decimal idTipo)
        {
            CrearDirecionCliente(rut,direccion,GetTipoDireccionById(idTipo));
        }

        public void EditarDireccionCliente(Direccion direccion)
        {
            
            var dire = _ent.Direccions.Where(x => x.Id == direccion.Id).FirstOrDefault();
            _ent.Direccions.Attach(direccion, dire);
            _ent.SubmitChanges();
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

        public void CrearContactoCliente(Cliente cliente, Contacto contacto, Tipo_Contacto tipoContacto)
        {
            contacto.Cliente = cliente;
            contacto.Tipo_Contacto = tipoContacto.Id_Tipo_Contacto;

            _ent.Contactos.InsertOnSubmit(contacto);
            _ent.SubmitChanges();
        }
        public void CrearContactoCliente(decimal rut, Contacto contacto, Tipo_Contacto tipoContacto)
        {
            CrearContactoCliente(GetClienteByRut(rut), contacto, tipoContacto);
        }

        public void CrearContactoCliente(decimal rut, Contacto contacto, decimal idTipoContacto)
        {
            CrearContactoCliente(rut, contacto, GetTipoContactoById(idTipoContacto));
        }

        #endregion

    }
}
