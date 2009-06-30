<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administracion
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Administracion de Tablas</h2>
   <p>
   <ul>
    <li> <%=Html.ActionLink("Empleado", "Lista", "Empleado") %></li>
    <li> <%=Html.ActionLink("Usuario", "Lista", "Usuario") %> </li>
    <li> <%=Html.ActionLink("Tipo de Usuario", "Lista", "TipoUsuario") %> </li>
   </ul>
   </p>
        
           
   
</asp:Content>
