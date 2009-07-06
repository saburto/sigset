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


        UsuarioRepositorio _usuario;
        [TestInitialize]
        public void TestConexion()
        {
            _usuario = new UsuarioRepositorio();
           

        }

        [TestMethod]
        public void TestModificar()
        {
            Usuario user = _usuario.GetUsuario(2);


            user.Usuario1 = "test1";

            Usuario mod = _usuario.UpdateUsuario(user);


            Assert.IsNotNull(mod);
            Assert.AreEqual("test1", mod.Usuario1);
            
        }

    }
}
