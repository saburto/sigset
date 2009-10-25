using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Helpers
{
    public static class ImagenFondoHelper
    {
        /*style="background-image:url('../../Content/icons/Buddy%20Group.png'); background-position:right top;background-repeat:no-repeat;"*/
        public static string ImagenFondo(this HtmlHelper html, string carpeta, string imagen)
        {
            return ImagenFondo(html, carpeta, imagen, null);
        }


        public static string ImagenFondo(this HtmlHelper html, string carpeta, string imagen, int? zIndex){
            UrlHelper url = new UrlHelper(html.ViewContext.RequestContext);
            var urlImagen = url.Content(string.Format("~/Content/{0}/{1}",carpeta,imagen));
            var zIndexImg = "";
            if (zIndex.HasValue)
            {
                zIndexImg = string.Format("z-index:{0}",zIndex.Value );
            }

            return string.Format("style=\"background-image:url('{0}'); background-position:right top;background-repeat:no-repeat;{1}\"",urlImagen,zIndexImg );
        }
    }

    
}
