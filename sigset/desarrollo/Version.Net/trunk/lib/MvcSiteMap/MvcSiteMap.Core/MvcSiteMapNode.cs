using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Text.RegularExpressions;
using System.Collections;
using System.Collections.Specialized;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// MvcSiteMapNode
    /// </summary>
    public class MvcSiteMapNode : SiteMapNode
    {
        #region Properties

        /// <summary>
        /// Controller name the SiteMap node is linked to
        /// </summary>
        public string Controller { get; set; }

        /// <summary>
        /// Action method name the SiteMap node is linked to
        /// </summary>
        public string Action { get; set; }

        /// <summary>
        /// Sets the current SiteMap node as dynamic
        /// </summary>
        public bool IsDynamic { get; set; }

        /// <summary>
        /// Parameters to ignore when IsDynamic is true 
        /// </summary>
        public List<string> DynamicParameters { get; private set; }

        /// <summary>
        /// Key of parent SiteMap node
        /// </summary>
        public string ParentKey { get; set; }

        /// <summary>
        /// MvcSiteMapNode visibility 
        /// </summary>
        public MvcSiteMapNodeVisibility Visibility { get; set; }

        #endregion

        #region Constructor

        ///// <summary>
        ///// Creates a new MvcSiteMapNode instance
        ///// </summary>
        //public MvcSiteMapNode(SiteMapProvider provider, string key)
        //    : base(provider, key)
        //{
        //    IsDynamic = false;
        //    DynamicParameters = new List<string>();
        //    Visibility = MvcSiteMapNodeVisibility.Full;
        //}

        /// <summary>
        /// Creates a new MvcSiteMapNode instance
        /// </summary>
        public MvcSiteMapNode(SiteMapProvider provider, string key, NameValueCollection explicitResourceKeys)
            : base(provider, key, "", "", "", new ArrayList(),
            new NameValueCollection(), explicitResourceKeys, "")
        {
            IsDynamic = false;
            DynamicParameters = new List<string>();
            Visibility = MvcSiteMapNodeVisibility.Full;
        }

        #endregion
    }
}
