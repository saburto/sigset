using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.Usuarios;
using Data.Modelo;
using Services.Helpers;
using xVal.ServerSide;

namespace Services.Autenticacion
{
    public class AutenticacionService : Services.Autenticacion.IAutenticacionService
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
                usuario.User = actualUserName;
                usuario.Password = nuevaContrasena;
                _repo.UpdateUsuario(usuario);
            }
        }

        public bool CambiarContrasena(string user, string actualContrasena, string nuevaContrasena)
        {
            if (ValidarUsuario(user, actualContrasena))
            {
                Usuario usuario = _repo.GetUsuarioByNombreUsuario(user);
                usuario.Password = nuevaContrasena;
                _repo.UpdateUsuario(usuario);
                return true;
            }
            return false;
        }

        public bool ValidarUsuario(string user, string contrasena)
        {
            Usuario usuario = new Usuario(){User=user,Password=contrasena};
            var errors = new List<ErrorInfo>();

            if (string.IsNullOrEmpty(user))
            {
                errors.Add(new ErrorInfo("User", "Nombre de Usuario debe ser ingresado"));    
            }

            if (string.IsNullOrEmpty(contrasena))
            {
                errors.Add(new ErrorInfo("Password", "Password de Usuario debe ser ingresado"));    
            }

            if (errors.Any())
            {
                throw new RulesException(errors);
            }
            else
            {
                Usuario u = _repo.GetUsuarioByNombreUsuario(user);

                if (u == null)
                {   
                    return false;
                }

                if (u.Activo)
                {
                    return u.Password == contrasena;
                }
                return false;
            }
        }
    }
}
