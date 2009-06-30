using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Clientes;

namespace Services.Clientes
{
    public class ClienteServicio : Services.Clientes.IClienteServicio
    {
        IClienteRepositorio _repo;

        public ClienteServicio()
            :this(new ClienteRepositorio())
        {

        }

        public ClienteServicio(IClienteRepositorio repo)
        {
            _repo = repo;
        }

        public void CrearNuevoCliente(Cliente clienteNuevo, string digitoVerificador)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>() ;
            if (clienteNuevo.Rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }
            else if (string.IsNullOrEmpty(digitoVerificador))
            {   
                _errors.Add(new ErrorInfo("Rut", "Se debe ingresar digito verificador"));
            }
            else if (!ValidarRut.GetDigitoVerificador(clienteNuevo.Rut).Equals(digitoVerificador, StringComparison.InvariantCultureIgnoreCase))
            {
                _errors.Add(new ErrorInfo("Rut", "Rut invalido"));
            }

            DataValidation.GetErrors(clienteNuevo, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                if (_repo.GetClienteByRut(clienteNuevo.Rut) != null)
                {
                    throw new RulesException("Rut", "Rut ya registrado.");
                }
                else
                {
                    _repo.CrearCliente(clienteNuevo);
                }
            }
        }

        public Cliente GetClientePorRut(decimal rut)
        {
            var cliente = _repo.GetClienteByRut(rut);
            if (cliente == null)
            {
                throw new Exception("Cliente con rut:"+ rut +" no ha sido encontrado");
            }
            return cliente;
        }

        public IQueryable<Cliente> BuscarClientesPorApellido(string apellido)
        {
            return null;
        }
    }
}
