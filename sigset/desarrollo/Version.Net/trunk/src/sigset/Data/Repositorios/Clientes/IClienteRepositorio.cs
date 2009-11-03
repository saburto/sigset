using System;
namespace Data.Repositorios.Clientes
{
    public interface IClienteRepositorio
    {
        global::Data.Modelo.Cliente CrearCliente(global::Data.Modelo.Cliente cliente);
        void CrearContactoCliente(decimal rut, global::Data.Modelo.Contacto contacto, decimal idTipoContacto);
        void Dispose();
        void EditarCliente(global::Data.Modelo.Cliente cliente);
        void EditarContactoCliente(global::Data.Modelo.Contacto contactoNuevo);
        void EditarDireccionCliente(global::Data.Modelo.Direccion direccion);
        global::Data.Modelo.Cliente GetClienteByRut(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Cliente> GetClientes();
        global::Data.Modelo.PagedList<global::Data.Modelo.Cliente> GetClientesByApellidoPaterno(string appellido, int indice, int pagina);
        System.Linq.IQueryable<global::Data.Modelo.Cliente> GetClientesByApellidoPaterno(string appellido);
        System.Linq.IQueryable<global::Data.Modelo.Comuna> GetComunasByProvinciaId(decimal idProvincia);
        System.Linq.IQueryable<global::Data.Modelo.Contacto> GetContactosByIdCliente(decimal rut);
        global::Data.Modelo.Direccion GetDireccionesByRutCliente(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Provincia> GetProvinciasByRegionId(decimal idRegion);
        System.Linq.IQueryable<global::Data.Modelo.Region> GetRegiones();
        global::Data.Modelo.TipoContacto GetTipoContactoById(decimal id);
        global::Data.Modelo.TipoDireccion GetTipoDireccionById(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.TipoContacto> GetTiposContacto();
        System.Linq.IQueryable<global::Data.Modelo.TipoDireccion> GetTiposDireccion();
        void SaveChanges();

        Data.Modelo.Cliente GetCliente(int id);
    }
}
