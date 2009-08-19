using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace MvcSiteMap.Core.Extensions
{
    /// <summary>
    /// SiteMapNode extensions
    /// </summary>
    public static class SiteMapNodeExtensions
    {
        /// <summary>
        /// Gets the level of the current SiteMapNode
        /// </summary>
        /// <param name="current">The current SiteMapNode</param>
        /// <returns>The level of the current SiteMapNode</returns>
        public static int GetNodeLevel(this SiteMapNode current)
        {
            int level = 0;
            SiteMapNode node = current;

            while (node.ParentNode != null)
            {
                level++;
                node = node.ParentNode;
            }

            return level;
        }

        /// <summary>
        /// Is the current SiteMapNode in the active path? (One of childs is SiteMap.CurrentNode?)
        /// </summary>
        /// <param name="current">The current SiteMapNode</param>
        /// <returns>True if the current SiteMapNode in the active path</returns>
        public static bool IsInCurrentNodePath(this SiteMapNode current)
        {
            // Check if one of childs is SiteMap.CurrentNode?
            SiteMapNode currentNode = SiteMap.CurrentNode;
            if (currentNode != null)
            {
                while (currentNode.ParentNode != null)
                {
                    if (currentNode == current)
                    {
                        return true;
                    }
                    currentNode = currentNode.ParentNode;
                }
            }

            return false;
        }
    }
}
