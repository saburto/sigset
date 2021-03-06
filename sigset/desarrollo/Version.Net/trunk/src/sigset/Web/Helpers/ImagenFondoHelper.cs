﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;
using System.Web.Routing;

namespace Helpers
{
    public static class ImagenFondoHelper
    {
        public static string ImagenLogo(this HtmlHelper html, int heigth, int width)
        {
            
            string filePath = Path.Combine(Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Content/images"), "Logo.jpg");
            FileInfo fileInfo = new FileInfo(filePath);
            if (fileInfo.Exists)
            {
                UrlHelper url = new UrlHelper(html.ViewContext.RequestContext);
                string urlImagen = url.Content("~/Content/images/Logo.jpg");
                TagBuilder img = new TagBuilder("img");
                img.Attributes.Add("src", urlImagen);
                img.Attributes.Add("alt", Services.Configuraciones.Configuracion.NombreEmpresa);
                img.Attributes.Add("style", "height:"+  heigth  +"px;width:"+ width +"px;");
                return img.ToString();
            }
            else
            {
                return "";
            }
        }


        public static string ImagenUsuario(this HtmlHelper html, string nombreUsuario,string cssClass , string alt ,object htmlAtributtes)
        {
            UrlHelper url = new UrlHelper(html.ViewContext.RequestContext);

            string imgUsuario  = string.Format("Content/usuarios/{0}.jpg", nombreUsuario);
            string imgUsuarioPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, imgUsuario);

            string urlImagen = url.Content("~/Content/icons/Buddy.png");
            FileInfo fileInfo = new FileInfo(imgUsuarioPath);
            if (fileInfo.Exists)
            {   
                urlImagen = url.Content(string.Format("~/{0}", imgUsuario));   
            }


            

            TagBuilder tag = new TagBuilder("img");
            tag.AddCssClass(cssClass);
            tag.Attributes.Add("alt", alt);
            tag.Attributes.Add("title", alt);
            tag.Attributes.Add("src", urlImagen);
            if (htmlAtributtes != null)
            {
                IDictionary<string, object> htmlAttributes1 = new RouteValueDictionary(htmlAtributtes);
                tag.MergeAttributes(htmlAttributes1);
            }


            return tag.ToString() ;
        }



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
