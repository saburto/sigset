using System;
using System.Web.Mvc;
using System.Web;
using System.Web.Security;
using System.Security.Principal;
using System.Web.UI;
using System.Text;
using MvcSiteMap.Core;
using System.Web.Routing;

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


        public static string MenuIzquierda(this HtmlHelper helper, string cssName)
        {
            string currentControllerName = (string)helper.ViewContext.RouteData.Values["controller"];
            string currentActionName = (string)helper.ViewContext.RouteData.Values["action"];

            StringBuilder sb = new StringBuilder();
            SiteMapProvider provider = SiteMap.Provider;

            HttpContextBase httpContext = new HttpContextWrapper(HttpContext.Current);
            UrlHelper urlHelper = new UrlHelper(new RequestContext(httpContext, RouteTable.Routes.GetRouteData(httpContext)));

            if (provider.RootNode.HasChildNodes)
            {
                foreach (SiteMapNode item in provider.RootNode.ChildNodes)
                {
                    if (item is MvcSiteMapNode)
                    {
                        MvcSiteMapNode nodeMap = (MvcSiteMapNode)item;
                        if (nodeMap.Controller == currentControllerName)
                        {
                            SiteMapNode node = item;
                            if (node.HasChildNodes)
                            {
                                sb.Append("<ul>");
                                for (int i = 0; i < node.ChildNodes.Count; i++)
                                {
                                    if (node.ChildNodes[i] is MvcSiteMapNode)
                                    {
                                        MvcSiteMapNode nodeHijo = (MvcSiteMapNode)node.ChildNodes[i];
                                        sb.Append("<li>");  
                                        string url = nodeHijo.Url;
                                        if (url.StartsWith("~"))
                                        {
                                            url = urlHelper.Content(nodeHijo.Url);
                                        }
                                        if (nodeHijo.Action == currentActionName)
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
                        }
                    }
                }
            }
            return sb.ToString();
        }
    }

   

}
