using System;
namespace Data.Repositorios.Empleados
{
    public interface IEmpleadoRepositorio
    {
        global::Data.Modelo.Empleado GetEmpleadoByRut(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Empleado> GetEmpleados();
        void GuardarEmpleado(global::Data.Modelo.Empleado empleado);
    }
}
