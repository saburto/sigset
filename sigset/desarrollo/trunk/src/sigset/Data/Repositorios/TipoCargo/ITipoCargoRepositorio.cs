using System;
namespace Data.Repositorios.TipoCargo
{
    public interface ITipoCargoRepositorio
    {
        System.Linq.IQueryable<global::Data.Modelo.Tipo_Cargo> GetTipoCargo();
        global::Data.Modelo.Tipo_Cargo GetTipoCargoById(int id);
    }
}
