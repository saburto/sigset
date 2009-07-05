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

            if (usuario.Tipo_Usuario == -1)
            {
                _errors.Add(new ErrorInfo("Tipo_Usuario", "Debe seleccionar Tipo de Usuario"));
            }
                    
            DataValidation.GetErrors(usuario, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {

                var usuarioRepetido = _repo.GetUsuarioByNombreUsuario(usuario.Usuario1);
                if (usuarioRepetido != null)
                {
                  if (usuario.Usuario1.ToLower().Equals(usuarioRepetido.Usuario1.ToLower()))
                   {
                    throw new RulesException("Usuario1", "Nombre de usario ya esta en uso");
                   }
                }
                else
                {
                    _repo.UpdateUsuario(usuario);
                }

            }
      
        }

        public void EliminarUsuario(decimal id)
        {
            var usuario = _repo.GetUsuario(id);
            _repo.DeleteUsuario(usuario);
        }

        public IList<Tipo_Usuario> TiposUsuarios()
        {
            return _repo.GetTipos_Usuario().ToList();
        }
        public IList<Empleado> TodosLosEmpleados()
        {
            return _repo.GetTodosLosEmpleados().ToList();
        }

        public Empleado BuscarEmpleadoByRut(decimal rut)
        {
            return _repo.FindEmpleadoByRut(rut);
        }

        public void CrearUsuario(Usuario usuario)
        {
            List<ErrorInfo> _errors = new List<ErrorInfo>();                     

            if (usuario.Tipo_Usuario == -1)
            {
                _errors.Add(new ErrorInfo("Tipo_Usuario", "Debe seleccionar Tipo de Usuario"));
            }

            if (usuario.Empleado == -1)
            {
                _errors.Add(new ErrorInfo("Empleado", "Debe seleccionar Empleado asociado a nuevo usuario"));
            }
          
            DataValidation.GetErrors(usuario, _errors);
            if (_errors.Any())
            {
                throw new RulesException(_errors);
            }
            else
            {

                var usuarioRepetido = _repo.GetUsuarioByNombreUsuario(usuario.Usuario1);
                if (usuarioRepetido != null)
                {
                  if (usuario.Usuario1.ToLower().Equals(usuarioRepetido.Usuario1.ToLower()))
                   {
                    throw new RulesException("Usuario1", "Nombre de usario ya esta en uso");
                   }
                }
                else
                {
                    _repo.CreateUsuario(usuario);
                }

            }

        }
    }
}
    

