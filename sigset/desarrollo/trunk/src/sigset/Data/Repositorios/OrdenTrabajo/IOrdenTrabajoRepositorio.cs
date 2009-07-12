using System;
using System.Linq;
using Data.Modelo;
namespace Data.Repositorios.OrdenTrabajoRepositorio
{
   public  interface IOrdenTrabajoRepositorio
    {
        Data.Modelo.Detalle GetOrdenTrabajoById(decimal id);
        System.Linq.IQueryable<Data.Modelo.Orden_Trabajo> GetTodasLasOrdenDeTrabajo();
        IQueryable<Data.Modelo.Orden_Trabajo> GetTodasLasOrdenDeTrabajoByTecnicoId(decimal id);

        void GuardarOrdenTrabajo(Data.Modelo.Orden_Trabajo orden);

        IQueryable<Tipo_Orden> GetTiposOrden();
    }
}
