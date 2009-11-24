using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.Usuarios;
using Services.Helpers;
using xVal.ServerSide;
using Data.Modelo;
using Data.Modelo.Constantes;
using Data.Modelo.Enums;
using Services.Tecnicos;


namespace Services.Usuarios
{
    public class UsuarioServicio : Services.Usuarios.IUsuarioServicio 
    {
        private IUsuarioRepositorio _repo;
        private TecnicoServicio _tecnicoSrv;


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
            if (usuario.Id == Constantes.ID_USUARIO_SISTEMA)
            {   
                return;
            }

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
                if (usuario.PerfilUsuario == (int)PerfilUsuarios.Tecnico)
                {
                    _tecnicoSrv = new TecnicoServicio();
                    _tecnicoSrv.CrearTecnicoDefecto(usuario.Id);
                }
            }
        }
            
      
        

        public void EliminarUsuario(decimal id)
        {
            if (Constantes.ID_USUARIO_SISTEMA != id)
            {
                var usuario = _repo.GetUsuario(id);
                _repo.DeleteUsuario(usuario);
            }
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
                    usuario.Activo = true;
                    _repo.CreateUsuario(usuario);

                    if (usuario.PerfilUsuario == (int) PerfilUsuarios.Tecnico )
                    {
                        _tecnicoSrv = new TecnicoServicio();
                        _tecnicoSrv.CrearTecnicoDefecto(usuario.Id);
                    }

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


        #region IUsuarioServicio Members


        public IList<Usuario> BuscarUsuario(Usuario parametros)
        {
            var usuarios = _repo.GetUsuarios();

             if (!string.IsNullOrEmpty(parametros.User))
             {
                 return usuarios.Where(x => x.User == parametros.User).ToList();
             }

             if (parametros.Rut != 0)
             {
                 return usuarios.Where(x => x.Rut == parametros.Rut).ToList();
             }

             if (!string.IsNullOrEmpty(parametros.Nombres))
             {  
                usuarios = usuarios.Where(x => x.Nombres.Contains(parametros.Nombres)); 
             }

             if (!string.IsNullOrEmpty(parametros.ApellidoPaterno))
             {
                 usuarios = usuarios.Where(x=> x.ApellidoPaterno.Contains(parametros.ApellidoPaterno));
             }

             if (parametros.PerfilUsuario > 0)
             {
                 usuarios = usuarios.Where(x => x.PerfilUsuario == parametros.PerfilUsuario);
             }


             return usuarios.ToList();
        }

        #endregion
    }
}
    

