using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// MvcSiteMap ACL module contract
    /// </summary>
    public interface IMvcSiteMapAclModule
    {
        /// <summary>
        /// Determine if a node is accessible for a user
        /// </summary>
        /// <param name="provider">The MvcSiteMapProvider requesting the current method</param>
        /// <param name="context">Current HttpContext</param>
        /// <param name="node">SiteMap node</param>
        /// <returns>True/false if the node is accessible</returns>
        bool IsAccessibleToUser(MvcSiteMapProvider provider, HttpContext context, SiteMapNode node);
    }
}
