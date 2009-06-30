using System;
using Data.Modelo;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        void CrearNuevoCliente(Cliente clienteNuevo, string digitoVerificador);
        Cliente GetClientePorRut(decimal rut);
    }
}
