using System;
using Data.Modelo;
using System.Collections.Generic;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        void CrearNuevoCliente(Cliente clienteNuevo, string digitoVerificador);
        Cliente GetClientePorRut(decimal rut);
        Cliente GetClientePorRut(decimal rut, string dv);
        Cliente GetClientePorRut(string rut, string dv);

         IList<Region> GetRegiones();
         IList<Provincia> GetProvinciasByRegion(decimal regionId);
         IList<Provincia> GetProvinciasByRegion(decimal regionId, string nombreAlcance );
        IList<Comuna> GetComunasByProvincia(decimal p);
        
    }
}
