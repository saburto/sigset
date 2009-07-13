using System;
namespace Services.OrdenTrabajo
{
    public interface IOrdenTrabajoServicio
    {
        decimal CrearOrdenTrabajo(global::Data.Modelo.Orden_Trabajo orden);
        System.Collections.Generic.IList<global::Data.Modelo.Tipo_Orden> GetTiposOrden();

        Data.Modelo.Orden_Trabajo GetOrdenTrabajo(decimal id);
    }
}
