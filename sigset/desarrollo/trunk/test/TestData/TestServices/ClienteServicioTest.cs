using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Services.Clientes;
using Data.Modelo;
using xVal.ServerSide;


namespace TestServices
{
    [TestClass]
    public class ClienteServicioTest
    {
        private ClienteServicio _serv;
        [TestInitialize]
        public void InitTest()
        {
            _serv = new ClienteServicio();
        }

        [TestMethod]
        public void TestValidadorRut()
        {
            string dv = Services.Helpers.ValidarRut.GetDigitoVerificador(16007459);
            Assert.AreEqual("0", dv);

            string dv2 = Services.Helpers.ValidarRut.GetDigitoVerificador(16007459);
            Assert.AreNotEqual("3", dv2);

            //10699370-K
            string k = Services.Helpers.ValidarRut.GetDigitoVerificador(10699370);
            Assert.AreNotEqual("k",k);
            Assert.AreEqual("K", k);
        }


        [TestMethod]
        public void TestCrearCliente_Con_Datos_Invalidos()
        {
            try
            {
                Cliente clienteInvalido = new Cliente();
                _serv.CrearNuevoCliente(clienteInvalido,"");
            }
            catch (RulesException ex)
            {
                Assert.IsNotNull(ex);
                Assert.IsTrue(ex.Errors.Count() > 0);
                Assert.IsTrue(ex.Errors.ToList()[0].PropertyName == "Rut");
                Assert.IsTrue(ex.Errors.ToList()[1].PropertyName == "Nombre");
                Assert.IsTrue(ex.Errors.ToList()[2].PropertyName == "Apellido_Paterno");
            }
        }

        [TestMethod]
        public void TestCrearCliente_ConSolo_Rut()
        {
            try
            {
                Cliente clienteInvalido = new Cliente();
                clienteInvalido.Rut = 16007459;
                _serv.CrearNuevoCliente(clienteInvalido,"0");
            }
            catch (RulesException ex)
            {
                Assert.IsNotNull(ex);
                Assert.IsTrue(ex.Errors.Count() > 0);
                Assert.IsTrue(ex.Errors.ToList()[0].PropertyName == "Nombre");
                Assert.IsTrue(ex.Errors.ToList()[1].PropertyName == "Apellido_Paterno");
            }
        }

        [TestMethod]
        public void TestCrearCliente_Con_RutInvalido()
        {
            try
            {
                Cliente clienteInvalido = new Cliente();
                clienteInvalido.Rut = 16;
                clienteInvalido.Nombre = "Juan";
                clienteInvalido.Apellido_Paterno = "Perez";
                _serv.CrearNuevoCliente(clienteInvalido,"0");
            }
            catch (RulesException ex)
            {
                Assert.IsNotNull(ex);
                Assert.IsTrue(ex.Errors.Count() > 0);
                Assert.IsTrue(ex.Errors.ToList()[0].PropertyName == "Rut");
            }
        }

        [TestMethod]
        public void TestCrearCliente_Con_RutInvalido_y_sin_nombre()
        {
            try
            {
                Cliente clienteInvalido = new Cliente();
                clienteInvalido.Rut = 16;
                _serv.CrearNuevoCliente(clienteInvalido, "0");
            }
            catch (RulesException ex)
            {
                Assert.IsNotNull(ex);
                Assert.IsTrue(ex.Errors.Count() > 0);
                Assert.IsTrue(ex.Errors.ToList()[0].PropertyName == "Rut");
                Assert.IsTrue(ex.Errors.ToList()[1].PropertyName == "Nombre");
                Assert.IsTrue(ex.Errors.ToList()[2].PropertyName == "Apellido_Paterno");

            }
        }

        [TestMethod]
        public void TestCrearCliente_Valido_con_DV_Invalido()
        {
            Cliente clienteValido = new Cliente();
            clienteValido.Rut = 16007459;
            clienteValido.Nombre = "Sebastián";
            clienteValido.Apellido_Paterno = "Aburto";
            clienteValido.Apellido_Materno = "Méndez";

            try
            {
                _serv.CrearNuevoCliente(clienteValido, "3");
            }
            catch (RulesException ex)
            {
                Assert.IsNotNull(ex);
                Assert.IsTrue(ex.Errors.Count() > 0);
                Assert.IsTrue(ex.Errors.ToList()[0].PropertyName == "Rut");
            }
        }

        [TestMethod]
        public void TestCrearCliente_Valido_con_DV_valido()
        {
            Cliente clienteValido = new Cliente();
            clienteValido.Rut = 16007459;
            clienteValido.Nombre = "Sebastián";
            clienteValido.Apellido_Paterno = "Aburto";
            clienteValido.Apellido_Materno = "Méndez";

            Exception e = null;

            try
            {
                _serv.CrearNuevoCliente(clienteValido, "0");
            }
            catch (RulesException ex)
            {
                e = ex;
            }
            Assert.IsNull(e);
        }

        [TestMethod]
        public void TestCrearCliente_Valido_con_Rut_Ya_Ingresado()
        {
            Cliente clienteValido = new Cliente();
            clienteValido.Rut = 16007459;
            clienteValido.Nombre = "Juan";
            clienteValido.Apellido_Paterno = "Perez";
            
            try
            {
                _serv.CrearNuevoCliente(clienteValido, "0");
            }
            catch (RulesException ex)
            {
                Assert.IsNotNull(ex);
                Assert.IsTrue(ex.Errors.Count() > 0);
                Assert.IsTrue(ex.Errors.ToList()[0].PropertyName == "Rut");

            }            
        }



    }
}
