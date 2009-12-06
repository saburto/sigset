using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using System.Web.DynamicData;

namespace Web
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("Reserved.ReportViewerWebControl.axd/{*pathInfo}");
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");
        
            routes.MapRoute(
                "Paginado",                                              // Route name
                "{controller}/Lista/{index}",                           // URL with parameters
                new { controller = "Home", action = "Lista", index = 0 }  // Parameter defaults
            );
            
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
            TagBuilder tag = new TagBuilder("html");
            TagBuilder tagBody = new TagBuilder("body");
           
            TagBuilder tagH2 = new TagBuilder("h2");
            tagH2.InnerHtml = "Ha ocurrido un problema dentro del sistema. Favor contactarse con administrador de sistema";

            TagBuilder tagP = new TagBuilder("p");
            tagP.InnerHtml = ex.Message +" <br />"  +  (ex.InnerException != null ? ex.InnerException.Message: "") ;

            tagBody.InnerHtml = tagH2.ToString() + tagP.ToString();

            tag.InnerHtml = tagBody.ToString() ;

            Response.Clear();
            Response.Write(tag.ToString());

            Server.ClearError();
            

        }

    }
}