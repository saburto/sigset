using System;
namespace Services.TipoCargo
{
    public interface ITipoCargoServicio
    {
        void BorrarTipoCargo(int id);
        void CrearTipoCargo(global::Data.Modelo.Perfil tipoNuevo);
        global::Data.Modelo.Perfil EditarTipoCargo(int id, global::Data.Modelo.Perfil tipo);
        global::Data.Modelo.Perfil GetTipoCargoById(int id);
        System.Collections.Generic.IList<global::Data.Modelo.Perfil> GetTodosLosTiposCargo();
    }
}
