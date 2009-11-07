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
            if (esClienteParticular())
            {
                if (this.ClienteParticular != null)
                {
                    return this.ClienteParticular.Rut;
                }
            }
            else if (esClienteComercial())
            {
                if (this.ClienteComercial != null)
                {
                    return this.ClienteComercial.Rut;
                }
            }
            throw new NullReferenceException("No existe cliente particular ni comercial asociado");
        }

        public bool esClienteParticular()
        {
            return (this.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteParticular);
        }

        public bool esClienteComercial()
        {
            return (this.TipoCliente == (int)Data.Modelo.Enums.TipoClientes.ClienteComercial);
        }

        public string NombreCompleto()
        {
            if (esClienteParticular())
            {
                return string.Format("{0} {1}", this.ClienteParticular.Nombre, this.ClienteParticular.ApellidoPaterno);
            }
            else if(esClienteComercial())
            {
                return this.ClienteComercial.RazonSocial;
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
