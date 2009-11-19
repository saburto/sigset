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

        public IList<Permiso> GetPermisosDisponibles(decimal id)
        {
            return _repo.GetPermisosDisponibles(id).ToList();
        }

        public void AgregarPermisoAPerfil(decimal idPermiso, decimal idPerfil)
        {
            PerfilPermiso perfilPermiso = new PerfilPermiso();
            Perfil perfil = new Perfil();
            Permiso permiso = new Permiso();
            perfil = _repo.GetPerfilById(idPerfil);
            permiso = _repo.GetPermisoById(idPermiso);
            perfilPermiso.Permiso = permiso;
            perfilPermiso.Perfil = perfil;
            perfilPermiso.Estado = true;
            _repo.AddPerfilPermiso(perfilPermiso);
        }
        public void EliminarPerfilPermiso(decimal idPermiso, decimal idPerfi)
        {
            PerfilPermiso perfilPermiso = new PerfilPermiso();
            perfilPermiso = _repo.GetPermisoPerfil(idPermiso, idPerfi);
            _repo.DeletePerfilPermiso(perfilPermiso);

        }

        public PerfilPermiso GetPermisoPerfil(decimal idPermiso, decimal idPerfil)
        {
            return _repo.GetPermisoPerfil(idPermiso, idPerfil);
        }

        public Permiso GetPermisoById(decimal idPermiso)
        {
            return _repo.GetPermisoById(idPermiso);
        }


        public PerfilPermiso GetPerfilPermisoById(decimal id)
        {
            return _repo.GetPerfilPermisoById(id);
        }

        public void ActualizarEstadoPerfilPermiso(PerfilPermiso perfilPermiso)
        {
            _repo.ActualizarEstadoPerfilPermiso(perfilPermiso);
        }

        public IList<UsuarioPermiso> GetUsuariosPermisos(decimal idUsuario)
        { 
            return _repo.GetUsuariosPermisos(idUsuario).ToList();
        }

        public IList<PerfilPermiso> GetPerfilPermisoByIdUsuario(decimal idUsuario)
        {
           return _repo.GetPerfilPermisoByIdUsuario(idUsuario).ToList();
        }

        public IList<Permiso> GetPermisosDisponiblesUsuario(decimal idUsuario, decimal idPerfil)
        {
            return _repo.GetPermisosDisponiblesUsuario(idUsuario, idPerfil).ToList();
        }

        public void EliminarUsuarioPermiso(decimal idPermiso, decimal idPerfil, decimal idUsuario)
        {
            _repo.DeleteUsuarioPermiso(idPermiso, idPerfil, idUsuario);
        }

        public void CambiarEstadoUsuarioPermiso(decimal idPermiso, decimal idUsuario)
        {
            var usuarioPermisoNuevo = _repo.GetUsuarioPermiso(idPermiso, idUsuario);
            usuarioPermisoNuevo.Estado = !usuarioPermisoNuevo.Estado;
            _repo.CambiarEstadoUsuarioPermiso(usuarioPermisoNuevo);
        }

        public void GuardarUsuarioPermisoBloqueado(decimal idPermiso, decimal idUsuario)
        {
           
            var permiso = _repo.GetPermisoById(idPermiso);
            var usuario = _repo.GetUsuario(idUsuario);

            if (permiso != null && usuario != null)
            {
                UsuarioPermiso usuarioPermiso = new UsuarioPermiso();
                usuarioPermiso.Permiso = permiso;
                usuarioPermiso.Usuario = usuario;
                usuarioPermiso.Estado = false;
                // guardar en usuarioPermiso;
                _repo.CrearUsuarioPermiso(usuarioPermiso);
            }
            else
            { 
            // datos invalidos
            }

        }

        public void GuardarNuevoUsuarioPermiso(decimal idPermiso, decimal idUsuario)
        {
            var permiso = _repo.GetPermisoById(idPermiso);
            var usuario = _repo.GetUsuario(idUsuario);

            if (permiso != null && usuario != null)
            {
                UsuarioPermiso usuarioPermiso = new UsuarioPermiso();
                usuarioPermiso.Permiso = permiso;
                usuarioPermiso.Usuario = usuario;
                usuarioPermiso.Estado = true;
                // guardar en usuarioPermiso;
                _repo.CrearUsuarioPermiso(usuarioPermiso);
            }
            else
            {
                // datos invalidos
            }
            
        }

        #region IAutorizacionService Members


        Data.Repositorios.RepoGenerico<Permiso> repoPermisos;

        IList<string> IAutorizacionService.GetPermisos()
        {
            repoPermisos = new Data.Repositorios.RepoGenerico<Permiso>();
            return repoPermisos.GetAll().Select(x => x.Opcion).ToList(); ;
        }

        public IList<string> GetPermisosByUsuario(string username)
        {
            var usuario =  _repo.GetUsuarioByNombreUsuario(username);
            List<String> listaPermisosUsuario = usuario.UsuarioPermisos.Where(x => x.Estado).Select(x => x.Permiso.Opcion).ToList(); ;
            List<String> listaPerfil = usuario.Perfil.PerfilPermisos.Where(x => x.Estado).Select(x => x.Permiso.Opcion).ToList();
            listaPermisosUsuario.AddRange(listaPerfil);
            HashSet<String> permisos = new HashSet<string>(listaPermisosUsuario);
            return permisos.ToList();
        }

        public IList<string> GetUsuariosDePermiso(string roleName)
        {
            repoPermisos = new Data.Repositorios.RepoGenerico<Permiso>();
            var permiso = repoPermisos.GetAll().Where(x => x.Opcion == roleName).FirstOrDefault();
            return permiso.UsuarioPermisos.Select(x => x.Usuario.User).ToArray() ;

        }

        public bool UsuarioTienePermiso(string username, string roleName)
        {
            var usuario = _repo.GetUsuarioByNombreUsuario(username);
            List<String> listaPermisosUsuario = usuario.UsuarioPermisos.Where(x => x.Estado).Select(x => x.Permiso.Opcion).ToList(); ;
            List<String> listaPerfil = usuario.Perfil.PerfilPermisos.Where(x => x.Estado).Select(x => x.Permiso.Opcion).ToList();
            listaPermisosUsuario.AddRange(listaPerfil);

            return listaPermisosUsuario.Contains(roleName);
        }

        public bool ExistePermiso(string roleName)
        {
            repoPermisos = new Data.Repositorios.RepoGenerico<Permiso>();
            return repoPermisos.GetAll().Where(x => x.Opcion == roleName).Any();
        }

        #endregion
    }
}
