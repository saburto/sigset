using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.EnterpriseLibrary.Logging;

namespace Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "Default",                                              // Route name
                "{controller}/{action}/{id}",                           // URL with parameters
                new { controller = "Home", action = "Index", id = "" }  // Parameter defaults
            );

        }

        protected void Application_Start()
        {
            Logger.Write("App Iniciando");
            RegisterRoutes(RouteTable.Routes);

        }

        protected void Application_End()
        {
            Logger.Write("App Cerrando");
        }

        protected void Application_Error(object sender, EventArgs e) 
        {
            Exception ex = Server.GetLastError().GetBaseException();
            
            string message = ex.Message + 
                            "\nSOURCE: " + ex.Source +
                            "\nFORM: " + Request.Form.ToString() + 
                            "\nQUERYSTRING: " + 
                               Request.QueryString.ToString() +
                            "\nTARGETSITE: " + ex.TargetSite +
                            "\nSTACKTRACE: " + ex.StackTrace;

            Logger.Write(message);
        }

    }
}