using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.UI.WebControls;
using Data.Modelo;


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


        /// <summary>
        /// Devuele lista de items para select
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="listaDeCampos"></param>
        /// <param name="valueMember">Campo que sera el que contengael valor</param>
        /// <param name="displayMember">Campo que se mostrara</param>
        /// <returns></returns>
        public static List<SelectListItem> GetSelectCampos<T>(this IList<T> listaDeCampos, string valueMember, string displayMember)
        {
            List<SelectListItem> lista = new List<SelectListItem>();
            lista.Add(new SelectListItem() { Text = "Seleccione...", Value = "-1" });
            foreach (T campo in listaDeCampos)
            {
                var valor = campo.GetType().GetProperty(valueMember).GetValue(campo, null);
                var display = campo.GetType().GetProperty(displayMember).GetValue(campo, null);
                lista.Add(new SelectListItem() { Text = display.ToString(), Value = valor.ToString() });
            }
            return lista;
        }
       

    }
}
