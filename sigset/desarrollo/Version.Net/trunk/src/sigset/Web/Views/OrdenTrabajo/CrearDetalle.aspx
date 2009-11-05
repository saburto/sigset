<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.OrdenTrabajo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Crear Orden de Trabajo
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
 <script type="text/javascript">
    //<![CDATA[
<%using (Html.BeginReady())
  {%>
    
    
    $.datepicker.setDefaults({
        constrainInput: true,
        dateFormat: 'dd-mm-yy',
 		closeText: 'Cerrar',
		prevText: '&#x3c;Ant',
		nextText: 'Sig&#x3e;',
		currentText: 'Hoy',
		monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
		'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
		monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
		'Jul','Ago','Sep','Oct','Nov','Dic'],
		dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
		dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
		dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
        firstDay: 1,
		isRTL: false,
		showButtonPanel: true
    });

    $('#FechaCompra').datepicker();
    $('#FechaEntrega').datepicker();
    
    $('#TipoOrden').change(
        function()
        {
          if($('#TipoOrden').val() == 2)
          {
            $('#datosGarantia').hide();
          }
          else
          {
            $('#datosGarantia').show();
          }  
        }
    );
      
  <%} %>
  
  //]]>
</script>

<%=Html.ClientSideValidation("",typeof(Data.Modelo.OrdenTrabajo)) %>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Crear Orden de Trabajo</h2>
   <%if (Model != null && Model.Cliente != null)
   { %>
      <% Html.RenderPartial("DatosCliente", Model.Cliente); %>
   <%} %>
   <%if (Model != null && Model.Articulo != null)
   { %>
      <% Html.RenderPartial("DatosArticulo", Model.Articulo); %>
   <%} %> 
    

    <%= Html.ValidationSummary("Create was unsuccessful. Please correct the errors and try again.") %>

    <% using (Html.BeginForm()) {%>

        <fieldset>
            <legend>Orden de Trabajo</legend>
            <p>
                <label for="Serie">N° Serie de Articulo:</label>
                <%= Html.TextBox("Serie") %>
                <%= Html.ValidationMessage("Serie", "*") %>
            </p>

            <p>
                <label for="Falla">Falla Articulo:</label>
                <%= Html.TextArea("Falla", new { rows = "4", style = "width:100%" })%>
                <%= Html.ValidationMessage("Falla", "*") %>
            </p>
            <p>
                <label for="CondicionArticulo">Condicion Articulo:</label>
                <%= Html.TextArea("CondicionArticulo", new { rows = "4", style="width:100%"})%>
                <%= Html.ValidationMessage("CondicionArticulo", "*") %>
            </p>

            <div class="three-column-container">
                <div class="three-column-left">
                <p>
                    <label for="TipoOrden">Tipo Orden:</label>
                    <%= Html.DropDownList("TipoOrden")%>
                    
                    <%= Html.ValidationMessage("TipoOrden", "*") %>
                </p>
                </div>
                <div id="datosGarantia">
                <div class="three-column-middle">
                <p>
                <label for="Boleta">Boleta:</label>
                <%= Html.TextBox("Boleta") %>
                <%= Html.ValidationMessage("Boleta", "*") %>
                <label for="Poliza">Poliza:</label>
                <%= Html.TextBox("Poliza") %>
                <%= Html.ValidationMessage("Poliza", "*") %>
                </p>
                </div>
                <div class="three-column-right">
                <p>
                <label for="FechaCompra">Fecha Compra:</label>
                
                <%= Html.TextBox("FechaCompra") %>
                
                <%= Html.ValidationMessage("FechaCompra", "*") %>
                <label for="LugarCompra">Lugar Compra:</label>
                <%= Html.TextBox("LugarCompra") %>
                <%= Html.ValidationMessage("LugarCompra", "*") %>
                </p>
                </div>
                </div>
            </div>
            <div class="clear"></div>
            <p>
                <label for="Fecha Entrega">Fecha Entrega:</label>
                <%= Html.TextBox("FechaEntrega", Model.FechaEntrega.ToShortDateString()) %>
                <%= Html.ValidationMessage("FechaEntrega", "*") %>
            </p>
        </fieldset>
          <fieldset>
            <legend>Observaciones</legend>
            <%=Html.TextArea("Observacion", new { style = "width: 100%", title="Información adicional de Orden de trabajo"})%>
            <br />
            
        </fieldset>
        <p>
            <%= Html.Hidden("IdCliente", Model.Cliente.Id)%>
            <%= Html.Hidden("IdArticulo", Model.IdArticulo)%>
            <%=Html.ButtonSubmit("Guardar") %>
        </p>

    <% } %>
</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

