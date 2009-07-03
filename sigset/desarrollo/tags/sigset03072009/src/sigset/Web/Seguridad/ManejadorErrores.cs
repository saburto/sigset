using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using System.Text;

namespace Web.Seguridad
{
    public class ManejadorErroresAttribute : FilterAttribute, IExceptionFilter
    {
        private const string _defaultView = "Error";

        private Type _exceptionType = typeof(Exception);
        private string _master;
        private string _view;
    
        private string Master
        {
            get
            {
                return _master ?? String.Empty;
            }
            set
            {
                _master = value;
            }
        }

        private string View
        {
            get
            {
                return (!String.IsNullOrEmpty(_view)) ? _view : _defaultView;
            }
            set
            {
                _view = value;
            }
        }


        public virtual void OnException(ExceptionContext filterContext)
        {

            Exception exception = filterContext.Exception;

            

            string controllerName = (string)filterContext.RouteData.Values["controller"];
            string actionName = (string)filterContext.RouteData.Values["action"];
            HandleErrorInfo model = new HandleErrorInfo(filterContext.Exception, controllerName, actionName);
            filterContext.Result = new ViewResult
            {
                ViewName = View,
                MasterName = Master,
                ViewData = new ViewDataDictionary<HandleErrorInfo>(model),
                TempData = filterContext.Controller.TempData
            };

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("Error en controlador: " +  controllerName);
            sb.AppendLine("Action: " + actionName );
            sb.AppendLine(exception.Message);
            sb.AppendLine("SOURCE: " + exception.Source);
            sb.AppendLine("TARGETSITE: " + exception.TargetSite);
            sb.AppendLine("STACKTRACE: " + exception.StackTrace);

            Logger.Write(sb.ToString());

            filterContext.ExceptionHandled = true;
            filterContext.HttpContext.Response.Clear();
            filterContext.HttpContext.Response.StatusCode = 500;

            // Certain versions of IIS will sometimes use their own error page when
            // they detect a server error. Setting this property indicates that we
            // want it to try to render ASP.NET MVC's error page instead.
            filterContext.HttpContext.Response.TrySkipIisCustomErrors = true;
        }
    }
}
