using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace Web.Helpers
{
    public static class StringHelpers
    {
        public static string ToCapitalize(this string str)
        {
            return CultureInfo.CurrentCulture.TextInfo.ToTitleCase(str);
        }
      
    }
}

namespace Helpers
{
    using Web.Helpers;
    public static class StringHelpers
    {
        public static bool isNotNull(this string str)
        {
            return !string.IsNullOrEmpty(str);
        }

        public static string toOpcion(this string str)
        {
            if (!string.IsNullOrEmpty(str))
            {
                var opciones = str.Split('_');
                if (opciones.Length > 1)
                {
                    return string.Format("{0} {1}", opciones[0].ToCapitalize(), opciones[1].ToCapitalize());
                }
                return str.ToCapitalize();
            }
            return "";

        }

    }

    public static class BooleanHelper
    {
        public static string toEstado(this bool boolean)
        {
            if (boolean)
            {
                return "Activado";
            }
            else
            {
                return "Desactivado";
            }
        }
    }
}


