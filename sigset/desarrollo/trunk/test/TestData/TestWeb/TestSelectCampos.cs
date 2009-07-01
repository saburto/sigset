using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Data.Modelo;
using Helpers;


namespace TestWeb
{
    [TestClass]
    public class TestSelectCampos
    {
        [TestMethod]
        public void TestSelectCamposCOnTipoCargo()
        {
            Services.Empleados.EmpleadoServicio _ser = new Services.Empleados.EmpleadoServicio();
            var listaCargos = _ser.GetTodosLosTipoCargo();
            
            var listaItem = CamposHelper.GetSelectCampos<Tipo_Cargo>(listaCargos, "Id_Tipo_Cargo", "Descripcion");
            Assert.IsNotNull(listaItem);

        }
    }
}
