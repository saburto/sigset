<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <%using (Html.BeginReady()) {%>
    
    <%= Html.InitializeAutoComplete("Region", "EncontrarRegiones", "Cliente", true,15) %>
    <%= Html.InitializeAutoComplete("Provincia", "EncontrarProvincias", "Cliente", true, "Region", 30, 0) %>
    <%= Html.InitializeAutoComplete("Comuna", "EncontrarComunas", "Cliente", true, "Provincia",100,0 ) %>
    
    <%} %>
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Orden de Trabajo</h2>

    <div id="datosCliente">
        <%Html.RenderPartial("~/Views/Cliente/Crear.ascx"); %>
    
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MenuDerecha" runat="server">

<ol>
<li>
    <%=Ajax.ActionLink("Buscar Cliente", "Buscar", "Cliente", new AjaxOptions { LoadingElementId = "loadingAjax", UpdateTargetId = "datosCliente", HttpMethod = "GET" })%>
</li>
<li>
    <%=Ajax.ActionLink("Nuevo Cliente", "Crear", "Cliente", new AjaxOptions{ LoadingElementId="loadingAjax",UpdateTargetId="datosCliente", HttpMethod="GET"}) %>
</li>
</ol>

</asp:Content>