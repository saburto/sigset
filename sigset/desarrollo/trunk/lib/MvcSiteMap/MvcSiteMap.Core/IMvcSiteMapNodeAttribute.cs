using System;
namespace MvcSiteMap.Core
{
    /// <summary>
    /// SiteMap node attribute contract
    /// </summary>
    public interface IMvcSiteMapNodeAttribute
    {
        /// <summary>
        /// SiteMap node key
        /// </summary>
        string Key { get; set; }

        /// <summary>
        /// SiteMap node title
        /// </summary>
        string Title { get; set; }

        /// <summary>
        /// SiteMap node description
        /// </summary>
        string Description { get; set; }

        /// <summary>
        /// SiteMap node parent key
        /// </summary>
        string ParentKey { get; set; }

        /// <summary>
        /// Detect if the current SiteMap node is dynamic (based on method parameters)
        /// </summary>
        bool DetectIsDynamic { get; set; }

        /// <summary>
        /// Is the current SiteMap node dynamic? (If omitted, wil be automatically determined based on method parameters)
        /// </summary>
        bool IsDynamic { get; set; }

        /// <summary>
        /// Parameters to ignore when IsDynamic is true 
        /// </summary>
        string DynamicParameters { get; set; }

        /// <summary>
        /// Resource key, used when working with localization
        /// </summary>
        string ResourceKey { get; set; }

        /// <summary>
        /// MvcSiteMapNode visibility 
        /// </summary>
        MvcSiteMapNodeVisibility Visibility { get; set; }

        /// <summary>
        /// Order i.e. in menu.
        /// </summary>
        int Order { get; set; }
    }
}
