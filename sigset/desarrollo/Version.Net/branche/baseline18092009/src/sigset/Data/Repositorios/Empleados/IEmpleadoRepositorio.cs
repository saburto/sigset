using System;
namespace Data.Repositorios.Empleados
{
   public interface IEmpleadoRepositorio
    {
        global::Data.Modelo.Empleado EditarEmpleado(int Rut, global::Data.Modelo.Empleado empleado, decimal tipoCargo);
        global::Data.Modelo.Empleado GetEmpleadoByRut(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Empleado> GetEmpleados();
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Cargo> GetTipoCargo();
        void GuardarEmpleado(global::Data.Modelo.Empleado empleado);
        void GuardarEmpleado(global::Data.Modelo.Empleado empleado, decimal tipoCargo);
    }
}
