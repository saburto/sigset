<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Articulo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar Articulo
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary("Edit was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>
            <fieldset>
            <legend>Editar Articulo</legend>
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Modelo">Modelo:</label>
                <%= Html.TextBox("Modelo", Model.Modelo, new { @class = "required", title="Modelo del articulo" })%>
                <%= Html.ValidationMessage("Modelo", "*") %>
                </div>
                <div class="three-column-middle">
                <label for="Marca">Marca:</label>
                <%= Html.AutoCompleteTextBox("Marca",Model.Marca1.Descripcion, Model.Marca, new { @class = "required", title="Marca a la que pertenece el articulo, si no existe en la lista se agrega" })%>
                <%= Html.ValidationMessage("Marca", "*") %>
                </div>
                <div class="three-column-right">
                <label for="Linea">Linea:</label>
                <%= Html.AutoCompleteTextBox("Linea",Model.Linea1.Descripcion, Model.Linea  , new { @class = "required", title="Linea a la que pertence el modelo" })%>
                <%= Html.ValidationMessage("Linea", "*") %>
                </div>
            </div>
            <br />
            <br />
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Categoria">Categoria:</label>
                <%= Html.AutoCompleteTextBox("Categoria", Model.Categoria1.Descripcion, Model.Categoria, new { @class = "required", title="Categoria a la que pertence el articulo" })%>
                <%= Html.ValidationMessage("Categoria", "*") %>                
                </div>
                
                <div class="three-column-middle">
                <label for="TipoArticulo">Tipo Articulo:</label>
                <%= Html.AutoCompleteTextBox("TipoArticulo",Model.TipoArticulo1.Descripcion, Model.TipoArticulo , new { @class = "required", title="Tipo de Articulo" })%>
                <%= Html.ValidationMessage("TipoArticulo", "*") %>
                </div>
                
                <div class="three-column-right">
                <label for="PrecioGarantia">Precios Garantia:</label>
                <%= Html.DropDownList("PrecioGarantia", null, new { @class = "required", title="Precio de reparacion del articulo" })%>
                <%= Html.ValidationMessage("PrecioGarantia", "*") %>
                </div>
            </div>
                <div class="clear"></div>
                <br />
        </fieldset>
    <% } %>

    <div>
        <%=Html.ButtonSubmit("Guardar") %>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<script type="text/javascript">
//<![CDATA[

<%using (Html.BeginReady())
  { %>
  <%=Html.InitializeAutoComplete("Marca", "GetMarcas", "Articulo", false) %>
  <%=Html.InitializeAutoComplete("TipoArticulo", "GetTipoArticulo", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Categoria", "GetCategorias", "Articulo", true)%>
  <%=Html.InitializeAutoComplete("Linea", "GetLineas", "Articulo", false)%>
  
    $("#formArticulo").validate({
  
            errorClass: "field-validation-error",
            errorElement: "span",
            highlight: function(element) { $(element).addClass("input-validation-error"); },
            unhighlight: function(element) { $(element).removeClass("input-validation-error");},
             rules: {
                PrecioGarantia: {
                    required: true,
                    min: 1
                }
            },
            messages:{
                PrecioGarantia:{
                    min:"Seleccione un precio"
                }
            }
  });
  
<%} %>

//]]>
</script>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="divContentStyle" runat="server">
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

