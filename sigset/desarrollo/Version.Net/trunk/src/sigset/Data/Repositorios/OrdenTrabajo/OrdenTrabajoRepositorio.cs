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

        public IQueryable<OrdenTrabajo> GetTodasLasOrdenDeTrabajo()
        {
            var ordenes_trabajo = from ot in _data.OrdenTrabajos
                                  select ot;
            return ordenes_trabajo;        
        }
        public IQueryable<OrdenTrabajo> GetTodasLasOrdenDeTrabajoByTecnicoId(decimal id)
        {
            var ordenes_trabajo = from ot in _data.OrdenTrabajos
                                  where ot.IdTecnicoAsignado == id
                                  select ot;
                                  
            return ordenes_trabajo;
        }
        public OrdenTrabajo GetOrdenTrabajoById(decimal id)
        {
            var ordenes_trabajo = (from o in _data.OrdenTrabajos
                                   where o.Id == id
                                   select o).FirstOrDefault();
            return ordenes_trabajo;
        }



        public OrdenTrabajo GuardarOrdenTrabajo(OrdenTrabajo orden)
        {
            _data.OrdenTrabajos.InsertOnSubmit(orden);
            _data.SubmitChanges();
            return orden;
        }




        public IQueryable<TipoOrden> GetTiposOrden()
        {
            return _data.TipoOrdens;
        }

        public void SaveChanges()
        {
            _data.SubmitChanges();
        }


        public void GuardarDetalle(Detalle detalle)
        {
            _data.Detalles.InsertOnSubmit(detalle);
            SaveChanges();
        }


        public IQueryable<Estado> GetEstadosOrden()
        {
            return _data.Estados;
        }
    }
}
