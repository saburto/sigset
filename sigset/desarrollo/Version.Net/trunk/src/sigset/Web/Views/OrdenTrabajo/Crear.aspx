<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Orden de Trabajo
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">

<%using (Html.BeginReady())
  { %>
  <%=Html.InitializeAutoComplete("Marca", "GetMarcas", "Articulo", false) %>
  <%=Html.InitializeAutoComplete("TipoArticulo", "GetTipoArticulo", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Categoria", "GetCategorias", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Linea", "GetLineas", "Articulo", false)%>
<%} %>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Orden de Trabajo</h2>
    <%if (Model != null && Model.Cliente != null)
      { %>
      <% Html.RenderPartial("DatosCliente", Model.Cliente); %>
    <%} %>
    
     <%= Html.ValidationSummary("Creación de articulo con errores.") %>
    
    <%using (Html.BeginForm()) { %>
    
    <%=Html.Hidden("IdCliente", Model.Cliente.Id) %>
    <% Html.RenderPartial("../Articulo/CrearArticulo"); %>
    
    <p>
        <% =Html.ButtonSubmit("Guardar")%>
    </p>
    
    <%} %>
    
</asp:Content>
