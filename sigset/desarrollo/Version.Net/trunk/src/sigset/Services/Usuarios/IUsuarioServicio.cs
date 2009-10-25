using System;
namespace Services.Usuarios
{
    public interface IUsuarioServicio
    {
        global::Data.Modelo.Usuario BuscarEmpleadoByRut(decimal rut);
        void CrearUsuario(global::Data.Modelo.Usuario usuario);
        void EliminarUsuario(decimal id);
        System.Collections.Generic.IList<global::Data.Modelo.Usuario> GetTodosLosUsuario();
        global::Data.Modelo.Usuario GetUsuariByNombre(string p);
        global::Data.Modelo.Usuario GetUsuarioById(decimal id);
        void ModificarUsuario(global::Data.Modelo.Usuario usuario);
        System.Collections.Generic.IList<global::Data.Modelo.Perfil> TiposUsuarios();
        System.Collections.Generic.IList<global::Data.Modelo.Usuario> TodosLosEmpleados();
    }
}
