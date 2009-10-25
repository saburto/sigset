using System;
namespace Services.Autenticacion
{
    public interface IAutenticacionService
    {
        void ActualizarUsuario(string actualUserName, string actualContrasena, string nuevoUserName, string nuevaContrasena);
        bool CambiarContrasena(string user, string actualContrasena, string nuevaContrasena);
        bool ValidarUsuario(string user, string contrasena);
    }
}
