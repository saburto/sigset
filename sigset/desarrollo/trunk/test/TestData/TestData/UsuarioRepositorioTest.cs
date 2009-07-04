using Data.Repositorios.Usuarios;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using Data.Modelo;
using System.Linq;

namespace TestData
{
    
    
    /// <summary>
    ///This is a test class for UsuarioRepositorioTest and is intended
    ///to contain all UsuarioRepositorioTest Unit Tests
    ///</summary>
    [TestClass()]
    public class UsuarioRepositorioTest
    {


        private TestContext testContextInstance;

        /// <summary>
        ///Gets or sets the test context which provides
        ///information about and functionality for the current test run.
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

        [TestMethod()]
        public void TestConexion()
        {
            UsuarioRepositorio usuario = new UsuarioRepositorio();

            Assert.IsNotNull(usuario);
        }

        [TestMethod()]
        public void Test_GetUsuarioById()
        {
            UsuarioRepositorio usuario = new UsuarioRepositorio();
            Usuario user = usuario.GetUsuario(1);

            Assert.IsNotNull(user);
        }

        [TestMethod()]
        public void Test_GetUsuarioByNombre()
        {
            UsuarioRepositorio usuario = new UsuarioRepositorio();
            Usuario user = usuario.GetUsuarioByNombreUsuario("test");

            Assert.IsNotNull(user);
            Assert.AreEqual("test", user.Usuario1);
        }

        /// <summary>
        ///A test for UpdateUsuario
        ///</summary>
        [TestMethod()]
        public void UpdateUsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            Usuario usuario = null; // TODO: Initialize to an appropriate value
            Usuario expected = null; // TODO: Initialize to an appropriate value
            Usuario actual;
            actual = target.UpdateUsuario(usuario);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUsuariosTipo_Usuario
        ///</summary>
        [TestMethod()]
        public void GetUsuariosTipo_UsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            string nombreTipoUsuario = string.Empty; // TODO: Initialize to an appropriate value
            IQueryable<Usuario> expected = null; // TODO: Initialize to an appropriate value
            IQueryable<Usuario> actual;
            actual = target.GetUsuariosTipo_Usuario(nombreTipoUsuario);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUsuarios
        ///</summary>
        [TestMethod()]
        public void GetUsuariosTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            IQueryable<Usuario> expected = null; // TODO: Initialize to an appropriate value
            IQueryable<Usuario> actual;
            actual = target.GetUsuarios();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUsuarioByNombreUsuario
        ///</summary>
        [TestMethod()]
        public void GetUsuarioByNombreUsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            string nombreUsuario = string.Empty; // TODO: Initialize to an appropriate value
            Usuario expected = null; // TODO: Initialize to an appropriate value
            Usuario actual;
            actual = target.GetUsuarioByNombreUsuario(nombreUsuario);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetUsuario
        ///</summary>
        [TestMethod()]
        public void GetUsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            Decimal id = new Decimal(); // TODO: Initialize to an appropriate value
            Usuario expected = null; // TODO: Initialize to an appropriate value
            Usuario actual;
            actual = target.GetUsuario(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetTipos_Usuario
        ///</summary>
        [TestMethod()]
        public void GetTipos_UsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            IQueryable<Tipo_Usuario> expected = null; // TODO: Initialize to an appropriate value
            IQueryable<Tipo_Usuario> actual;
            actual = target.GetTipos_Usuario();
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetTipo_UsuarioByNombre
        ///</summary>
        [TestMethod()]
        public void GetTipo_UsuarioByNombreTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            string nombre = string.Empty; // TODO: Initialize to an appropriate value
            Tipo_Usuario expected = null; // TODO: Initialize to an appropriate value
            Tipo_Usuario actual;
            actual = target.GetTipo_UsuarioByNombre(nombre);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for GetTipo_Usuario
        ///</summary>
        [TestMethod()]
        public void GetTipo_UsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            Decimal id = new Decimal(); // TODO: Initialize to an appropriate value
            Tipo_Usuario expected = null; // TODO: Initialize to an appropriate value
            Tipo_Usuario actual;
            actual = target.GetTipo_Usuario(id);
            Assert.AreEqual(expected, actual);
            Assert.Inconclusive("Verify the correctness of this test method.");
        }

        /// <summary>
        ///A test for DeleteTipo_Usuario
        ///</summary>
        [TestMethod()]
        public void DeleteTipo_UsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            Decimal id = new Decimal(); // TODO: Initialize to an appropriate value
            target.DeleteTipo_Usuario(id);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        /// <summary>
        ///A test for CreateTipo_Usuario
        ///</summary>
        [TestMethod()]
        public void CreateTipo_UsuarioTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            string nombreTipoUsuario = string.Empty; // TODO: Initialize to an appropriate value
            target.CreateTipo_Usuario(nombreTipoUsuario);
            Assert.Inconclusive("A method that does not return a value cannot be verified.");
        }

        [TestMethod()]
        public void Create_UsuarioTest()
        {
            Usuario usuario = new Usuario();
            usuario.Empleado = 15709046;
            usuario.Usuario1 = "Ruminita";
            usuario.Contraseña = "1234";
            usuario.Tipo_Usuario = 1;
            UsuarioRepositorio target = new UsuarioRepositorio(); // TODO: Initialize to an appropriate value
            target.CreateUsuario(usuario);          
         }

        /// <summary>
        ///A test for UsuarioRepositorio Constructor
        ///</summary>
        [TestMethod()]
        public void UsuarioRepositorioConstructorTest()
        {
            UsuarioRepositorio target = new UsuarioRepositorio();
            Assert.Inconclusive("TODO: Implement code to verify target");
        }
    }
}
