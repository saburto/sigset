<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Orden_Trabajo>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Orden de Trabajo
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Orden de Trabajo</h2>
    <%if (Model != null && Model.Cliente != null)
      { %>
      <% Html.RenderPartial("DatosCliente", Model.Cliente); %>
    <%} %>
    
    <p>
    <%=Html.ActionLink("Agregar Articulo", "Buscar", "Articulo", new {id=Model.Cliente.Rut }, null)%>
    </p>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">

<%--
<ol>
<li>
    <%=Ajax.ActionLink("Buscar Cliente", "Buscar", "Cliente", new AjaxOptions { LoadingElementId = "loadingAjax", UpdateTargetId = "datosCliente", HttpMethod = "GET" })%>
</li>
<li>
    <%=Ajax.ActionLink("Nuevo Cliente", "Crear", "Cliente", new AjaxOptions{ LoadingElementId="loadingAjax",UpdateTargetId="datosCliente", HttpMethod="GET"}) %>
</li>
</ol>
--%>
</asp:Content>