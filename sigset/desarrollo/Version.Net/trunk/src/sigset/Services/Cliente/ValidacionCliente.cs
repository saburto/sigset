using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using xVal.ServerSide;
using Services.Helpers;
using Data.Modelo;

namespace Services.Clientes
{
    public partial class ValidacionCliente
    {
        IList<ErrorInfo> _errors;
        Cliente _cliente;

        public ValidacionCliente(Cliente cliente, string rut, string dv, IList<ErrorInfo> errors)
        {
            _cliente = cliente;
            _errors = errors;
            ValidarRutCliente(rut, dv);
        }
        private void ValidarRutCliente(string rut, string dv)
        {
            if (ValidarRut.RutEsValido(rut,dv))
            {
                _errors.Add(new ErrorInfo("rut", "Rut no valido"));
            }
        }


        private void ValidarClienteComercial(ClienteComercial clienteNuevo)
        {
            DataValidation.GetErrors(clienteNuevo, _errors);
        }

        private void ValidarClienteParticular(ClienteParticular clienteNuevo)
        {

            DataValidation.GetErrors(clienteNuevo, _errors);
        }

        public bool esValido()
        {
            if (_cliente.TipoCliente == 1)
            {
                ValidarClienteParticular(_cliente.ClienteParticular);
            }
            else if(_cliente.TipoCliente == 2)
            {
                ValidarClienteComercial(_cliente.ClienteComercial);
            }
            return !_errors.Any();
        }
    }
}
