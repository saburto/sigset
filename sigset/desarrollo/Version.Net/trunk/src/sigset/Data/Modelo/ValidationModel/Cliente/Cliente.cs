using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Data.Modelo.ValidationModel;

namespace Data.Modelo
{
    [MetadataType(typeof(ClienteParticularMetaData))]
    public partial class ClienteParticular
    {

    }


    public class ClienteParticularMetaData
    {
        [Required(ErrorMessage="Rut es necesario")]
        public object Rut { get; set; }

        [Required(ErrorMessage="Nombre es necesario")]
        [StringLength(50, ErrorMessage="Nombre no puede tener mas de 50 caracteres")]
        [RegularExpression(RegEx.SOLO_TEXTO, ErrorMessage=RegEx.SOLO_TEXTO_MESSAGE)]
        public object Nombre { get; set; }

        [Required(ErrorMessage = "Apellido Paterno es necesario")]
        [StringLength(50, ErrorMessage = "Apellido no puede tener mas de 50 caracteres")]
        [RegularExpression(RegEx.SOLO_TEXTO, ErrorMessage = RegEx.SOLO_TEXTO_MESSAGE)]
        public object ApellidoPaterno { get; set; }

        [StringLength(50, ErrorMessage = "Apellido no puede tener mas de 50 caracteres")]
        [RegularExpression(RegEx.SOLO_TEXTO, ErrorMessage = RegEx.SOLO_TEXTO_MESSAGE)]
        public object ApellidoMaterno { get; set; }
    }

}
