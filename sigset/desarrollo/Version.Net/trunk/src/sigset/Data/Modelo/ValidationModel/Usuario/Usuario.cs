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
        public string NombreCompleto
        {
            get
            {
                return string.Format("{0} {1}",this.Nombres, this.ApellidoPaterno?? "" );
            }
        }

        public bool esSistema()
        {
            return this.Id == Constantes.Constantes.ID_USUARIO_SISTEMA;
        }
    }

    public class UserMetadata
    {
        [Required(ErrorMessage="Usuario requerido")]
        [StringLength(255)]
        public object User { get; set; }

        [Required(ErrorMessage = "Nombre requerido")]
        [StringLength(255)]
        [RegularExpression("^[^0-9]+$", ErrorMessage="Solo caracteres alfabeticos")]
        public object Nombres { get; set; }

        [Required(ErrorMessage="Contraseña requerida")]
        [StringLength(255)]
        public object Password { get; set; }

        [Required(ErrorMessage = "Apellido Paterno Requerido")]
        [StringLength(50)]
        [RegularExpression("^[^0-9]+$", ErrorMessage = "Solo caracteres alfabeticos")]
        public object ApellidoPaterno { get; set; }

        [Required(ErrorMessage = "Apellido Materno Requerido")]
        [StringLength(50)]
        [RegularExpression("^[^0-9]+$", ErrorMessage = "Solo caracteres alfabeticos")]
        public object ApellidoMaterno { get; set; }

        [DataType(DataType.EmailAddress)]
        public object Email { get; set; }

        [Required(ErrorMessage = "Perfil de usuario Requerido")]
        [Range(1, 10, ErrorMessage = "Perfil de usuario Requerido")]
        public object PerfilUsuario { get; set; }


        public object Rut { get; set; }
    }
}
