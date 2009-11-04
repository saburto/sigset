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
    public static class StringHelpers
    {
        public static bool isNotNull(this string str)
        {
            return !string.IsNullOrEmpty(str);
        }
      
    }
}


