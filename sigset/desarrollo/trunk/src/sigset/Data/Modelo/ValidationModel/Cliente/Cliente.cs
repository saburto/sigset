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
        [Required(ErrorMessage="Rut es necesario"),
        Range(1000000,99999999)]
        public object Rut { get; set; }
    }
}
