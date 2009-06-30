using System;
namespace Data.Repositorios.Clientes
{
    public interface IClienteRepositorio
    {
        void CrearCliente(global::Data.Modelo.Cliente cliente);
        void CrearContactoCliente(global::Data.Modelo.Cliente cliente, global::Data.Modelo.Contacto contacto, global::Data.Modelo.Tipo_Contacto tipoContacto);
        void CrearContactoCliente(decimal rut, global::Data.Modelo.Contacto contacto, global::Data.Modelo.Tipo_Contacto tipoContacto);
        void CrearContactoCliente(decimal rut, global::Data.Modelo.Contacto contacto, decimal idTipoContacto);
        void CrearDirecionCliente(global::Data.Modelo.Cliente cliente, global::Data.Modelo.Direccion direccion, global::Data.Modelo.Tipo_Direccion tipo);
        void CrearDirecionCliente(decimal rut, global::Data.Modelo.Direccion direccion, decimal idTipo);
        void CrearDirecionCliente(decimal rut, global::Data.Modelo.Direccion direccion, global::Data.Modelo.Tipo_Direccion tipo);
        void EditarDireccionCliente(global::Data.Modelo.Direccion direccion);
        global::Data.Modelo.Cliente GetClienteByRut(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Direccion> GetDireccionesByRutCliente(decimal rut);
        global::Data.Modelo.Tipo_Contacto GetTipoContactoById(decimal id);
        global::Data.Modelo.Tipo_Direccion GetTipoDireccionById(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Contacto> GetTiposContacto();
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Direccion> GetTiposDireccion();
    }
}
