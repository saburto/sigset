using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MvcSiteMap.Core
{
    /// <summary>
    /// UnknownSiteMapProviderException
    /// </summary>
    public class UnknownSiteMapProviderException : Exception
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public UnknownSiteMapProviderException() : base() { }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="message">Message</param>
        public UnknownSiteMapProviderException(string message) : base(message) { }

        /// <summary>
        /// Constructor
        /// </summary>
        /// <param name="message">Message</param>
        /// <param name="innerException">Inner Exception</param>
        public UnknownSiteMapProviderException(string message, Exception innerException) : base(message, innerException) { }
    }
}
