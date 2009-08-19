using System;
using System.Collections.Generic;
namespace Services.Autorizacion
{
    public interface IAutorizacionService
    {
        void CrearTipo_Usuario(string nombreTipoUsuario);
        bool EsUsuarioTipo_Usuario(string nombreUsuario, string nombreTipo);
        bool EsUsuarioTipo_Usuario(string nombreUsuario, decimal tipo);
        bool ExisteTipo_Usuario(string nombreTipo);
        IList<String> GetUsuariosTipo_Usuario(string nombreTipo);
        IList<String> GetTipos_Usuarios();
        IList<String> GetTipos_UsuarioByUsuario(String user);
    }
}
