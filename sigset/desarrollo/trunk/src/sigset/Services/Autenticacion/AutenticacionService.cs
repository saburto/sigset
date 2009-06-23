using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.Usuarios;
using Data.Modelo;

namespace Services.Autenticacion
{
    public class AutenticacionService : IAutenticacionService
    {
        private IUsuarioRepositorio _repo;
        public AutenticacionService():
            this(new UsuarioRepositorio())
        {

        }

        public AutenticacionService(IUsuarioRepositorio repo)
        {
            _repo = repo;
        }

        public void ActualizarUsuario(string actualUserName, string actualContrasena, string nuevoUserName, string nuevaContrasena)
        {
            if (ValidarUsuario(actualUserName, actualContrasena))
            {
                Usuario usuario = _repo.GetUsuarioByNombreUsuario(actualUserName);
                usuario.Usuario1 = actualUserName;
                usuario.Contraseña = nuevaContrasena;
                _repo.UpdateUsuario(usuario);
            }
        }

        public bool CambiarContrasena(string user, string actualContrasena, string nuevaContrasena)
        {
            if (ValidarUsuario(user, actualContrasena))
            {
                Usuario usuario = _repo.GetUsuarioByNombreUsuario(user);
                usuario.Contraseña = nuevaContrasena;
                _repo.UpdateUsuario(usuario);
                return true;
            }
            return false;
        }

        public bool ValidarUsuario(string user, string contrasena)
        {
            Usuario usuario = _repo.GetUsuarioByNombreUsuario(user);
            if (usuario != null)
            {
                return usuario.Contraseña == contrasena;
            }
            return false;
        }
    }
}
