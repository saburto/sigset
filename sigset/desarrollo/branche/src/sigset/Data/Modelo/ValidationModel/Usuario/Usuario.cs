using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Modelo;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
    [MetadataType(typeof(UserMetadata))]
    public partial class Usuario
    {

    }

    public class UserMetadata
    {
        [Required(ErrorMessage="Usuario debe ser informado")]
        public object Usuario1 { get; set; }

        [Required(ErrorMessage="Contraseña requerida")]
        public object Contraseña { get; set; }
    }
}
