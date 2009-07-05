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
            :this(new UsuarioRepositorio())
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
            _repo.UpdateUsuario(usuario);        
        }

        public void EliminarUsuario(Usuario usuario)
        {
            _repo.DeleteUsuario(usuario);
        }

        public IList<Tipo_Usuario> TiposUsuarios()
        {
            return _repo.GetTipos_Usuario().ToList() ;
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
               
                if (usuario.Empleado == 0)
                {
                    _errors.Add(new ErrorInfo("Empleado", "Empleado es necesario"));
                }
                DataValidation.GetErrors(usuario, _errors);
                if (_errors.Any())
                {
                    throw new RulesException(_errors);
                }
                else
                {
                    _repo.CreateUsuario(usuario);
                }
           
            }
        
        }

    }

