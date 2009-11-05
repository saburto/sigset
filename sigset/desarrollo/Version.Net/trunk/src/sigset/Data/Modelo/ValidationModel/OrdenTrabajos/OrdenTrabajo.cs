using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Data.Modelo.ValidationModel;

namespace Data.Modelo
{
    [MetadataType(typeof(OrdenTrabajoMetadata))]
    public partial class OrdenTrabajo
    {
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
