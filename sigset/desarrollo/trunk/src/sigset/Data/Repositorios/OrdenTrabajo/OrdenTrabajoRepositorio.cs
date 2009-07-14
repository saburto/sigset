using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;

namespace Data.Repositorios.OrdenTrabajoRepositorio
{
    public class OrdenTrabajoRepositorio : Data.Repositorios.OrdenTrabajoRepositorio.IOrdenTrabajoRepositorio
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
        public Orden_Trabajo GetOrdenTrabajoById(decimal id)
        {
            var ordenes_trabajo = (from o in _data.Orden_Trabajos
                                   where o.Id == id
                                   select o).FirstOrDefault();
            return ordenes_trabajo;
        }



        public Orden_Trabajo GuardarOrdenTrabajo(Orden_Trabajo orden)
        {
            _data.Orden_Trabajos.InsertOnSubmit(orden);
            _data.SubmitChanges();
            return orden;
        }




        public IQueryable<Tipo_Orden> GetTiposOrden()
        {
            return _data.Tipo_Ordens;
        }

        public void SaveChanges()
        {
            _data.SubmitChanges();
        }

    }
}
