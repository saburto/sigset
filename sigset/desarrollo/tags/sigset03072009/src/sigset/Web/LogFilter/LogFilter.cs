using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.Practices.EnterpriseLibrary.Logging;
using System.Web.Routing;
using System.Text;

namespace Web.LogFilter
{
    public class LogAttribute : ActionFilterAttribute,
                    IActionFilter, IResultFilter, IExceptionFilter
    {
        #region IActionFilter Members
        void IActionFilter.OnActionExecuted(ActionExecutedContext filterContext)
        {
            Log("OnActionExecuted", filterContext.RouteData);
        }
        void IActionFilter.OnActionExecuting(ActionExecutingContext filterContext)
        {
            Log("OnActionExecuting", filterContext.RouteData);
        }
        #endregion
        #region IResultFilter Members
        void IResultFilter.OnResultExecuted(ResultExecutedContext filterContext)
        {
            Log("OnResultExecuted", filterContext.RouteData);
        }
        void IResultFilter.OnResultExecuting(ResultExecutingContext filterContext)
        {
            Log("OnResultExecuting", filterContext.RouteData);
        }
        #endregion
        #region IExceptionFilter Members
        public void OnException(ExceptionContext filterContext)
        {
            Log("OnException", filterContext.RouteData);
        }
        #endregion
        #region Log
        public static void Log(string message, RouteData routeData)
        {
            Logger.Write(
                string.Format("{0}, controller = {1}, action = {2}",
                message,
                routeData.Values["controller"],
                routeData.Values["action"]));
        }
        #endregion
    }

    
}
