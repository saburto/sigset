<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Administraci�n
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <h2>Administraci�n de Tablas</h2>
   <p>
   <ul>
    <li> <%=Html.ActionLink("Empleado", "Lista", "Empleado") %></li>
    <li> <%=Html.ActionLink("Tipo Cargo", "Lista", "TipoCargo") %></li>   
    <li> <%=Html.ActionLink("Usuario", "Lista", "Usuario") %> </li>   
    <li> <%=Html.ActionLink("T�cnico", "Lista", "Tecnico") %> </li>   
   </ul>
   </p>
        
           
   
</asp:Content>
