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

      
        public IQueryable<Empleado> GetEmpleados()
        {
            var empleados = from v in _data.Empleado
                            select v;
            return empleados;
        }
        public Empleado GetEmpleadoByRut(decimal rut)
        {
            var empleado = (from c in _data.Empleado
                           where c.Rut == rut
                           select c).FirstOrDefault();
            return empleado;
        }

        public IQueryable<Tipo_Cargo> GetTipoCargo()
        {
            var tipo_cargo = from tc in _data.Tipo_Cargo
                            select tc;
            return tipo_cargo;
        }



        public void GuardarEmpleado(Empleado empleado)
        {
            _data.AddToEmpleado(empleado);
            _data.SaveChanges();
        }

        public void GuardarEmpleado(Empleado empleado, decimal tipoCargo)
        {
            Tipo_Cargo cargo = _data.Tipo_Cargo.Where(x => x.Id_Tipo_Cargo == tipoCargo).FirstOrDefault();
            empleado.Tipo_Cargo = cargo;
            GuardarEmpleado(empleado);
        }

        public Empleado EditarEmpleado(int Rut, Empleado empleado,decimal tipoCargo)
        {
            var empleado_original = (from eo in _data.Empleado
                                     where eo.Rut == Rut
                                     select eo).FirstOrDefault();
            empleado_original.Nombre = empleado.Nombre;
            empleado_original.Apellido_Paterno = empleado.Apellido_Paterno;
            empleado_original.Apellido_Materno = empleado.Apellido_Materno;
            Tipo_Cargo cargo = _data.Tipo_Cargo.Where(x => x.Id_Tipo_Cargo == tipoCargo).FirstOrDefault();
            empleado_original.Tipo_Cargo = cargo;
           

            _data.SaveChanges();

            return empleado;

                             
          
        }

      
    }
}
