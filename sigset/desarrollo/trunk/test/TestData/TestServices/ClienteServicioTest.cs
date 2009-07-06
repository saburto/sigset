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
        public void TestBuscarClientePorRut_Encontrado()
        {
            Cliente clienteEncontrado = _serv.GetClientePorRut(16007459, "0");
            Assert.IsNotNull(clienteEncontrado);
        }

        [TestMethod]
        public void TestBuscarClientePorRut_No_Encontrado()
        {
            Cliente clienteEncontrado = null;
            try
            {
                clienteEncontrado = _serv.GetClientePorRut(16007459, "K");
            }
            catch (Exception ex)
            {

                Assert.IsNotNull(ex);
            }
            
            Assert.IsNull(clienteEncontrado);
        }

    }
}
