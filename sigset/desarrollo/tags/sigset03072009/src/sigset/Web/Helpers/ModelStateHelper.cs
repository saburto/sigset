using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using xVal.ServerSide;

namespace Web.Helpers
{
    public static class ModelStateHelper
    {
        public static void AddRuleErrors(this System.Web.Mvc.ModelStateDictionary modelState, IEnumerable<ErrorInfo> error)
        {
            foreach (var key in modelState.Keys)
            {
                modelState[key].Errors.Clear();
            }
            foreach (var erro in error)
            {
                modelState.AddModelError(erro.PropertyName, erro.ErrorMessage);
            }
        }
    }
}
