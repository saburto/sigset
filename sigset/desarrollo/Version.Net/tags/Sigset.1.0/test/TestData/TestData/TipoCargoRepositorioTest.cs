using Data.Repositorios.TipoCargo;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Data.Modelo;

namespace TestData
{
    
    
    /// <summary>
    ///Se trata de una clase de prueba para TipoCargoRepositorioTest y se pretende que
    ///contenga todas las pruebas unitarias TipoCargoRepositorioTest.
    ///</summary>
    [TestClass()]
    public class TipoCargoRepositorioTest
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
        ///Una prueba de ContarEmpleadoSegunTipoCargo
        ///</summary>
        [TestMethod()]
        public void ContarEmpleadoSegunTipoCargoTest()
        {
            TipoCargoRepositorio target = new TipoCargoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tipo_Cargo tipo = target.GetTipoCargoById(3); // TODO: Inicializar en un valor adecuado
            int expected = 2; // TODO: Inicializar en un valor adecuado
            int actual;
            actual = target.ContarEmpleadoSegunTipoCargo(tipo);
            Assert.AreEqual(expected, actual);
            
        }
    }
}
