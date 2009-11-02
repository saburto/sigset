using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
    [MetadataType(typeof(DireccionMetadata))]
    public partial class Direccion
    {
    }

    public class DireccionMetadata{
        [Required]
        public object Calle { get; set; }
        [Required]
        public object Comuna { get; set; }
        [Required]
        public object Numero { get; set; }
        [Required]
        public object Provincia { get; set; }
        [Required]
        public object Region { get; set; }

    }
}
