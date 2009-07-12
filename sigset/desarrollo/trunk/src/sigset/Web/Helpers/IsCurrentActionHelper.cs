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
            //y los hijos una lista de controlladores, entiendes???sipis
            controllerHijos = new Dictionary<string,List<string>>();
            
            List<String> hijos = new List<string>();
            
            //Estos son los hijos de Admin
            hijos.Add("Usuario");
            hijos.Add("Empleado");
            hijos.Add("Tecnico");
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
                List<string> hijos = controllerHijos[currentControllerName];
                provider = SiteMap.Providers[currentControllerName];
            }
            catch
            {
                foreach (KeyValuePair<string,List<string>> item in controllerHijos)
                {
                    foreach (string c in item.Value)
                    {
                        if (c == currentControllerName)
                        {
                            provider = SiteMap.Providers[item.Key];
                        }
                    }
                }
            }

            if (provider == null)
            {
                return "";
            }

            HttpContextBase httpContext = new HttpContextWrapper(HttpContext.Current);
            UrlHelper urlHelper = new UrlHelper(new RequestContext(httpContext, RouteTable.Routes.GetRouteData(httpContext)));

            if (provider.RootNode.HasChildNodes)
            {
                sb.Append("<ul>");
                foreach (SiteMapNode item in provider.RootNode.ChildNodes)
                {
                    if (item is MvcSiteMapNode)
                    {
                        MvcSiteMapNode nodeHijo = (MvcSiteMapNode)item;
                        sb.Append("<li>");
                        string url = nodeHijo.Url;
                        if (url.StartsWith("~"))
                        {
                            url = urlHelper.Content(nodeHijo.Url);
                        }
                        if (nodeHijo.Action == currentActionName && nodeHijo.Controller == currentControllerName)
                        {
                            sb.AppendFormat("<a style=\"color:black;font-weight: bold;\" class=\"{0}\" href=\"{0}\">{1}</a>", url, helper.Encode(nodeHijo.Title), cssName);
                        }
                        else
                        {
                            sb.AppendFormat("<a href=\"{0}\">{1}</a>", url, helper.Encode(nodeHijo.Title));
                        }
                        sb.Append("</li> ");
                    }
                                    //sb.Append(MvcSiteMap.Core.Helpers.SiteMapHelper.SiteMap(helper, node.ChildNodes[i]));
                }
                sb.Append("</ul>");
            }
            return sb.ToString();
        }

    }



}
