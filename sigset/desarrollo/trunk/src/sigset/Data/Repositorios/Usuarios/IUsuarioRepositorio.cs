using System;
using Data.Modelo;
using System.Linq;
namespace Data.Repositorios.Usuarios
{
    public interface IUsuarioRepositorio
    {
        void CreateTipo_Usuario(string nombreTipoUsuario);
        void DeleteTipo_Usuario(decimal id);
        Tipo_Usuario GetTipo_Usuario(decimal id);
        Tipo_Usuario GetTipo_UsuarioByNombre(string nombre);
        IQueryable<Tipo_Usuario> GetTipos_Usuario();
        Usuario GetUsuario(decimal id);
        Usuario GetUsuarioByNombreUsuario(string nombreUsuario);
        IQueryable<Usuario> GetUsuarios();
        IQueryable<Usuario> GetUsuariosTipo_Usuario(string nombreTipoUsuario);
        Usuario UpdateUsuario(Usuario usuario);
    }
}
