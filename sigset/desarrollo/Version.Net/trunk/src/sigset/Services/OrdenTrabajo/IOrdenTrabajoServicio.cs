using System;
namespace Services.OrdenTrabajo
{
    public interface IOrdenTrabajoServicio
    {
        void AgregarDetalle(global::Data.Modelo.Detalle detalle, string p);
        void AsginarTecnicoOrden(global::Data.Modelo.Detalle detalle, int rutTecnico, string usuario);
        void AsigancionAutomatica(global::Data.Modelo.OrdenTrabajo ot);
        decimal CrearOrdenTrabajo(global::Data.Modelo.OrdenTrabajo orden, string usuario);
        System.Collections.Generic.IList<global::Data.Modelo.Estado> GetEstadosOrden();
        System.Collections.Generic.IList<global::Data.Modelo.OrdenTrabajo> GetOrdenesTrabajo(DateTime Fecha_Inicio, DateTime Fecha_Final, string ListaTipos, string ListaEstados);
        System.Collections.Generic.IList<global::Data.Modelo.OrdenTrabajo> GetOrdenesTrabajoByRut(decimal p);
        System.Collections.Generic.IList<global::Data.Modelo.OrdenTrabajo> GetOrdenesTrabajoByTecnico(decimal id);
        System.Collections.Generic.IList<global::Data.Modelo.OrdenTrabajo> GetOrdenesTrabajoSinAsignar();
        global::Data.Modelo.OrdenTrabajo GetOrdenTrabajo(decimal id);
        System.Collections.Generic.IList<global::Data.Modelo.TipoOrden> GetTiposOrden();

        void AsginarTecnicoOrden(int idOrden, int idTecnico, string usuario);

        void AceptarOrden(decimal id, Data.Modelo.Usuario usuario);
    }
}
