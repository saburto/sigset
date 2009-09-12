using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
    [MetadataType(typeof(ClienteMetaData))]
    public partial class Cliente
    {

    }


    public class ClienteMetaData
    {
        [Required(ErrorMessage="Rut es necesario")]
        public object Rut { get; set; }

        [Required(ErrorMessage="Nombre es necesario")]
        [StringLength(50, ErrorMessage="Nombre no puede tener mas de 50 caracteres")]
        public object Nombre { get; set; }

        [Required(ErrorMessage = "Apellido Paterno es necesario")]
        [StringLength(50, ErrorMessage = "Apellido no puede tener mas de 50 caracteres")]
        public object Apellido_Paterno { get; set; }

        [StringLength(50, ErrorMessage = "Apellido no puede tener mas de 50 caracteres")]
        public object Apellido_Materno { get; set; }
    }

}
