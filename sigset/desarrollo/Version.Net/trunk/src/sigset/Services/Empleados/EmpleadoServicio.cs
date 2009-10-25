using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Empleados;


namespace Services.Empleados 
{
    public class EmpleadoServicio : Services.Empleados.IEmpleadoServicio 
    {
        private IEmpleadoRepositorio _repo;
        public EmpleadoServicio(IEmpleadoRepositorio repo)
        {
            _repo = repo;
        }

         public EmpleadoServicio()
            //COn la palabra this llamamos al constructor de arriba
            :this(new EmpleadoRepositorio())
        {

        }

        public IList<Usuario> GetTodosLosEmpleados()
        {
                   return _repo.GetEmpleados().ToList();
        }

        public IList<Perfil> GetTodosLosTipoCargo()
        {
              return _repo.GetPerfil().ToList();
        }

        public Usuario BuscarEmpleadoPorRut(int rut)
        {
            var empleado = _repo.GetEmpleadoByRut(rut);
            if (empleado == null)
            {
                throw new Exception("Empleado con rut:" + rut + " no ha sido encontrado");
            }
            return empleado;
        }

        public void EditarEmpleado(int rut, string listaTipos, Usuario empleado)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if(listaTipos == "-1")
            { 
                _errors.Add(new ErrorInfo("Tipo Cargo" ,"Debe seleccionar Tipo de Cargo"));
            }
            if (!empleado.Nombres.SoloTexto())
            { 
                 _errors.Add(new ErrorInfo("Nombre","Debe ingresar sólo texto en Nombre"));
            }
            if (!empleado.ApellidoPaterno.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Apellido_Paterno", "Debe ingresar sólo texto en Apellido Paterno"));
            }

            if (!empleado.ApellidoMaterno.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Apellido_Materno", "Debe ingresar sólo texto en Apellido Materno"));
            }   

            decimal cargo;
            if(!decimal.TryParse(listaTipos,out cargo))
            {
                _errors.Add(new ErrorInfo("Tipo Cargo", "Tipo de Cargo Invalido"));
            }

            DataValidation.GetErrors(empleado, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                _repo.EditarEmpleado(rut, empleado, cargo);
            }
        
        }


        public void CrearNuevoEmpleado(Usuario empleadoNuevo, string digitoVerificador,string listaTipos)
        {
            
            List<ErrorInfo> _errors = new List<ErrorInfo>();
            if (empleadoNuevo.Rut == 0)
            {
                _errors.Add(new ErrorInfo("Rut", "Rut es necesario"));
            }
          
            else if (string.IsNullOrEmpty(digitoVerificador))
            {
                _errors.Add(new ErrorInfo("Rut", "Se debe ingresar digito verificador"));
            }
            else if (!ValidarRut.GetDigitoVerificador(empleadoNuevo.Rut).Equals(digitoVerificador, StringComparison.InvariantCultureIgnoreCase))
            {
                _errors.Add(new ErrorInfo("Rut", "Rut invalido"));
            }
            if (!empleadoNuevo.Nombres.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Nombre", "Debe ingresar sólo texto en Nombre"));
            }
            if (!empleadoNuevo.ApellidoPaterno.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Apellido_Paterno", "Debe ingresar sólo texto en Apellido Paterno"));
            }

            if (!empleadoNuevo.ApellidoMaterno.SoloTexto())
            {
                _errors.Add(new ErrorInfo("Apellido_Materno", "Debe ingresar sólo texto en Apellido Materno"));
            }   
            if (listaTipos == "-1")
            { 
                _errors.Add(new ErrorInfo("Tipo Cargo" ,"Debe seleccionar Tipo de Cargo"));
            }

            decimal cargo;
            if(!decimal.TryParse(listaTipos,out cargo))
            {
                _errors.Add(new ErrorInfo("Tipo Cargo", "Tipo de Cargo Invalido"));
            }

            DataValidation.GetErrors(empleadoNuevo, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {
                if (_repo.GetEmpleadoByRut(empleadoNuevo.Rut) != null)
                {
                    throw new RulesException("Rut", "Rut ya registrado.");
                }
                else
                {
                  _repo.GuardarEmpleado(empleadoNuevo,cargo);
                }
            }        
        }
    }
}
