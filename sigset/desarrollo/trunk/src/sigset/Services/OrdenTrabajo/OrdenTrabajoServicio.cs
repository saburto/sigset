using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using Data.Repositorios.OrdenTrabajoRepositorio;


namespace Services.OrdenTrabajo
{
    public class OrdenTrabajoServicio : Services.OrdenTrabajo.IOrdenTrabajoServicio
    {
        private IOrdenTrabajoRepositorio _repo;
        public OrdenTrabajoServicio(IOrdenTrabajoRepositorio repo)
        {
            _repo = repo;
        }
        public OrdenTrabajoServicio()
               : this(new OrdenTrabajoRepositorio())
        {
        }

        public void CrearOrdenTrabajo(Orden_Trabajo orden)
        {
            orden.Fecha_Ingreso = DateTime.Now;
            

            _repo.GuardarOrdenTrabajo(orden);
        }

        public IList<Tipo_Orden> GetTiposOrden()
        {
            return _repo.GetTiposOrden().ToList();
        }

    }
}
