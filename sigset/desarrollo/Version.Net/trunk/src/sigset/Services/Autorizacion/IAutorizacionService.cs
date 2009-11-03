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
       
    }
}
