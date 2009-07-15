using System;
using System.Collections.Generic;
namespace Services.OrdenTrabajo
{
    public interface IOrdenTrabajoServicio
    {
        decimal CrearOrdenTrabajo(global::Data.Modelo.Orden_Trabajo orden, string usuario);
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Orden> GetTiposOrden();

        Data.Modelo.Orden_Trabajo GetOrdenTrabajo(decimal id);

        IList<Data.Modelo.Orden_Trabajo> GetOrdenesTrabajoByRut(decimal p);

        IList<Data.Modelo.Estado> GetEstadosOrden();

        IList<Data.Modelo.Orden_Trabajo> GetOrdenesTrabajo(DateTime Fecha_Inicio, DateTime Fecha_Final, string ListaTipos, string ListaEstados);

        IList<Data.Modelo.Orden_Trabajo> GetOrdenesTrabajoSinAsignar();

        void AsginarTecnicoOrden(Data.Modelo.Detalle detalle, decimal rutTecnico, string usuario);
    }
}
