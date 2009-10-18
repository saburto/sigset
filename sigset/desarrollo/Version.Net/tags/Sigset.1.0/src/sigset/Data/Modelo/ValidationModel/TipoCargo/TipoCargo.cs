using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
   [MetadataType(typeof(TipoCargoMetaData))]
    public partial class TipoCargo
    {
    }
    public class TipoCargoMetaData 
    {
        [Required(ErrorMessage = "ID es necesario"),
         Range(1,99999999)]
        public object Id_Tipo_Cargo { get; set;}      

        [Required(ErrorMessage = "Descripción es necesaria")]
        public object Descripcion { get; set; }

        }

    }

