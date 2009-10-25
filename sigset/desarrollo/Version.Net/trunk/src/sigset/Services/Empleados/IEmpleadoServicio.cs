using System;
namespace Services.Empleados
{
    public interface IEmpleadoServicio
    {
        global::Data.Modelo.Usuario BuscarEmpleadoPorRut(int rut);
        void CrearNuevoEmpleado(global::Data.Modelo.Usuario empleadoNuevo, string digitoVerificador, string listaTipos);
        void EditarEmpleado(int rut, string listaTipos, global::Data.Modelo.Usuario empleado);
        System.Collections.Generic.IList<global::Data.Modelo.Usuario> GetTodosLosEmpleados();
        System.Collections.Generic.IList<global::Data.Modelo.Perfil> GetTodosLosTipoCargo();
    }
}
