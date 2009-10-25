using System;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        System.Linq.IQueryable<Data.Modelo.Cliente> BuscarClientesPorApellido(string apellido);
        void CrearCliente(Data.Modelo.Cliente clienteNuevo, Data.Modelo.ClienteParticular cliente, string digitoVerificador);
        void CrearNuevaDireccion(decimal rut, Data.Modelo.Direccion direccion, decimal tipoDireccion);
        void CrearNuevoCliente(Data.Modelo.Cliente clienteNuevo, string digitoVerificador, Data.Modelo.Direccion direccion, Data.Modelo.Contacto email, Data.Modelo.Contacto telefono, Data.Modelo.ClienteComercial clienteComercial, Data.Modelo.ClienteParticular clienteParticular);
        void CrearNuevoContacto(decimal rut, Data.Modelo.Contacto contacto, decimal tipoContacto);
        void CrearNuevoContacto(decimal rut, Data.Modelo.Contacto contacto, decimal tipoContacto, string prefijo);
        void EditarCliente(Data.Modelo.Cliente cliente);
        void EditarCliente(Data.Modelo.Cliente cliente, Data.Modelo.Direccion direccion, Data.Modelo.Contacto email, Data.Modelo.Contacto fono);
        Data.Modelo.Cliente GetClienteCompletoPorRut(decimal Rut, string dv);
        Data.Modelo.Cliente GetClientePorRut(decimal rut);
        Data.Modelo.Cliente GetClientePorRut(string rut, string dv);
        Data.Modelo.Cliente GetClientePorRut(decimal rut, string dv);
        System.Collections.Generic.IList<Data.Modelo.Cliente> GetClientes();
        System.Collections.Generic.IList<Data.Modelo.Comuna> GetComunasByProvincia(decimal p, string nombreAlcance);
        System.Collections.Generic.IList<Data.Modelo.Comuna> GetComunasByProvincia(decimal p);
        System.Collections.Generic.IList<Data.Modelo.Provincia> GetProvinciasByRegion(decimal regionId);
        System.Collections.Generic.IList<Data.Modelo.Provincia> GetProvinciasByRegion(decimal regionId, string nombreAlcance);
        System.Collections.Generic.IList<Data.Modelo.Region> GetRegiones();
        System.Collections.Generic.IList<Data.Modelo.Region> GetRegionesPorNombre(string regionNombre);
        void ValidarCliente(Data.Modelo.ClienteParticular clienteNuevo, System.Collections.Generic.IList<xVal.ServerSide.ErrorInfo> _errors);
    }
}
