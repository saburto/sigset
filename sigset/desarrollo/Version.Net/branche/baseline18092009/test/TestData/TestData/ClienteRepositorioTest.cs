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


        [TestMethod]
        public void Test_GetClientesPorAppellido()
        {
            var clientes = _repo.GetClientesByApellidoPaterno("a");
            Assert.IsNotNull(clientes);
            Assert.IsTrue(clientes.Any());
        }

        [TestMethod]
        public void Test_GetClientesPorAppellidoConPaginado()
        {
            var clientes = _repo.GetClientesByApellidoPaterno("a",0,10);
            Assert.AreEqual(0,clientes.PageIndex);
            Assert.AreEqual(10, clientes.Count());
            Assert.IsNotNull(clientes);
            Assert.IsTrue(clientes.Any());
            Assert.IsTrue(clientes.IsNextPage);
            
            var clientes2 = _repo.GetClientesByApellidoPaterno("a",1,10);
            Assert.AreEqual(4, clientes2.Count());

            var clientes3 = _repo.GetClientesByApellidoPaterno("a",2,10);
            Assert.IsFalse(clientes3.Any());
        }

        [TestMethod]
        public void TestDireccionesLocalizaciones()
        {
            var regiiones = _repo.GetRegiones();
            Assert.IsNotNull(regiiones);
            Assert.IsTrue(regiiones.Count() == 15);
        }

        [TestMethod]
        public void TestDireccionesLocalizacionesProvincias()
        {
            var regiiones = _repo.GetRegiones();
            
            var provincicas = _repo.GetProvinciasByRegionId(regiiones.FirstOrDefault().Id);
            Assert.IsNotNull(provincicas);
            Assert.IsTrue(provincicas.Any());
        }

        [TestMethod]
        public void TestDireccionesLocalizacionesComunas()
        {
            var regiiones = _repo.GetRegiones();

            var provincicas = _repo.GetProvinciasByRegionId(regiiones.FirstOrDefault().Id);

            var comunas = _repo.GetComunasByProvinciaId(provincicas.FirstOrDefault().Id);

            Assert.IsNotNull(comunas);
            Assert.IsTrue(comunas.Any());
        }

    }
}
