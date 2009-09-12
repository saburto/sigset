using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Data.Repositorios.Empleados;
using Data.Modelo;

namespace TestData
{
   
    [TestClass]
    public class EmpleadoRepositorioTest
    {
        EmpleadoRepositorio _repo;
               
        [TestInitialize]
        public void TestInit()
        {
            _repo = new EmpleadoRepositorio();
        }

        [TestMethod]
        public void Test_CrearNuevoEmpleado()
        {
            Empleado nuevoEmpleado = new Empleado();
            nuevoEmpleado.Rut = 15709046;
            nuevoEmpleado.Apellido_Paterno = "Morales";
            nuevoEmpleado.Apellido_Materno = "Ruiz";
            nuevoEmpleado.Nombre = "Rumina";
            decimal listaTipo = 1;
            _repo.GuardarEmpleado(nuevoEmpleado, listaTipo);
            nuevoEmpleado = _repo.GetEmpleadoByRut(15709046);
            Empleado empleadoGrabado = null;
            Exception ex = null;
            try
            {
                _repo.GuardarEmpleado(nuevoEmpleado, 1);
                empleadoGrabado = _repo.GetEmpleadoByRut(nuevoEmpleado.Rut);
                                         
            }
            catch (Exception e)
            {
                ex = e;
            }
            Assert.AreEqual(nuevoEmpleado, empleadoGrabado);


        }
        [TestMethod]
        public void Test_EditarEmpleado()
        {
            Empleado empleado_original = new Empleado();
            Empleado empleado_modificado = new Empleado();
            empleado_original = _repo.GetEmpleadoByRut(15709046);
            empleado_modificado = _repo.GetEmpleadoByRut(15709046);
            empleado_modificado.Nombre = "modificado";
            empleado_modificado.Apellido_Materno = "ape_MAt";
            empleado_modificado.Apellido_Paterno = "ape_pat";
            Empleado nuevo_empleado = new Empleado(); 
            nuevo_empleado = _repo.EditarEmpleado(15709046, empleado_modificado, 2);


        }

        [TestMethod]
        public void Test_EmpleadoSinTecnico_TestQuery()
        {
            sigsetEntities ent = new sigsetEntities();
            /*from emp in empleados where 
            ((tipo_cargo == 1) && (!(from t in tecnicos where t.rut == emp.rut).Any())) select emp*/
            var empleadosSinTecnicos = from emp in ent.Empleados
                                       where
                                       (emp.Tipo_Cargo == 1) &&
                                       ((from t in ent.Tecnicos
                                         where t.Rut == emp.Rut
                                         select t).Any())
                                       select emp;
            Assert.IsTrue(empleadosSinTecnicos.Any());
        }


    }
}
