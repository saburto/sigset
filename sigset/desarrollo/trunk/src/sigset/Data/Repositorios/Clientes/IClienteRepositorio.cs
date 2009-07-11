using System;
using System.Linq;
using Data.Modelo;
namespace Data.Repositorios.Clientes
{
    public interface IClienteRepositorio : IDisposable
    {
        void CrearCliente(global::Data.Modelo.Cliente cliente);
        void CrearContactoCliente(decimal rut, global::Data.Modelo.Contacto contacto, decimal idTipoContacto);
        void CrearDirecionCliente(decimal rut, global::Data.Modelo.Direccion direccion, decimal idTipo);
        void EditarDireccionCliente(global::Data.Modelo.Direccion direccion);
        global::Data.Modelo.Cliente GetClienteByRut(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Direccion> GetDireccionesByRutCliente(decimal rut);
        global::Data.Modelo.Tipo_Contacto GetTipoContactoById(decimal id);
        global::Data.Modelo.Tipo_Direccion GetTipoDireccionById(decimal id);
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Contacto> GetTiposContacto();
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Direccion> GetTiposDireccion();

        IQueryable<Cliente> GetClientesByApellidoPaterno(string appellido);
        PagedList<Cliente> GetClientesByApellidoPaterno(string appellido, int indice, int pagina);

        IQueryable<Region> GetRegiones();
        IQueryable<Provincia> GetProvinciasByRegionId(decimal idRegion);
        IQueryable<Comuna> GetComunasByProvinciaId(decimal idProvincia);

        IQueryable<Contacto> GetContactosByIdCliente(decimal rut);

        void SaveChanges();

        void EditarCliente(Cliente cliente);

        IQueryable<Cliente> GetClientes();

        void EditarContactoCliente(Contacto email);
    }
}
