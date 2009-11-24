using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.UI.WebControls;
using Data.Modelo;
using System.Web.Routing;
using Data.Modelo.Enums;
using System.Text;


namespace Helpers
{
    public static class CamposHelper
    {

        public static string ListaEstadosRecepcion(this HtmlHelper html, string name, bool required)
        {
            IList<SelectListItem> lista = new List<SelectListItem>();


            foreach (var item in Enum.GetNames(typeof(EstadoOrden)))
            {

                var selectItem = new SelectListItem();
                selectItem.Text = item;
                var estado = ((EstadoOrden)Enum.Parse(typeof(EstadoOrden), item));
                if (estado == EstadoOrden.Entregado || estado == EstadoOrden.Anulado || estado == EstadoOrden.Ingresado || estado == EstadoOrden.SinGarantia)
                {
                    selectItem.Value = ((int)estado).ToString();
                    lista.Add(selectItem);
                }
            }

            object atrr = null;
            if (required)
            {
                atrr = new { @class = "required" };
            }
            return html.DropDownList(name, lista, "Seleccione", atrr);
        }

        public static string ListaEstadosTecnicos(this HtmlHelper html, string name, bool required)
        {
            IList<SelectListItem> lista = new List<SelectListItem>();
            
            
            foreach(var item in Enum.GetNames(typeof(EstadoOrden))){
                
                var selectItem = new SelectListItem();
                selectItem.Text=item;
                var estado = ((EstadoOrden) Enum.Parse(typeof(EstadoOrden), item));
                if (estado == EstadoOrden.Anulado || estado == EstadoOrden.Asignado || estado == EstadoOrden.Entregado || estado == EstadoOrden.Ingresado || estado == EstadoOrden.SinGarantia)
                {
                    continue;
                }
                selectItem.Value = ((int)estado).ToString();
                lista.Add(selectItem);
            }

            object atrr = null;
            if (required)
            {
                atrr = new { @class = "required" };
            }
            return html.DropDownList(name, lista, "Seleccione", atrr);
        }


        public static string NivelesTecnicos(this HtmlHelper html, int seleccionado)
        {
            StringBuilder sb = new StringBuilder();
            foreach(var nivel in Enum.GetNames(typeof(NivelesTecnicos))){
                TagBuilder tagBuilder = new TagBuilder("option");
                tagBuilder.InnerHtml = nivel;
                NivelesTecnicos nivelTecnico = (NivelesTecnicos)Enum.Parse(typeof(NivelesTecnicos), nivel);
                tagBuilder.Attributes.Add("value", ((int)nivelTecnico).ToString());

                if (seleccionado == (int)nivelTecnico)
                {
                    tagBuilder.Attributes.Add("selected", "selected");
                }
                sb.AppendLine(tagBuilder.ToString());
            }
            return sb.ToString();
        }


        public static string Button(this HtmlHelper html, string content, ButtonType type)
        {
            TagBuilder tagBuilder = new TagBuilder("button");
            tagBuilder.MergeAttribute("type", type.ToString());
            tagBuilder.AddCssClass("fg-button ui-state-default ui-corner-all");

            tagBuilder.InnerHtml = html.Encode(content);

            return tagBuilder.ToString();
        }


        public static string ButtonSubmit(this HtmlHelper html, string content)
        {
            return ButtonSubmit(html, content, null);
        }

        public static string ButtonSubmit(this HtmlHelper html, string content, object htmlAtributes)
        {
            TagBuilder tagBuilder = new TagBuilder("button");

            if (htmlAtributes != null)
            {
                IDictionary<string, object> htmlAttributes1 = new RouteValueDictionary(htmlAtributes);
                tagBuilder.MergeAttributes(htmlAttributes1);
            }


            tagBuilder.MergeAttribute("type", ButtonType.submit.ToString());
            tagBuilder.AddCssClass("fg-button ui-state-default ui-corner-all");

            tagBuilder.InnerHtml = html.Encode(content);

            return tagBuilder.ToString();
        }


        public static string ButtonLinkIcon(this HtmlHelper html, string href, string content)
        {
            return ButtonLinkIcon(html, href, content, null);
        }

        public static string ButtonLinkIcon(this HtmlHelper html, string href, string content, Iconos? icon)
        {
            return ButtonLinkIcon(html, href, content, icon,null);
        }

        public static string ButtonLinkIcon(this HtmlHelper html, string href, string content, Iconos? icon, IconPosition? position)
        {
            return ButtonLinkIcon(html, href, content, icon, position,null);
        }

        public static string ButtonLinkIcon(this HtmlHelper html, string href, string content, Iconos? icon, IconPosition? position, object htmlAtributtes)
        {
            TagBuilder tagBuilder = new TagBuilder("a");
            tagBuilder.MergeAttribute("href", href);

            if (htmlAtributtes != null)
            {
                IDictionary<string, object> htmlAttributes1 = new RouteValueDictionary(htmlAtributtes);
                tagBuilder.MergeAttributes(htmlAttributes1);
            }
            

            tagBuilder.AddCssClass("fg-button ui-state-default ui-corner-all");

            if (position != null)
            {
                tagBuilder.AddCssClass("fg-button-icon-" + position.ToString());
            }
            else
            {
                tagBuilder.AddCssClass("fg-button-icon-left");
            }

            TagBuilder tagBuilderSpan = new TagBuilder("span");
            tagBuilderSpan.AddCssClass("ui-icon");
            if (icon != null)
            {
                string classIcon = "ui-icon-" + icon.ToString().Replace('_', '-');
                tagBuilderSpan.AddCssClass(classIcon);
            }
            tagBuilder.InnerHtml = tagBuilderSpan.ToString() + html.Encode(content);

            return tagBuilder.ToString();
        }


