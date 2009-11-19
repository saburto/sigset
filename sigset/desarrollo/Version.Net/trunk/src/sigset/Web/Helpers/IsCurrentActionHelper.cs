using System;
using System.Web.Mvc;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Web.UI;
using System.Text;
using MvcSiteMap.Core;
using System.Web.Routing;
using System.Collections.Generic;

namespace Helpers
{
    public static class IsCurrentActionHelper
    {
        public static bool IsCurrentAction(this HtmlHelper helper, string actionName, string controllerName)
        {
            string currentControllerName = (string)helper.ViewContext.RouteData.Values["controller"];
            string currentActionName = (string)helper.ViewContext.RouteData.Values["action"];

            if (currentControllerName.Equals(controllerName, StringComparison.CurrentCultureIgnoreCase) && currentActionName.Equals(actionName, StringComparison.CurrentCultureIgnoreCase))
                return true;

            return false;
        }

        public static Dictionary<String, List<String>> controllerHijos = null;
        public static void InitControllerHijo()
        {
            //Aca guardamos la realacion de controller padre e hijos.
            //mira controllerHijos es de tipo diccionario, donde la clave va a ser el padre
            controllerHijos = new Dictionary<string, List<string>>();

            List<String> hijos = new List<string>();

            //Estos son los hijos de Admin
            hijos.Add("Usuario");
            hijos.Add("Empleado");
            hijos.Add("Tecnico");
            hijos.Add("Permisos");
            hijos.Add("Perfiles");
            hijos.Add("Configuracion");
            hijos.Add("Especialidad");
            hijos.Add("Categoria");
            //Aqui guardo a Admin y a sus hijos.
            controllerHijos.Add("Admin", hijos);

            //aqui por ejemplo el controller Orden de trabaajo tiene como hijo al cliente
            hijos = new List<string>();
            hijos.Add("Cliente");
            hijos.Add("Articulo");
            controllerHijos.Add("OrdenTrabajo", hijos);

            hijos = new List<string>();
            hijos.Add("OrdenesAsignadas");
            controllerHijos.Add("AreaTecnica", hijos);

            hijos = new List<string>();
            hijos.Add("OrdenesTrabajo");
            controllerHijos.Add("Administrativos", hijos);
            
        }

        public static string MenuIzquierda(this HtmlHelper helper, string cssName)
        {
            if (controllerHijos == null)
            {
                InitControllerHijo();
            }
            string currentControllerName = (string)helper.ViewContext.RouteData.Values["controller"];
            string currentActionName = (string)helper.ViewContext.RouteData.Values["action"];

            StringBuilder sb = new StringBuilder();

            SiteMapProvider provider = null;

            try
            {
                List<string> hijos = controllerHijos[helper.ViewContext.HttpContext.Session["ModuloActual"].ToString()];
                provider = SiteMap.Providers[helper.ViewContext.HttpContext.Session["ModuloActual"].ToString()];
            }
            catch
            {
                //Ante cualquier error solo retornar nada
                return "";
            }

            if (provider == null)
            {
                return "";
            }

            HttpContextBase httpContext = new HttpContextWrapper(HttpContext.Current);
            UrlHelper urlHelper = new UrlHelper(new RequestContext(httpContext, RouteTable.Routes.GetRouteData(httpContext)));

            if (provider.RootNode.HasChildNodes)
            {
                
                AppendMenuItem(helper, cssName, currentControllerName, currentActionName, sb, provider, urlHelper);

                
            }
            return sb.ToString();
        }
        private static string nodeHijoControllerActive = null;
        private static void AppendMenuItem(HtmlHelper helper, string cssName, string currentControllerName, string currentActionName, StringBuilder sb, SiteMapProvider provider, UrlHelper urlHelper)
        {
            int index = 0, active = 0;
            sb.Append("<div id=\"accordion\">");
            foreach (SiteMapNode item in provider.RootNode.ChildNodes)
            {
                
                if (item is MvcSiteMapNode)
                {
                    MvcSiteMapNode nodeHijo = (MvcSiteMapNode)item;
                    if (nodeHijo.HasChildNodes)
                    {
                        sb.Append("<h3>");
                        sb.Append("<a href=\"#\">").Append(helper.Encode(nodeHijo.Title)).Append("</a>");
                        sb.Append("</h3>");
                        sb.Append("<div>");
                        sb.Append("<ul>");
                        foreach (var menu in nodeHijo.ChildNodes)
                        {
                            AppendItemMenuLink(helper, cssName, currentControllerName, currentActionName, sb, urlHelper, (MvcSiteMapNode)menu);    
                        }
                        sb.Append("</ul>");
                        sb.Append("</div>");

                        if (nodeHijo.Controller == currentControllerName || (!string.IsNullOrEmpty(nodeHijoControllerActive) && nodeHijoControllerActive == currentControllerName ))
                        {
                            active = index;
                            nodeHijoControllerActive = null;
                        }
                        index++;
                    }
                }
            }
            sb.Append("</div>");
            TagBuilder tagScript = new TagBuilder("script");
            tagScript.Attributes.Add("type", "text/javascript");
            tagScript.InnerHtml = "$(function(){ $('#accordion').accordion( 'activate' , "+ active +" );});";
            sb.Append(tagScript.ToString());
        }

        private static void AppendItemMenuLink(HtmlHelper helper, string cssName, string currentControllerName, string currentActionName, StringBuilder sb, UrlHelper urlHelper, MvcSiteMapNode nodeHijo)
        {
        
            if(!nodeHijo.IsAccessibleToUser(HttpContext.Current)){
                return;
            }


            sb.Append("<li>");
            string url = nodeHijo.Url;
            if (url.StartsWith("~"))
            {
                url = urlHelper.Content(nodeHijo.Url);
            }
            if (nodeHijo.Action == currentActionName && nodeHijo.Controller == currentControllerName)
            {
                nodeHijoControllerActive = nodeHijo.Controller;
                sb.AppendFormat("<a style=\"color:black;font-weight: bold;\" class=\"{0}\" href=\"{0}\">{1}</a>", url, helper.Encode(nodeHijo.Title), cssName);
            }
            else
            {
                sb.AppendFormat("<a href=\"{0}\">{1}</a>", url, helper.Encode(nodeHijo.Title));
            }
            sb.Append("</li>");
        }

    }



}
