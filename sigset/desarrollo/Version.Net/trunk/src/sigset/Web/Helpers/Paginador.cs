using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Text;

namespace Helpers
{
    public class Paginador
    {
        public int Total { get; set; }
        public int IndexPaginaActual { get; set; }
        public int PaginaSize { get { return 10; } }

    }

    public static class PaginadorHelper
    {
        public static string Paginador(this HtmlHelper html)
        {
            return Paginador(html, null);
        }

        public static string Paginador(this HtmlHelper html, string actionName)
        {
            if (html.ViewData["Paginado"] == null)
            {
                return "";
            }

            if (string.IsNullOrEmpty(actionName))
            {
                actionName = "Lista";
            }

            var paginador = html.ViewData["Paginado"] as Paginador;

            
            StringBuilder sb = new StringBuilder();

            int pageCount = (int)Math.Ceiling(paginador.Total / (double)paginador.PaginaSize);
            if (pageCount == 1)
            {
                return "";
            }

            if (paginador.IndexPaginaActual != 0)
            {
                sb.Append(html.ActionLink("Anterior", actionName, new { index = paginador.IndexPaginaActual - 1 })).Append(" ");
            }

            for (int i = 0; i < pageCount; i++)
            {
                if (i == paginador.IndexPaginaActual)
                {
                    sb.Append(i + 1).Append(" ");
                }
                else
                {
                    sb.Append(html.ActionLink((i + 1).ToString(), actionName, new { index = i })).Append(" ");
                }
            }

            if ((paginador.IndexPaginaActual + 1) != pageCount)
            {
                sb.Append(" ").Append(html.ActionLink("Siguiente", actionName, new { index = paginador.IndexPaginaActual + 1 }));
            }
            TagBuilder tag = new TagBuilder("p");
            tag.InnerHtml = sb.ToString();

            return tag.ToString();
        }
    }
}
