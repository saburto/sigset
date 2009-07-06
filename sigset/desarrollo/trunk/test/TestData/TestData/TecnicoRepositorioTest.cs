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
        ///Una prueba de GetTodosLosTiposEspecialidad
        ///</summary>
        [TestMethod()]
        public void GetTodosLosTiposEspecialidadTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Tipo_Especialidad> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Tipo_Especialidad> actual;
            actual = target.GetTodosLosTiposEspecialidad();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosTecnicos
        ///</summary>
        [TestMethod()]
        public void GetTodosLosTecnicosTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Tecnico> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Tecnico> actual;
            actual = target.GetTodosLosTecnicos();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosNiveles
        ///</summary>
        [TestMethod()]
        public void GetTodosLosNivelesTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Nivel> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Nivel> actual;
            actual = target.GetTodosLosNiveles();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodasLasEspecialidades
        ///</summary>
        [TestMethod()]
        public void GetTodasLasEspecialidadesTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> actual;
            actual = target.GetTodasLasEspecialidades();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTipoEspecialidadById
        ///</summary>
        [TestMethod()]
        public void GetTipoEspecialidadByIdTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            Tipo_Especialidad expected = null; // TODO: Inicializar en un valor adecuado
            Tipo_Especialidad actual;
            actual = target.GetTipoEspecialidadById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTecnicoByRut
        ///</summary>
        [TestMethod()]
        public void GetTecnicoByRutTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal rut = new Decimal(); // TODO: Inicializar en un valor adecuado
            Tecnico expected = null; // TODO: Inicializar en un valor adecuado
            Tecnico actual;
            actual = target.GetTecnicoByRut(rut);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetNivelById
        ///</summary>
        [TestMethod()]
        public void GetNivelByIdTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            Nivel expected = null; // TODO: Inicializar en un valor adecuado
            Nivel actual;
            actual = target.GetNivelById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetEspecialidadByTecnicoId
        ///</summary>
        [TestMethod()]
        public void GetEspecialidadByTecnicoIdTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> actual;
            actual = target.GetEspecialidadByTecnicoId(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetEmpleadosTecnicos
        ///</summary>
        [TestMethod()]
        public void GetEmpleadosTecnicosTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Empleado> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Empleado> actual;
            actual = target.GetEmpleadosTecnicos();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de Constructor TecnicoRepositorio
        ///</summary>
        [TestMethod()]
        public void TecnicoRepositorioConstructorTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio();
            Assert.Inconclusive("TODO: Implementar código para comprobar el destino");
        }

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
        ///Una prueba de GetTodosLosTiposEspecialidad
        ///</summary>
        [TestMethod()]
        public void GetTodosLosTiposEspecialidadTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Tipo_Especialidad> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Tipo_Especialidad> actual;
            actual = target.GetTodosLosTiposEspecialidad();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosTecnicos
        ///</summary>
        [TestMethod()]
        public void GetTodosLosTecnicosTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Tecnico> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Tecnico> actual;
            actual = target.GetTodosLosTecnicos();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosNiveles
        ///</summary>
        [TestMethod()]
        public void GetTodosLosNivelesTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Nivel> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Nivel> actual;
            actual = target.GetTodosLosNiveles();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodasLasEspecialidades
        ///</summary>
        [TestMethod()]
        public void GetTodasLasEspecialidadesTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> actual;
            actual = target.GetTodasLasEspecialidades();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTipoEspecialidadById
        ///</summary>
        [TestMethod()]
        public void GetTipoEspecialidadByIdTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            Tipo_Especialidad expected = null; // TODO: Inicializar en un valor adecuado
            Tipo_Especialidad actual;
            actual = target.GetTipoEspecialidadById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTecnicoByRut
        ///</summary>
        [TestMethod()]
        public void GetTecnicoByRutTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal rut = new Decimal(); // TODO: Inicializar en un valor adecuado
            Tecnico expected = null; // TODO: Inicializar en un valor adecuado
            Tecnico actual;
            actual = target.GetTecnicoByRut(rut);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetNivelById
        ///</summary>
        [TestMethod()]
        public void GetNivelByIdTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            Nivel expected = null; // TODO: Inicializar en un valor adecuado
            Nivel actual;
            actual = target.GetNivelById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetEspecialidadByTecnicoId
        ///</summary>
        [TestMethod()]
        public void GetEspecialidadByTecnicoIdTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> actual;
            actual = target.GetEspecialidadByTecnicoId(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetEmpleadosTecnicos
        ///</summary>
        [TestMethod()]
        public void GetEmpleadosTecnicosTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Empleado> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Empleado> actual;
            actual = target.GetEmpleadosTecnicos();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
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
        public void CreateTecnicoTest()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tecnico tecnico = null; // TODO: Inicializar en un valor adecuado
            target.CreateTecnico(tecnico);
            Assert.Inconclusive("Un método que no devuelve ningún valor no se puede comprobar.");
        }

        /// <summary>
        ///Una prueba de Constructor TecnicoRepositorio
        ///</summary>
        [TestMethod()]
        public void TecnicoRepositorioConstructorTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio();
            Assert.Inconclusive("TODO: Implementar código para comprobar el destino");
        }

        /// <summary>
        ///Una prueba de UpdateTecnico
        ///</summary>
        [TestMethod()]
        public void UpdateTecnicoTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tecnico tecnico = null; // TODO: Inicializar en un valor adecuado
            target.UpdateTecnico(tecnico);
            Assert.Inconclusive("Un método que no devuelve ningún valor no se puede comprobar.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosTiposEspecialidad
        ///</summary>
        [TestMethod()]
        public void GetTodosLosTiposEspecialidadTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Tipo_Especialidad> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Tipo_Especialidad> actual;
            actual = target.GetTodosLosTiposEspecialidad();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosTecnicos
        ///</summary>
        [TestMethod()]
        public void GetTodosLosTecnicosTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Tecnico> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Tecnico> actual;
            actual = target.GetTodosLosTecnicos();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodosLosNiveles
        ///</summary>
        [TestMethod()]
        public void GetTodosLosNivelesTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Nivel> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Nivel> actual;
            actual = target.GetTodosLosNiveles();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTodasLasEspecialidades
        ///</summary>
        [TestMethod()]
        public void GetTodasLasEspecialidadesTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> actual;
            actual = target.GetTodasLasEspecialidades();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTipoEspecialidadById
        ///</summary>
        [TestMethod()]
        public void GetTipoEspecialidadByIdTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            Tipo_Especialidad expected = null; // TODO: Inicializar en un valor adecuado
            Tipo_Especialidad actual;
            actual = target.GetTipoEspecialidadById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetTecnicoByRut
        ///</summary>
        [TestMethod()]
        public void GetTecnicoByRutTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal rut = new Decimal(); // TODO: Inicializar en un valor adecuado
            Tecnico expected = null; // TODO: Inicializar en un valor adecuado
            Tecnico actual;
            actual = target.GetTecnicoByRut(rut);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetNivelById
        ///</summary>
        [TestMethod()]
        public void GetNivelByIdTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            Nivel expected = null; // TODO: Inicializar en un valor adecuado
            Nivel actual;
            actual = target.GetNivelById(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetEspecialidadByTecnicoId
        ///</summary>
        [TestMethod()]
        public void GetEspecialidadByTecnicoIdTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Decimal id = new Decimal(); // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Especialidade> actual;
            actual = target.GetEspecialidadByTecnicoId(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de GetEmpleadosTecnicos
        ///</summary>
        [TestMethod()]
        public void GetEmpleadosTecnicosTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            IQueryable<Empleado> expected = null; // TODO: Inicializar en un valor adecuado
            IQueryable<Empleado> actual;
            actual = target.GetEmpleadosTecnicos();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Compruebe la exactitud de este método de prueba.");
        }

        /// <summary>
        ///Una prueba de DeleteTecnico
        ///</summary>
        [TestMethod()]
        public void DeleteTecnicoTest1()
        {
            TecnicoRepositorio target = new TecnicoRepositorio(); // TODO: Inicializar en un valor adecuado
            Tecnico tecnico = null; // TODO: Inicializar en un valor adecuado
            target.DeleteTecnico(tecnico);
            Assert.Inconclusive("Un método que no devuelve ningún valor no se puede comprobar.");
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
        ///Una prueba de Constructor TecnicoRepositorio
        ///</summary>
        [TestMethod()]
        public void TecnicoRepositorioConstructorTest2()
        {
            TecnicoRepositorio target = new TecnicoRepositorio();
            Assert.Inconclusive("TODO: Implementar código para comprobar el destino");
        }
    }
}
