using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web;

namespace MvcSiteMap.Core.Helpers
{
    /// <summary>
    /// HtmlHelper extension methods
    /// </summary>
    public static class SiteMapHelper
    {
        /// <summary>
        /// Build a sitemap tree, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <returns>Html markup</returns>
        public static string SiteMap(this HtmlHelper helper)
        {
            return SiteMap(helper, System.Web.SiteMap.RootNode, "");
        }

        /// <summary>
        /// Build a sitemap tree, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="rootNode">Root node</param>
        /// <returns>Html markup</returns>
        public static string SiteMap(this HtmlHelper helper, System.Web.SiteMapNode rootNode)
        {
            return SiteMap(helper, rootNode, "");
        }

        /// <summary>
        /// Build a sitemap tree, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="cssClass">SiteMap CSS class</param>
        /// <returns>Html markup</returns>
        public static string SiteMap(this HtmlHelper helper, string cssClass)
        {
            return SiteMap(helper, System.Web.SiteMap.RootNode, cssClass);
        }

        /// <summary>
        /// Build a sitemap tree, based on the MvcSiteMap
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="rootNode">Root node</param>
        /// <param name="cssClass">SiteMap CSS class</param>
        /// <returns>Html markup</returns>
        public static string SiteMap(this HtmlHelper helper, System.Web.SiteMapNode rootNode, string cssClass)
        {
            // String builder
            var sb = new StringBuilder();

            // Create unordered list tag
            sb.Append("<ul");
            if (!string.IsNullOrEmpty(cssClass))
            {
                sb.Append(string.Format(" class=\"{0}\"", cssClass));
            }
            sb.AppendLine(">");

            // Render root node
            sb.Append("<li>");
            sb.Append(string.Format("<a href=\"{0}\">{1}</a>", rootNode.Url, rootNode.Title));
            if (rootNode.HasChildNodes)
            {
                // Make sure all child nodes are accessible prior to rendering them...
                bool shouldRender = false;
                foreach (System.Web.SiteMapNode node in rootNode.ChildNodes)
                {
                    if (node.IsAccessibleToUser(HttpContext.Current))
                    {
                        shouldRender = true;
                        break;
                    }
                }

                // Render child nodes?
                if (shouldRender)
                {
                    sb.AppendLine();
                    foreach (System.Web.SiteMapNode node in rootNode.ChildNodes)
                    {
                        if (node.IsAccessibleToUser(HttpContext.Current))
                        {
                            sb.Append(SiteMap(helper, node, ""));
                        }
                    }
                }
            }
            sb.AppendLine("</li>");

            // Close unordered list tag
            sb.AppendLine("</ul>");

            return sb.ToString();
        }
    }
}
