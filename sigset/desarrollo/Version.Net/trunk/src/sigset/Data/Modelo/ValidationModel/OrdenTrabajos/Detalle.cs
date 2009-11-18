using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{

    [MetadataType(typeof(DetalleMetaData))]
    public partial class Detalle
    {
        
    }

    public class DetalleMetaData
    {
        [StringLength(250)]
        public object Contenido { get; set; }

        [Range(1,short.MaxValue)]
        public object Estado { get; set; }
    }
}
