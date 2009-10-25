using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Perfiles
{
    public class PerfilRepositorio : Data.Repositorios.Perfiles.IPerfilRepositorio
    {
        sigsetEntities _data;

        public PerfilRepositorio()
        {  
            _data = new sigsetEntities();
        }
        public IQueryable <Perfil> GetPerfil()
        {
            var perfil = from tc in _data.Perfils
                             select tc;
            return perfil;
        }


        public Perfil GetPerfilById(int id)
        {
            var perfil = (from tc in _data.Perfils
                              where tc.Id == id
                              select tc).FirstOrDefault();
            return perfil;
            
        }
        public void GuardarNuevoTipoCargo(Perfil tipo)
        {
            _data.Perfils.InsertOnSubmit(tipo);
            _data.SubmitChanges();
        }

        public Perfil EditarTipoCargo(int id,Perfil tipo)
        {
          var perfil_original = (from tc in _data.Perfils
                                   where tc.Id == id
                                  select tc).FirstOrDefault();
          perfil_original.Descripcion = tipo.Descripcion;
          _data.SubmitChanges();
          return tipo;    
        }

        public void BorrarTipoCargo(int id)
        {
            Perfil tipo = GetPerfilById(id);
             _data.Perfils.DeleteOnSubmit(tipo);
            _data.SubmitChanges();
        }

        public int ContarEmpleadoSegunTipoCargo(Perfil tipo)
        {
            var cargos = (from e in _data.Usuarios
                          where e.Perfil == tipo
                          select e).Count();
            return cargos;

        }
    }
             


    }

