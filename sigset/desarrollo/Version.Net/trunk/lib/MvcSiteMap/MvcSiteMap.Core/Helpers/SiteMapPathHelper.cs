using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace MvcSiteMap.Core.Helpers
{
    /// <summary>
    /// HtmlHelper extension methods
    /// </summary>
    public static class SiteMapPathHelper
    {
        /// <summary>
        /// Gets SiteMap path for the current request
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <returns>SiteMap path for the current request</returns>
        public static string SiteMapPath(this HtmlHelper helper)
        {
            return SiteMapPath(helper, " > ", "separator", "link");
        }

        /// <summary>
        /// Gets SiteMap path for the current request
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="separator">Separator, i.e. " > "</param>
        /// <returns>SiteMap path for the current request</returns>
        public static string SiteMapPath(this HtmlHelper helper, string separator)
        {
            return SiteMapPath(helper, separator, "separator", "link");
        }

        /// <summary>
        /// Gets SiteMap path for the current request
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="separator">Separator, i.e. " > "</param>
        /// <param name="separatorCssClass">CSS class for separator</param>
        /// <param name="linkCssClass">CSS class for links</param>
        /// <returns>SiteMap path for the current request</returns>
        public static string SiteMapPath(this HtmlHelper helper, string separator, string separatorCssClass, string linkCssClass)
        {
            List<string> pages = new List<string>();

            SiteMapNode node = SiteMap.CurrentNode;
            while (node != null)
            {
                pages.Add(SiteMapLink(helper, node, linkCssClass));
                node = node.ParentNode;
            }
            pages.Reverse();

            string separatorHtml = "";
            if (!string.IsNullOrEmpty(separatorCssClass))
            {
                separatorHtml = string.Format("<span class=\"{0}\">{1}</span>", separatorCssClass, separator);
            }
            else
            {
                separatorHtml = separator;
            }

            return string.Join(separatorHtml, pages.ToArray());
        }

        /// <summary>
        /// Gets a SiteMap link
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="node">The node to get a SiteMap link for</param>
        /// <returns>SiteMap link for the specified node</returns>
        private static string SiteMapLink(this HtmlHelper helper, SiteMapNode node)
        {
            return SiteMapLink(helper, node, "");
        }

        /// <summary>
        /// Gets a SiteMap link
        /// </summary>
        /// <param name="helper">HtmlHelper instance</param>
        /// <param name="node">The node to get a SiteMap link for</param>
        /// <param name="linkCssClass">CSS class for links</param>
        /// <returns>SiteMap link for the specified node</returns>
        private static string SiteMapLink(this HtmlHelper helper, SiteMapNode node, string linkCssClass)
        {
            string spanHtml = "";
            if (!string.IsNullOrEmpty(linkCssClass))
            {
                spanHtml = string.Format("<span class=\"{0}\">{1}</span>", linkCssClass, node.Title);
            }
            else
            {
                spanHtml = node.Title;
            }

            return (node != SiteMap.CurrentNode)
                ? string.Format("<a href=\"{0}\">{1}</a>", node.Url, spanHtml)
                : spanHtml;
        }
    }
}