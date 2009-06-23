using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Usuarios
{
    public class UsuarioRepositorio : IUsuarioRepositorio
    {
        sigsetEntities _entities;

        public UsuarioRepositorio()
        {
            _entities = new sigsetEntities();
        }

        public IQueryable<Usuario> GetUsuarios()
        {
            return _entities.Usuario;
        }

        public Usuario GetUsuario(decimal id)
        {
            return _entities.Usuario.Where(x => x.Id == id).FirstOrDefault();
        }


        public Usuario GetUsuarioByNombreUsuario(string nombreUsuario )
        {
            return _entities.Usuario.Where(x => x.Usuario1 == nombreUsuario).FirstOrDefault();
        }

        public Usuario UpdateUsuario(Usuario usuario)
        {
            var originalUsuario = GetUsuario(usuario.Id);
            _entities.ApplyPropertyChanges(originalUsuario.EntityKey.EntitySetName, usuario);
            _entities.SaveChanges();
            return usuario;
        }


        public Tipo_Usuario GetTipo_Usuario(decimal id)
        {
            return _entities.Tipo_Usuario.Where(x => x.Id == id).FirstOrDefault();
        }

        public Tipo_Usuario GetTipo_UsuarioByNombre(string nombre)
        {
            return _entities.Tipo_Usuario.Where(x => x.Descripcion == nombre).FirstOrDefault();
        }

        public void CreateTipo_Usuario(string nombreTipoUsuario)
        {
            _entities.AddToTipo_Usuario(new Tipo_Usuario() { Descripcion= nombreTipoUsuario });
            _entities.SaveChanges();
        }

        public void DeleteTipo_Usuario(decimal id)
        {
            Tipo_Usuario tipo = GetTipo_Usuario(id);
            _entities.DeleteObject(tipo);
            _entities.SaveChanges();
        }

        public IQueryable<Usuario> GetUsuariosTipo_Usuario(string nombreTipoUsuario)
        {
            return _entities.Usuario.Where(x => x.Tipo_Usuario.Descripcion == nombreTipoUsuario);
        }

        public IQueryable<Tipo_Usuario> GetTipos_Usuario()
        {
            return _entities.Tipo_Usuario;
        }


    }
}
