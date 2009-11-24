using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
    [MetadataType(typeof(ArticuloMetaData))]
    public partial class Articulo
    {
    }

    public class ArticuloMetaData
    {
        [Required]
        public object Categoria { get; set; }
        ////[Required]
        //public object Linea { get; set; }
        ////[Required]
        //public object Marca { get; set; }
        [Required]
        public object Modelo { get; set; }
        [Required]
        [Range(1,int.MaxValue, ErrorMessage="Debe seleccionar precio garantía")]
        public object PrecioGarantia { get; set; }
        [Required]
        public object TipoArticulo { get; set; }

        [StringLength(255)]
        public object Observacion { get; set; }
    }
}
