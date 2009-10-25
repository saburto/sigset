using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.Empleados
{
    public class EmpleadoRepositorio : Data.Repositorios.Empleados.IEmpleadoRepositorio
    {
        sigsetEntities _data;
       
        public EmpleadoRepositorio()
        {
  
            _data = new sigsetEntities();
        }

      
        public IQueryable<Usuario> GetEmpleados()
        {
            var empleados = from v in _data.Usuarios
                            select v;
            return empleados;
        }
        public Usuario GetEmpleadoByRut(decimal rut)
        {
            var empleado = (from c in _data.Usuarios
                           where c.Rut == rut
                           select c).FirstOrDefault();
            return empleado;
        }

        public IQueryable<Perfil> GetPerfil()
        {
            var TipoCargo = from tc in _data.Perfils
                            select tc;
            return TipoCargo;
        }



        public void GuardarEmpleado(Usuario empleado)
        {
            _data.Usuarios.InsertOnSubmit(empleado);
            _data.SubmitChanges();
        }

        public void GuardarEmpleado(Usuario empleado, decimal tipoCargo)
        {
            Perfil cargo = _data.Perfils.Where(x => x.Id == tipoCargo).FirstOrDefault();
            empleado.Perfil = cargo;
            GuardarEmpleado(empleado);
        }

        public Usuario EditarEmpleado(int Rut, Usuario empleado,decimal tipoCargo)
        {
            var empleado_original = (from eo in _data.Usuarios
                                     where eo.Rut == Rut
                                     select eo).FirstOrDefault();
            empleado_original.Nombres = empleado.Nombres;
            empleado_original.ApellidoPaterno = empleado.ApellidoPaterno;
            empleado_original.ApellidoMaterno = empleado.ApellidoMaterno;
            Perfil cargo = _data.Perfils.Where(x => x.Id == tipoCargo).FirstOrDefault();
            empleado_original.Perfil = cargo;
           

            _data.SubmitChanges();

            return empleado;

                             
          
        }

      
    }
}
