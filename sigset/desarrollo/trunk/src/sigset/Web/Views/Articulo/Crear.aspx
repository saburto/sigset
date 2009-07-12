<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Articulo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<%using (Html.BeginReady())
  { %>
  <%=Html.InitializeAutoComplete("Marca", "GetMarcas", "Articulo", false) %>
  <%=Html.InitializeAutoComplete("Tipo_Articulo", "GetTipoArticulo", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Categoria", "GetCategorias", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Linea", "GetLineas", "Articulo", false)%>
<%} %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear</h2>

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

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
                <label for="Tipo_Articulo">Tipo Articulo:</label>
                <%= Html.AutoCompleteTextBox("Tipo_Articulo")%>
                <%= Html.ValidationMessage("Tipo_Articulo", "*") %>
                </div>
                
                <div class="three-column-right">
                <label for="Precio_Garantia">Precios Garantia:</label>
                <%= Html.DropDownList("Lista_Precio_Garantia") %>
                <%= Html.ValidationMessage("Precio_Garantia", "*") %>
                </div>
            </div>
                <div class="clear"></div>
                <input type="submit" value="Create" />
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

