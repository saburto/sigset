using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Ajax;
using MvcSiteMap.Core;

namespace MvcSiteMap.Web.Controllers
{
    public class ProductsController : Controller
    {
        private readonly Dictionary<string, string> products = new Dictionary<string, string>();

        public ProductsController()
        {
            products.Add("ASP.NET MVC 1.0 Quickly", "Books");
            products.Add("Toy Story 2", "DVD");
            products.Add("Intel Core i7", "Electronics");
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult List(string id)
        {
            if (string.IsNullOrEmpty(id))
                id = "Books";

            SiteMap.CurrentNode.Title = string.Format("{0}", id);

            ViewData["category"] = id; // just for generating a products list on the view
            ViewData["product"] = products.Where(p=>p.Value == id).First().Key; // just some product in this category

            return View();
        }

        [MvcSiteMapNode(ParentKey="ProductsListCategory", Title="Product details", IsDynamic=true, DynamicParameters="id")]
        public ActionResult Details(string id)
        {
            if (string.IsNullOrEmpty(id))
                id = "ASP.NET MVC 1.0 Quickly";

            // Get category
            string category = products.Where(p => p.Key == id).First().Value;

            // Set sitemap node title
            SiteMap.CurrentNode.Title = string.Format("{0}", id);

            // Set parent node title
            SiteMap.CurrentNode.ParentNode.Title = string.Format("{0}", category);
            SiteMap.CurrentNode.ParentNode.Url = Url.Action("List", new { id = category }).Replace("..", "~/Products");

            // Return view
            return View();
        }
    }
}
