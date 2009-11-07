using System;
using System.Collections.Generic;
using Data.Modelo;
namespace Services.Autorizacion
{
    public interface IAutorizacionService
    {
        void CrearTipo_Usuario(string nombreTipoUsuario);
        bool EsUsuarioTipo_Usuario(string nombreUsuario, string nombreTipo);
        bool EsUsuarioTipo_Usuario(string nombreUsuario, decimal tipo);
        bool ExisteTipo_Usuario(string nombreTipo);
        IList<String> GetUsuariosTipo_Usuario(string nombreTipo);
        IList<String> GetPerfiless();
        IList<String> GetPerfilesByUsuario(String user);
        IList<PerfilPermiso> GetPermisosByPerfil(decimal id);
        IList<Permiso> GetPermisosDisponibles(decimal id);
        void AgregarPermisoAPerfil(decimal idPermiso, decimal idPerfil);
        void EliminarPerfilPermiso(decimal idPermiso, decimal idPerfi);
        PerfilPermiso GetPermisoPerfil(decimal idPermiso, decimal idPerfil);
        Permiso GetPermisoById(decimal idPermiso);
        PerfilPermiso GetPerfilPermisoById(decimal id);
        void ActualizarEstadoPerfilPermiso(PerfilPermiso perfilPermiso);
        IList<UsuarioPermiso> GetUsuariosPermisos(decimal idUsuario);
        IList<PerfilPermiso> GetPerfilPermisoByIdUsuario(decimal idUsuario);
        IList<Permiso> GetPermisosDisponiblesUsuario(decimal idUsuario, decimal idPerfil);
        void EliminarUsuarioPermiso(decimal idPermiso, decimal idPerfil, decimal idUsuario);
        void CambiarEstadoUsuarioPermiso(decimal idPermiso, decimal idUsuario);
        void GuardarUsuarioPermiso(decimal idPermiso, decimal idUsuario);
        void GuardarNuevoUsuarioPermiso(decimal idPermiso, decimal idUsuario);
    }
}
