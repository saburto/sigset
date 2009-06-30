using System;
namespace Services.Clientes
{
    public interface IClienteServicio
    {
        void CrearNuevoCliente(global::Data.Modelo.Cliente clienteNuevo, string digitoVerificador);
    }
}
