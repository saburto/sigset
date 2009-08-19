using System;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        System.Linq.IQueryable<Data.Modelo.Cliente> BuscarClientesPorApellido(string apellido);
        void CrearCliente(Data.Modelo.Cliente clienteNuevo, string digitoVerificador);
        void CrearNuevaDireccion(decimal rut, Data.Modelo.Direccion direccion, decimal tipoDireccion);
        void CrearNuevoCliente(Data.Modelo.Cliente clienteNuevo, string digitoVerificador, Data.Modelo.Direccion direccion, Data.Modelo.Contacto email, Data.Modelo.Contacto telefono);
        void CrearNuevoContacto(decimal rut, Data.Modelo.Contacto contacto, decimal tipoContacto);
        Data.Modelo.Cliente GetClientePorRut(string rut, string dv);
        Data.Modelo.Cliente GetClientePorRut(decimal rut);
        Data.Modelo.Cliente GetClientePorRut(decimal rut, string dv);
        System.Collections.Generic.IList<Data.Modelo.Comuna> GetComunasByProvincia(decimal p);
        System.Collections.Generic.IList<Data.Modelo.Comuna> GetComunasByProvincia(decimal p, string nombreAlcance);
        System.Collections.Generic.IList<Data.Modelo.Provincia> GetProvinciasByRegion(decimal regionId, string nombreAlcance);
        System.Collections.Generic.IList<Data.Modelo.Provincia> GetProvinciasByRegion(decimal regionId);
        System.Collections.Generic.IList<Data.Modelo.Region> GetRegiones();
        System.Collections.Generic.IList<Data.Modelo.Region> GetRegionesPorNombre(string regionNombre);

        Data.Modelo.Cliente GetClienteCompletoPorRut(decimal Rut, string dv);

        void EditarCliente(Data.Modelo.Cliente cliente);

         System.Collections.Generic.IList<Data.Modelo.Cliente> GetClientes();

         void EditarCliente(Data.Modelo.Cliente cliente, Data.Modelo.Direccion direccion, Data.Modelo.Contacto email, Data.Modelo.Contacto fono);
    }
}
