using System;
namespace Services.Empleados
{
    public interface IEmpleadoServicio
    {
        global::Data.Modelo.Empleado BuscarEmpleadoPorRut(int rut);
        void CrearNuevoEmpleado(global::Data.Modelo.Empleado empleadoNuevo, string digitoVerificador, string listaTipos);
        void EditarEmpleado(int rut, string listaTipos, global::Data.Modelo.Empleado empleado);
        System.Collections.Generic.IList<global::Data.Modelo.Empleado> GetTodosLosEmpleados();
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Cargo> GetTodosLosTipoCargo();
    }
}
