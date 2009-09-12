using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using MvcSiteMap.Core.Extensions;

namespace MvcSiteMap.Core.Helpers
{
    /// <summary>
    /// HtmlHelper extension methods
    /// </summary>
    public static class MenuHelper
    {
        /// <summary>
        /// Build a menu, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="menuCssClass">Menu CSS class</param>
        /// <param name="selectedMenuItemCssClass">Selected menu item CSS class</param>
        /// <returns>Html markup</returns>
        public static string Menu(this HtmlHelper helper, string menuCssClass, string selectedMenuItemCssClass)
        {
            return Menu(helper, true, false, menuCssClass, selectedMenuItemCssClass, null);
        }

        /// <summary>
        /// Build a menu, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="menuCssClass">Menu CSS class</param>
        /// <param name="selectedMenuItemCssClass">Selected menu item CSS class</param>
        /// <param name="menuHtmlAttributes">Html attributes for the outer unordered list</param>
        /// <returns>Html markup</returns>
        public static string Menu(this HtmlHelper helper, string menuCssClass, string selectedMenuItemCssClass, object menuHtmlAttributes)
        {
            return Menu(helper, true, false, menuCssClass, selectedMenuItemCssClass, menuHtmlAttributes);
        }

        /// <summary>
        /// Build a menu, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="showStartingNode">Show starting node?</param>
        /// <param name="startFromCurrentNode">Start from current node?</param>
        /// <param name="menuCssClass">Menu CSS class</param>
        /// <param name="selectedMenuItemCssClass">Selected menu item CSS class</param>
        /// <param name="menuHtmlAttributes">Html attributes for the outer unordered list</param>
        /// <returns>Html markup</returns>
        public static string Menu(this HtmlHelper helper, bool showStartingNode, bool startFromCurrentNode, string menuCssClass, string selectedMenuItemCssClass, object menuHtmlAttributes)
        {
            return Menu(helper, SiteMap.Provider.Name, showStartingNode, startFromCurrentNode, menuCssClass, selectedMenuItemCssClass, menuHtmlAttributes);
        }

        /// <summary>
        /// Build a menu, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="providerName">Provider name (can be used to specify SiteMap datasource)</param>
        /// <param name="menuCssClass">Menu CSS class</param>
        /// <param name="selectedMenuItemCssClass">Selected menu item CSS class</param>
        /// <returns>Html markup</returns>
        public static string Menu(this HtmlHelper helper, string providerName, string menuCssClass, string selectedMenuItemCssClass)
        {
            return Menu(helper, providerName, true, false, menuCssClass, selectedMenuItemCssClass, null);
        }

        /// <summary>
        /// Build a menu, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="providerName">Provider name (can be used to specify SiteMap datasource)</param>
        /// <param name="menuCssClass">Menu CSS class</param>
        /// <param name="selectedMenuItemCssClass">Selected menu item CSS class</param>
        /// <param name="menuHtmlAttributes">Html attributes for the outer unordered list</param>
        /// <returns>Html markup</returns>
        public static string Menu(this HtmlHelper helper, string providerName, string menuCssClass, string selectedMenuItemCssClass, object menuHtmlAttributes)
        {
            return Menu(helper, providerName, true, false, menuCssClass, selectedMenuItemCssClass, menuHtmlAttributes);
        }

        /// <summary>
        /// Build a menu, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="providerName">Provider name (can be used to specify SiteMap datasource)</param>
        /// <param name="showStartingNode">Show starting node?</param>
        /// <param name="startFromCurrentNode">Start from current node?</param>
        /// <param name="menuCssClass">Menu CSS class</param>
        /// <param name="selectedMenuItemCssClass">Selected menu item CSS class</param>
        /// <param name="menuHtmlAttributes">Html attributes for the outer unordered list</param>
        /// <returns>Html markup</returns>
        public static string Menu(this HtmlHelper helper, string providerName, bool showStartingNode, bool startFromCurrentNode, string menuCssClass, string selectedMenuItemCssClass, object menuHtmlAttributes)
        {
            // Check for provider
            if (SiteMap.Providers[providerName] == null)
            {
                throw new UnknownSiteMapProviderException(string.Format("Unknown SiteMap provider: {0}", providerName));
            }

            // Helpers
            HttpContextBase httpContext = new HttpContextWrapper(HttpContext.Current);
            UrlHelper urlHelper = new UrlHelper(new RequestContext(httpContext, RouteTable.Routes.GetRouteData(httpContext)));

            // Html attributes
            IDictionary<string, object> attributes = new RouteValueDictionary(menuHtmlAttributes);
        
            // Determine root node
            SiteMapNode relativeRootNode = null;
            if (startFromCurrentNode)
            {
                relativeRootNode = SiteMap.Providers[providerName].CurrentNode;
            }
            else
            {
                relativeRootNode = SiteMap.Providers[providerName].RootNode;
            }

            // Fetch nodes to render
            SiteMapNodeCollection nodesToRender = new SiteMapNodeCollection();
            if (showStartingNode)
            {
                nodesToRender.Add(relativeRootNode);
            }
            if (relativeRootNode.HasChildNodes)
            {
                nodesToRender.AddRange(relativeRootNode.ChildNodes);
            }


            // String builder
            var sb = new StringBuilder();

            // Create unordered list tag
            sb.Append("<ul");
            if (!string.IsNullOrEmpty(menuCssClass))
            {
                sb.Append(string.Format(" class=\"{0}\"", menuCssClass));
            }
            foreach (var attribute in attributes) {
                if (attribute.Key.ToLowerInvariant() != "class")
                {
                    sb.Append(string.Format(" {0}=\"{1}\"", attribute.Key, attribute.Value));
                }
            }
            sb.AppendLine(">");
            
            // Render each node
            foreach (SiteMapNode node in nodesToRender)
            {
                MvcSiteMapNode mvcNode = node as MvcSiteMapNode;
                bool nodeVisible = true;

                // Node authorized?
                if (!node.IsAccessibleToUser(HttpContext.Current))
                    nodeVisible = false;

                // Node visible?
                if (mvcNode != null && mvcNode.Visibility != MvcSiteMapNodeVisibility.Full)
                    nodeVisible = false;

                    // Render node
                if (nodeVisible)
                {
                    if (SiteMap.CurrentNode == node || node.IsInCurrentNodePath())
                    {
                        sb.Append("<li");
                        if (!string.IsNullOrEmpty(selectedMenuItemCssClass))
                        {
                            sb.Append(string.Format(" class=\"{0}\"", selectedMenuItemCssClass));
                        }
                        sb.Append(">");
                    }
                    else
                    {
                        sb.Append("<li>");
                    }

                    string url = node.Url;
                    if (url.StartsWith("~"))
                    {
                        url = urlHelper.Content(node.Url);
                    }

                    sb.AppendFormat("<a href=\"{0}\">{1}</a>", url, helper.Encode(node.Title));
                    sb.AppendLine("</li>");
                }
            }

            // Close unordered list tag
            sb.AppendLine("</ul>");

            return sb.ToString();
        }
    }
}