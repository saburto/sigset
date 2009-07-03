using System;
namespace Services.TipoCargo
{
    public interface ITipoCargoServicio
    {
        void BorrarTipoCargo(int id);
        void CrearTipoCargo(global::Data.Modelo.Tipo_Cargo tipoNuevo);
        global::Data.Modelo.Tipo_Cargo EditarTipoCargo(int id, global::Data.Modelo.Tipo_Cargo tipo);
        global::Data.Modelo.Tipo_Cargo GetTipoCargoById(int id);
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Cargo> GetTodosLosTiposCargo();
    }
}
