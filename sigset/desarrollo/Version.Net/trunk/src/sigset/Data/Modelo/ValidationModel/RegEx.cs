using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Data.Modelo.ValidationModel
{
    public class RegEx
    {
        public const string SOLO_TEXTO = "^[^0-9]+$";
        public const string SOLO_TEXTO_MESSAGE = "Solo caracteres alfabeticos";
        public const string FECHA = @"^(((((0[1-9])|(1\d)|(2[0-8]))-((0[1-9])|(1[0-2])))|((31-((0[13578])|(1[02])))|((29|30)-((0[1,3-9])|(1[0-2])))))-((20[0-9][0-9]))|(29-02-20(([02468][048])|([13579][26]))))$";
        public const string FECHA_MESSAGE ="Ingrese fecha valida Ej. 31-12-2009";
    }
}
