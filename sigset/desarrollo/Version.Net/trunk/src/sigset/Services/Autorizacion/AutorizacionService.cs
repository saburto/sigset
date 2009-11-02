using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Repositorios.Usuarios;
using Data.Modelo;

namespace Services.Autorizacion
{
    public class AutorizacionService : IAutorizacionService
    {
        private IUsuarioRepositorio _repo;
        public AutorizacionService() :
            this(new UsuarioRepositorio())
        {

        }

        public AutorizacionService(IUsuarioRepositorio repo)
        {
            _repo = repo;
        }


        public void CrearTipo_Usuario(string nombreTipoUsuario)
        {
            _repo.CreatePerfil(nombreTipoUsuario);
        }

        public bool ExisteTipo_Usuario(string nombreTipo)
        {
            return _repo.GetPerfilByNombre(nombreTipo) != null;
        }

        public bool EsUsuarioTipo_Usuario(string nombreUsuario, decimal tipo)
        {
            return _repo.GetUsuarioByNombreUsuario(nombreUsuario).Perfil.Id == tipo;
        }

        public bool EsUsuarioTipo_Usuario(string nombreUsuario, string nombreTipo)
        {
            return _repo.GetUsuarioByNombreUsuario(nombreUsuario).Perfil.Descripcion == nombreTipo;
        }

        public IList<String> GetUsuariosTipo_Usuario(string nombreTipo)
        {
            return _repo.GetUsuariosPerfil(nombreTipo).Select(x => x.User).ToList();
        }

        public IList<String> GetPerfiless()
        {
            var tipos = from t in _repo.GetPerfiles()
                        select t.Descripcion;
            return tipos.ToList();
        }


        public IList<string> GetPerfilesByUsuario(string user)
        {
            IList<String> lista = new List<String>();
            Perfil tipo = _repo.GetPerfilByUsuarioNombre(user);
            if (tipo != null)
            {
                lista.Add(tipo.Descripcion);
            }
            return lista;
        }

        public IList<Permiso> GetPermisos()
        {
            return _repo.GetTodosLosPermisos().ToList();
        }

        public IList<PerfilPermiso> GetPermisosByPerfil(decimal id)
        {
            return _repo.GetPermisosByPerfil(id).ToList();
        }
    }
}
