using System;
using System.Linq;
using Data.Modelo;
namespace Data.Repositorios.OrdenTrabajoRepositorio
{
   public  interface IOrdenTrabajoRepositorio
    {
       Orden_Trabajo GetOrdenTrabajoById(decimal id);
        System.Linq.IQueryable<Data.Modelo.Orden_Trabajo> GetTodasLasOrdenDeTrabajo();
        IQueryable<Data.Modelo.Orden_Trabajo> GetTodasLasOrdenDeTrabajoByTecnicoId(decimal id);

        Orden_Trabajo GuardarOrdenTrabajo(Data.Modelo.Orden_Trabajo orden);

        IQueryable<Tipo_Orden> GetTiposOrden();

        void SaveChanges();
    }
}
