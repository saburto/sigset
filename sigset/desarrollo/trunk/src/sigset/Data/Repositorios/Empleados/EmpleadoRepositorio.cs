﻿using System;
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

        public void GuardarEmpleado(Empleado empleado)
        {
            _data.AddToEmpleado(empleado);
            _data.SaveChanges();
        }
      
    }
}