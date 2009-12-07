using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Data.Modelo.ValidationModel;
using Data.Modelo.Enums;

namespace Data.Modelo
{
    [MetadataType(typeof(OrdenTrabajoMetadata))]
    public partial class OrdenTrabajo
    {
        public Estado EstadoActual()
        {
            var ultimoDetalle = this.Detalles.OrderByDescending(x => x.FechaCreacion).FirstOrDefault();
            if (ultimoDetalle != null)
            {
                return ultimoDetalle.Estado1;
            }
            return null;
        }

        public bool AsignadoTecnico()
        {
            try
            {
                EstadoOrden estado = (EstadoOrden)Enum.Parse(typeof(EstadoOrden), IdEstadoActual().ToString());
                switch (estado)
                {
                    case EstadoOrden.Ingresado:
                        return false;
                    case EstadoOrden.Asignado:
                        return true;
                    case EstadoOrden.EnRevisión:
                        return true;
                    case EstadoOrden.EnReparación:
                        return true;
                    case EstadoOrden.Reparado:
                        return false;
                    case EstadoOrden.Entregado:
                        return false;
                    case EstadoOrden.Pendiente:
                        return true;
                    case EstadoOrden.SinGarantia:
                        return false;
                    case EstadoOrden.Anulado:
                        return false;
                    default:
                        return false;
                        break;
                }
            }
            catch
            {
                return false;
            }
        }

        public bool ReparadoTecnico()
        {
            try
            {
                EstadoOrden estado = (EstadoOrden)Enum.Parse(typeof(EstadoOrden), IdEstadoActual().ToString());
                switch (estado)
                {
                    case EstadoOrden.Ingresado:
                        return false;
                    case EstadoOrden.Asignado:
                        return false;
                    case EstadoOrden.EnRevisión:
                        return false;
                    case EstadoOrden.EnReparación:
                        return false;
                    case EstadoOrden.Reparado:
                        return true;
                    case EstadoOrden.Entregado:
                        return true;
                    case EstadoOrden.Pendiente:
                        return false;
                    case EstadoOrden.SinGarantia:
                        return false;
                    case EstadoOrden.Anulado:
                        return false;
                    default:
                        return false;
                        break;
                }
            }
            catch
            {
                return false;
            }
        }

        public decimal IdEstadoActual()
        {
            var ultimoDetalle = this.Detalles.OrderByDescending(x => x.FechaCreacion).FirstOrDefault();
            if (ultimoDetalle != null)
            {
                return ultimoDetalle.Estado1.IdEstado;
            }
            return -1;
        }
    }

    public class OrdenTrabajoMetadata
    {
        [StringLength(250)]
        public object Boleta { get; set; }

        [StringLength(250)]
        public object CondicionArticulo { get; set; }

        [Required]
        [StringLength(250)]
        public object Falla { get; set; }

        [RegularExpression(RegEx.FECHA, ErrorMessage = RegEx.FECHA_MESSAGE)]
        public object FechaCompra { get; set; }

        [RegularExpression(RegEx.FECHA ,ErrorMessage=RegEx.FECHA_MESSAGE)]
        [Required]
        public object FechaEntrega { get; set; }
        
        public object FechaIngreso { get; set; }

        [StringLength(100)]
        public object LugarCompra { get; set; }

        [StringLength(255)]
        public object Observacion { get; set; }

        [StringLength(50)]
        public object Poliza { get; set; }

        [Required]
        [StringLength(50)]
        public object Serie { get; set; }

        [Required]
        [Range(1,short.MaxValue)]
        public object TipoOrden { get; set; }

    }
}
