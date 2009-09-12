using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;
using System.Web.Mvc;
using System.Collections;
using System.Reflection;
using System.Security.Principal;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// Default MvcSiteMap ACL module
    /// </summary>
    public class DefaultMvcSiteMapAclModule : IMvcSiteMapAclModule
    {
        /// <summary>
        /// Determine if a node is accessible for a user
        /// </summary>
        /// <param name="provider">The MvcSiteMapProvider requesting the current method</param>
        /// <param name="context">Current HttpContext</param>
        /// <param name="node">SiteMap node</param>
        /// <returns>True/false if the node is accessible</returns>
        public bool IsAccessibleToUser(MvcSiteMapProvider provider, HttpContext context, SiteMapNode node)
        {
            // Is security trimming enabled?
            if (!provider.SecurityTrimmingEnabled)
                return true;

            // Is it a regular node? No need for more things to do!
            MvcSiteMapNode mvcNode = node as MvcSiteMapNode;
            if (mvcNode == null)
            {
                if (provider.ParentProvider != null)
                {
                    return provider.ParentProvider.IsAccessibleToUser(context, node);
                }
                else
                {
                    return false; // This should not be happening, but in the case it does: security first!
                }
            }

            // Find current request context
            HttpContextBase httpContext = new HttpContextWrapper(context);
            RequestContext requestContext = new RequestContext(httpContext, RouteTable.Routes.GetRouteData(httpContext));

            if (requestContext != null)
            {
                // check explicitly specified roles
                if (mvcNode.Roles != null && mvcNode.Roles.Count > 0 && !mvcNode.Roles.Contains("*"))
                {
                    if (httpContext.User == null || mvcNode.Roles.OfType<string>().Any(role => role != "*" && !httpContext.User.IsInRole(role)))
                    {
                        return false;
                    }
                }

                IController controller = provider.GetController(requestContext, mvcNode.Controller); // get controller
                if (controller is ControllerBase)
                {
                    var controllerContext = new ControllerContext(requestContext, (ControllerBase)controller);
                    var authorizationContext = new AuthorizationContext(controllerContext);

                    foreach (IAuthorizationFilter att in controller.GetType().GetCustomAttributes(typeof(IAuthorizationFilter), true).Union(// get controller authorization filters
                    controller.GetType().GetMethods(BindingFlags.Public | BindingFlags.Instance).Where(m =>
                    {
                        var nameAtt = m.GetCustomAttributes(typeof(ActionNameAttribute), true).FirstOrDefault() as ActionNameAttribute;
                        return string.Equals(mvcNode.Action, nameAtt != null ? nameAtt.Name : m.Name, StringComparison.OrdinalIgnoreCase);
                    })
                    .SelectMany(m => m.GetCustomAttributes(typeof(IAuthorizationFilter), true))))// get authorization filters from all related methods
                    {
                        att.OnAuthorization(authorizationContext); // run authorization
                        if (authorizationContext.Result != null) // authorization failed
                        {
                            return false;
                        }
                    }
                }

                return true;
            }

            return false;
        }
    }
}
