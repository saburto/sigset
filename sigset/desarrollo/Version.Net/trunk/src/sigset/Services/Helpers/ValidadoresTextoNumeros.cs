﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;

namespace Services.Helpers
{
  public static class ValidadoresTextoNumeros
    {
      public static bool SoloTexto(this string str)
      {
          return !Regex.IsMatch(str, "[^a-zA-ZÑñáéíóúÁÉÍÓÚ\\s]");
      }

      public static bool EsEmail(this string str)
      {
          return Regex.IsMatch(str, @"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
      }
   
    }
}
