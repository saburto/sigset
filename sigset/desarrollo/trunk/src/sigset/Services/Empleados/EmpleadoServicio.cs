using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;
using Data.Repositorios.Empleados;


//amor ojo, al crear esta carpeta me trajo conflico con el nombre del modelo, asi que le voy a poner una s, okis??oki
namespace Services.Empleados //aqui le puse la S, el modelo no hay que tocarlo, okisdoki
{
    //Esta clase tambien le voy a sacar la interfaz para que se comunique con la visa, okis??oki
    public class EmpleadoServicio : Services.Empleados.IEmpleadoServicio
    {
        private IEmpleadoRepositorio _repo;
        public EmpleadoServicio(IEmpleadoRepositorio repo)
        {
            _repo = repo;
        }

        //Con este constructor le decimos que trabaje con esa implementacion, ahora esto
        //esto no se debeira hacer, porque al cambiar el repositorio tambien debemos de cambiar solo este constructor, okis??doki
        public EmpleadoServicio()
            //COn la palabra this llamamos al constructor de arribasi
            :this(new EmpleadoRepositorio())
        {

        }

        //Entornces ahora vamos a crear una function
        /// <summary>
        /// Asi se hace la docu de los meotods por siiiii :) sisabia
        /// </summary>
        /// <returns></returns>
        public IList<Empleado> GetTodosLosEmpleados()
        {
            //oops me equivoque, XD era IQuryeable
            //amor en este caso es super simple, no hay que hacer nada,
            //pero en el servicio debe estar toda la logica de negoscios y validaciones, okis??doki
            return _repo.GetEmpleados().ToList();
        }

        public void CrearNuevoEmpleado(Empleado empleadoNuevo, string digitoVerificador)
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
                    _repo.GuardarEmpleado(empleadoNuevo);
                }
            }
        }
    }
}
