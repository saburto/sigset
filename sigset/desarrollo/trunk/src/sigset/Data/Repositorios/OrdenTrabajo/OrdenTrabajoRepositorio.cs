using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.OrdenTrabajoRepositorio
{
    public class OrdenTrabajoRepositorio : Data.Repositorios.OrdenTrabajo.IOrdenTrabajoRepositorio
    {
        sigsetEntities _data;
        public OrdenTrabajoRepositorio()
        {
            _data = new sigsetEntities();
        }

        public IQueryable<Orden_Trabajo> GetTodasLasOrdenDeTrabajo()
        {
            var ordenes_trabajo = from ot in _data.Orden_Trabajos
                                  select ot;
            return ordenes_trabajo;        
        }
        public IQueryable<Orden_Trabajo> GetTodasLasOrdenDeTrabajoByTecnicoId(decimal id)
        {
            var ordenes_trabajo = from ot in _data.Orden_Trabajos
                                  where ot.Id_Tecnico_Asignado == id
                                  select ot;
            return ordenes_trabajo;
        }
        public Detalle GetOrdenTrabajoById(decimal id)
        {
            var ordenes_trabajo = (from det in _data.Detalles
                                   where det.Id_Orden == id
                                   orderby det.Fecha_Creacion
                                   select det).FirstOrDefault();
            return ordenes_trabajo;
        }

    }
}
