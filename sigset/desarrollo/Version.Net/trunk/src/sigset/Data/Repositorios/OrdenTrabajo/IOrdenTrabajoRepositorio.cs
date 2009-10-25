using System;
using System.Linq;
using Data.Modelo;
namespace Data.Repositorios.OrdenTrabajoRepositorio
{
   public  interface IOrdenTrabajoRepositorio
    {
       OrdenTrabajo GetOrdenTrabajoById(decimal id);
        System.Linq.IQueryable<Data.Modelo.OrdenTrabajo> GetTodasLasOrdenDeTrabajo();
        IQueryable<Data.Modelo.OrdenTrabajo> GetTodasLasOrdenDeTrabajoByTecnicoId(decimal id);

        OrdenTrabajo GuardarOrdenTrabajo(Data.Modelo.OrdenTrabajo orden);

        IQueryable<TipoOrden> GetTiposOrden();

        void SaveChanges();

        void GuardarDetalle(Detalle detalle);

        IQueryable<Estado> GetEstadosOrden();
    }
}
