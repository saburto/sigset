using System;
using Data.Modelo;
namespace Data.Repositorios.Usuarios
{
    public interface IUsuarioRepositorio
    {
        void CreatePerfil(string nombreTipoUsuario);
        void CreateUsuario(global::Data.Modelo.Usuario usuario);
        void DeletePerfil(decimal id);
        void DeleteUsuario(global::Data.Modelo.Usuario usuario);
        global::Data.Modelo.Usuario FindEmpleadoByRut(decimal rut);
        global::Data.Modelo.Perfil GetPerfil(decimal id);
        global::Data.Modelo.Perfil GetPerfilByNombre(string nombre);
        global::Data.Modelo.Perfil GetPerfilByUsuarioNombre(string usuarioNombre);
        System.Linq.IQueryable<global::Data.Modelo.Perfil> GetPerfiles();
        System.Linq.IQueryable<global::Data.Modelo.Usuario> GetTodosLosEmpleados();
        global::Data.Modelo.Usuario GetUsuario(decimal id);
        global::Data.Modelo.Usuario GetUsuarioByNombreUsuario(string nombreUsuario);
        System.Linq.IQueryable<global::Data.Modelo.Usuario> GetUsuarios();
        System.Linq.IQueryable<global::Data.Modelo.Usuario> GetUsuariosPerfil(string nombreTipoUsuario);
        global::Data.Modelo.Usuario UpdateUsuario(global::Data.Modelo.Usuario usuario);

        System.Linq.IQueryable<Data.Modelo.Permiso> GetTodosLosPermisos();
        System.Linq.IQueryable<Data.Modelo.PerfilPermiso> GetPermisosByPerfil(decimal id);
        global::Data.Modelo.Perfil GetPerfilById(decimal id);
        System.Linq.IQueryable<Permiso> GetPermisosDisponibles(decimal id);
    }
}
