using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Helpers
{
    public static class JQueryHelper
    {
        public static JQueryDocumentReadyFunction BeginReady(this HtmlHelper helper)
        {
            return new JQueryDocumentReadyFunction(helper.ViewContext.HttpContext.Response);
        }
    }

    public class JQueryDocumentReadyFunction : IDisposable
    {
        private bool _disposed;
        private readonly HttpResponseBase _httpResponse;

        public JQueryDocumentReadyFunction(HttpResponseBase httpResponse)
        {
            if (httpResponse == null) {
                throw new ArgumentNullException("httpResponse");
            }
            _httpResponse = httpResponse;
            //_httpResponse.Write("<script type=\"text/javascript\">");
            _httpResponse.Write(" $(document).ready(function() {");
        }

        public void Dispose() {
            Dispose(true /* disposing */);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing) {
            if (!_disposed) {
                _disposed = true;
                _httpResponse.Write(" });");
                //_httpResponse.Write("</script>");
            }
        }

        public void EndForm() {
            Dispose(true);
        }

    }
}
