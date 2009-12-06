<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<iframe frameborder="0" scrolling="no" height="800px" width="100%" 
    src="<%= Url.Content("~/Reportes/OrdenesPorTecnico.aspx")%><%=ViewData["qs"] %>">


</iframe>