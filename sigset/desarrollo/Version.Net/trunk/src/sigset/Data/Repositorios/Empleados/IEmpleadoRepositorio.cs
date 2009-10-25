using System;
using Data.Modelo;
namespace Data.Repositorios.Empleados
{
    public interface IEmpleadoRepositorio
    {
        global::Data.Modelo.Usuario EditarEmpleado(int Rut, global::Data.Modelo.Usuario empleado, decimal tipoCargo);
        Usuario GetEmpleadoByRut(decimal rut);
        System.Linq.IQueryable<global::Data.Modelo.Usuario> GetEmpleados();
        System.Linq.IQueryable<global::Data.Modelo.Perfil> GetPerfil();
        void GuardarEmpleado(global::Data.Modelo.Usuario empleado);
        void GuardarEmpleado(global::Data.Modelo.Usuario empleado, decimal tipoCargo);
    }
}
