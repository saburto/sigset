using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo.Enums;

namespace Data.Modelo
{
    public partial class Tecnico
    {
        public int OrdenesReparadas()
        {
            return CountOrdenes(EstadoOrden.Reparado);
        }

        private int CountOrdenes(EstadoOrden estado)
        {
            if (this.OrdenTrabajos == null || !this.OrdenTrabajos.Any())
            {
                return 0;
            }

            var ordenes = this.OrdenTrabajos.Where(x => x.IdEstadoActual() == (int)estado).Count();
            return ordenes;
        }


        public int OrdenesEnRevision()
        {
            return CountOrdenes(EstadoOrden.EnRevisión);
        }

        public int OrdenesEnReparacion()
        {
            return CountOrdenes(EstadoOrden.EnReparación);
        }

        public int OrdenesAsignadas()
        {
            return CountOrdenes(EstadoOrden.Asignado);
        }

        private IEnumerable<OrdenTrabajo> GetOrdenesPorEstado(EstadoOrden estado)
        {
            return this.OrdenTrabajos.Where(x => x.IdEstadoActual() == (int)estado);
        }

        public IEnumerable<OrdenTrabajo> GetOrdenesAsignadas()
        {
            return this.GetOrdenesPorEstado(EstadoOrden.Asignado);
        }

        public IEnumerable<OrdenTrabajo> GetOrdenesEnRevision()
        {
            return this.GetOrdenesPorEstado(EstadoOrden.EnRevisión);
        }

        public IEnumerable<OrdenTrabajo> GetOrdenesEnReparacion()
        {
            return this.GetOrdenesPorEstado(EstadoOrden.EnReparación);
        }

        public IEnumerable<OrdenTrabajo> GetOrdenesReparados()
        {
            return this.OrdenTrabajos.Where(x => x.ReparadoTecnico());
        }
        
    }
}
