﻿using System;
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


        public Usuario GetUsuarioByNombreUsuario(string nombreUsuario)
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
            _entities.Perfils.InsertOnSubmit(new Perfil() { Descripcion = nombreTipoUsuario });
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
                        select u.Perfil).FirstOrDefault();
            return tipo;
        }
        public void CreateUsuario(Usuario usuario)
        {
            _entities.Usuarios.InsertOnSubmit(usuario);
            _entities.SubmitChanges();
        }
        public Usuario FindEmpleadoByRut(decimal rut)
        {
            return _entities.Usuarios.Where(x => x.Rut == rut).FirstOrDefault();
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

        public IQueryable<PerfilPermiso> GetPermisosByPerfil(decimal id)
        {
            return _entities.PerfilPermisos.Where(x => x.IdPerfil == id);
        }

        public PerfilPermiso GetPermisoPerfil(decimal idPermiso, decimal idPerfil)
        {
            return _entities.PerfilPermisos.Where(x => x.IdPermiso == idPermiso && x.IdPerfil == idPerfil).FirstOrDefault();
        }

        public Perfil GetPerfilById(decimal id)
        {
            return _entities.Perfils.Where(x => x.Id == id).FirstOrDefault();
        }

        public IQueryable<Permiso> GetPermisosDisponibles(decimal id)
        {

            return _entities.PermisosDispPerfil((int?)id).AsQueryable();
        }


        public void AddPerfilPermiso(PerfilPermiso perfilPermiso)
        {

            _entities.PerfilPermisos.InsertOnSubmit(perfilPermiso);
            _entities.SubmitChanges();
        }

        public Permiso GetPermisoById(decimal id)
        {
            return _entities.Permisos.Where(x => x.Id == Convert.ToInt32(id)).FirstOrDefault();
        }

        public void DeletePerfilPermiso(PerfilPermiso perfilPermiso)
        {
            _entities.PerfilPermisos.DeleteOnSubmit(perfilPermiso);
            _entities.SubmitChanges();

        }

        public PerfilPermiso GetPerfilPermisoById(decimal id)
        {
            return _entities.PerfilPermisos.Where(x => x.Id == id).FirstOrDefault();
        }

        public void ActualizarEstadoPerfilPermiso(PerfilPermiso perfilPermiso)
        {
            var nuevoPerfilPermiso = GetPerfilPermisoById(perfilPermiso.Id);
            nuevoPerfilPermiso.Estado = !perfilPermiso.Estado;
            nuevoPerfilPermiso = perfilPermiso;
            _entities.SubmitChanges();
        }

        public IQueryable<UsuarioPermiso> GetUsuariosPermisos(decimal idUsuario)
        {
            return _entities.UsuarioPermisos.Where(x => x.IdUsuario == idUsuario);
        }

        public IQueryable<PerfilPermiso> GetPerfilPermisoByIdUsuario(decimal idUsuario)
        {
            var usuarioPerfil = _entities.Usuarios.Where(x => x.Id == idUsuario).FirstOrDefault();
            return _entities.PerfilPermisos.Where(x => x.IdPerfil == usuarioPerfil.Perfil.Id);
        }

        public IQueryable<Permiso> GetPermisosDisponiblesUsuario(decimal idUsuario, decimal idPerfil)
        {
            return _entities.PermisosDispUsuario((int?)idPerfil, (int?)idUsuario).AsQueryable();
        }

        public void DeleteUsuarioPermiso(decimal idPermiso, decimal idPerfil, decimal idUsuario)
        {
            var usuarioPermiso = _entities.UsuarioPermisos.Where(x => x.IdPermiso == idPermiso && x.IdUsuario == idUsuario).FirstOrDefault();
            _entities.UsuarioPermisos.DeleteOnSubmit(usuarioPermiso);
            _entities.SubmitChanges();
        }

        public UsuarioPermiso GetUsuarioPermiso(decimal idPermiso, decimal idUsuario)
        {
            return _entities.UsuarioPermisos.Where(x => x.IdPermiso == idPermiso && x.IdUsuario == idUsuario).FirstOrDefault();
        }

        public void CambiarEstadoUsuarioPermiso(UsuarioPermiso usuarioPermisoNuevo)
        {
            UsuarioPermiso usuarioPermisoAnterior = GetUsuarioPermiso(Convert.ToDecimal(usuarioPermisoNuevo.IdPermiso), Convert.ToDecimal(usuarioPermisoNuevo.IdUsuario));
            usuarioPermisoAnterior = usuarioPermisoNuevo;
            _entities.SubmitChanges();
        }
        public void CrearUsuarioPermiso(UsuarioPermiso usuarioPermiso)
        {
            _entities.UsuarioPermisos.InsertOnSubmit(usuarioPermiso);
            _entities.SubmitChanges();
        }

        #endregion
    }
}
