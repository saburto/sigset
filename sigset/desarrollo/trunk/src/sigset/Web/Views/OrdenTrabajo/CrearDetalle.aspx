<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<Data.Modelo.Orden_Trabajo>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	CrearDetalle
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" runat="server">
<%using (Html.BeginReady())
  {%>
    
    
    $.datepicker.setDefaults({
        constrainInput: true,
        dateFormat: 'dd--mm-yy',
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

    $('#Fecha_Compra').datepicker();
    $('#Fecha_Entrega').datepicker();
      
  <%} %>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>CrearDetalle</h2>
    
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
                <label for="Id"><%=Html.Encode("Número de Orden:") %></label>
                <%= Html.TextBox("Id") %>
                <%= Html.ValidationMessage("Id", "*") %>
            </p>
            <p>
                <label for="Serie">Serie:</label>
                <%= Html.TextBox("Serie") %>
                <%= Html.ValidationMessage("Serie", "*") %>
            </p>
                <label for="Fecha_Ingreso">Fecha_Ingreso:</label>
                <%= Html.TextoSoloLectura("Fecha_Ingreso", DateTime.Now.ToShortDateString()) %>
                <%= Html.ValidationMessage("Fecha_Ingreso", "*") %>
            <p>
                <label for="Fecha_Entrega">Fecha_Entrega:</label>
                <%= Html.TextBox("Fecha_Entrega") %>
                <%= Html.ValidationMessage("Fecha_Entrega", "*") %>
            </p>
            <p>
                <label for="Falla">Falla:</label>
                <%= Html.TextArea("Falla") %>
                <%= Html.ValidationMessage("Falla", "*") %>
            </p>
            <p>
                <label for="Condicion_Articulo">Condicion_Articulo:</label>
                <%= Html.TextArea("Condicion_Articulo") %>
                <%= Html.ValidationMessage("Condicion_Articulo", "*") %>
            </p>

            <p>
                <label for="Tipo_Orden">Tipo_Orden:</label>
                <%= Html.TextBox("Tipo_Orden") %>
                <%= Html.ValidationMessage("Tipo_Orden", "*") %>
            </p>

            <p>
                <label for="Boleta">Boleta:</label>
                <%= Html.TextBox("Boleta") %>
                <%= Html.ValidationMessage("Boleta", "*") %>
            </p>

            <p>
                <label for="Poliza">Poliza:</label>
                <%= Html.TextBox("Poliza") %>
                <%= Html.ValidationMessage("Poliza", "*") %>
            </p>

            <p>
                <label for="Fecha_Compra">Fecha_Compra:</label>
                <%= Html.TextBox("Fecha_Compra") %>
                <%= Html.ValidationMessage("Fecha_Compra", "*") %>
            </p>
            <p>
                <label for="Lugar_Compra">Lugar_Compra:</label>
                <%= Html.TextBox("Lugar_Compra") %>
                <%= Html.ValidationMessage("Lugar_Compra", "*") %>
            </p>
            <p>
                <input type="submit" value="Create" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%=Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MenuDerecha" runat="server">
</asp:Content>

