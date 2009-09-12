using System;
namespace Services.Usuarios
{
   public interface IUsuarioServicio
    {
        global::Data.Modelo.Empleado BuscarEmpleadoByRut(decimal rut);
        void CrearUsuario(global::Data.Modelo.Usuario usuario);
        void EliminarUsuario(decimal id);
        System.Collections.Generic.IList<global::Data.Modelo.Usuario> GetTodosLosUsuario();
        global::Data.Modelo.Usuario GetUsuarioById(decimal id);
        void ModificarUsuario(global::Data.Modelo.Usuario usuario);
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Usuario> TiposUsuarios();
        System.Collections.Generic.IList<global::Data.Modelo.Empleado> TodosLosEmpleados();

        global::Data.Modelo.Usuario GetUsuariByNombre(string p);
    }
}
