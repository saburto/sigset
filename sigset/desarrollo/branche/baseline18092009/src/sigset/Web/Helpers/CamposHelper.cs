﻿using System;
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
            return RutTextBox(helper, null, false);
        }

        public static string RutTextBox(this HtmlHelper helper,string rutName, object dataRut, bool soloLectura)
        {
            return RutTextBox(helper, rutName, "dv", dataRut, null, soloLectura);
        }

        public static string RutTextBox(this HtmlHelper helper, object dataRut, bool soloLectura)
        {
            return RutTextBox(helper, "Rut", "dv", dataRut, null, soloLectura);
        }

        public static string RutTextBox(this HtmlHelper helper, string nombreCampoRut, string nombreCampoDV, object dataRut, object dataDv, bool soloLectura)
        {
            Dictionary<string, object> htmlAtributtes = new Dictionary<string, object>();
            htmlAtributtes.Add("maxlength", "10");
            htmlAtributtes.Add("size", "10");
            htmlAtributtes.Add("style", "text-align: right");
            if (soloLectura)
            {
                htmlAtributtes.Add("readonly", "readonly");
            }

            string textBoxRut = InputExtensions.TextBox(helper, nombreCampoRut, dataRut, htmlAtributtes);

            htmlAtributtes["maxlength"] = "1";
            htmlAtributtes["size"] = "1";
            htmlAtributtes["style"] = "width: 10px";

            string textBoxDV = InputExtensions.TextBox(helper, nombreCampoDV, dataDv, htmlAtributtes);
            return textBoxRut + " - " + textBoxDV;
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
        }


    }


}
