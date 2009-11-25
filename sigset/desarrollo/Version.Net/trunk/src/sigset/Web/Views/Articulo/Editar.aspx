<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Articulo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Editar <%=Html.Encode("Art�culo")%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.ValidationSummary() %>

    <% using (Html.BeginForm("Editar", "Articulo", FormMethod.Post, new { id = "formArticulo" })){%>
            <fieldset>
            <legend>Editar <%=Html.Encode("Art�culo")%></legend>
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Modelo">Modelo:</label>
                <%= Html.Hidden("Id", Model.Id) %>
                <%= Html.TextBox("Modelo", Model.Modelo, new { @class = "required", title="Modelo del art�culo" })%>
                <%= Html.ValidationMessage("Modelo", "*") %>
                </div>
                <div class="three-column-middle">
                <label for="Marca">Marca:</label>
                <%= Html.AutoCompleteTextBox("Marca", Model.Marca1.Descripcion, Model.Marca, new { @class = "required", title="Marca a la que pertenece el art�culo, si no existe en la lista se agrega" })%>
                <%= Html.ValidationMessage("Marca", "*") %>
                </div>
                <div class="three-column-right">
                <label for="Linea"><%=Html.Encode("L�nea")%>:</label>
                <%= Html.AutoCompleteTextBox("Linea",Model.Linea1.Descripcion, Model.Linea  , new { @class = "required", title="L�nea a la que pertence el modelo" })%>
                <%= Html.ValidationMessage("Linea", "*") %>
                </div>
            </div>
            <br />
            <br />
            <div class="three-column-container">
                <div class="three-column-left">
                <label for="Categoria"><%=Html.Encode("Categor�a")%>::</label>
                <%= Html.AutoCompleteTextBox("Categoria", Model.Categoria1.Descripcion, Model.Categoria, new { @class = "required", title="Categor�a a la que pertence el art�culo" })%>
                <%= Html.ValidationMessage("Categoria", "*") %>                
                </div>
                
                <div class="three-column-middle">
                <label for="TipoArticulo">Tipo <%=Html.Encode("Art�culo")%>:</label>
                <%= Html.AutoCompleteTextBox("TipoArticulo",Model.TipoArticulo1.Descripcion, Model.TipoArticulo , new { @class = "required", title="Tipo de Art�culo" })%>
                <%= Html.ValidationMessage("TipoArticulo", "*") %>
                </div>
                
                <div class="three-column-right">
                <label for="PrecioGarantia">Precios <%=Html.Encode("Garant�a")%>:</label>
                <%= Html.DropDownList("PrecioGarantia", null, new { @class = "required", title = "Precio de revisi�n y reparaci�n del art�culo" })%>
                <%= Html.ValidationMessage("PrecioGarantia", "*") %>
                </div>
            </div>
                <div class="clear"></div>
                <br />
        </fieldset>
        <div>
        <%=Html.ButtonSubmit("Guardar") %>
    </div>
    <% } %>

    

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

