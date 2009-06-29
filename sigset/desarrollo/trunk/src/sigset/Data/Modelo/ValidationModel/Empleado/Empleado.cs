using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace Data.Modelo
{
    [MetadataType(typeof(EmpleadoMetaData))]
    public partial class Empleado
    {
    }
    public class EmpleadoMetaData 
    {
        [Required(ErrorMessage = "Rut empleado es necesario"),
         Range(1000000,99999999)]
        public object Rut { get; set;}

        [Required(ErrorMessage = "Nombre es necesario")]
        public object Nombre { get; set;}

        [Required(ErrorMessage = "Apellido Paterno es necesario")]
        public object Apellido_Paterno { get; set;}

        [Required(ErrorMessage = "Apellido Materno es necesario")]
        public object Apellido_Materno { get; set; }
    }

    }



