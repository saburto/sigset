<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.Direccion>>" %>

    <% foreach (var item in Model) { %>
    
    <% Html.RenderPartial("Direccion", item); %>

    <% } %>
    


