using System;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        System.Linq.IQueryable<global::Data.Modelo.Cliente> BuscarClientesPorApellido(string apellido);
        global::Data.Modelo.Cliente CrearCliente(global::Data.Modelo.Cliente clienteNuevo);
        int CrearNuevoCliente(global::Data.Modelo.Cliente cliente, string rut, string dv, global::Data.Modelo.Direccion direccion, global::Data.Modelo.Contacto email, global::Data.Modelo.Contacto fono);
        void EditarCliente(global::Data.Modelo.Cliente cliente, global::Data.Modelo.Direccion direccion, global::Data.Modelo.Contacto email, global::Data.Modelo.Contacto fono);
        global::Data.Modelo.Cliente GetClienteCompletoPorRut(decimal Rut, string dv);
        global::Data.Modelo.Cliente GetClientePorId(int id);
        global::Data.Modelo.Cliente GetClientePorRut(decimal rut);
        global::Data.Modelo.Cliente GetClientePorRut(decimal rut, string dv);
        global::Data.Modelo.Cliente GetClientePorRut(string rut, string dv);
        System.Collections.Generic.IList<global::Data.Modelo.Cliente> GetClientes();
        System.Collections.Generic.IList<global::Data.Modelo.Comuna> GetComunasByProvincia(decimal p, string nombreAlcance);
        System.Collections.Generic.IList<global::Data.Modelo.Comuna> GetComunasByProvincia(decimal p);
        System.Collections.Generic.IList<global::Data.Modelo.Provincia> GetProvinciasByRegion(decimal regionId);
        System.Collections.Generic.IList<global::Data.Modelo.Provincia> GetProvinciasByRegion(decimal regionId, string nombreAlcance);
        System.Collections.Generic.IList<global::Data.Modelo.Region> GetRegiones();
        System.Collections.Generic.IList<global::Data.Modelo.Region> GetRegionesPorNombre(string regionNombre);
    }
}
