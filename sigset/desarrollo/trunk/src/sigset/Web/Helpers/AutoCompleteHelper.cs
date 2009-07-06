using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.UI.WebControls;
using Data.Modelo;
using System.Text;
using System.Reflection;


namespace Helpers
{
    public static class AutoCompleteHelper
    {
        private const string DISPLAY_TEXT = "_DISPLAY_TEXT";

        public static string AutoCompleteTextBox(this HtmlHelper html, string name, string selectedText, object selectedValue, object htmlAttributes)
        {   
            return string.Format("{0} {1}", html.TextBox(name + DISPLAY_TEXT, selectedText, htmlAttributes),html.Hidden(name, selectedValue));
        }

        public static string AutoCompleteTextBox(this HtmlHelper html, string name, object htmlAttributes)
        {
            return AutoCompleteTextBox(html, name, string.Empty, null, htmlAttributes);
        }

        public static string AutoCompleteTextBox(this HtmlHelper html, string name)
        {
            return AutoCompleteTextBox(html, name, string.Empty, null, null);
        }

        /// <summary>
        /// Inicializador que debe tener los textos con autocomplete
        /// </summary>
        /// <param name="html"></param>
        /// <param name="name"></param>
        /// <param name="url"></param>
        /// <param name="mustMatch">Si el texto en el input debe ser uno de la seleccion</param>
        /// <param name="options">Opciones propias que puede obtener el plugin de autocomplete</param>
        /// <param name="nameExtraParameter"></param>
        /// <returns></returns>
        public static string InitializeAutoComplete(this HtmlHelper html, string name, string actionName, string controllerName, bool mustMatch ,string nameExtraParameter, int limit, int min, object options)
        {
            UrlHelper helper = new UrlHelper(html.ViewContext.RequestContext, html.RouteCollection);
            string url = helper.Action(actionName, controllerName);

            StringBuilder sb = new StringBuilder();
            string textBoxName = name + DISPLAY_TEXT;
            sb.AppendLine();
            sb.AppendLine(string.Format(" $('#{0}').autocomplete('{1}', {{", textBoxName, url));

            if (mustMatch)
            {
                sb.AppendLine("mustMatch: true,");
            }

            string dataJson =
            @"
            autoFill: false,
            max: "+ limit +@",
            selectFirst:true,
            cacheLength:0,
            delay:100,
            minChars:"+ min +@",
            dataType:'json',
            parse: function(data)
            {
                var array = new Array();
                for(var i=0;i<data.length;i++) 
                {
                    array[i] = { data:data[i], value: data[i].value, result: data[i].display};
                }
                return array;
            },
            formatItem: function(data,i,max,value,term) {
			return data.display;}";


            sb.AppendLine(dataJson);

            if (options != null)
            {
                PropertyInfo[] properties = options.GetType().GetProperties();
                for (int i = 0; i < properties.Length; i++)
                {
                    sb.AppendLine(string.Format(",   {0} : {1} ",
                                            properties[i].Name,
                                            properties[i].GetValue(options, null)));
                }
            }

            if (!string.IsNullOrEmpty(nameExtraParameter))
            {
                sb.AppendLine(@", extraParams : { " + nameExtraParameter + ":function(){return $('#" + nameExtraParameter + "').val();}}");
            }

            sb.AppendLine("   });");
            sb.AppendLine();
            sb.AppendLine(string.Format("   $('#{0}').result(function(e, d, f) {{", textBoxName));
            sb.AppendLine(string.Format("       $('#{0}').val(d.value);", name));
            sb.AppendLine("    });");
            sb.AppendLine();
            return sb.ToString();
        }

        public static string InitializeAutoComplete(this HtmlHelper html, string Name,string actionName, string controllerName, bool mustMatch)
        {
            return InitializeAutoComplete(html, Name, actionName, controllerName, mustMatch, string.Empty, 15, 0,null);
        }

        public static string InitializeAutoComplete(this HtmlHelper html, string name, string actionName, string controllerName, bool mustMatch, string nameExtraParameter, int limit, int min)
        {
            return InitializeAutoComplete(html,name, actionName, controllerName, mustMatch,nameExtraParameter, limit,min, null);
        }

        public static string InitializeAutoComplete(this HtmlHelper html, string name, string actionName, string controllerName, bool mustMatch, int limit, int min)
        {
            return InitializeAutoComplete(html, name, actionName, controllerName, mustMatch, string.Empty, limit, min, null);
        }

        public static string InitializeAutoComplete(this HtmlHelper html, string name, string actionName, string controllerName, bool mustMatch, int limit)
        {
            return InitializeAutoComplete(html, name, actionName, controllerName, mustMatch, string.Empty, limit, 0, null);
        }

    }
}
