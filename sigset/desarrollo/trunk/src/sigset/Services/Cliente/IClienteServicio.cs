using System;
using Data.Modelo;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        void CrearNuevoCliente(Cliente clienteNuevo, string digitoVerificador);
        Cliente GetClientePorRut(decimal rut);
        Cliente GetClientePorRut(decimal rut, string dv);
        Cliente GetClientePorRut(string rut, string dv);
    }
}
