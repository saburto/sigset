using System;
namespace Data.Repositorios.OrdenTrabajoRepositorio
{
   public  interface IOrdenTrabajoRepositorio
    {
        Data.Modelo.Detalle GetOrdenTrabajoById(decimal id);
        System.Linq.IQueryable<Data.Modelo.Orden_Trabajo> GetTodasLasOrdenDeTrabajo();
        System.Linq.IQueryable<Data.Modelo.Orden_Trabajo> GetTodasLasOrdenDeTrabajoByTecnicoId(decimal id);
    }
}
