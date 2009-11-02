using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.Usuarios;
using Services.Helpers;
using xVal.ServerSide;
using Data.Modelo;


namespace Services.Usuarios
{
    public class UsuarioServicio : Services.Usuarios.IUsuarioServicio 
    {
        private IUsuarioRepositorio _repo;
        public UsuarioServicio(IUsuarioRepositorio repo)
        {
            _repo = repo;
        }
        public UsuarioServicio()
            : this(new UsuarioRepositorio())
        {
        }

        public Usuario GetUsuarioById(decimal id)
        {
            return _repo.GetUsuario(id);
        }

        public IList<Usuario> GetTodosLosUsuario()
        {
            return _repo.GetUsuarios().ToList();
        }

        public void ModificarUsuario(Usuario usuario)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();

            if (usuario.PerfilUsuario == -1)
            {
                _errors.Add(new ErrorInfo("PerfilUsuario", "Debe seleccionar Tipo de Usuario"));
            }
      
            var usuarioRepetido = _repo.GetUsuarioByNombreUsuario(usuario.User);
            if (usuarioRepetido != null)
            {
                if (usuario.User.ToLower().Equals(usuarioRepetido.User.ToLower()) && usuario.Id != usuarioRepetido.Id)
                {
                    throw new RulesException("User", "Nombre de usuario ya esta en uso");
                }
            }

            DataValidation.GetErrors(usuario, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }          
            else
            {
                _repo.UpdateUsuario(usuario);
            }
        }
            
      
        

        public void EliminarUsuario(decimal id)
        {
            var usuario = _repo.GetUsuario(id);
            _repo.DeleteUsuario(usuario);
        }

        public IList<Perfil> TiposUsuarios()
        {
            return _repo.GetPerfiles().ToList();
        }
        public IList<Usuario> TodosLosEmpleados()
        {
            return _repo.GetTodosLosEmpleados().ToList();
        }

        public Usuario BuscarEmpleadoByRut(decimal rut)
        {
            return _repo.FindEmpleadoByRut(rut);
        }

        public void CrearUsuario(Usuario usuario)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();                     

            if (usuario.PerfilUsuario == -1)
            {
                _errors.Add(new ErrorInfo("PerfilUsuario", "Debe seleccionar Perfil"));
            }

          
            DataValidation.GetErrors(usuario, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {

                var usuarioRepetido = _repo.GetUsuarioByNombreUsuario(usuario.User);
                if (usuarioRepetido != null)
                {
                  if (usuario.User.ToLower().Equals(usuarioRepetido.User.ToLower()))
                   {
                    throw new RulesException("User", "Nombre de usario ya esta en uso");
                   }
                }
                else
                {
                    _repo.CreateUsuario(usuario);
                }

            }

        }
        public Usuario GetUsuariByNombre(string p)
        {
            return _repo.GetUsuarioByNombreUsuario(p);
        }

        public Perfil GetPerfilById(decimal id)
        { 
          return _repo.GetPerfilById(id);
        }

    }
}
    

