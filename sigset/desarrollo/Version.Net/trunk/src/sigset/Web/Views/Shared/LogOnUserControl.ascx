<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Web.Helpers" %>
<%
    if (Request.IsAuthenticated) {
%>
        Bienvenido <b><%= (Html.Encode(Page.User.Identity.Name.ToCapitalize())) %></b>
        <br />
        [ <%= Html.ActionLink("Cerrar Sesión", "LogOff", "Account") %> ]
<%
    }
    else {
%> 
        [ <%= Html.ActionLink("Iniciar Sesión", "LogOn", "Account") %> ]
<%
    }
%>
