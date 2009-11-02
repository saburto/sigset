using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using Data.Modelo.ValidationModel;

namespace Data.Modelo
{
    [MetadataType(typeof(ClienteComercialMetadata))]
    public partial class ClienteComercial
    {
    }

    public class ClienteComercialMetadata
    {
        [Required(ErrorMessage="Rut es necesario")]
        public object Rut { get; set; }

        [Required(ErrorMessage = "Razon Social es necesario")]
        public object RazonSocial { get; set; }

        [RegularExpression(RegEx.SOLO_TEXTO, ErrorMessage = RegEx.SOLO_TEXTO_MESSAGE)]
        public object Sucursal { get; set; }
    }
}
