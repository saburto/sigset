using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace Helpers
{
    public static class CamposHelper
    {
        /// <summary>
        /// Devuelve dos textbox, uno para los numeros y otro para el digito verificador
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static string RutTextBox(this HtmlHelper helper)
        {
            return RutTextBox(helper,null,false);
        }

        public static string RutTextBox(this HtmlHelper helper, object dataRut, bool soloLectura)
        {
            return RutTextBox(helper, "Rut", "dv", dataRut, null, soloLectura);
        }

        public static string RutTextBox(this HtmlHelper helper,string nombreCampoRut, string nombreCampoDV, object dataRut, object dataDv, bool soloLectura )
        {
            Dictionary<string,object> htmlAtributtes = new Dictionary<string, object>();
            htmlAtributtes.Add("maxlength", "10");
            htmlAtributtes.Add("size", "10");
            htmlAtributtes.Add("style", "text-align: right");
            if (soloLectura)
            {
                htmlAtributtes.Add("readonly", "readonly");   
            }
            
            string textBoxRut = InputExtensions.TextBox(helper,nombreCampoRut, dataRut, htmlAtributtes);

            htmlAtributtes["maxlength"] = "1";
            htmlAtributtes["size"] = "1";
            htmlAtributtes["style"] = "width: 10px";

            string textBoxDV = InputExtensions.TextBox(helper, nombreCampoDV, dataDv, htmlAtributtes);
            return textBoxRut+ " - " + textBoxDV;
        }
    }
}
