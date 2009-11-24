<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Orden de Trabajo
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">

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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Orden de Trabajo</h2>
    <%if (Model != null && Model.Cliente != null)
      { %>
      <% Html.RenderPartial("DatosCliente", Model.Cliente); %>
    <%} %>
    
     <%= Html.ValidationSummary("Creación de artículo con errores.") %>
    
    <%using (Html.BeginForm("Crear", "OrdenTrabajo", FormMethod.Post, new { id="formArticulo" }))
      { %>
    
    
    <% Html.RenderPartial("../Articulo/CrearArticulo"); %>
    
    <p>
        <%=Html.Hidden("IdCliente", Model.Cliente.Id)%>
        <% =Html.ButtonSubmit("Guardar")%>
    </p>
    
    <%} %>
    
</asp:Content>
