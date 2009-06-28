using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Data.Repositorios.Clientes;
using Data.Modelo;

namespace TestData
{
    [TestClass]
    public class ClienteRepositorioTest
    {
        ClienteRepositorio _repo;
        [TestInitialize]
        public void TestInit()
        {
            _repo = new ClienteRepositorio();
        }

        [TestMethod]
        public void Test_GetClienteByRut_isNull()
        {
            Cliente cliente = _repo.GetClienteByRut(9);

            Assert.IsNull(cliente);
        }

        [TestMethod]
        public void Test_GetClienteByRut_No_Null()
        {
            Cliente cliente = _repo.GetClienteByRut(11744218);

            Assert.IsNotNull(cliente);
        }

        [TestMethod]
        public void Test_GetClienteByRut_Cliente()
        {
            Cliente cliente = _repo.GetClienteByRut(13317464);

            Assert.IsNotNull(cliente);
            Assert.AreEqual("Angelica Soledad", cliente.Nombre);
            Assert.AreEqual("Perez", cliente.Apellido_Paterno);
            Assert.AreEqual("Cotapo", cliente.Apellido_Materno);

        }

        [TestMethod]
        public void Test_CrearCliente_Cliente_Vacio()
        {
            Exception ex = null;
            try
            {
                _repo.CrearCliente(new Cliente());
            }
            catch(Exception e)
            {
                ex = e;
            }
            Assert.IsNotNull(ex);
        }

        [TestMethod]
        public void Test_CrearCliente_Cliente_Nuevo()
        {
            Cliente clienteNuevo = new Cliente();
            clienteNuevo.Rut = 16007459;
            clienteNuevo.Apellido_Paterno = "Aburto";
            clienteNuevo.Apellido_Materno = "Méndez";
            clienteNuevo.Nombre = "Sebastián";

            Cliente clientGrabado = null;

            Exception ex = null;
            try
            {
                _repo.CrearCliente(clienteNuevo);
                clientGrabado = _repo.GetClienteByRut(clienteNuevo.Rut);
            }
            catch (Exception e)
            {
                ex = e;
            }
            Assert.AreEqual<Cliente>(clienteNuevo, clientGrabado);
            Assert.IsNull(ex);
        }


        [TestMethod]
        public void Test_CrearCliente_Cliente_Sin_Rut()
        {
            Cliente clienteNuevo = new Cliente();
            //clienteNuevo.Rut = 16007459;
            //clienteNuevo.Apellido_Paterno = "Aburto";
            clienteNuevo.Apellido_Materno = "Méndez";
            clienteNuevo.Nombre = "Sebastián";

            Cliente clientGrabado = null;

            Exception ex = null;
            try
            {
                _repo.CrearCliente(clienteNuevo);
                clientGrabado = _repo.GetClienteByRut(clienteNuevo.Rut);
            }
            catch (Exception e)
            {
                ex = e;
            }
            Assert.AreEqual<Cliente>(clienteNuevo, clientGrabado);
            Assert.IsNull(ex);
        }

        [TestMethod]
        public void Test_GetDireccionesByClienteRut()
        {
            var dires = _repo.GetDireccionesByRutCliente(0);
            Assert.IsNotNull(dires);
            Assert.AreEqual(0, dires.Count());
        }

        [TestMethod]
        public void Test_GetDireccionesByClienteRut_no_null()
        {
            var dires = _repo.GetDireccionesByRutCliente(16007459);
            Assert.IsNotNull(dires);
            Assert.IsTrue(dires.Count() > 0);

        }

        [TestMethod]
        public void Test_CrearDireccionCliente_Null()
        {
            Direccion dire = new Direccion();
            dire.Region = 13;
            dire.Ciudad = "Santiago";
            dire.Comuna = "PA";
            dire.Calle = "asdads";
            dire.Numero = 123;
            
            Exception ex = null;
            try
            {
                _repo.CrearDirecionCliente(0, dire, 1);
            }
            catch (Exception e)
            {
                ex = e;
            }
            Assert.IsNotNull(ex);
            
        }

        [TestMethod]
        public void Test_CrearDireccionCliente_NoNull()
        {
            Direccion dire = new Direccion();
            dire.Region = 13;
            dire.Ciudad = "Santiago";
            dire.Comuna = "PA";
            dire.Calle = "asdads";
            dire.Numero = 123;

            Exception ex = null;

            IQueryable<Direccion> dires = null;

            try
            {
                _repo.CrearDirecionCliente(16007459, dire, 1);
                dires = _repo.GetDireccionesByRutCliente(16007459);
            }
            catch (Exception e)
            {
                ex = e;
            }
            Assert.IsNull(ex);
            Assert.IsTrue(dires.Count() > 1);
            

        }

        [TestMethod]
        public void Test_ListaDeTipoDireccion()
        {
            IQueryable<Tipo_Direccion> tipos = _repo.GetTiposDireccion();
            Assert.IsNotNull(tipos);
            Assert.IsTrue(tipos.Count() > 0);
        }

        [TestMethod]
        public void Test_TipoDireccionById()
        {
            Tipo_Direccion tipo = _repo.GetTipoDireccionById(1);
            Assert.IsNotNull(tipo);
            Assert.IsTrue(tipo.Id_Tipo_Direccion == 1);
        }

        [TestMethod]
        public void Test_TipoDireccionById_isNull()
        {
            Tipo_Direccion tipo = _repo.GetTipoDireccionById(99);
            Assert.IsNull(tipo);
        }
    }
}
