using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using System.Collections;

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
            return _entities.Usuarios;
        }

        public Usuario GetUsuario(decimal id)
        {
            return _entities.Usuarios.Where(x => x.Id == id).FirstOrDefault();
        }


        public Usuario GetUsuarioByNombreUsuario(string nombreUsuario )
        {
            return _entities.Usuarios.Where(x => x.Usuario1 == nombreUsuario).FirstOrDefault();
        }

        public Usuario UpdateUsuario(Usuario usuario)
        {

            var usuario_original = (from uo in _entities.Usuarios
                                     where uo.Id == usuario.Id
                                     select uo).FirstOrDefault();
            usuario_original.Usuario1 = usuario.Usuario1;
            usuario_original.Contraseña = usuario.Contraseña;
            usuario_original.Tipo_Usuario = usuario.Tipo_Usuario;
            usuario_original.Empleado = usuario.Empleado;
            _entities.SubmitChanges();
            return usuario;
          }


        public Tipo_Usuario GetTipo_Usuario(decimal id)
        {
            return _entities.Tipo_Usuarios.Where(x => x.Id_Tipo_Usuario == id).FirstOrDefault();
        }

        public Tipo_Usuario GetTipo_UsuarioByNombre(string nombre)
        {
            return _entities.Tipo_Usuarios.Where(x => x.Descripcion == nombre).FirstOrDefault();
        }

        public void CreateTipo_Usuario(string nombreTipoUsuario)
        {
            _entities.Tipo_Usuarios.InsertOnSubmit(new Tipo_Usuario() { Descripcion= nombreTipoUsuario });
            _entities.SubmitChanges();
        }

        public void DeleteTipo_Usuario(decimal id)
        {
            Tipo_Usuario tipo = GetTipo_Usuario(id);
            _entities.Tipo_Usuarios.DeleteOnSubmit(tipo);
            _entities.SubmitChanges();
        }

        public IQueryable<Usuario> GetUsuariosTipo_Usuario(string nombreTipoUsuario)
        {
            return _entities.Usuarios.Where(x => x.Tipo_Usuario1.Descripcion == nombreTipoUsuario);
        }

        public IQueryable<Tipo_Usuario> GetTipos_Usuario()
        {
            return _entities.Tipo_Usuarios;
        }

        public Tipo_Usuario GetTipo_UsuarioByUsuarioNombre(string usuarioNombre)
        {
            var tipo = (from u in _entities.Usuarios
                       where u.Usuario1 == usuarioNombre
                        select u.Tipo_Usuario1).FirstOrDefault() ;
            return tipo;
        }
        public void CreateUsuario(Usuario usuario)
        {
            _entities.Usuarios.InsertOnSubmit(usuario);
            _entities.SubmitChanges();
        }
        public Empleado FindEmpleadoByRut(decimal rut)
        {
            var empleado = (from e in _entities.Empleados
                            where e.Rut == rut
                            select e).FirstOrDefault();
            return empleado;
        }
        public IQueryable<Empleado> GetTodosLosEmpleados()
        {
            return _entities.Empleados;            
        }
        public void DeleteUsuario(Usuario usuario)
        {
            _entities.Usuarios.DeleteOnSubmit(usuario);
            _entities.SubmitChanges();
        }


    }
}
