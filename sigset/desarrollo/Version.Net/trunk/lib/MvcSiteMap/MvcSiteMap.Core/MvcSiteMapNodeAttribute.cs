using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// SiteMap node attribute, used to decorate action methods with SiteMap node metadata
    /// </summary>
    [AttributeUsage(AttributeTargets.Method | AttributeTargets.Class, AllowMultiple = true)]
    public class MvcSiteMapNodeAttribute : Attribute, IMvcSiteMapNodeAttribute
    {
        /// <summary>
        /// SiteMap node key
        /// </summary>
        public string Key { get; set; }

        /// <summary>
        /// SiteMap node title
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// SiteMap node description
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// SiteMap node parent key
        /// </summary>
        public string ParentKey { get; set; }

        /// <summary>
        /// Detect if the current SiteMap node is dynamic (based on method parameters)
        /// </summary>
        public bool DetectIsDynamic { get; set; }

        /// <summary>
        /// Is the current SiteMap node dynamic? (If omitted, wil be automatically determined based on method parameters)
        /// </summary>
        public bool IsDynamic { get; set; }

        /// <summary>
        /// Parameters to ignore when IsDynamic is true 
        /// </summary>
        public string DynamicParameters { get; set; }

        /// <summary>
        /// Resource key, used when working with localization
        /// </summary>
        public string ResourceKey { get; set; }

        /// <summary>
        /// MvcSiteMapNode visibility 
        /// </summary>
        public MvcSiteMapNodeVisibility Visibility { get; set; }

        /// <summary>
        /// Order i.e. in menu.
        /// </summary>
        public int Order { get; set; }
    }
}
