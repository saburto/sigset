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
            var cliente = (from c in _ent.Cliente
                           where c.Rut == rut
                           select c).FirstOrDefault();
            return cliente;
        }

        public IQueryable<Cliente> GetClientesByApellidoPaterno(string appellido)
        {
            
            return from c in _ent.Cliente
                   where c.Apellido_Paterno.Contains(appellido)
                   select c;
            
        }

        public PagedList<Cliente> GetClientesByApellidoPaterno(string appellido, int indice, int pagina)
        {
            return GetClientesByApellidoPaterno(appellido).OrderBy(x => x.Apellido_Paterno).ToPagedList<Cliente>(indice, pagina);
        }

        public void CrearCliente(Cliente cliente)
        {
            _ent.AddToCliente(cliente);
            _ent.SaveChanges();
        }


        #region "Direccion Cliente"

        /// <summary>
        /// No devuelve null, devuele una lista vacia
        /// </summary>
        /// <param name="rut"></param>
        /// <returns></returns>
        public IQueryable<Direccion> GetDireccionesByRutCliente(decimal rut)
        {
            var direcciones = from dires in _ent.Direccion
                              where dires.Cliente.Rut == rut
                              select dires;
            return direcciones;
        }

        public void CrearDirecionCliente(Cliente cliente, Direccion direccion, Tipo_Direccion tipo)
        {
            direccion.Cliente = cliente;
            direccion.Tipo_Direccion = tipo;
            _ent.AddToDireccion(direccion);
            _ent.SaveChanges();
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
            _ent.Attach(direccion);
            var dire = _ent.Direccion.Where(x => x.Id == direccion.Id).FirstOrDefault();
            _ent.ApplyPropertyChanges("Direccion", dire);
            _ent.SaveChanges();

        }

        public IQueryable<Tipo_Direccion> GetTiposDireccion()
        {
            return _ent.Tipo_Direccion;
        }

        public Tipo_Direccion GetTipoDireccionById(decimal id)
        {
            return _ent.Tipo_Direccion.Where( x => x.Id_Tipo_Direccion == id).FirstOrDefault();
        }

        #endregion

        #region "Contacto Cliente"
        

        public IQueryable<Tipo_Contacto> GetTiposContacto()
        {
            return _ent.Tipo_Contacto;
        }

        public Tipo_Contacto GetTipoContactoById(decimal id)
        {
            return _ent.Tipo_Contacto.Where(x => x.Id_Tipo_Contacto == id).FirstOrDefault();
        }

        public void CrearContactoCliente(Cliente cliente, Contacto contacto, Tipo_Contacto tipoContacto)
        {
            contacto.Cliente = cliente;
            contacto.Tipo_Contacto = tipoContacto;
            _ent.AddToContacto(contacto);
            _ent.SaveChanges();
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
