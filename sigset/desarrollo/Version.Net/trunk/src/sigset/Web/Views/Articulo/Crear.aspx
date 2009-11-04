<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Articulo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<%using (Html.BeginReady())
  { %>
  <%=Html.InitializeAutoComplete("Marca", "GetMarcas", "Articulo", false) %>
  <%=Html.InitializeAutoComplete("TipoArticulo", "GetTipoArticulo", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Categoria", "GetCategorias", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Linea", "GetLineas", "Articulo", false)%>
<%} %>

<%=Html.ClientSideValidation("",typeof(Data.Modelo.Articulo)) %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear</h2>

    <%= Html.ValidationSummary("Creación de articulo con errores.") %>

    <% using (Html.BeginForm()) {%>
    
    
    <%=Html.Hidden("Rut", TempData["rutOrden"])%>
        
        <% Html.RenderPartial("CrearArticulo"); %>
        <br />
        <% =Html.ButtonSubmit("Guardar") %>
    <% } %>


</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

