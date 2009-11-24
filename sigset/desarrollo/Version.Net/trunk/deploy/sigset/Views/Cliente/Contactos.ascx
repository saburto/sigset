<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<Data.Modelo.Contacto>>" %>

    <%if(Model != null) %>
    <% foreach (var item in Model) { %>
    
        <% Html.RenderPartial("Contacto", item); %>
    
    <% } %>



