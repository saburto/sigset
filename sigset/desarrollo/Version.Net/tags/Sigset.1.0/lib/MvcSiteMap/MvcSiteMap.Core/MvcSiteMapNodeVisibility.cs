using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// MvcSiteMapNode visibility
    /// </summary>
    public enum MvcSiteMapNodeVisibility
    {
        /// <summary>
        /// Full visibility (default)
        /// </summary>
        Full = 0,

        /// <summary>
        /// Visible in SiteMapPath only, not in Menu
        /// </summary>
        InSiteMapPathOnly = 1
    }
}
