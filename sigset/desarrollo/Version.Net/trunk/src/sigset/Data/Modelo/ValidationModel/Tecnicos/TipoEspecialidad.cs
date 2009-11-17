using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
    [MetadataType(typeof(TipoEspecialidadMetaData))]
    public partial class TipoEspecialidad
    {
    }

    public class TipoEspecialidadMetaData
    {
        [Required]
        public object Descripcion { get; set; }
    }
}