        public static string TextoSoloLectura(this HtmlHelper helper,string name, object value)
        {
            Dictionary<String, object> atributos = new Dictionary<string, object>();
            atributos.Add("readonly", "readonly");
            return helper.TextBox(name, value, atributos);
        }
        /// <summary>
        /// Devuelve dos textbox, uno para los numeros y otro para el digito verificador
        /// </summary>
        /// <param name="helper"></param>
        /// <returns></returns>
        public static string RutTextBox(this HtmlHelper helper)
        {
            return RutTextBox(helper, null,null, false);
        }

        public static string RutTextBox(this HtmlHelper helper, bool soloLectura)
        {
            return RutTextBox(helper, null, null, soloLectura);
        }


        public static string RutTextBox(this HtmlHelper helper, object dataRut, object dataDv, bool soloLectura)
        {
            Dictionary<string, object> htmlAtributtes = new Dictionary<string, object>();
            htmlAtributtes.Add("maxlength", "15");
            //htmlAtributtes.Add("size", "10");
            //htmlAtributtes.Add("style", "text-align: right");
            htmlAtributtes.Add("class", "rut required");
            htmlAtributtes.Add("title","Rut sin puntos Ej: 12345678-9");
            if (soloLectura)
            {
                htmlAtributtes.Add("readonly", "readonly");
            }

            string textBoxRut = helper.TextBox("RutDisplay", dataRut, htmlAtributtes);
            string rutHidden = helper.Hidden("Rut", dataRut);
            string dvHidden = helper.Hidden("dv", dataDv);

            //htmlAtributtes["maxlength"] = "1";
            //htmlAtributtes["size"] = "1";
            //htmlAtributtes["class"] = "dv";
            //htmlAtributtes["style"] = "width: 10px";
            //htmlAtributtes["title"] = "Digito verificador puede ser un digito o la letra k";

            //string textBoxDV = InputExtensions.TextBox(helper, nombreCampoDV, dataDv, htmlAtributtes);
            //return textBoxRut + " - " + textBoxDV;
            return textBoxRut + rutHidden + dvHidden;
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
            return GetSelectCampos<T>(listaDeCampos, valueMember, displayMember, null);
        }

        public static List<SelectListItem> GetSelectCampos<T>(this IList<T> listaDeCampos, string valueMember, string displayMember, string seleccionado)
        {
            return GetSelectCampos<T>(listaDeCampos, valueMember, displayMember, seleccionado,null);
        }

        public static List<SelectListItem> GetSelectCampos<T>(this IList<T> listaDeCampos, string valueMember, string displayMember, string seleccionado, string formatDisplay)
        {
            List<SelectListItem> lista = new List<SelectListItem>();
            lista.Add(new SelectListItem() { Text = "Seleccione...", Value = "-1" });
            foreach (T campo in listaDeCampos)
            {
                var valor = campo.GetType().GetProperty(valueMember).GetValue(campo, null).ToString();
                var display = campo.GetType().GetProperty(displayMember).GetValue(campo, null).ToString();
                if (formatDisplay != null)
                {
                    display = string.Format(formatDisplay, display);
                }


                if (seleccionado != null && valor.ToString() == seleccionado)
                {
                    lista.Add(new SelectListItem() { Text = display.ToString(), Value = valor.ToString(), Selected = true });
                }
                else
                {
                    lista.Add(new SelectListItem() { Text = display.ToString(), Value = valor.ToString() });
                }
            }
            return lista;
        }

        public static string GetRutCompleto(this decimal rut)
        {
            return rut.ToString() + "-" + ValidarRut.GetDigitoVerificador(rut);
        }
        public static string GetRutCompleto(this int rut)
        {
            return rut.ToString() + "-" + ValidarRut.GetDigitoVerificador(rut);
        }

        public static class ValidarRut
        {

            public static string GetDigitoVerificador(decimal rut)
            {
                return GetDigitoVerificador((int)rut);
            }

            public static string GetDigitoVerificador(int rut)
            {
                int Digito, Contador, Multiplo, Acumulador;
                string RutDigito;
                Contador = 2;
                Acumulador = 0;
                while (rut != 0)
                {
                    Multiplo = (rut % 10) * Contador;
                    Acumulador = Acumulador + Multiplo;
                    rut = rut / 10;
                    Contador = Contador + 1;
                    if (Contador == 8)
                    {
                        Contador = 2;
                    }
                }
                Digito = 11 - (Acumulador % 11);
                RutDigito = Digito.ToString().Trim();
                if (Digito == 10)
                {
                    RutDigito = "K";
                }
                if (Digito == 11)
                {
                    RutDigito = "0";
                }
                return (RutDigito);
            }

              /*      <a href="<%=Url.Action("Crear") %>" 
               * class="fg-button ui-state-default fg-button-icon-left ui-corner-all" >
        <span class="ui-icon ui-icon-circle-plus"></span>Crear Nuevo
        </a>*/

        }


        

    }


}

