using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Data.Modelo.Enums
{
    public enum EstadoOrden
    {
        Ingresado = 1,
        Asignado = 2,
        EnRevisión = 3,
        EnReparación = 4,
        Reparado = 5,
        Entregado = 6,
        Pendiente = 7,
        SinGarantia = 8,
        Anulado = 9
    }
}
