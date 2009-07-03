using System;
namespace Data.Repositorios.TipoCargo
{
   public interface ITipoCargoRepositorio
    {
        void BorrarTipoCargo(int id);
        global::Data.Modelo.Tipo_Cargo EditarTipoCargo(int id, global::Data.Modelo.Tipo_Cargo tipo);
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Cargo> GetTipoCargo();
        global::Data.Modelo.Tipo_Cargo GetTipoCargoById(int id);
        void GuardarNuevoTipoCargo(global::Data.Modelo.Tipo_Cargo tipo);

            }
}
