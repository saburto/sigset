using System;
namespace Services.Empleados 
{
    public interface IEmpleadoServicio 
    {
       
        void CrearNuevoEmpleado(global::Data.Modelo.Empleado empleadoNuevo, string digitoVerificador);
        System.Collections.Generic.IList<global::Data.Modelo.Empleado> GetTodosLosEmpleados();
    }
}
