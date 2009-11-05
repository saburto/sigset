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
        global::Data.Modelo.Permiso GetPermisoById(decimal id);
        System.Linq.IQueryable<Permiso> GetPermisosDisponibles(decimal id);
        void AddPerfilPermiso(global::Data.Modelo.PerfilPermiso perfilPermiso);
        void DeletePerfilPermiso(PerfilPermiso perfilPermiso);
        global::Data.Modelo.PerfilPermiso GetPermisoPerfil(decimal idPermiso, decimal idPerfil);
        void ActualizarEstadoPerfilPermiso(global::Data.Modelo.PerfilPermiso perfilPermiso);
        global::Data.Modelo.PerfilPermiso GetPerfilPermisoById(decimal id);
        System.Linq.IQueryable<UsuarioPermiso> GetUsuariosPermisos(decimal idUsuario);
        System.Linq.IQueryable<PerfilPermiso> GetPerfilPermisoByIdUsuario(decimal idUsuario);
        System.Linq.IQueryable<Permiso> GetPermisosDisponiblesUsuario(decimal idUsuario, decimal idPerfil);     
    }
}
