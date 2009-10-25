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
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear</h2>

    <%= Html.ValidationSummary("Creación de articulo con errores.") %>

    <% using (Html.BeginForm()) {%>
    <%=Html.Hidden("Rut", TempData["rutOrden"])%>
        <fieldset>
            <legend>Nuevo Articulo</legend>
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Modelo">Modelo:</label>
                <%= Html.TextBox("Modelo") %>
                <%= Html.ValidationMessage("Modelo", "*") %>
                </div>
                <div class="three-column-middle">
                <label for="Marca">Marca:</label>
                <%= Html.AutoCompleteTextBox("Marca") %>
                <%= Html.ValidationMessage("Marca", "*") %>
                </div>
                <div class="three-column-right">
                <label for="Linea">Linea:</label>
                <%= Html.AutoCompleteTextBox("Linea")%>
                <%= Html.ValidationMessage("Linea", "*") %>
                </div>
            </div>
            <br />
            <br />
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Categoria">Categoria:</label>
                <%= Html.AutoCompleteTextBox("Categoria")%>
                <%= Html.ValidationMessage("Categoria", "*") %>                
                </div>
                
                <div class="three-column-middle">
                <label for="TipoArticulo">Tipo Articulo:</label>
                <%= Html.AutoCompleteTextBox("TipoArticulo")%>
                <%= Html.ValidationMessage("TipoArticulo", "*") %>
                </div>
                
                <div class="three-column-right">
                <label for="PrecioGarantia">Precios Garantia:</label>
                <%= Html.DropDownList("Lista_PrecioGarantia") %>
                <%= Html.ValidationMessage("PrecioGarantia", "*") %>
                </div>
            </div>
                <div class="clear"></div>
                <input type="submit" value="Guardar" />
        </fieldset>

    <% } %>


</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

