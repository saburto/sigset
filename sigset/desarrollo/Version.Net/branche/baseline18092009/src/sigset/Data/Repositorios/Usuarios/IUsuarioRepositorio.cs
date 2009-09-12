using System;
using Data.Modelo;
using System.Linq;
namespace Data.Repositorios.Usuarios
{
    public interface IUsuarioRepositorio
    {

        void DeleteUsuario(Usuario usuario);
        IQueryable<Empleado> GetTodosLosEmpleados();
        Empleado FindEmpleadoByRut(decimal rut);
        void CreateUsuario(Usuario usuario);
        void CreateTipo_Usuario(string nombreTipoUsuario);
        void DeleteTipo_Usuario(decimal id);
        Tipo_Usuario GetTipo_Usuario(decimal id);
        Tipo_Usuario GetTipo_UsuarioByNombre(string nombre);
        Tipo_Usuario GetTipo_UsuarioByUsuarioNombre(string usuarioNombre);
        IQueryable<Tipo_Usuario> GetTipos_Usuario();
        Usuario GetUsuario(decimal id);
        Usuario GetUsuarioByNombreUsuario(string nombreUsuario);
        IQueryable<Usuario> GetUsuarios();
        IQueryable<Usuario> GetUsuariosTipo_Usuario(string nombreTipoUsuario);
        Usuario UpdateUsuario(Usuario usuario);
    }
}
