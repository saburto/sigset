using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using System.Collections;

namespace Data.Repositorios.Usuarios
{
    public class UsuarioRepositorio : Data.Repositorios.Usuarios.IUsuarioRepositorio 
    {
        sigsetEntities _entities;

        public UsuarioRepositorio()
        {
            _entities = new sigsetEntities();
        }

        public IQueryable<Usuario> GetUsuarios()
        {
            return _entities.Usuarios;
        }

        public Usuario GetUsuario(decimal id)
        {
            return _entities.Usuarios.Where(x => x.Id == id).FirstOrDefault();
        }


        public Usuario GetUsuarioByNombreUsuario(string nombreUsuario )
        {
            return _entities.Usuarios.Where(x => x.User == nombreUsuario).FirstOrDefault();
        }

        public Usuario UpdateUsuario(Usuario usuario)
        {
            var usuario_original = GetUsuario(usuario.Id);
            
            usuario_original.User = usuario.User;
            usuario_original.Password = usuario.Password;
            usuario_original.PerfilUsuario = usuario.PerfilUsuario;
            usuario_original.Nombres = usuario.Nombres;
            usuario_original.Activo = usuario.Activo;
            usuario_original.ApellidoMaterno = usuario.ApellidoMaterno;
            usuario_original.ApellidoPaterno = usuario.ApellidoPaterno;
            usuario_original.Email = usuario.Email;
            usuario_original.Telefono = usuario.Telefono;

            _entities.SubmitChanges();
            return usuario;
          }


        public Perfil GetPerfil(decimal id)
        {
            return _entities.Perfils.Where(x => x.Id == id).FirstOrDefault();
        }

        public Perfil GetPerfilByNombre(string nombre)
        {
            return _entities.Perfils.Where(x => x.Descripcion == nombre).FirstOrDefault();
        }

        public void CreatePerfil(string nombreTipoUsuario)
        {
            _entities.Perfils.InsertOnSubmit(new Perfil() { Descripcion= nombreTipoUsuario });
            _entities.SubmitChanges();
        }

        public void DeletePerfil(decimal id)
        {
            Perfil tipo = GetPerfil(id);
            _entities.Perfils.DeleteOnSubmit(tipo);
            _entities.SubmitChanges();
        }

        public IQueryable<Usuario> GetUsuariosPerfil(string nombreTipoUsuario)
        {
            return _entities.Usuarios.Where(x => x.Perfil.Descripcion == nombreTipoUsuario);
        }

        public IQueryable<Perfil> GetPerfiles()
        {
            return _entities.Perfils;
        }

        public Perfil GetPerfilByUsuarioNombre(string usuarioNombre)
        {
            var tipo = (from u in _entities.Usuarios
                       where u.User == usuarioNombre
                        select u.Perfil).FirstOrDefault() ;
            return tipo;
        }
        public void CreateUsuario(Usuario usuario)
        {
            _entities.Usuarios.InsertOnSubmit(usuario);
            _entities.SubmitChanges();
        }
        public Usuario FindEmpleadoByRut(decimal rut)
        {
            return new Repositorios.Empleados.EmpleadoRepositorio().GetEmpleadoByRut(rut);
        }
        public IQueryable<Usuario> GetTodosLosEmpleados()
        {
            return new Repositorios.Empleados.EmpleadoRepositorio().GetEmpleados();
        }
        public void DeleteUsuario(Usuario usuario)
        {
            _entities.Usuarios.DeleteOnSubmit(usuario);
            _entities.SubmitChanges();
        }



        #region IUsuarioRepositorio Members


        public IQueryable<Permiso> GetTodosLosPermisos()
        {
            return _entities.Permisos;
        }

        #endregion
    }
}
