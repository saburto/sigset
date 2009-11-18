<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Web.Helpers" %>
<%
    if (Request.IsAuthenticated) {
%>
        Bienvenido <b><%= (Html.Encode(Page.User.Identity.Name.ToCapitalize())) %></b>
        
        <%=Html.ImagenUsuario(Page.User.Identity.Name, "", "Imagen usuario", new{style="width:64px;height:64px;"}) %>
        
        [ <%= Html.ActionLink("Cerrar Sesión", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%= Html.ActionLink("Iniciar Sesión", "LogOn", "Account") %> ]
<%
    }
%>
