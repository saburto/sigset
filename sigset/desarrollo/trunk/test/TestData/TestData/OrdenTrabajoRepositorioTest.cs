using Data.Repositorios.OrdenTrabajoRepositorio;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Data.Modelo;
using System.Linq;

namespace TestData
{
    
    
    /// <summary>
    ///Se trata de una clase de prueba para OrdenTrabajoRepositorioTest y se pretende que
    ///contenga todas las pruebas unitarias OrdenTrabajoRepositorioTest.
    ///</summary>
    [TestClass()]
    public class OrdenTrabajoRepositorioTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Obtiene o establece el contexto de la prueba que proporciona
        ///la información y funcionalidad para la ejecución de pruebas actual.
        ///</summary>
        public TestContext TestContext
        {
            get
            {
                return testContextInstance;
            }
            set
            {
                testContextInstance = value;
            }
        }

        #region Atributos de prueba adicionales
        // 
        //Puede utilizar los siguientes atributos adicionales mientras escribe sus pruebas:
        //
        //Use ClassInitialize para ejecutar código antes de ejecutar la primera prueba en la clase 
        //[ClassInitialize()]
        //public static void MyClassInitialize(TestContext testContext)
        //{
        //}
        //
        //Use ClassCleanup para ejecutar código después de haber ejecutado todas las pruebas en una clase
        //[ClassCleanup()]
        //public static void MyClassCleanup()
        //{
        //}
        //
        //Use TestInitialize para ejecutar código antes de ejecutar cada prueba
        //[TestInitialize()]
        //public void MyTestInitialize()
        //{
        //}
        //
        //Use TestCleanup para ejecutar código después de que se hayan ejecutado todas las pruebas
        //[TestCleanup()]
        //public void MyTestCleanup()
        //{
        //}
        //
        #endregion


        /// <summary>
        ///Una prueba de Constructor OrdenTrabajoRepositorio
        ///</summary>
        [TestMethod()]
        public void OrdenTrabajoRepositorioConstructorTest()
        {
            OrdenTrabajoRepositorio target = new OrdenTrabajoRepositorio();
            Assert.Inconclusive("TODO: Implementar código para comprobar el destino");
        }

        /// <summary>
        ///Una prueba de GetOrdenTrabajoById
        ///</summary>
        [TestMethod()]
        public void GetOrdenTrabajoByIdTest()
        {
            OrdenTrabajoRepositorio target = new OrdenTrabajoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = 4; // TODO: Inicializar en un valor adecuado
            Detalle expected 
            Detalle actual;
            actual = target.GetOrdenTrabajoById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodasLasOrdenDeTrabajo
        ///</summary>
        [TestMethod()]
        public void GetTodasLasOrdenDeTrabajoTest()
        {
            OrdenTrabajoRepositorio target = new OrdenTrabajoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Orden_Trabajo> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Orden_Trabajo> actual;
            actual = target.GetTodasLasOrdenDeTrabajo();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodasLasOrdenDeTrabajoByTecnicoId
        ///</summary>
        [TestMethod()]
        public void GetTodasLasOrdenDeTrabajoByTecnicoIdTest()
        {
            OrdenTrabajoRepositorio target = new OrdenTrabajoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            IQueryable<Orden_Trabajo> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Orden_Trabajo> actual;
            actual = target.GetTodasLasOrdenDeTrabajoByTecnicoId(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }
    }
}
