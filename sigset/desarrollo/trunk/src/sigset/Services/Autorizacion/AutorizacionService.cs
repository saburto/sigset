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
        public AutorizacionService():
               this(new UsuarioRepositorio())
        {

        }

        public AutorizacionService(IUsuarioRepositorio repo)
        {
            _repo = repo;
        }


        public void CrearTipo_Usuario(string nombreTipoUsuario)
        {
            _repo.CreateTipo_Usuario(nombreTipoUsuario);
        }

        public bool ExisteTipo_Usuario(string nombreTipo)
        {
            return _repo.GetTipo_UsuarioByNombre(nombreTipo) != null;
        }

        public bool EsUsuarioTipo_Usuario(string nombreUsuario, decimal tipo)
        {
            return _repo.GetUsuarioByNombreUsuario(nombreUsuario).Tipo_Usuario.Id == tipo;
        }

        public bool EsUsuarioTipo_Usuario(string nombreUsuario, string nombreTipo)
        {
            return _repo.GetUsuarioByNombreUsuario(nombreUsuario).Tipo_Usuario.Descripcion == nombreTipo;
        }

        public IList<String> GetUsuariosTipo_Usuario(string nombreTipo)
        {
            return _repo.GetUsuariosTipo_Usuario(nombreTipo).Select(x => x.Usuario1).ToList();
        }

        public IList<String> GetTipos_Usuarios()
        {
            var tipos = from t in _repo.GetTipos_Usuario()
                        select t.Descripcion;
            return tipos.ToList();
        }


        public IList<string> GetTipos_UsuarioByUsuario(string user)
        {
            Tipo_Usuario tipo = _repo.GetUsuarioByNombreUsuario(user).Tipo_Usuario;
            IList<String> lista = new List<String>();
            lista.Add(tipo.Descripcion);
            return lista;
        }
    }
}
