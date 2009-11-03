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
        public decimal Rut()
        {
            if (this.TipoCliente == (int) Data.Modelo.Enums.TipoClientes.ClienteParticular)
            {
                if (this.ClienteParticular != null)
                {
                    return this.ClienteParticular.Rut;
                }
            }
            else if (this.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial)
            {
                if (this.ClienteComercial != null)
                {
                    return this.ClienteComercial.Rut;
                }
            }
            throw new NullReferenceException("No existe cliente particular ni comercial asociado");
        }
    }

    public class ClienteMetaData
    {
        [StringLength(255)]
        public object Observacion { get; set; }
    }
}
