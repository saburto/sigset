using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Web.Routing;
using System.Web.Mvc;
using System.Web.Caching;
using System.Collections.Specialized;
using System.Reflection;
using System.Collections;
using System.Security.Principal;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.Globalization;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// Provides an XML based SiteMap provider for the ASP.NET MVC framework.
    /// </summary>
    public class MvcSiteMapProvider : System.Web.StaticSiteMapProvider
    {
        #region Private fields

        /// <summary>
        /// Root SiteMap node
        /// </summary>
        private SiteMapNode rootNode = null;

        /// <summary>
        /// MvcSiteMap Namespace
        /// </summary>
        private readonly XNamespace ns_mvc = @"http://mvcsitemap.codeplex.com/schemas/MvcSiteMap-File-1.0";

        /// <summary>
        /// SiteMap Namespace
        /// </summary>
        private readonly XNamespace ns_aspnet = @"http://schemas.microsoft.com/AspNet/SiteMap-File-1.0";

        /// <summary>
        /// SiteMap root XML element name
        /// </summary>
        private const string rootName = "siteMap";

        /// <summary>
        /// SiteMap node XML element name
        /// </summary>
        private const string nodeName = "siteMapNode";

        /// <summary>
        /// MVC SiteMap node XML element name
        /// </summary>
        private const string mvcNodeName = "mvcSiteMapNode";

        /// <summary>
        /// Cache duration
        /// </summary>
        private int cacheDuration = 1;

        /// <summary>
        /// SiteMap file
        /// </summary>
        private string SiteMapFile = string.Empty;

        /// <summary>
        /// Cache key
        /// </summary>
        private string cacheKey = "A33EF2B1-F0A4-4507-B011-94669840F79C";

        /// <summary>
        /// Scan assemblies for IMvcSiteMapNodeAttribute?
        /// </summary>
        private bool scanAssembliesForSiteMapNodes = false;

        /// <summary>
        /// Treat attributes in sitemap XML as route values?
        /// </summary>
        private bool treatAttributesAsRouteValues = true;

        /// <summary>
        /// MvcSiteMap ACL module
        /// </summary>
        private IMvcSiteMapAclModule aclModule = null;

        /// <summary>
        /// Synchronization lock
        /// </summary>
        private readonly object syncLock = new object();

        /// <summary>
        /// Controller builder cache
        /// </summary>
        private readonly Hashtable controllerCache = new Hashtable();

        /// <summary>
        /// Child provider cache
        /// </summary>
        private readonly List<SiteMapProvider> providerCache = new List<SiteMapProvider>();

        /// <summary>
        /// Node cache
        /// </summary>
        private readonly Dictionary<string, SiteMapNode> nodeCache = new Dictionary<string, SiteMapNode>();

        #endregion

        #region Properties

        /// <summary>
        /// Gets the root System.Web.SiteMapNode object of the site map data that the current provider represents.
        /// </summary>
        public override SiteMapNode RootNode
        {
            get
            {
                if (rootNode != null)
                    return rootNode;

                return base.RootNode;
            }
        }

        #endregion

        #region Public methods

        /// <summary>
        /// Initializes the SiteMap provider and gets the attributes that are set in the config
        /// that enable us to customise the behaviour of this provider.
        /// </summary>
        /// <param name="name">Name of the provider</param>
        /// <param name="attributes">Provider attributes</param>
        public override void Initialize(string name, NameValueCollection attributes)
        {
            // Verify parameters
            if (attributes == null) throw new ArgumentNullException("attributes");
            if (String.IsNullOrEmpty(name)) name = "MvcSiteMapProvider";

            // Add a default "description" attribute to config if the
            // attribute doesn't exist or is empty
            if (string.IsNullOrEmpty(attributes["description"]))
            {
                attributes.Remove("description");
                attributes.Add("description", "ASP.NET MVC SiteMap provider");
            }

            // Initialize base class
            base.Initialize(name, attributes);

            // Get the SiteMapFile from the attributes.
            this.SiteMapFile = attributes["siteMapFile"];

            // If a cacheDuration was passed, set it. Otherwise default to 1 minute.
            if (!string.IsNullOrEmpty(attributes["cacheDuration"]))
            {
                this.cacheDuration = int.Parse(attributes["cacheDuration"]);
            }

            // If a cache key was set in config, set it. 
            // Otherwise it will use the default which is a GUID.
            if (!string.IsNullOrEmpty(attributes["cacheKey"]))
            {
                this.cacheKey = attributes["cacheKey"];
            }

            // Scan assemblies for IMvcSiteMapNodeAttribute?
            if (!string.IsNullOrEmpty(attributes["scanAssembliesForSiteMapNodes"]))
            {
                this.scanAssembliesForSiteMapNodes = Boolean.Parse(attributes["scanAssembliesForSiteMapNodes"]);
            }

            // Treat attributes in sitemap XML as route values?
            if (!string.IsNullOrEmpty(attributes["treatAttributesAsRouteValues"]))
            {
                this.treatAttributesAsRouteValues = Boolean.Parse(attributes["treatAttributesAsRouteValues"]);
            }

            // ACL module
            if (!string.IsNullOrEmpty(attributes["aclModule"]))
            {
                aclModule = (IMvcSiteMapAclModule)Activator.CreateInstance(
                    Type.GetType(attributes["aclModule"]));
            }
            else
            {
                aclModule = new DefaultMvcSiteMapAclModule();
            }

            // Enable Localization
            if (!string.IsNullOrEmpty(attributes["enableLocalization"]))
            {
                EnableLocalization = Boolean.Parse(attributes["enableLocalization"]);
            }

            // Resource key
            if (!string.IsNullOrEmpty(attributes["resourceKey"]))
            {
                ResourceKey = attributes["resourceKey"];
            }
        }

        /// <summary>
        /// Builds the SiteMap, firstly reads in the XML file, and grabs the outer rootNode element and 
        /// maps this to become our main out rootNode SiteMap node.
        /// </summary>
        /// <returns>The rootNode SiteMapNode.</returns>
        public override SiteMapNode BuildSiteMap()
        {
            if (rootNode != null && HttpContext.Current.Cache[this.cacheKey] != null)
            {
                lock (syncLock)
                {
                    if (rootNode != null && HttpContext.Current.Cache[this.cacheKey] != null)
                    {
                        // If SiteMap already loaded and our cache key is still set,
                        // return current root node.
                        // Checking a cache item enables us to invalidate the SiteMap
                        // after a given time period.
                        return rootNode;
                    }
                }
            }

            lock (this.syncLock)
            {
                // SiteMap XML
                XDocument SiteMapXML = null;

                // Clear the current SiteMap.
                Clear();

                try
                {
                    // Load the XML document.
                    SiteMapXML = XDocument.Load(HttpContext.Current.Server.MapPath(this.SiteMapFile));

                    // Enable localization?
                    var enableLocalization = SiteMapXML.Root.Attribute("enableLocalization");
                    if (enableLocalization != null && enableLocalization.Value.ToLowerInvariant() == "true")
                    {
                        this.EnableLocalization = true;
                    }

                    // Get the rootNode SiteMapNode element
                    XElement rootElement = SiteMapXML.Root.Elements().First();
                    if (rootElement.Name == ns_aspnet + nodeName || rootElement.Name == nodeName)
                    {
                        rootNode = GetSiteMapNodeFromXMLElement(rootElement);
                    }
                    else if (rootElement.Name == ns_mvc + mvcNodeName || rootElement.Name == mvcNodeName)
                    {
                        rootNode = GetMvcSiteMapNodeFromXMLElement(null, rootElement);
                    }
                    else
                    {
                        throw new MvcSiteMapException("SiteMap XML root element has an unknown namespace.");
                    }

                    // Process our XML file, passing in the main rootNode SiteMap node and xml element.
                    ProcessXMLNodes(rootNode, rootElement);

                    // Add our main rootNode node.
                    AddNode(rootNode);

                    // Process nodes in the assemblies of the current AppDomain?
                    if (this.scanAssembliesForSiteMapNodes)
                    {
                        var assemblies = AppDomain.CurrentDomain.GetAssemblies()
                                                                .Where(a => !a.FullName.StartsWith("mscorlib")
                                                                    && !a.FullName.StartsWith("System")
                                                                    && !a.FullName.StartsWith("Microsoft")
                                                                    && !a.FullName.StartsWith("WebDev")
                                                                    && !a.FullName.StartsWith("SMDiagnostics")
                                                                    && !a.FullName.StartsWith("Anonymously")
                                                                    && !a.FullName.StartsWith("App_"));
                        foreach (Assembly assembly in assemblies)
                        {
                            ProcessNodesInAssembly(assembly);
                        }
                    }

                    // Create a cache item, this is used for the sole purpose of being able to invalidate our SiteMap
                    // after a given time period, it also adds a dependancy on the SiteMap file
                    // so that once changed it will refresh your SiteMap, unfortunately at this stage
                    // there is no dependancy for dynamic data, this could be implemented by clearing the cache item,
                    // by setting a custom cacheKey, then use this in your administration console for example to
                    // clear the cache item when the structure requires refreshing.
                    HttpContext.Current.Cache.Insert(this.cacheKey,
                                                 "",
                                                 new CacheDependency(HttpContext.Current.Server.MapPath(this.SiteMapFile)),
                                                 DateTime.Now.AddMinutes(this.cacheDuration),
                                                 Cache.NoSlidingExpiration
                    );
                }
                catch (Exception ex)
                {
                    // If there was ANY error loading or parsing the SiteMap XML file, throw an exception.
                    throw new MvcSiteMapException("An error occured while parsing the SiteMap XML. Check the inner exception for more details.", ex);
                }
                finally
                {
                    SiteMapXML = null;
                }
            }

            // Finally return our rootNode SiteMapNode.
            return rootNode;
        }

        /// <summary>
        /// Clears the current SiteMap provider.
        /// </summary>
        protected override void Clear()
        {
            rootNode = null;
            controllerCache.Clear();
            providerCache.Clear();
            nodeCache.Clear();

            base.Clear();
        }

        /// <summary>
        /// Adds a System.Web.SiteMapNode object to the node collection that is maintained by the site map provider.
        /// </summary>
        /// <param name="node">The System.Web.SiteMapNode to add to the node collection maintained by the provider.</param>
        protected override void AddNode(SiteMapNode node)
        {
            lock (nodeCache)
            {
                if (!nodeCache.ContainsKey(node.Key))
                    nodeCache.Add(node.Key, node);
            }

            base.AddNode(node);
        }

        /// <summary>
        /// Adds a System.Web.SiteMapNode object to the node collection that is maintained
        /// by the site map provider and specifies the parent System.Web.SiteMapNode
        /// object.
        /// </summary>
        /// <param name="node">The System.Web.SiteMapNode to add to the node collection maintained by the provider.</param>
        /// <param name="parentNode">The System.Web.SiteMapNode that is the parent of node.</param>
        protected override void AddNode(SiteMapNode node, SiteMapNode parentNode)
        {
            lock (nodeCache)
            {
                if (!nodeCache.ContainsKey(node.Key))
                    nodeCache.Add(node.Key, node);

                node.ParentNode = parentNode;
            }

            base.AddNode(node, parentNode);
        }

        /// <summary>
        /// Calls the BuildSiteMap method.
        /// </summary>
        /// <returns>Root node of the site map</returns>
        protected override SiteMapNode GetRootNodeCore()
        {
            return this.BuildSiteMap();
        }

        /// <summary>
        /// Retrieves the child site map nodes of a specific SiteMapNode object.
        /// </summary>
        /// <param name="node">The SiteMapNode for which to retrieve all child site map nodes. </param>
        /// <returns>A read-only SiteMapNodeCollection that contains the child site map nodes of node. If security trimming is enabled, the collection contains only site map nodes that the user is permitted to see.</returns>
        public override SiteMapNodeCollection GetChildNodes(SiteMapNode node)
        {
            lock (nodeCache)
            {
                if (nodeCache.ContainsKey(node.Key))
                {
                    SiteMapNodeCollection returnValue = new SiteMapNodeCollection();
                    returnValue.AddRange(nodeCache.Values.Where(v => v.ParentNode == node).ToArray());
                    return returnValue;
                }
            }

            return base.GetChildNodes(node);
        }

        #endregion

        #region Helper functions

        /// <summary>
        /// Recursively processes our XML document, parsing our SiteMapNodes and dynamicNode(s).
        /// </summary>
        /// <param name="rootNode">The main rootNode SiteMap node.</param>
        /// <param name="rootElement">The main rootNode XML element.</param>
        protected void ProcessXMLNodes(SiteMapNode rootNode, XElement rootElement)
        {
            SiteMapNode childNode = rootNode;

            // Loop through each element below the current rootNode element.
            foreach (XElement node in rootElement.Elements())
            {
                if (node.Name == nodeName || node.Name == ns_aspnet + nodeName)
                {
                    var providerName = GetAttributeValue(node.Attribute("provider"));
                    if (!string.IsNullOrEmpty(providerName))
                    {
                        // If this is SiteMapNode referencing another provider, add the
                        // nodes from the other provider.
                        SiteMapProvider provider = new SiteMapPath { SiteMapProvider = providerName }.Provider;
                        if (!providerCache.Contains(provider))
                        {
                            providerCache.Add(provider);
                        }
                        AddNode(provider.RootNode, rootNode);
                    }
                    else
                    {
                        // If this is a normal SiteMapNode then map the xml element 
                        // to a SiteMapNode, and add the node to the current rootNode. 
                        childNode = GetSiteMapNodeFromXMLElement(node);
                        AddNode(childNode, rootNode);
                    }
                }
                else if (node.Name == mvcNodeName || node.Name == ns_mvc + mvcNodeName)
                {
                    // If this is an MvcSiteMapNode then map the xml element
                    // to a MvcSiteMapNode, and add the node to the current rootNode.
                    childNode = this.GetMvcSiteMapNodeFromXMLElement(rootNode, node);
                    AddNode(childNode, rootNode);
                }
                else
                {
                    // If the current node is not one of the known node types throw and exception
                    throw new MvcSiteMapException("An invalid element was found in the SiteMap XML.");
                }

                // Continue recursively processing the XML file.
                ProcessXMLNodes(childNode, node);
            }
        }

        /// <summary>
        /// Process nodes in assembly
        /// </summary>
        /// <param name="assembly">Assembly</param>
        protected void ProcessNodesInAssembly(Assembly assembly)
        {
            var types = new List<KeyValuePair<Type, IMvcSiteMapNodeAttribute>>(); // type and its attribute

            // load all types and their attributes
            foreach (Type type in assembly.GetTypes())
            {
                types.Add(new KeyValuePair<Type, IMvcSiteMapNodeAttribute>(type, type.GetCustomAttributes(typeof(IMvcSiteMapNodeAttribute), true).FirstOrDefault() as IMvcSiteMapNodeAttribute));
            }

            // sort them
            types.Sort((p1, p2) => (p1.Value == null ? 0 : p1.Value.Order) - (p2.Value == null ? 0 : p2.Value.Order));

            // use them
            foreach (var type in types)
            {
                SiteMapNode controllerNode = null;
                if (type.Value != null) // attribute on type-level specified
                {
                    controllerNode = GetMvcSiteMapNodeFromMvcSiteMapNodeAttribute(type.Value, type.Key, null);
                    SiteMapNode parentNode = (string.IsNullOrEmpty(type.Value.ParentKey) ? null : FindSiteMapNodeFromKey(type.Value.ParentKey)) ?? this.rootNode;
                    if (controllerNode != null && parentNode != null)
                    {
                        AddNode(controllerNode, parentNode);
                    }
                }

                foreach (MethodInfo method in type.Key.GetMethods(BindingFlags.Public | BindingFlags.Instance))
                {
                    foreach (MvcSiteMapNodeAttribute attribute in (MvcSiteMapNodeAttribute[])method.GetCustomAttributes(typeof(MvcSiteMapNodeAttribute), true))
                    {
                        SiteMapNode node = GetMvcSiteMapNodeFromMvcSiteMapNodeAttribute(attribute, type.Key, method);
                        SiteMapNode parentNode = (controllerNode != null && string.IsNullOrEmpty(attribute.ParentKey)) ?
                                                    controllerNode :
                                                    (string.IsNullOrEmpty(attribute.ParentKey) ? this.rootNode : FindSiteMapNodeFromKey(attribute.ParentKey));
                        parentNode = parentNode ?? this.rootNode;
                        if (node != null && parentNode != null)
                        {
                            AddNode(node, parentNode);
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Determine if a node is accessible for a user
        /// </summary>
        /// <param name="context">Current HttpContext</param>
        /// <param name="node">SiteMap node</param>
        /// <returns>True/false if the node is accessible</returns>
        public override bool IsAccessibleToUser(HttpContext context, SiteMapNode node)
        {
            // Delegate to aclModule
            if (aclModule != null)
            {
                return aclModule.IsAccessibleToUser(this, context, node);
            }
            else
            {
                throw new MvcSiteMapException("MvcSiteMapProvider ACL module is not configured.");
            }
        }

        /// <summary>
        /// Finds the current SiteMap node based on raw url
        /// </summary>
        /// <param name="rawUrl">Raw URL</param>
        /// <returns>Current SiteMap node</returns>
        public override SiteMapNode FindSiteMapNode(string rawUrl)
        {
            return base.FindSiteMapNode(rawUrl);
        }

        /// <summary>
        /// Finds the current SiteMap node based on key
        /// </summary>
        /// <param name="key">Key</param>
        /// <returns>Current SiteMap node</returns>
        public override SiteMapNode FindSiteMapNodeFromKey(string key)
        {
            lock (nodeCache)
            {
                if (nodeCache.ContainsKey(key))
                {
                    return nodeCache[key];
                }
            }

            return null;
            //return base.FindSiteMapNodeFromKey(key);
        }

        /// <summary>
        /// Finds the current SiteMap node based on context
        /// </summary>
        /// <param name="context">Current HttpContext</param>
        /// <returns>Current SiteMap node</returns>
        public override SiteMapNode FindSiteMapNode(HttpContext context)
        {
            // Node
            SiteMapNode node = null;

            // Search child providers
            foreach (var provider in providerCache)
            {
                node = provider.FindSiteMapNode(context);
                if (node != null)
                    return node;
            }

            // Fetch route data
            HttpContextWrapper httpContext = new HttpContextWrapper(HttpContext.Current);
            RouteData routeData = RouteTable.Routes.GetRouteData(httpContext);
            if (routeData != null)
            {
                IDictionary<string, object> routeValues = routeData.Values;
                string controller = (string)routeValues["controller"];
                string action = (string)routeValues["action"];
                node = FindControllerActionNode(this.RootNode, controller, action, routeData.Values)
                    ?? FindControllerActionNode(this.RootNode, controller, "Index", routeData.Values)
                    ?? FindControllerActionNode(this.RootNode, "Home", "Index", routeData.Values);
            }

            // Try base class
            if (node == null)
            {
                node = base.FindSiteMapNode(context);
            }

            return node;
        }

        /// <summary>
        /// Maps a controller + action from the XML file to a SiteMapNode.
        /// </summary>
        /// <param name="rootNode">Root node</param>
        /// <param name="controller">Controller</param>
        /// <param name="action">Action</param>
        /// <param name="values">Values</param>
        /// <returns>A SiteMapNode which represents the controller + action.</returns>
        private SiteMapNode FindControllerActionNode(SiteMapNode rootNode, string controller, string action, IDictionary<string, object> values)
        {
            if (rootNode != null)
            {
                // Search current level
                foreach (SiteMapNode node in this.GetChildNodes(rootNode))
                {
                    // Check if it is an MvcSiteMapNode
                    MvcSiteMapNode mvcNode = node as MvcSiteMapNode;
                    if (mvcNode != null)
                    {
                        // Valid node?
                        if (NodeMatchesRoute(mvcNode, controller, action, values))
                        {
                            return mvcNode;
                        }
                    }
                }

                // Search one deeper level
                foreach (SiteMapNode node in this.GetChildNodes(rootNode))
                {
                    SiteMapNode SiteMapNode = FindControllerActionNode(node, controller, action, values);
                    if (SiteMapNode != null)
                    {
                        return SiteMapNode;
                    }
                }
            }

            return null;
        }

        /// <summary>
        /// Node matches route?
        /// </summary>
        /// <param name="mvcNode">Current node</param>
        /// <param name="controller">Controller</param>
        /// <param name="action">Action</param>
        /// <param name="values">Values</param>
        /// <returns>A SiteMapNode which represents the controller + action.</returns>
        private bool NodeMatchesRoute(MvcSiteMapNode mvcNode, string controller, string action, IDictionary<string, object> values)
        {
            bool nodeValid = true;

            if (mvcNode != null && mvcNode.Controller.ToLowerInvariant() == controller.ToLowerInvariant() && mvcNode.Action.ToLowerInvariant() == action.ToLowerInvariant())
            {
                // Verify other route values
                if (values.Count > 0)
                {
                    foreach (var pair in values)
                    {
                        if (mvcNode[pair.Key] == null || mvcNode[pair.Key].ToString().ToLowerInvariant() != pair.Value.ToString().ToLowerInvariant())
                        {
                            if (!mvcNode.DynamicParameters.Contains("*") && (!mvcNode.IsDynamic || !mvcNode.DynamicParameters.Contains(pair.Key)))
                            {
                                nodeValid = false;
                            }
                        }
                    }
                }
            }
            else
            {
                nodeValid = false;
            }

            return nodeValid;
        }

        /// <summary>
        /// Maps an XElement from the XML file to a SiteMapNode.
        /// </summary>
        /// <param name="node">The element to map.</param>
        /// <returns>A SiteMapNode which represents the XElement.</returns>
        protected SiteMapNode GetSiteMapNodeFromXMLElement(XElement node)
        {
            // Is the node to be handled by the current provider?
            var provider = GetAttributeValue(node.Attribute("provider"));
            if (!string.IsNullOrEmpty(provider))
                return GetSiteMapNodesFromProvider(provider);

            // Get the URL attribute, need this so we can get the key.
            string url = GetAttributeValue(node.Attribute("url")) ?? "";

            // Create a new SiteMap node, setting the key and url
            var siteMapNode = new SiteMapNode(this, url)
            {
                Url = url
            };

            // Add each attribute to our attributes collection on SiteMapNode.
            foreach (XAttribute attribute in node.Attributes())
            {
                siteMapNode[attribute.Name.ToString()] = attribute.Value;
            }

            // Set the other properties on SiteMapNode.
            // These were added as attributes but can be mapped to properties.
            siteMapNode.Title = siteMapNode["title"];
            siteMapNode.Description = siteMapNode["description"];
            siteMapNode.ResourceKey = siteMapNode["resourceKey"] ?? "";

            // Set roles
            var roles = siteMapNode["roles"];
            if (!string.IsNullOrEmpty(roles))
            {
                siteMapNode.Roles = roles.Split(',', ';');
            }

            return siteMapNode;
        }

        /// <summary>
        /// Maps an XElement from the XML file to a SiteMapNode.
        /// </summary>
        /// <param name="parentNode">Parent SiteMapNode (can be null)</param>
        /// <param name="node">The element to map.</param>
        /// <returns>A SiteMapNode which represents the XElement.</returns>
        protected SiteMapNode GetMvcSiteMapNodeFromXMLElement(SiteMapNode parentNode, XElement node)
        {
            // Is the node to be handled by the current provider?
            var provider = GetAttributeValue(node.Attribute("provider"));
            if (!string.IsNullOrEmpty(provider))
                return GetSiteMapNodesFromProvider(provider);

            // Generate key for node
            var key = GetAttributeValue(node.Attribute("key")) ??
                      (GetAttributeValue(node.Attribute("controller")) ?? "") + "_" + (GetAttributeValue(node.Attribute("action")) ?? "") + "_" + (GetAttributeValue(node.Attribute("title")) ?? "");

            // Handle title and description globalization
            NameValueCollection explicitResourceKeys = new NameValueCollection();
            string title = GetAttributeValue(node.Attribute("title"));
            string description = GetAttributeValue(node.Attribute("title"));
            HandleResourceAttribute("title", ref title, ref explicitResourceKeys);
            HandleResourceAttribute("description", ref description, ref explicitResourceKeys);

            // Create a new SiteMap node, setting the key and url
            var siteMapNode = new MvcSiteMapNode(this, key, explicitResourceKeys);

            // Create a route data dictionary
            IDictionary<string, object> routeValues = new Dictionary<string, object>();

            // Add each attribute to our attributes collection on the SiteMapNode
            // and to a route data dictionary.
            foreach (XAttribute attribute in node.Attributes())
            {
                string attributeName = attribute.Name.ToString();
                string attributeValue = attribute.Value;

                if (attributeName != "title"
                    && attributeName != "description")
                {
                    siteMapNode[attributeName] = attributeValue;
                }

                // Treat attributes in sitemap XML as route values?
                if (treatAttributesAsRouteValues)
                {
                    if (attributeName != "title"
                        && attributeName != "description"
                        && attributeName != "resourceKey"
                        && attributeName != "key"
                        && attributeName != "isDynamic"
                        && attributeName != "dynamicParameters"
                        && attributeName != "visibility"
                        && attributeName != "roles")
                    {
                        routeValues.Add(attributeName, attributeValue);
                    }
                }

                if (attributeName == "roles")
                {
                    siteMapNode.Roles = attribute.Value.Split(new char[] { ',' }, StringSplitOptions.RemoveEmptyEntries);
                }
            }

            // Set the other properties on SiteMapNode.
            // These were added as attributes but can be mapped to properties.
            siteMapNode["title"] = title;
            siteMapNode.Title = siteMapNode["title"];
            siteMapNode["description"] = description;
            siteMapNode.Description = siteMapNode["description"];
            siteMapNode.ResourceKey = siteMapNode["resourceKey"] ?? "";

            if (siteMapNode["controller"] == null)
            {
                siteMapNode["controller"] = "Home";
            }
            siteMapNode.Controller = siteMapNode["controller"];

            if (siteMapNode["action"] == null)
            {
                siteMapNode["action"] = "Index";
            }
            siteMapNode.Action = siteMapNode["action"];

            siteMapNode.IsDynamic = Convert.ToBoolean(siteMapNode["isDynamic"] ?? "false");
            if (!string.IsNullOrEmpty(siteMapNode["dynamicParameters"]))
            {
                siteMapNode.DynamicParameters.AddRange(siteMapNode["dynamicParameters"].Split(';'));
            }
            if (!string.IsNullOrEmpty(siteMapNode["visibility"]))
            {
                siteMapNode.Visibility = (MvcSiteMapNodeVisibility)Enum.Parse(typeof(MvcSiteMapNodeVisibility), siteMapNode["visibility"], true);
            }

            // Verify route values
            if (!routeValues.ContainsKey("controller"))
            {
                // Try getting parent  controller name
                if (parentNode != null && parentNode is MvcSiteMapNode)
                {
                    string parentControllerName = (parentNode as MvcSiteMapNode).Controller;
                    if (!string.IsNullOrEmpty(parentControllerName))
                    {
                        siteMapNode.Controller = parentControllerName;
                        routeValues.Add("controller", parentControllerName);
                    }
                }
            }
            if (!routeValues.ContainsKey("controller")) routeValues.Add("controller", "Home");
            if (!routeValues.ContainsKey("action")) routeValues.Add("action", "Index");

            // Build URL
            HttpContextWrapper httpContext = new HttpContextWrapper(HttpContext.Current);
            RouteData routeData = RouteTable.Routes.GetRouteData(httpContext);
            if (routeData != null)
            {
                // Set URL based on route
                UrlHelper helper = new UrlHelper(new RequestContext(httpContext, routeData));
                siteMapNode.Url = helper.RouteUrl(new RouteValueDictionary(routeValues));

                // Specify defaults from route on siteMapNode
                Route route = routeData.Route as Route;
                if (route != null && route.Defaults != null)
                {
                    foreach (var defaultValue in route.Defaults)
                    {
                        if (siteMapNode[defaultValue.Key] == null)
                        {
                            siteMapNode[defaultValue.Key] = defaultValue.Value.ToString();
                        }
                    }
                }
            }

            return siteMapNode;
        }

         /// Maps an IMvcSiteMapNodeAttribute to a SiteMapNode.
         /// </summary>
         /// <param name="attribute">IMvcSiteMapNodeAttribute to map</param>
        /// <param name="type">Type.</param>
         /// <param name="methodInfo">MethodInfo on which the IMvcSiteMapNodeAttribute is applied</param>
         /// <returns>A SiteMapNode which represents the IMvcSiteMapNodeAttribute.</returns>
        protected SiteMapNode GetMvcSiteMapNodeFromMvcSiteMapNodeAttribute(IMvcSiteMapNodeAttribute attribute, Type type, MethodInfo methodInfo)
         {
            if (attribute == null)
            {
                throw new ArgumentNullException("attribute");
            }
            if (type == null)
            {
                throw new ArgumentNullException("type");
            }
 
            if (methodInfo == null) // try to find Index action
             {
                var ms = type.FindMembers(MemberTypes.Method, BindingFlags.Instance | BindingFlags.Public, (mi, o) => mi != null && string.Equals(mi.Name, "Index"), null);
                if (ms != null)
                {
                    foreach (var m in ms.OfType<MethodInfo>())
                    {
                        var pars = m.GetParameters();
                        if (pars == null || pars.Length == 0)
                        {
                            methodInfo = m;
                            break;
                        }
                    }
                }
            }

            string controller = type.Name.Replace("Controller", "") ?? "Home";
            string action = (methodInfo != null ? methodInfo.Name : null) ?? "Index";
            if (methodInfo != null) // handle custom action name
            {
                var actionNameAttribute = methodInfo.GetCustomAttributes(typeof(ActionNameAttribute), true).FirstOrDefault() as ActionNameAttribute;
                if (actionNameAttribute != null)
                {
                    action = actionNameAttribute.Name;
                }
            }

            // Generate key for node
            var key = !string.IsNullOrEmpty(attribute.Key) ? attribute.Key :
                methodInfo != null ? controller + "_" + action + "_" + attribute.Title : Guid.NewGuid().ToString();

            // Handle title and description globalization
            NameValueCollection explicitResourceKeys = new NameValueCollection();
            string title = attribute.Title;
            string description = attribute.Description;
            HandleResourceAttribute("title", ref title, ref explicitResourceKeys);
            HandleResourceAttribute("description", ref description, ref explicitResourceKeys);

            // Create a new SiteMap node, setting the key and url
            var siteMapNode = new MvcSiteMapNode(this, key, explicitResourceKeys);

            // Set the properties on SiteMapNode.
            siteMapNode.Title = title;
            siteMapNode.Description = description;
            siteMapNode.Controller = controller;
            siteMapNode.Action = action;

            siteMapNode.Visibility = attribute.Visibility;
            siteMapNode.ResourceKey = attribute.ResourceKey;

            if (attribute.Visibility == MvcSiteMapNodeVisibility.Full && siteMapNode.IsDynamic)
            {
                siteMapNode.Visibility = MvcSiteMapNodeVisibility.InSiteMapPathOnly;
            }

            if (attribute.DetectIsDynamic && methodInfo != null)
            {
                var pars = methodInfo.GetParameters();
                siteMapNode.IsDynamic = pars != null && pars.Length > 0;
                if (siteMapNode.IsDynamic)
                {
                    foreach (var parameter in pars)
                    {
                        siteMapNode.DynamicParameters.Add(parameter.Name);
                        /*if (parameter.ParameterType == typeof(string))
                        {
                            routeValues.Add(parameter.Name, string.Empty);
                        }
                        else if (parameter.ParameterType.IsValueType)
                        {
                            routeValues.Add(parameter.Name, 0);
                        }
                        else if (parameter.ParameterType.IsClass)
                        {
                            routeValues.Add(parameter.Name, null);
                        }*/
                    }
                }
            }
            else
            {
                siteMapNode.IsDynamic = attribute.IsDynamic;
                if (siteMapNode.IsDynamic && !string.IsNullOrEmpty(attribute.DynamicParameters))
                {
                    siteMapNode.DynamicParameters.AddRange(attribute.DynamicParameters.Split(';', ','));
                }
            }

            // Set node properties
            siteMapNode["controller"] = siteMapNode.Controller;
            siteMapNode["action"] = siteMapNode.Action;

            // Create a route data dictionary
            IDictionary<string, object> routeValues = new Dictionary<string, object>();
            routeValues.Add("controller", siteMapNode.Controller);
            routeValues.Add("action", siteMapNode.Action);

            // Build URL
            HttpContextWrapper httpContext = new HttpContextWrapper(HttpContext.Current);
            RouteData routeData = RouteTable.Routes.GetRouteData(httpContext);
            if (routeData != null)
            {
                UrlHelper helper = new UrlHelper(new RequestContext(httpContext, routeData));
                siteMapNode.Url = helper.RouteUrl(new RouteValueDictionary(routeValues));
            }

            return siteMapNode;
        }

        #endregion

        #region Helpers

        /// <summary>
        /// Given an XAttribute, will either return an empty string if its value is
        /// null or the actual value.
        /// </summary>
        /// <param name="attribute">The attribe to get the value for.</param>
        /// <returns></returns>
        public string GetAttributeValue(XAttribute attribute)
        {
            return attribute != null ? attribute.Value : null;
        }

        /// <summary>
        /// Get controller from controller cache
        /// </summary>
        /// <param name="context">Request context</param>
        /// <param name="controllerName">Controller name</param>
        /// <returns>Controller instance</returns>
        public IController GetController(RequestContext context, string controllerName)
        {
            if (!controllerCache.ContainsKey(controllerName))
            {
                lock (controllerCache)
                {
                    if (!controllerCache.ContainsKey(controllerName))
                    {
                        IController controller = ControllerBuilder.Current.GetControllerFactory().CreateController(context, controllerName);
                        controllerCache.Add(controllerName, controller);

                        return controller;
                    }
                }
            }

            return (IController)controllerCache[controllerName];
        }

        /// <summary>
        /// Get SiteMap nodes from other provider
        /// </summary>
        /// <param name="provider">Provider name</param>
        /// <returnsRoot node from other provider</returns>
        private SiteMapNode GetSiteMapNodesFromProvider(string provider)
        {
            var ds = new SiteMapDataSource { ShowStartingNode = true };
            ds.SiteMapProvider = provider;
            var view = (SiteMapDataSourceView)ds.GetView(string.Empty);
            var nodes = (SiteMapNodeCollection)view.Select(DataSourceSelectArguments.Empty);
            return nodes[0];
        }

        /// <summary>
        /// Handle resource attribute
        /// </summary>
        /// <param name="attributeName">Attribute name</param>
        /// <param name="text">Text</param>
        /// <param name="collection">NameValueCollection to be used for localization</param>
        private void HandleResourceAttribute(string attributeName, ref string text, ref NameValueCollection collection)
        {
            if (!string.IsNullOrEmpty(text))
            {
                string tempStr1 = null;
                string tempStr2 = text.TrimStart(new char[] { ' ' });
                if (((tempStr2 != null) && (tempStr2.Length > 10)) && tempStr2.ToLower(CultureInfo.InvariantCulture).StartsWith("$resources:", StringComparison.Ordinal))
                {
                    tempStr1 = tempStr2.Substring(11);
                    string tempStr3 = null;
                    string tempStr4 = null;
                    int index = tempStr1.IndexOf(',');
                    tempStr3 = tempStr1.Substring(0, index);
                    tempStr4 = tempStr1.Substring(index + 1);
                    int length = tempStr4.IndexOf(',');
                    if (length != -1)
                    {
                        text = tempStr4.Substring(length + 1);
                        tempStr4 = tempStr4.Substring(0, length);
                    }
                    else
                    {
                        text = null;
                    }
                    if (collection == null)
                    {
                        collection = new NameValueCollection();
                    }
                    collection.Add(attributeName, tempStr3.Trim());
                    collection.Add(attributeName, tempStr4.Trim());
                }
            }
        }

        #endregion
    }
}
