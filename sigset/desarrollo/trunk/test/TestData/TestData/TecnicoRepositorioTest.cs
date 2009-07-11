using Data.Repositorios.Tecnicos;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Data.Modelo;
using System.Linq;
using System;

namespace TestData
{
    
    
    /// <summary>
    ///Se trata de una clase de prueba para TecnicoRepositorioTest y se pretende que
    ///contenga todas las pruebas unitarias TecnicoRepositorioTest.
    ///</summary>
    [TestClass()]
    public class TecnicoRepositorioTest
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
        ///Una prueba de UpdateTecnico
        ///</summary>
        [TestMethod()]
        public void UpdateTecnicoTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tecnico tecnico = new Tecnico(); // TODO: Inicializar en un valor adecuado
            tecnico.Rut = 15709046;
            tecnico.Nivel = 2;
            target.UpdateTecnico(tecnico);
          
        } 

        /// <summary>
        ///Una prueba de DeleteTecnico
        ///</summary>
        [TestMethod()]
        public void DeleteTecnicoTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tecnico tecnico = new Tecnico(); // TODO: Inicializar en un valor adecuado
            tecnico.Rut = 15709046;
            tecnico.Nivel = 2;
            target.DeleteTecnico(tecnico);
           
        }




        /// <summary>
        ///Una prueba de CreateTecnico
        ///</summary>
        [TestMethod()]
        public void CreateTecnicoTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tecnico tecnico = new Tecnico(); // TODO: Inicializar en un valor adecuado
            tecnico.Rut = 15709046;
            tecnico.Nivel = 1;
            target.CreateTecnico(tecnico);
          }

        /// <summary>
        ///Una prueba de ContarEspecialidadesByTecnico
        ///</summary>
        [TestMethod()]
        public void ContarEspecialidadesByTecnicoTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = 15709046; // TODO: Inicializar en un valor adecuado
            int expected = 2; // TODO: Inicializar en un valor adecuado
            int actual;
            actual = target.ContarEspecialidadesByTecnico(id);
            Assert.AreEqual(expected, actual);
          
        }
    }
}
